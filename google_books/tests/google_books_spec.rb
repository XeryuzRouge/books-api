
require_relative '../google_books'

RSpec.describe Search do

  let(:google_books) { GoogleBooks.new }

  it "should send request and receive response from Google Books API" do
    response = google_books.look_for("anything")

    expect(response.code).to eq 200
    expect(valid_json?(response.body)).to eq true
    expect(response.body.include?('"kind": "books#volumes"')).to eq true
  end

  def valid_json?(json)
    JSON.parse(json)
    return true
  rescue JSON::ParserError => e
    return false
  end

end
