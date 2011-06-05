class UsersController < ApplicationController

  # filters
  before_filter :check_authenticated

  def show
    @presenter = Users::ShowPresenter.new( current_user )
  end

end

