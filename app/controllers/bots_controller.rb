class BotsController < ApplicationController

  before_filter :check_authenticated

  def create
    bot = Bot.new params[:bot]
    bot.user = current_user
    if bot.save
      return redirect_to profile_path
    else
      @bot = bot
      return render :new
    end
  end

  def new
    @bot = Bot.new
  end

  def show
    @bot = Bot.find params[:id]
  end

end
