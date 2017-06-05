require 'test_helper'

class TraineeModuleControllerTest < ActionDispatch::IntegrationTest
  test "should get assign" do
    get trainee_module_assign_url
    assert_response :success
  end

  test "should get completed" do
    get trainee_module_completed_url
    assert_response :success
  end

  test "should get Remaining" do
    get trainee_module_Remaining_url
    assert_response :success
  end

end
