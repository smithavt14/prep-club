class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.prep = Prep.find(params[:id])
    @booking.save
    redirect_to prep_path(@booking.prep)
  end

  def destroy
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
