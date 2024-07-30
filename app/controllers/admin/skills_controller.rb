class Admin::SkillsController < ApplicationController
  layout 'admin/admins'
  before_action :authenticate_user!, :authenticate_admin!
  before_action :set_admin_skill, only: %i[ show edit update destroy ]

  # GET /admin/skills or /admin/skills.json
  def index
    @skills = Admin::Skill.paginate(page: params[:page]).order(name: :asc)
  end

  # GET /admin/skills/1 or /admin/skills/1.json
  def show
  end

  # GET /admin/skills/new
  def new
    @admin_skill = Admin::Skill.new
  end

  # GET /admin/skills/1/edit
  def edit
  end

  # POST /admin/skills or /admin/skills.json
  def create
    @admin_skill = Admin::Skill.new(admin_skill_params)

    respond_to do |format|
      if @admin_skill.save
        format.html { redirect_to admin_skill_url(@admin_skill), notice: "Skill was successfully created." }
        format.json { render :show, status: :created, location: @admin_skill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/skills/1 or /admin/skills/1.json
  def update
    respond_to do |format|
      if @admin_skill.update(admin_skill_params)
        format.html { redirect_to admin_skill_url(@admin_skill), notice: "Skill was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_skill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/skills/1 or /admin/skills/1.json
  def destroy
    @admin_skill.destroy

    respond_to do |format|
      format.html { redirect_to admin_skills_url, notice: "Skill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_skill
      @admin_skill = Admin::Skill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_skill_params
      params.require(:admin_skill).permit(:name)
    end
end
