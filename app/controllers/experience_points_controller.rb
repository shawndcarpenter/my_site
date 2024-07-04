class ExperiencePointsController < ApplicationController
  before_action :set_experience_point, only: %i[ show edit update destroy ]

  # GET /experience_points or /experience_points.json
  def index
    @experience_points = ExperiencePoint.all
  end

  # GET /experience_points/1 or /experience_points/1.json
  def show
  end

  # GET /experience_points/new
  def new
    @experience_point = ExperiencePoint.new
  end

  # GET /experience_points/1/edit
  def edit
  end

  # POST /experience_points or /experience_points.json
  def create
    @experience_point = ExperiencePoint.new(experience_point_params)

    respond_to do |format|
      if @experience_point.save
        format.html { redirect_to experience_point_url(@experience_point), notice: "Experience point was successfully created." }
        format.json { render :show, status: :created, location: @experience_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @experience_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experience_points/1 or /experience_points/1.json
  def update
    respond_to do |format|
      if @experience_point.update(experience_point_params)
        format.html { redirect_to experience_point_url(@experience_point), notice: "Experience point was successfully updated." }
        format.json { render :show, status: :ok, location: @experience_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @experience_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experience_points/1 or /experience_points/1.json
  def destroy
    @experience_point.destroy!

    respond_to do |format|
      format.html { redirect_to experience_points_url, notice: "Experience point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience_point
      @experience_point = ExperiencePoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def experience_point_params
      params.require(:experience_point).permit(:text, :experience_id)
    end
end
