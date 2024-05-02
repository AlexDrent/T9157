require "test_helper"

class CommitteeAgendaItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @committee_agenda_item = committee_agenda_items(:one)
  end

  test "should get index" do
    get committee_agenda_items_url
    assert_response :success
  end

  test "should get new" do
    get new_committee_agenda_item_url
    assert_response :success
  end

  test "should create committee_agenda_item" do
    assert_difference("CommitteeAgendaItem.count") do
      post committee_agenda_items_url, params: { committee_agenda_item: { details: @committee_agenda_item.details, done: @committee_agenda_item.done, subject: @committee_agenda_item.subject } }
    end

    assert_redirected_to committee_agenda_item_url(CommitteeAgendaItem.last)
  end

  test "should show committee_agenda_item" do
    get committee_agenda_item_url(@committee_agenda_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_committee_agenda_item_url(@committee_agenda_item)
    assert_response :success
  end

  test "should update committee_agenda_item" do
    patch committee_agenda_item_url(@committee_agenda_item), params: { committee_agenda_item: { details: @committee_agenda_item.details, done: @committee_agenda_item.done, subject: @committee_agenda_item.subject } }
    assert_redirected_to committee_agenda_item_url(@committee_agenda_item)
  end

  test "should destroy committee_agenda_item" do
    assert_difference("CommitteeAgendaItem.count", -1) do
      delete committee_agenda_item_url(@committee_agenda_item)
    end

    assert_redirected_to committee_agenda_items_url
  end
end
