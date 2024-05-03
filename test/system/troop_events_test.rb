require "application_system_test_case"

class TroopEventsTest < ApplicationSystemTestCase
  setup do
    @troop_event = troop_events(:one)
  end

  test "visiting the index" do
    visit troop_events_url
    assert_selector "h1", text: "Troop events"
  end

  test "should create troop event" do
    visit troop_events_url
    click_on "New troop event"

    fill_in "Cost", with: @troop_event.cost
    fill_in "Description", with: @troop_event.description
    fill_in "End date", with: @troop_event.end_date
    fill_in "End time", with: @troop_event.end_time
    fill_in "Location", with: @troop_event.location
    fill_in "Start date", with: @troop_event.start_date
    fill_in "Start time", with: @troop_event.start_time
    fill_in "Title", with: @troop_event.title
    click_on "Create Troop event"

    assert_text "Troop event was successfully created"
    click_on "Back"
  end

  test "should update Troop event" do
    visit troop_event_url(@troop_event)
    click_on "Edit this troop event", match: :first

    fill_in "Cost", with: @troop_event.cost
    fill_in "Description", with: @troop_event.description
    fill_in "End date", with: @troop_event.end_date
    fill_in "End time", with: @troop_event.end_time
    fill_in "Location", with: @troop_event.location
    fill_in "Start date", with: @troop_event.start_date
    fill_in "Start time", with: @troop_event.start_time
    fill_in "Title", with: @troop_event.title
    click_on "Update Troop event"

    assert_text "Troop event was successfully updated"
    click_on "Back"
  end

  test "should destroy Troop event" do
    visit troop_event_url(@troop_event)
    click_on "Destroy this troop event", match: :first

    assert_text "Troop event was successfully destroyed"
  end
end
