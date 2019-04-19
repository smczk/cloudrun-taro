require "bundler"
Bundler.require(:default, :test)

require "test/unit"
require "rack/test"

APP = Rack::Builder.parse_file("config.ru").first

class TestApp < Test::Unit::TestCase
include Rack::Test::Methods

  def app
    APP
  end

  def test_status
    get "/"
    assert last_response.ok?
  end

  def test_content_type
    get "/"
    assert_equal last_response.content_type, "text/plain"
  end

  def test_body
    get "/"
    assert_equal last_response.body, "OK"
  end
end
