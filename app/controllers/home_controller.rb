class HomeController < ApplicationController
  def index
    @rooms = Room.take(10)
  end
end
