class SessionsController < ApplicationController

  def create
    auth_data = request.env["omniauth.auth"]
    @auth = Authorization.find_or_create_by_omniauth_hash! auth_data
    self.current_user = @auth.user
    redirect_to profile_path
  end

  def new
    render :text => params[:message].humanize
  end

  def destroy
    session.delete "user_id"
    redirect_to home_path
  end

end

