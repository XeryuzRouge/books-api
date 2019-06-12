require 'sinatra'
require 'json'
require_relative 'api_request'
require_relative 'response'

get '/' do
  response = Response.new(APIRequest.book_search('harry'))
  books = response.library
end

get '/books' do
  headers \
    "Access-Control-Allow-Origin" => "http://localhost:3000"

  response = Response.new(APIRequest.book_search('harry'))
  response.library
end
