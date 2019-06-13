require 'sinatra/base'
require_relative '../search/search'

class Main < Sinatra::Base

  attr_reader :search

  def initialize(search = Search.new, app = nil)
    super(app)

    @search = search
  end

  get '/' do
    "Welcome"
  end

  get '/search' do
    headers \
      "Access-Control-Allow-Origin" => "http://localhost:3000"

    keyword = params[:keyword]
    search.for(keyword)
  end

   # start the server if ruby file executed directly
  run! if app_file == $0

end
