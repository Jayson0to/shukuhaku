class SearchesController < ApplicationController
  def index
    @rooms = Room.all
end
