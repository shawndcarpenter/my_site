class EducationPointsController < ApplicationController
  before_action :set_education_point, only: %i[ show edit update destroy ]

  # GET /education_points or /education_points.json
  def index
    @education_points = EducationPoint.all
  end

  # GET /education_points/1 or /education_points/1.json
  def show
  end

  # GET /education_points/new
  def new
    @education_point = EducationPoint.new
  end

  # GET /education_points/1/edit
  def edit
  end

  # POST /education_points or /education_points.json
  def create
    @education_point = EducationPoint.new(education_point_params)

    respond_to do |format|
      if @education_point.save
        format.html { redirect_to education_point_url(@education_point), notice: "Education point was successfully created." }
        format.json { render :show, status: :created, location: @education_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @education_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /education_points/1 or /education_points/1.json
  def update
    respond_to do |format|
      if @education_point.update(education_point_params)
        format.html { redirect_to education_point_url(@education_point), notice: "Education point was successfully updated." }
        format.json { render :show, status: :ok, location: @education_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @education_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /education_points/1 or /education_points/1.json
  def destroy
    @education_point.destroy!

    respond_to do |format|
      format.html { redirect_to education_points_url, notice: "Education point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education_point
      @education_point = EducationPoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def education_point_params
      params.require(:education_point).permit(:text, :education_id)
    end
end
