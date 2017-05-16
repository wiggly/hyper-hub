class App < Hyperloop::Router
  history :browser

  route do
    puts 'APP: route'
    DIV do
      NAV(class: 'navbar navbar-default') do
        DIV(class: 'container-fluid') do

          DIV(class: 'navbar-header') do
            BUTTON(type: 'button', class: 'navbar-toggle collapsed', 'data-toggle' => 'collapse', 'data-target' => '#navbar-collapse-1', 'aria-expanded' => false) do
              SPAN(class: 'sr-only') { 'Toggle navigation/span' }
              SPAN(class: 'icon-bar')
              SPAN(class: 'icon-bar')
              SPAN(class: 'icon-bar')
            end
            A(class: 'navbar-brand', href: '#') { 'HyperHub' }
          end

          DIV(class: 'collapse navbar-collapse', id: 'navbar-collapse-1') do
            UL(class: 'nav navbar-nav') do
              LI(class: 'active') do
                Link('/') { 'Repositories' }
              end
              LI() do
                Link('/settings') { 'Settings' }
              end
            end
          end
        end
      end

      DIV do
        # TODO: note that if we mount Repos here and pass in a store state as a param that it will not be correctly updated
        Route('/', exact: true, mounts: ReposApp)
        Route('/settings', mounts: SettingsApp)
      end
    end
  end
end
