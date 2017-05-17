class Repo < Hyperloop::Router::Component
  param :data

  render do
    puts 'REPO: render'
    if params.data.error.length > 0
      render_error
    elsif params.data.loading
      render_loading
    else
      render_loaded
    end
  end

  def render_error
    DIV(class: 'col-md-8 col-md-offset-2') do
      P { "Err #{params.data.error}" }
    end
  end

  def render_loading
    DIV(class: 'col-md-8 col-md-offset-2') do
      P { "Loading..." }
    end
  end

  def render_loaded
    DIV(class: 'col-md-8 col-md-offset-2') do
      DIV(class: 'panel panel-primary') do
        DIV(class: 'panel-heading') do
          H2(class: 'panel-title') do
            params.data.fullname
          end
        end
        DIV(class: 'panel-body') do
          DIV do
            A(href: params.data.owner_url) do
              P { params.data.owner }
              P do
                IMG(src: params.data.avatar, width: 64, height: 64)
              end
            end
          end

          DIV do
            P { params.data.description }

            A(href: params.data.github_url ) do
              P { 'GitHub Link' }
            end
          end
        end
        DIV(class: 'panel-footer') do
          P { params.data.language }
        end
      end
    end
  end
end
