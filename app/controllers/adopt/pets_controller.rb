class Adopt::PetsController < ApplicationController
  def index
    if params[:search].present?
      @pets = Pet.search(params[:search])
    else
      @pets = Pet.adoptable
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    pet = Pet.new(pet_params)
    if pet.save
      redirect_to "/adopt/shelters/#{pet_params[:shelter_id]}/pets"
    else
      redirect_to "/adopt/shelters/#{pet_params[:shelter_id]}/pets/new"
      flash[:alert] = "Error: #{error_message(pet.errors)}"
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    if pet.update(pet_params)
      redirect_to "/adopt/pets/#{pet.id}"
    else
      redirect_to "/adopt/pets/#{pet.id}/edit"
      flash[:alert] = "Error: #{error_message(pet.errors)}"
    end
  end

  def destroy
    Pet.find(params[:id]).destroy
    redirect_to "/adopt/pets"
  end

  private

  def pet_params
    params.permit(:id, :name, :age, :breed, :adoptable, :shelter_id)
  end

  def extra_params
    params.permit(:commit, :authenticity_token)
  end
end
