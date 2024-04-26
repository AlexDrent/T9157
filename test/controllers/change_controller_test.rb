require "test_helper"

class ChangeControllerTest < ActionDispatch::IntegrationTest
  test "should get roles" do
    get change_roles_url
    assert_response :success
  end
end
