require "application_system_test_case"

class CommitteeMeetingsTest < ApplicationSystemTestCase
  setup do
    @committee_meeting = committee_meetings(:one)
  end

  test "visiting the index" do
    visit committee_meetings_url
    assert_selector "h1", text: "Committee meetings"
  end

  test "should create committee meeting" do
    visit committee_meetings_url
    click_on "New committee meeting"

    fill_in "Date", with: @committee_meeting.date
    click_on "Create Committee meeting"

    assert_text "Committee meeting was successfully created"
    click_on "Back"
  end

  test "should update Committee meeting" do
    visit committee_meeting_url(@committee_meeting)
    click_on "Edit this committee meeting", match: :first

    fill_in "Date", with: @committee_meeting.date
    click_on "Update Committee meeting"

    assert_text "Committee meeting was successfully updated"
    click_on "Back"
  end

  test "should destroy Committee meeting" do
    visit committee_meeting_url(@committee_meeting)
    click_on "Destroy this committee meeting", match: :first

    assert_text "Committee meeting was successfully destroyed"
  end
end
