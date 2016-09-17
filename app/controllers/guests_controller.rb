class GuestsController < ApplicationController
	
	def index
    @guest = Guest.new
  end

  def create
  	@guest = Guest.new(guest_params)
  	@guest.save
    redirect_to root_path
  end

  private
    def guest_params
      params.require(:guest).permit(:name, :phone, :skype, :email, :password, :password_confirmation)
    end
end
