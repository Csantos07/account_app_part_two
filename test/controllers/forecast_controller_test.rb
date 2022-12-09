require "test_helper"

class ForecastControllerTest < ActionDispatch::IntegrationTest
  test "should get estimate" do
    get forecast_estimate_url
    assert_response :success
  end
end
