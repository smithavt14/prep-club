class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @prep = Prep.find(params[:prep_id])
    @booking = Booking.new
    @booking.user = current_user
    @booking.prep = Prep.find(params[:prep_id])
    authorize @booking
    @prep.bookings.count < @prep.max_participants ? @booking.save : flash[:alert] = "This event is already at full capacity. Please try again later."
    redirect_to prep_path(@booking.prep)
  end

  def destroy
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
