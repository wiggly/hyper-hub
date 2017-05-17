class RepoStore < Hyperloop::Store

  state :data, scope: :class, reader: true

  state loading: true, scope: :class, reader: true

  state error: '', scope: :class, reader: true

  def self.owner
    state.data['owner']['login']
  end

  def self.avatar
    state.data['owner']['avatar_url']
  end

  def self.owner_url
    state.data['owner']['html_url']
  end

  def self.name
    state.data['name']
  end

  def self.fullname
    state.data['name']
  end

  def self.description
    state.data['description']
  end

  def self.language
    state.data['language']
  end

  def self.github_url
    state.data['html_url']
  end

  class Find < Hyperloop::Operation
    param :fullname
  end

  receives Find do
    puts 'REPO_STORE: Find'

    mutate.loading(true)

    key = SettingsStore.key

    headers = {
      'Authorization' => "token #{key}"
    }

    url = 'https://api.github.com/repos/%s' % params.fullname

    HTTP.get(url, headers: headers) do |res|
      if res.ok?
        puts 'result ok, setting items'
        mutate.data(res.json)
        mutate.loading(false)
        mutate.error('')
      else
        puts "ERROR #{res.body}"
        mutate.error(res.json['message'])
      end
    end
  end
end
