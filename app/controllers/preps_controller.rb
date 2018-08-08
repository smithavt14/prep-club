class PrepsController < ApplicationController
  before_action :set_prep, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @preps = policy_scope(Prep)
    @preps = Prep.where.not(latitude: nil, longitude: nil)

    @markers = @preps.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @related_preps = @prep.find_related_tags
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
    params.require(:prep).permit(:name, :description, :max_participants, :meal, :time, :location, :photo, :tag_list)
  end
end
