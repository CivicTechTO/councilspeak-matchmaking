require 'test_helper'

class WizardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wizard_index_url
    assert_response :success
  end

end
