require "application_system_test_case"

class SignUpsTest < ApplicationSystemTestCase
  setup do
    @sign_up = sign_ups(:one)
  end

  test "visiting the index" do
    visit sign_ups_url
    assert_selector "h1", text: "Sign ups"
  end

  test "should create sign up" do
    visit sign_ups_url
    click_on "New sign up"

    fill_in "First name", with: @sign_up.first_name
    fill_in "Last name", with: @sign_up.last_name
    check "Paided" if @sign_up.paided
    click_on "Create Sign up"

    assert_text "Sign up was successfully created"
    click_on "Back"
  end

  test "should update Sign up" do
    visit sign_up_url(@sign_up)
    click_on "Edit this sign up", match: :first

    fill_in "First name", with: @sign_up.first_name
    fill_in "Last name", with: @sign_up.last_name
    check "Paided" if @sign_up.paided
    click_on "Update Sign up"

    assert_text "Sign up was successfully updated"
    click_on "Back"
  end

  test "should destroy Sign up" do
    visit sign_up_url(@sign_up)
    click_on "Destroy this sign up", match: :first

    assert_text "Sign up was successfully destroyed"
  end
end
