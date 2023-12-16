class HotelsController < ApplicationController
  def index; end

  def new
    if Hotel.count > 0
      @random_id = Hotel.pluck(:id).sample
      @hotel = Hotel.find_by(id: @random_id)
    end
  end
end
