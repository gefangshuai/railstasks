class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:new, :edit]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end
  # GET /projects/1/edit
  def edit
    
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        build_users params[:users], @project
        flash[:success] = '项目添加成功！'
        format.html { redirect_to projects_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        build_users params[:users], @project
        flash[:success] = '项目编辑成功！'
        format.html { redirect_to projects_path }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    flash[:success] = "项目删除成功！"
    respond_to do |format|
      format.html { redirect_to projects_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description)
    end

    def build_users (user_ids, project)
      # todo 要优化
      project.users.each do |u|
        u.update_attribute(:project, nil)
      end
      if user_ids != nil
        user_ids.each do |user_id|
          user = User.find(user_id)
          user.update_attribute(:project, @project)
        end
      end
    end

    def set_users
      @users = User.all
    end
end
