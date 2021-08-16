require 'test_helper'

class PokespotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokespots_index_url
    assert_response :success
  end

  test "should get show" do
    get pokespots_show_url
    assert_response :success
  end

  test "should get new" do
    get pokespots_new_url
    assert_response :success
  end

  test "should get create" do
    get pokespots_create_url
    assert_response :success
  end

  test "should get edit" do
    get pokespots_edit_url
    assert_response :success
  end

  test "should get update" do
    get pokespots_update_url
    assert_response :success
  end

  test "should get destroy" do
    get pokespots_destroy_url
    assert_response :success
  end

end
