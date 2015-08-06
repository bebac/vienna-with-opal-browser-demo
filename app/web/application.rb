require 'opal'
require 'jquery'
require 'opal-jquery'
require 'vienna'

require 'templates/application'
require 'views/application_view'

class Application

  def run
    @view = ApplicationView.new
    @view.render
    p @view.element
    Document.find('#view-container').html = @view.element
    router.update
  end

  def router
    @router ||= Vienna::Router.new.tap do |router|
      #router.route('/xxx')   { |params| @view.show_xxx }
    end
  end

end

Document.ready? do
  Application.new.run
end
