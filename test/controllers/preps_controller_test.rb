require 'test_helper'

class PrepsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get preps_index_url
    assert_response :success
  end

  test "should get show" do
    get preps_show_url
    assert_response :success
  end

  test "should get new" do
    get preps_new_url
    assert_response :success
  end

  test "should get create" do
    get preps_create_url
    assert_response :success
  end

  test "should get edit" do
    get preps_edit_url
    assert_response :success
  end

  test "should get update" do
    get preps_update_url
    assert_response :success
  end

  test "should get destroy" do
    get preps_destroy_url
    assert_response :success
  end

end
