class SessionsController < ApplicationController

  def create
    auth_data = request.env["omniauth.auth"]
    @auth = Authorization.find_or_create_by_omniauth_hash auth_data["uid"]
    self.current_user = @auth.user
  end

  def new
    render :text => params[:message].humanize
  end

end

