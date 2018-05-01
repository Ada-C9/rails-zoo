class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def create
    @animal = Animal.new(
      name: params[:animal][:name],
      species: params[:animal][:species],
      age: params[:animal][:age]
    )
    # ".save" returns a boolean result
    if @animal.save
      # success
      redirect_to animals_path
    else
      # failure
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def destroy

  end
end
