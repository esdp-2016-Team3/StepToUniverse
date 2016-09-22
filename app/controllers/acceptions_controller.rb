class AcceptionsController < ApplicationController
  def accept
      @user = User.find(params[:format])
      @user.status = 'active'
      @user.save
      redirect_to admin_statuses_path
    end

    def reject
      @user = User.find(params[:format])
      @user.status = 'denied'
      @user.save
      redirect_to admin_statuses_path
    end
end