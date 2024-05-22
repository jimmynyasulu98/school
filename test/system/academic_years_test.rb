require "application_system_test_case"

class AcademicYearsTest < ApplicationSystemTestCase
  setup do
    @academic_year = academic_years(:one)
  end

  test "visiting the index" do
    visit academic_years_url
    assert_selector "h1", text: "Academic years"
  end

  test "should create academic year" do
    visit academic_years_url
    click_on "New academic year"

    fill_in "End date", with: @academic_year.end_date
    fill_in "Name", with: @academic_year.name
    fill_in "Start date", with: @academic_year.start_date
    click_on "Create Academic year"

    assert_text "Academic year was successfully created"
    click_on "Back"
  end

  test "should update Academic year" do
    visit academic_year_url(@academic_year)
    click_on "Edit this academic year", match: :first

    fill_in "End date", with: @academic_year.end_date
    fill_in "Name", with: @academic_year.name
    fill_in "Start date", with: @academic_year.start_date
    click_on "Update Academic year"

    assert_text "Academic year was successfully updated"
    click_on "Back"
  end

  test "should destroy Academic year" do
    visit academic_year_url(@academic_year)
    click_on "Destroy this academic year", match: :first

    assert_text "Academic year was successfully destroyed"
  end
end
