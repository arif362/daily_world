class Job::CompaniesController < ApplicationController
  before_action :set_job_company, only: %i[ show edit update destroy ]

  # GET /job/companies or /job/companies.json
  def index
    @job_companies = Job::Company.all
  end

  # GET /job/companies/1 or /job/companies/1.json
  def show
  end

  # GET /job/companies/new
  def new
    @job_company = Job::Company.new
  end

  # GET /job/companies/1/edit
  def edit
  end

  # POST /job/companies or /job/companies.json
  def create
    @job_company = Job::Company.new(job_company_params)

    respond_to do |format|
      if @job_company.save
        format.html { redirect_to job_company_url(@job_company), notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @job_company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job/companies/1 or /job/companies/1.json
  def update
    respond_to do |format|
      if @job_company.update(job_company_params)
        format.html { redirect_to job_company_url(@job_company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @job_company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job/companies/1 or /job/companies/1.json
  def destroy
    @job_company.destroy

    respond_to do |format|
      format.html { redirect_to job_companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_company
      @job_company = Job::Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_company_params
      params.require(:job_company).permit(:title, :description, :email, :address)
    end
end
