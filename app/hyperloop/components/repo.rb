class Repo < Hyperloop::Router::Component
  param :repo, type: Hash

  before_mount do
    puts 'REPO: before_mount'
  end

  after_mount do
    puts 'REPO: after_mount'
  end

  before_update do
    puts 'REPO: before_update'
  end

  before_unmount do
    puts 'REPO: before_unmount'
  end

  render do
    puts 'REPO: render'
    DIV(class: 'col-md-8 col-md-offset-2') do
      DIV(class: 'panel panel-primary') do
        DIV(class: 'panel-heading') do
          H2(class: 'panel-title') do
            params.repo['full_name']
          end
        end
        DIV(class: 'panel-body') do
          P() do
            params.repo['description']
          end
        end
        DIV(class: 'panel-footer') do
          SPAN() do
            # TODO: note that if we don't to_s here the react system does not attempt to coerce it and it effectively does not get rendered
            params.repo['id'].to_s
          end
        end
      end
    end
  end
end
