class PlacesController < ApplicationController
  before_action :find_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.where(active: true)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.update(
      user_id: current_user.id
    )

    if @place.save
      redirect_to places_path,
      notice: 'You place is on moderation and will be added after approval by administrator'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @place.update(place_params)
      redirect_to @place
    else
      render :edit
    end
  end

  def destroy
    @place.destroy

    redirect_to places_path
  end

  def show
  end

  private

  def find_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:title, :description, :category_id, :terms)
  end
end
