class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

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
    @prep.check_max_participants? ? @booking.save : flash[:alert] = "This event is already at full capacity. Please try again later."
    redirect_to prep_path(@booking.prep)
  end

  def destroy
    @prep = Prep.find(params[:id])
    @booking = @prep.bookings.find { |booking| booking.user == current_user }
    authorize @booking
    @booking.destroy
    redirect_to prep_path(@prep)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
