class GitHubController < ApplicationController
  def app
    render_component
  end

  def repos_app
    render_component
  end

  def settings_app
    render_component
  end
end
