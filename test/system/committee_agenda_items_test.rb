require "application_system_test_case"

class CommitteeAgendaItemsTest < ApplicationSystemTestCase
  setup do
    @committee_agenda_item = committee_agenda_items(:one)
  end

  test "visiting the index" do
    visit committee_agenda_items_url
    assert_selector "h1", text: "Committee agenda items"
  end

  test "should create committee agenda item" do
    visit committee_agenda_items_url
    click_on "New committee agenda item"

    fill_in "Details", with: @committee_agenda_item.details
    check "Done" if @committee_agenda_item.done
    fill_in "Subject", with: @committee_agenda_item.subject
    click_on "Create Committee agenda item"

    assert_text "Committee agenda item was successfully created"
    click_on "Back"
  end

  test "should update Committee agenda item" do
    visit committee_agenda_item_url(@committee_agenda_item)
    click_on "Edit this committee agenda item", match: :first

    fill_in "Details", with: @committee_agenda_item.details
    check "Done" if @committee_agenda_item.done
    fill_in "Subject", with: @committee_agenda_item.subject
    click_on "Update Committee agenda item"

    assert_text "Committee agenda item was successfully updated"
    click_on "Back"
  end

  test "should destroy Committee agenda item" do
    visit committee_agenda_item_url(@committee_agenda_item)
    click_on "Destroy this committee agenda item", match: :first

    assert_text "Committee agenda item was successfully destroyed"
  end
end
