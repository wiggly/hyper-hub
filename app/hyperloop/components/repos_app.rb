class ReposApp < Hyperloop::Router::Component
  before_mount do
    puts 'REPOS_APP: before_mount'
  end

  after_mount do
    puts 'REPOS_APP: after_mount'

    ReposStore::Refresh.run
  end

  before_update do
    puts 'REPOS_APP: before_update'
  end

  before_unmount do
    puts 'REPOS_APP: before_unmount'
  end

  render do
    puts 'REPOS_APP: render'
    DIV do
      NavBar(location: location)
      Repos(repos: ReposStore.items, error: ReposStore.error)
    end
  end
end
