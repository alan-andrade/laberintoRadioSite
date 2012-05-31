class PublicController < ApplicationController
  layout 'fluid'
  def index; end
  def locutor; end

  def stats
    Shoutcast.get_listeners
  end
end
