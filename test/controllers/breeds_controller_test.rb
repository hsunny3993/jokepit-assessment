require "test_helper"

class BreedsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get breeds_path

    assert_response :success
    assert_dom "form input", 1
  end

  test "should return random image on existing" do
    breed_name = 'basenji'

    breed_image_path = FetchBreed.call(breed_name)

    assert_not_equal breed_image_path, 'not_exist'
  end

  test "should return not-exist on not-existing breed" do
    breed_name = 'nobreed'

    breed_image_path = FetchBreed.call(breed_name)

    assert_equal breed_image_path, 'not_exist'
  end
end
