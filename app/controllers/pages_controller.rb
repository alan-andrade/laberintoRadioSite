class PagesController < ApplicationController
  def listeners
    render json: Shoutcast::Admin.get_listeners
  end
end
