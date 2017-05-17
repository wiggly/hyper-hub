# TODO: note all other componenets must be children of the main router otherwise they will fail
class App < Hyperloop::Router
  history :browser

  # TODO: note this doesn't work if defined as a method `def route`
  route do
    puts 'APP: route'
    DIV do
        # TODO: note that if we mount Repos here and pass in a store state as a param that it will not be correctly updated
      Route('/', exact: true, mounts: ReposApp)
      Route('/repos', exact: true, mounts: ReposApp)
      Route('/repos/:owner/:name', mounts: RepoApp)
      Route('/settings', mounts: SettingsApp)
    end
  end
end
