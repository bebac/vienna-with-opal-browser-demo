require 'opal'
require 'browser'
require 'vienna'

require 'templates/application'
require 'views/application_view'

class Application

  def run
    @view = ApplicationView.new
    @view.render
    find('#view-container').inner_dom = @view.element
    router.update
  end

  def router
    @router ||= Vienna::Router.new.tap do |router|
      #router.route('/xxx')   { |params| @view.show_xxx }
    end
  end

  def find(selector)
    $document.at(selector)
  end

end

$document.ready do
  Application.new.run
end
