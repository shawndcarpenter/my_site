class ProjectPointsController < ApplicationController
  before_action :set_project_point, only: %i[ show edit update destroy ]

  # GET /project_points or /project_points.json
  def index
    @project_points = ProjectPoint.all
  end

  # GET /project_points/1 or /project_points/1.json
  def show
  end

  # GET /project_points/new
  def new
    @project_point = ProjectPoint.new
  end

  # GET /project_points/1/edit
  def edit
  end

  # POST /project_points or /project_points.json
  def create
    @project_point = ProjectPoint.new(project_point_params)

    respond_to do |format|
      if @project_point.save
        format.html { redirect_to project_point_url(@project_point), notice: "Project point was successfully created." }
        format.json { render :show, status: :created, location: @project_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_points/1 or /project_points/1.json
  def update
    respond_to do |format|
      if @project_point.update(project_point_params)
        format.html { redirect_to project_point_url(@project_point), notice: "Project point was successfully updated." }
        format.json { render :show, status: :ok, location: @project_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_points/1 or /project_points/1.json
  def destroy
    @project_point.destroy!

    respond_to do |format|
      format.html { redirect_to project_points_url, notice: "Project point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_point
      @project_point = ProjectPoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_point_params
      params.require(:project_point).permit(:text, :project_id)
    end
end
