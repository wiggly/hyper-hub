class Settings < Hyperloop::Router::Component
  state :key, type: String do
    SettingsStore.key
  end

  before_mount do
    puts 'SETTINGS: before_mount'
  end

  after_mount do
    puts 'SETTINGS: after_mount'
  end

  before_update do
    puts 'SETTINGS: before_update'
  end

  before_unmount do
    puts 'SETTINGS: before_unmount'
  end

  render do
    puts 'SETTINGS: render'

    DIV(class: 'container') do

      DIV(class: 'row') do
        DIV(class: 'col-md-8 col-md-offset-2') do
          P() do
            SPAN() { 'You need to generate a ' }
            A(href: 'https://github.com/blog/1509-personal-api-tokens') { 'GitHub personal API token' }
            SPAN() { ' to use this application.' }
          end

          P() do
            'Please read the github blog post and enter the API token here.'
          end

          P() do
            'The token will only ever be stored in your browsers local storage and sent to github.'
          end
        end
      end

      DIV(class: 'row') do
        DIV(class: 'col-md-8 col-md-offset-2') do
          DIV(class: 'property-form panel panel-primary') do
            DIV(class: 'panel-heading') do
              H2(class: 'panel-title') do
                'Settings'
              end
            end

            DIV(class: 'panel-body') do
              DIV(class: 'form-group') do
                LABEL(htmlFor: 'key') do
                  'Personal API Token'
                end
                INPUT(id: 'key',
                      class: 'form-control',
                      type: 'text',
                      placeholder: 'API Key',
                      value: state.key).on(:change) do |e|
                  mutate.key e.target.value
                end
              end

              BUTTON(type: 'submit', class: 'btn btn-primary') do
                'Save'
              end.on(:click) do
                SettingsStore::SetApiKey.run(key: state.key)
              end
            end
          end
        end
      end
    end
  end
end
