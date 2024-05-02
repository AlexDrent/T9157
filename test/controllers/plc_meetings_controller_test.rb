require "test_helper"

class PlcMeetingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plc_meeting = plc_meetings(:one)
  end

  test "should get index" do
    get plc_meetings_url
    assert_response :success
  end

  test "should get new" do
    get new_plc_meeting_url
    assert_response :success
  end

  test "should create plc_meeting" do
    assert_difference("PlcMeeting.count") do
      post plc_meetings_url, params: { plc_meeting: { date: @plc_meeting.date } }
    end

    assert_redirected_to plc_meeting_url(PlcMeeting.last)
  end

  test "should show plc_meeting" do
    get plc_meeting_url(@plc_meeting)
    assert_response :success
  end

  test "should get edit" do
    get edit_plc_meeting_url(@plc_meeting)
    assert_response :success
  end

  test "should update plc_meeting" do
    patch plc_meeting_url(@plc_meeting), params: { plc_meeting: { date: @plc_meeting.date } }
    assert_redirected_to plc_meeting_url(@plc_meeting)
  end

  test "should destroy plc_meeting" do
    assert_difference("PlcMeeting.count", -1) do
      delete plc_meeting_url(@plc_meeting)
    end

    assert_redirected_to plc_meetings_url
  end
end
