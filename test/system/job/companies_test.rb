require "application_system_test_case"

class Job::CompaniesTest < ApplicationSystemTestCase
  setup do
    @job_company = job_companies(:one)
  end

  test "visiting the index" do
    visit job_companies_url
    assert_selector "h1", text: "Companies"
  end

  test "should create company" do
    visit job_companies_url
    click_on "New company"

    fill_in "Address", with: @job_company.address
    fill_in "Description", with: @job_company.description
    fill_in "Email", with: @job_company.email
    fill_in "Title", with: @job_company.title
    click_on "Create Company"

    assert_text "Company was successfully created"
    click_on "Back"
  end

  test "should update Company" do
    visit job_company_url(@job_company)
    click_on "Edit this company", match: :first

    fill_in "Address", with: @job_company.address
    fill_in "Description", with: @job_company.description
    fill_in "Email", with: @job_company.email
    fill_in "Title", with: @job_company.title
    click_on "Update Company"

    assert_text "Company was successfully updated"
    click_on "Back"
  end

  test "should destroy Company" do
    visit job_company_url(@job_company)
    click_on "Destroy this company", match: :first

    assert_text "Company was successfully destroyed"
  end
end
