module ApplicationHelper

  def body_id
    "#{ params[:controller] }-#{ params[:action] }"
  end

end

