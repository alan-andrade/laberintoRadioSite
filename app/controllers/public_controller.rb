class PublicController < ApplicationController
  layout 'fluid'
  def index; end
  def locutor; end

  def listeners
    render json: Shoutcast.get_listeners
  end
end
