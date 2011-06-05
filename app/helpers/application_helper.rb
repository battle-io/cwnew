module ApplicationHelper

  def body_id
    "#{ params[:controller] }-#{ params[:action] }"
  end

  def is_home?
    params[:controller] == "home" && params[:action] == "index"
  end

end

