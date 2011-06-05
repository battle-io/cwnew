class LikesController < ApplicationController

  before_filter :check_authenticated

  def create
    like = Like.new params[:like]
    like.user = current_user
    if like.save
      return render :json => { :status => "success" }
    else
      return render :json => { :status => "fail" }
    end
  end

end

