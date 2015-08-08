require 'vienna/template_view'

class ApplicationView < Vienna::TemplateView
  template :application

  def initialize
  end

  def class_name
    'application-view'
  end

  on :click do |evt|
    puts "clicked #{element.class_name}"
  end
end
