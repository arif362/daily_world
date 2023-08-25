class Admin::CompaniesController < ApplicationController
  layout 'admin/admins'
  before_action :authenticate_user!, :authenticate_admin!

  before_action :set_admin_company, only: %i[ show edit update destroy ]

  # GET /admin/companies or /admin/companies.json
  def index
    @admin_companies = Admin::Company.all
  end

  # GET /admin/companies/1 or /admin/companies/1.json
  def show
  end

  # GET /admin/companies/new
  def new
    @admin_company = Admin::Company.new
  end

  # GET /admin/companies/1/edit
  def edit
  end

  # POST /admin/companies or /admin/companies.json
  def create
    @admin_company = Admin::Company.new(admin_company_params)

    respond_to do |format|
      if @admin_company.save
        format.html { redirect_to admin_company_url(@admin_company), notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @admin_company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/companies/1 or /admin/companies/1.json
  def update
    respond_to do |format|
      if @admin_company.update(admin_company_params)
        format.html { redirect_to admin_company_url(@admin_company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/companies/1 or /admin/companies/1.json
  def destroy
    @admin_company.destroy

    respond_to do |format|
      format.html { redirect_to admin_companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_company
      @admin_company = Admin::Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_company_params
      params.require(:admin_company).permit(:name, :address)
    end
end
