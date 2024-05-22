require "test_helper"

class AcademicYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_year = academic_years(:one)
  end

  test "should get index" do
    get academic_years_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_year_url
    assert_response :success
  end

  test "should create academic_year" do
    assert_difference("AcademicYear.count") do
      post academic_years_url, params: { academic_year: { end_date: @academic_year.end_date, name: @academic_year.name, start_date: @academic_year.start_date } }
    end

    assert_redirected_to academic_year_url(AcademicYear.last)
  end

  test "should show academic_year" do
    get academic_year_url(@academic_year)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_year_url(@academic_year)
    assert_response :success
  end

  test "should update academic_year" do
    patch academic_year_url(@academic_year), params: { academic_year: { end_date: @academic_year.end_date, name: @academic_year.name, start_date: @academic_year.start_date } }
    assert_redirected_to academic_year_url(@academic_year)
  end

  test "should destroy academic_year" do
    assert_difference("AcademicYear.count", -1) do
      delete academic_year_url(@academic_year)
    end

    assert_redirected_to academic_years_url
  end
end
