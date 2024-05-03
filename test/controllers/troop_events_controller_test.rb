require "test_helper"

class TroopEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @troop_event = troop_events(:one)
  end

  test "should get index" do
    get troop_events_url
    assert_response :success
  end

  test "should get new" do
    get new_troop_event_url
    assert_response :success
  end

  test "should create troop_event" do
    assert_difference("TroopEvent.count") do
      post troop_events_url, params: { troop_event: { cost: @troop_event.cost, description: @troop_event.description, end_date: @troop_event.end_date, end_time: @troop_event.end_time, location: @troop_event.location, start_date: @troop_event.start_date, start_time: @troop_event.start_time, title: @troop_event.title } }
    end

    assert_redirected_to troop_event_url(TroopEvent.last)
  end

  test "should show troop_event" do
    get troop_event_url(@troop_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_troop_event_url(@troop_event)
    assert_response :success
  end

  test "should update troop_event" do
    patch troop_event_url(@troop_event), params: { troop_event: { cost: @troop_event.cost, description: @troop_event.description, end_date: @troop_event.end_date, end_time: @troop_event.end_time, location: @troop_event.location, start_date: @troop_event.start_date, start_time: @troop_event.start_time, title: @troop_event.title } }
    assert_redirected_to troop_event_url(@troop_event)
  end

  test "should destroy troop_event" do
    assert_difference("TroopEvent.count", -1) do
      delete troop_event_url(@troop_event)
    end

    assert_redirected_to troop_events_url
  end
end
