require_relative '../main'

require File.expand_path '../../../spec/spec_helper.rb', __FILE__

describe "Main" do
  include Rack::Test::Methods

  let(:search) { FakeSearch.new }
  let(:app) { Main.new(search) }

  it "should allow accessing the home page" do
    get '/'

    expect(last_response).to be_ok
    expect(last_response.body).to eq "Welcome"
  end

  it "should respond to a search request" do
    keyword = "StackOverflow"

    get '/search?keyword=' + keyword

    expect(last_response.headers['Access-Control-Allow-Origin']).to eq "http://localhost:3000"
    expect(last_response.body).to eq "#{keyword} results"
  end

  it "should respond to an empty search request" do
    keyword = ""

    get '/search?keyword=' + keyword

    expect(last_response).to be_ok
    expect(last_response.body).to eq "#{keyword} results"
  end

end

class FakeSearch

  def for(keyword)
    "#{keyword} results"
  end

end
