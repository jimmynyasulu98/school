require "application_system_test_case"

class TermsTest < ApplicationSystemTestCase
  setup do
    @term = terms(:one)
  end

  test "visiting the index" do
    visit terms_url
    assert_selector "h1", text: "Terms"
  end

  test "should create term" do
    visit terms_url
    click_on "New term"

    fill_in "Academic year", with: @term.academic_year_id
    fill_in "End date", with: @term.end_date
    fill_in "Name", with: @term.name
    check "Registration open" if @term.registration_open
    fill_in "Start date", with: @term.start_date
    click_on "Create Term"

    assert_text "Term was successfully created"
    click_on "Back"
  end

  test "should update Term" do
    visit term_url(@term)
    click_on "Edit this term", match: :first

    fill_in "Academic year", with: @term.academic_year_id
    fill_in "End date", with: @term.end_date
    fill_in "Name", with: @term.name
    check "Registration open" if @term.registration_open
    fill_in "Start date", with: @term.start_date
    click_on "Update Term"

    assert_text "Term was successfully updated"
    click_on "Back"
  end

  test "should destroy Term" do
    visit term_url(@term)
    click_on "Destroy this term", match: :first

    assert_text "Term was successfully destroyed"
  end
end
