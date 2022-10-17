require "test_helper"

class LibrariansControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get librarians_new_url
    assert_response :success
  end
end
