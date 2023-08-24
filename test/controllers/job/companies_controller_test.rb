require "test_helper"

class Job::CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_company = job_companies(:one)
  end

  test "should get index" do
    get job_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_job_company_url
    assert_response :success
  end

  test "should create job_company" do
    assert_difference("Job::Company.count") do
      post job_companies_url, params: { job_company: { address: @job_company.address, description: @job_company.description, email: @job_company.email, title: @job_company.title } }
    end

    assert_redirected_to job_company_url(Job::Company.last)
  end

  test "should show job_company" do
    get job_company_url(@job_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_company_url(@job_company)
    assert_response :success
  end

  test "should update job_company" do
    patch job_company_url(@job_company), params: { job_company: { address: @job_company.address, description: @job_company.description, email: @job_company.email, title: @job_company.title } }
    assert_redirected_to job_company_url(@job_company)
  end

  test "should destroy job_company" do
    assert_difference("Job::Company.count", -1) do
      delete job_company_url(@job_company)
    end

    assert_redirected_to job_companies_url
  end
end
