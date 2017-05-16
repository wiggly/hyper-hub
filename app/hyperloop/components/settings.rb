class Settings < Hyperloop::Router::Component
  state :key, type: String do
    SettingsStore.key
  end

  before_mount do
    puts "SETTINGS: before_mount"
  end

  after_mount do
    puts "SETTINGS: after_mount"
  end

  before_update do
    puts "SETTINGS: before_update"
  end

  before_unmount do
    puts "SETTINGS: before_unmount"
  end

  render do
    puts "SETTINGS: render"

    DIV do
      DIV(class: 'property-form panel panel-primary') do
        DIV(class: 'panel-heading') do
          H2(class: 'panel-title') do
            "Settings"
          end
        end

        DIV(class: 'panel-body') do
          DIV(class: 'form-group') do
            LABEL(htmlFor: 'key') do
              "Key"
            end
            INPUT(id: 'key', type: 'text', placeholder: 'API Key', class: 'form-control', value: state.key).on(:change) do |e|
              mutate.key e.target.value
            end
          end

          BUTTON(type: 'submit', class: 'btn btn-primary') do
            "Save"
          end.on(:click) do
            puts "creating operation"

            SettingsStore::SetApiKey.run(key: state.key)

            puts "created operation"
          end
        end
      end
    end
  end
end
