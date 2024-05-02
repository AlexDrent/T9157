require "test_helper"

class CommitteeMeetingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @committee_meeting = committee_meetings(:one)
  end

  test "should get index" do
    get committee_meetings_url
    assert_response :success
  end

  test "should get new" do
    get new_committee_meeting_url
    assert_response :success
  end

  test "should create committee_meeting" do
    assert_difference("CommitteeMeeting.count") do
      post committee_meetings_url, params: { committee_meeting: { date: @committee_meeting.date } }
    end

    assert_redirected_to committee_meeting_url(CommitteeMeeting.last)
  end

  test "should show committee_meeting" do
    get committee_meeting_url(@committee_meeting)
    assert_response :success
  end

  test "should get edit" do
    get edit_committee_meeting_url(@committee_meeting)
    assert_response :success
  end

  test "should update committee_meeting" do
    patch committee_meeting_url(@committee_meeting), params: { committee_meeting: { date: @committee_meeting.date } }
    assert_redirected_to committee_meeting_url(@committee_meeting)
  end

  test "should destroy committee_meeting" do
    assert_difference("CommitteeMeeting.count", -1) do
      delete committee_meeting_url(@committee_meeting)
    end

    assert_redirected_to committee_meetings_url
  end
end
