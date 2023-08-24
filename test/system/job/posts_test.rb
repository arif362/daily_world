require "application_system_test_case"

class Job::PostsTest < ApplicationSystemTestCase
  setup do
    @job_post = job_posts(:one)
  end

  test "visiting the index" do
    visit job_posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit job_posts_url
    click_on "New post"

    fill_in "Deadline", with: @job_post.deadline
    fill_in "Description", with: @job_post.description
    fill_in "Job/company", with: @job_post.job/company_id
    fill_in "Title", with: @job_post.title
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit job_post_url(@job_post)
    click_on "Edit this post", match: :first

    fill_in "Deadline", with: @job_post.deadline
    fill_in "Description", with: @job_post.description
    fill_in "Job/company", with: @job_post.job/company_id
    fill_in "Title", with: @job_post.title
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit job_post_url(@job_post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
