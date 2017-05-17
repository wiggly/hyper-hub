class RepoPanel < Hyperloop::Router::Component
  param :repo, type: Hash

  render do
    puts 'REPO_PANEL: render'
    DIV(class: 'col-md-8 col-md-offset-2') do
      DIV(class: 'panel panel-primary') do
        DIV(class: 'panel-heading') do
          H2(class: 'panel-title') do
            Link("/repos/#{params.repo['full_name']}") { params.repo['full_name'] }
          end
        end
        DIV(class: 'panel-body') do
          P() { params.repo['description'] }
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
