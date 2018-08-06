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
    @prep = Prep.new(params[:prep])
    @prep.user = current_user
    authorize @prep
    @prep.save
    redirect_to prep_path(@prep)
  end

  def edit
    authorize @prep
  end

  def update
    @prep.update(params[:prep])
  end

  def destroy
    @prep.destroy
    redirect_to preps_path
  end

  private

  def set_prep
    @prep = Prep.find(params[:id])
    authorize @prep
  end
end
