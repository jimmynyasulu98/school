require "test_helper"

class FormSubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get form_subjects_index_url
    assert_response :success
  end

  test "should get new" do
    get form_subjects_new_url
    assert_response :success
  end

  test "should get create" do
    get form_subjects_create_url
    assert_response :success
  end

  test "should get edit" do
    get form_subjects_edit_url
    assert_response :success
  end

  test "should get update" do
    get form_subjects_update_url
    assert_response :success
  end

  test "should get destroy" do
    get form_subjects_destroy_url
    assert_response :success
  end
end
