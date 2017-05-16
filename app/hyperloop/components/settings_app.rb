class SettingsApp < Hyperloop::Router::Component
  before_mount do
    puts "SETTINGS_APP: before_mount"
  end

  after_mount do
    puts "SETTINGS_APP: after_mount"
  end

  before_update do
    puts "SETTINGS_APP: before_update"
  end

  before_unmount do
    puts "SETTINGS_APP: before_unmount"
  end

  render do
    puts "SETTINGS_APP: render"
    DIV do
      Settings()
    end
  end
end
