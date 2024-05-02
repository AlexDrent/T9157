require "application_system_test_case"

class PlcMeetingsTest < ApplicationSystemTestCase
  setup do
    @plc_meeting = plc_meetings(:one)
  end

  test "visiting the index" do
    visit plc_meetings_url
    assert_selector "h1", text: "Plc meetings"
  end

  test "should create plc meeting" do
    visit plc_meetings_url
    click_on "New plc meeting"

    fill_in "Date", with: @plc_meeting.date
    click_on "Create Plc meeting"

    assert_text "Plc meeting was successfully created"
    click_on "Back"
  end

  test "should update Plc meeting" do
    visit plc_meeting_url(@plc_meeting)
    click_on "Edit this plc meeting", match: :first

    fill_in "Date", with: @plc_meeting.date
    click_on "Update Plc meeting"

    assert_text "Plc meeting was successfully updated"
    click_on "Back"
  end

  test "should destroy Plc meeting" do
    visit plc_meeting_url(@plc_meeting)
    click_on "Destroy this plc meeting", match: :first

    assert_text "Plc meeting was successfully destroyed"
  end
end
