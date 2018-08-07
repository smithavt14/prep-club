class PrepsController < ApplicationController
  before_action :set_prep, only: [:show, :edit, :update, :destroy]

  def index
    @preps = policy_scope(Prep)
  end

  def show
  end

  def new
    @prep = Prep.new
    authorize @prep
  end

  def create
    @prep = Prep.new(prep_params)
    @prep.user = current_user
    authorize @prep
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

  private

  def set_prep
    @prep = Prep.find(params[:id])
    authorize @prep
  end

  def prep_params
    params.require(:prep).permit(:name, :description, :max_participants, :meal, :time, :location, :photo)
  end
end
