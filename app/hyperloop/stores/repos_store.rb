class ReposStore < Hyperloop::Store
  state items: [], scope: :class, reader: true

  state error: nil, scope: :class, reader: true

  class SetItems < Hyperloop::Operation
    param :items
  end

  class SetError < Hyperloop::Operation
    param :message
  end

  class Refresh < Hyperloop::Operation
  end

  receives SetItems do
    puts 'REPOS_STORE: SetItems'
    mutate.items(params.items)
    mutate.error(nil)
  end

  receives SetError do
    puts 'REPOS_STORE: SetError'
    mutate.items.clear
    mutate.error(params.message)
  end

  receives Refresh do
    puts 'REPOS_STORE: Refresh'

    key = SettingsStore.key

    headers = {
      'Authorization' => "token #{key}"
    }

    HTTP.get('https://api.github.com/user/repos', headers: headers) do |res|
      if res.ok?
        puts 'result ok, setting items'
        ReposStore::SetItems.run(items: res.json)
      else
        puts "ERROR #{res.body}"
        ReposStore::SetError.run(message: res.json['message'])
      end
    end
  end
end
