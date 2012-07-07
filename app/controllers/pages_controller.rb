class PagesController < ApplicationController
  layout 'fluid'
  def index; end
  def programacion; end
  def program; end
  def pending; end
  def locutor; end
  def quienes; end
  def listeners
    render json: Shoutcast::Admin.get_listeners
  end
end
