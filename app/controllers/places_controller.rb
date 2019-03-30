class PlacesController < ApplicationController
  before_action :find_place, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category]
      @places = Place.where(active: true, category_id: params[:category]).paginate(page: params[:page], per_page: 20)
    else
      @places = Place.where(active: true).paginate(page: params[:page], per_page: 20)
    end
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
      notice: 'Your place is on moderation and will be added after approval by administrator'
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
    if @place.comments.present?
      @overall = overall_calculate
      @food_quality_average = food_quality_average_calculate
      @service_quality_average = service_quality_average_calculate
      @interior_average = interior_average_calculate
    end
  end

  private

  def overall_calculate
    sum = food_quality_average_calculate +
    service_quality_average_calculate + interior_average_calculate

    (sum / 3).round(1)
  end

  def food_quality_average_calculate
    sum = 0
    @place.comments.each do |comment|
      sum += comment.food_quality.to_f
    end

    (sum / @place.comments.count).round(1) if @place.comments.present?
  end

  def service_quality_average_calculate
    sum = 0
    @place.comments.each do |comment|
      sum += comment.service_quality.to_f
    end

    (sum / @place.comments.count).round(1) if @place.comments.present?
  end

  def interior_average_calculate
    sum = 0
    @place.comments.each do |comment|
      sum += comment.interior.to_f
    end

    (sum / @place.comments.count).round(1) if @place.comments.present?
  end

  def find_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(
      :title,
      :description,
      :category_id,
      :terms,
      :main_photo,
      pictures: []
    )
  end
end
