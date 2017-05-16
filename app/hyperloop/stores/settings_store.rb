require 'opal/jquery/local_storage'

class SettingsStore < Hyperloop::Store
  state base_url: 'https://api.github.com/', scope: :class, reader: true

  state :key, type: String, scope: :class, reader: true do
    state.key || LocalStorage['key'] || ''
  end

  class SetApiKey < Hyperloop::Operation
    param :key, type: String
  end

  receives SetApiKey do
    puts "SETTINGS_STORE: SetApiKey"

    LocalStorage['key'] = params.key
    mutate.key(params.key)
  end
end
