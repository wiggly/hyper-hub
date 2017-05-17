# TODO: note all other componenets must be children of the main router otherwise they will fail
class NavBar < Hyperloop::Router::Component
  param :location

  render do
    puts 'NAV_BAR: render'

    NAV(class: 'navbar navbar-default') do
      DIV(class: 'container-fluid') do
        DIV(class: 'navbar-header') do
          BUTTON(type: 'button',
                 class: 'navbar-toggle collapsed',
                 'data-toggle' => 'collapse',
                 'data-target' => '#navbar-collapse-1',
                 'aria-expanded' => false) do
            SPAN(class: 'sr-only') { 'Toggle navigation/span' }
            SPAN(class: 'icon-bar')
            SPAN(class: 'icon-bar')
            SPAN(class: 'icon-bar')
          end
          A(class: 'navbar-brand', href: '#') { 'HyperHub' }
        end

        DIV(class: 'collapse navbar-collapse', id: 'navbar-collapse-1') do
          UL(class: 'nav navbar-nav') do

            # TODO: clean this up
            url = '/'
            css = (location.pathname == url) ? 'active' : 'inactive'
            LI(class: css) { Link('/') { 'Repositories' } }

            url = '/settings'
            css = (location.pathname == url) ? 'active' : 'inactive'

            LI(class: css) { Link('/settings') { 'Settings' } }
          end
        end
      end
    end
  end
end
