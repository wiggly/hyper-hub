class RepoApp < Hyperloop::Router::Component

  after_mount do
    puts 'REPO_APP: after_mount'
    RepoStore::Find.run(fullname: "#{match.params['owner']}/#{match.params['name']}")
  end

  render do
    puts 'REPO_APP: render'
    DIV do
      NavBar(location: location)
      Repo(data: RepoStore)
    end
  end
end
