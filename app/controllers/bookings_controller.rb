class BookingsController < ApplicationController
  # before_action :check_rider_or_admin_logged_in!

  def index
    @bookings = Booking.all
  end
  def show
    @booking = Booking.find(params[:id])
    @centre = @booking.centre
    @service = @booking.service

    @hash = Gmaps4rails.build_markers(@centre) do |centre, marker|
        marker.lat centre.latitude
        marker.lng centre.longitude
        marker.picture({
          "url" => "http://s29.postimg.org/4avln1f3n/gmapsmarkergreen.png",
          "width" => 100,
          "height" => 100
          })
      end
  end

  def edit
  end

  def create
    if current_user.complete_profile
      @booking = Booking.new(booking_params)
        if @booking.save
          redirect_to booking_path(@booking)
        else
          redirect_to service_path(params[:id])
        end
    else
      redirect_to edit_rider_path(current_user.id), alert: 'Merci de renseigner les champs obligatoires avant de réserver.'
    end
  end

  def update
    @service = Service.find(params[:id])
    @centre = Centre.find(params[:id])
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Votre réservation à été mis à jour.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def booking_confirmation
    @booking = Booking.find(params[:id])
    @centre = @booking.centre
    @booking.update(validation: true)
    @booking.mailer_booking_confirmation
    redirect_to centre_path(@centre)
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
       params.require(:booking).permit(:number_of_people, :rider_id, :service_id, :centre_id, :validation)
    end
end
