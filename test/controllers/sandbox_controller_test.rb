require "test_helper"

class SandboxControllerTest < ActionDispatch::IntegrationTest
  test "should get card" do
    get sandbox_card_url
    assert_response :success
  end
end
