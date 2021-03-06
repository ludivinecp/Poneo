class RidersController < ApplicationController
  before_action :check_rider_or_admin_logged_in!, only: [:show, :edit, :update]

  def show
    @rider = Rider.find(params[:id])
    @rider_bookings = @rider.rider_bookings
  end
  def edit
    @rider = current_user.rider
    session[:return_to] ||= request.referer #Allow user to be redirecting to the previous page (part 1/2)
  end

  def new
    @rider = Rider.new
  end

  def create
    @rider = Rider.new(user_params)
      if @rider.save
        redirect_to show_rider_path
      render :show
      else
      render :edit
      end
  end


  def update
    @rider = Rider.find(params[:id])
    if @rider.update(rider_params)
          redirect_to session.delete(:return_to), notice: 'Vous avez bien mis à jour votre profil !'  #Allow user to be redirecting to the previous page (part 2/2)
    else
    render :edit
    end
  end

  def destroy
    @rider.destroy
    respond_to do |format|
      format.html { redirect_to riders_url, notice: ' was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def rider_params
      params[:rider]
      params.require(:rider).permit(:age, :gender, :weight, :tall, :nickname, :level, :centre, :last_name, :first_name, :phone, :address, :user_id, :avatar)
    end
end
