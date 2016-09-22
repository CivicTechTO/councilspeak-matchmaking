require 'test_helper'

class AgendaItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agenda_items_index_url
    assert_response :success
  end

end
