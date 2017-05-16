class Repos < Hyperloop::Router::Component
  param :repos, type: [Hash]
  param :error, type: String

  before_mount do
    puts 'REPOS: before_mount'
  end

  after_mount do
    puts 'REPOS: after_mount'
  end

  before_update do
    puts 'REPOS: before_update'
  end

  before_unmount do
    puts 'REPOS: before_unmount'
  end

  render do
    puts 'REPOS: render'

    if params.error.nil?
      render_repos
    else
      render_error
    end
  end

  def render_repos
    DIV do
      DIV(class: 'container') do
        params.repos.each do |repo|
          DIV(key: repo['id'], class: 'row') do
            Repo(repo: repo)
          end
        end
      end
    end
  end

  def render_error
    DIV do
      DIV(class: 'container') do
        DIV(class: 'row') do
          P() { 'Could not retrieve repos from github' }
          P() { Link('/settings') { 'Have you set your API key?' } }
          P() { "Error: #{params.error}" }
        end
      end
    end
  end
end
