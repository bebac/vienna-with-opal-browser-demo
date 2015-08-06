require 'opal'
require 'sinatra'

module TestApp
  class Main < Sinatra::Base
    enable  :sessions

    def initialize(app = nil, params = {})
      super(app)
      @sprockets = params.fetch(:sprockets, nil)
    end

    set :views, 'app/srv/views'

    get '/' do
      @opal_boot_code = Opal::Processor.load_asset_code(@sprockets, 'application')
      erb :'index.html'
    end

  end
end
