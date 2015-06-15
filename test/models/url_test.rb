require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "should not save url without url string" do
    url = Url.new
    assert_not url.save, "salvou url sem um endereço inserido"
  end
  test "should not save url without unique url string" do
    url = Url.new
    url.url = "http://www.teste.com"
    assert_not url.save, "salvou url que já existia no banco"
  end
  test "should not save url if not valid url" do
    url = Url.new
    url.url = "test_invalid_url"
    assert_not url.save, "salvou url inválida"
  end
end
