class HotelsController < ApplicationController
  def index; end

  def new
    @random_id = Hotel.pluck(:id).sample
    @hotel = Hotel.find_by(id: @random_id)
  end

  def privacy; end

  def term; end
end
