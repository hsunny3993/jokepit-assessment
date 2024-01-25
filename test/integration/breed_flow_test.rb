require "test_helper"

class BreedFlowTest < ActionDispatch::IntegrationTest
  test "can fetch breed image" do
    visit breeds_path

    fill_in 'Breed', with: 'not-existing-bread'
    click_on 'Submit'

    assert_equal find(:xpath, '//img')[:src], 'no-image.png'
  end
end
