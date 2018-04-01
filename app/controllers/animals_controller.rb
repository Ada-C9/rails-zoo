class AnimalsController < ApplicationController
  def index
    @animals = Animal.order(:name)
  end

  def show
    @animal = Animal.find_by(id: params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create

    # raw_animal = params[:animal]
    #
    # animal = Animal.new
    # animal.name = raw_animal[:name]
    # animal.species = raw_animal[:species]
    # animal.age = raw_animal[:age]

    animal = Animal.new(animal_params)

    if animal.save
      redirect_to animals_path
    end
  end

  def destroy
    @animal = Animal.find_by(id: params[:id])
    if @animal
      @animal.destroy
    end
    redirect_to animals_path
  end

  private
  def animal_params
    params.require(:animal).permit(:name, :species, :age)
  end
end
