require "application_system_test_case"

class Admin::CompaniesTest < ApplicationSystemTestCase
  setup do
    @admin_company = admin_companies(:one)
  end

  test "visiting the index" do
    visit admin_companies_url
    assert_selector "h1", text: "Companies"
  end

  test "should create company" do
    visit admin_companies_url
    click_on "New company"

    fill_in "Address", with: @admin_company.address
    fill_in "Name", with: @admin_company.name
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "should update Company" do
    visit admin_company_url(@admin_company)
    click_on "Edit this company", match: :first

    fill_in "Address", with: @admin_company.address
    fill_in "Name", with: @admin_company.name
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "should destroy Company" do
    visit admin_company_url(@admin_company)
    click_on "Destroy this company", match: :first

    assert_text "Company was successfully destroyed"
  end
end
