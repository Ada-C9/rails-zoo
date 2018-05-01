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

  def update
    # update the database
    @animal = Animal.find(params[:id])
    result = @animal.update({
      name: params[:animal][:name],
      species: params[:animal][:species],
      age: params[:animal][:age]
    })
    if result
      # if successful, go back to the show view
      redirect_to animal_path(@animal.id) # params[:id]
    else
      # if unsucessful, stay on the form
      render :edit
    end
  end

  def delete
    # remove this animal from db; don't need instance variable here because not using it in a view
    animal = Animal.find(params[:id])

    if animal.destroy
    # if successful, go back to index page
    redirect_to animals_path # same as what we had in create method
    else
    # if unsucessful, show an error - add error messages before updating this 'else'
    end
  end
end
