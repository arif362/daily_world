class Job::PostsController < ApplicationController
  before_action :set_job_post, only: %i[ show edit update destroy ]

  # GET /job/posts or /job/posts.json
  def index
    @job_posts = Job::Post.all
  end

  # GET /job/posts/1 or /job/posts/1.json
  def show
  end

  # GET /job/posts/new
  def new
    @job_post = Job::Post.new
  end

  # GET /job/posts/1/edit
  def edit
  end

  # POST /job/posts or /job/posts.json
  def create
    @job_post = Job::Post.new(job_post_params)

    respond_to do |format|
      if @job_post.save
        format.html { redirect_to job_post_url(@job_post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @job_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job/posts/1 or /job/posts/1.json
  def update
    respond_to do |format|
      if @job_post.update(job_post_params)
        format.html { redirect_to job_post_url(@job_post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @job_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job/posts/1 or /job/posts/1.json
  def destroy
    @job_post.destroy

    respond_to do |format|
      format.html { redirect_to job_posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_post
      @job_post = Job::Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_post_params
      params.require(:job_post).permit(:title, :job_company_id, :description, :deadline)
    end
end
