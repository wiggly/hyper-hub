class Repos < Hyperloop::Router::Component
  param :repos, type: [Hash]

  before_mount do
    puts "REPOS: before_mount"
  end

  after_mount do
    puts "REPOS: after_mount"
  end

  before_update do
    puts "REPOS: before_update"
  end

  before_unmount do
    puts "REPOS: before_unmount"
  end

  render do
    puts "REPOS: render"
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
end
