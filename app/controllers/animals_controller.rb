class AnimalsController < ApplicationController
  def index
    @animals = Animal.all.order(vote: :desc)
  end

  def show
    @animal = Animal.find_by(id: params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.vote = 0
    if @animal.save
      redirect_to animals_path
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find_by(id: params[:id])
  end

  def update
    @animal = Animal.find_by(id: params[:id])

    if @animal
      @animal.vote ||= 0
      if @animal.update(animal_params)
        redirect_to animal_path
      else
        render :edit
      end
    end
  end

  def vote
    @animal = Animal.find_by(id: params[:id])

    if @animal
      @animal.vote += 1
      if @animal.save
        redirect_to animal_path
      else
        render :show
      end
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
    return params.require(:animal).permit(:name, :species, :gender, :age, :image, :vote)
  end
end
