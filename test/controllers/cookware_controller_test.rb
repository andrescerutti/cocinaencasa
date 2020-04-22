require 'test_helper'

class CookwareControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cookware_index_url
    assert_response :success
  end

  test "should get create" do
    get cookware_create_url
    assert_response :success
  end

  test "should get update" do
    get cookware_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cookware_destroy_url
    assert_response :success
  end

end
