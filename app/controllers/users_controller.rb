class UsersController < ApplicationController

  # filters
  before_filter :check_authenticated

  def show
    user_id = params[:id] || session["user_id"]
    @user = User.find user_id
  end

end
