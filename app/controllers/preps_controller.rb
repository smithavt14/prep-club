class PrepsController < ApplicationController
  before_action :set_prep, only: [:show, :edit, :update, :destroy]

  def index
    @preps = policy_scope(Prep)
    @preps = Prep.all
    @markers = @preps.map do |prep|
      {
        lat: prep.latitude,
        lng: prep.longitude,
        infoWindow: { content: render_to_string(partial: "/preps/map_box", locals: { prep: prep })
                      }
      }
    end
  end

  def show
    @related_preps = @prep.find_related_tags
    @user_booking_status = @prep.check_user_booking_status?(current_user)
    @booking = @prep.bookings.where { |booking| booking.user == current_user }
    @marker = [{
                 lat: @prep.latitude,
                 lng: @prep.longitude
    }]
    if @prep.photo
      @photo = @prep.photo
    else
      @photo = @prep.photo_url
    end
  end

  def new
    @most_used_tags = []
    ActsAsTaggableOn::Tag.most_used(5).each do |tag|
      @most_used_tags << tag.name
    end
    @most_used_tags
    @prep = Prep.new
    authorize @prep
  end

  def create
    @prep = Prep.new(prep_params)
    @prep.user = current_user
    authorize @prep
    ActsAsTaggableOn.force_lowercase = true
    ActsAsTaggableOn.delimiter = ','
    @prep.save
    redirect_to prep_path(@prep)
  end

  def edit
    authorize @prep
  end

  def update
    @prep.update(prep_params)
    redirect_to prep_path(@prep)
  end

  def destroy
    @prep.destroy
    authorize @prep
    redirect_to preps_path
  end

  def tagged
    if params[:tag].present?
      @preps = Prep.tagged_with(params[:tag])
    else
      @preps = Prep.all
    end
    authorize @preps
  end

  private

  def set_prep
    @prep = Prep.find(params[:id])
    authorize @prep
  end

  def prep_params
    params.require(:prep).permit(:name, :description, :max_participants, :recipe_name, :recipe_url, :recipe_ingredients,  :time, :location, :photo, :tag_list, :image_link)
  end
end
