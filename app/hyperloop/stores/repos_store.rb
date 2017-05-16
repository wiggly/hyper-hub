class ReposStore < Hyperloop::Store
  state items: [], scope: :class, reader: true

  class SetItems < Hyperloop::Operation
    param :items
  end

  class Refresh < Hyperloop::Operation
  end

  receives SetItems do
    puts "REPOS_STORE: SetItems"
    mutate.items(params.items)
  end

  receives Refresh do
    puts "REPOS_STORE: Refresh"

    key = SettingsStore.key

    puts "key: #{key}"

    headers = {
      'Authorization' => "token #{key}"
    }

    HTTP.get('https://api.github.com/user/repos', headers: headers) do |res|
      if res.ok?
        puts "result ok, setting items"
        ReposStore::SetItems.run(items: res.json)
      else
        puts "ERROR #{res.body}"
      end
    end
  end
end
