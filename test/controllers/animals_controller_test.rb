require 'test_helper'

class AnimalsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get animals_create_url
    assert_response :success
  end

  test "should get controller" do
    get animals_controller_url
    assert_response :success
  end

end
