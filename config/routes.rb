Rails.application.routes.draw do
  root 'git_hub#app'

  get 'repos', to: 'git_hub#repos_app'

  get 'settings', to: 'git_hub#settings_app'

  mount Hyperloop::Engine => '/hyperloop'
end
