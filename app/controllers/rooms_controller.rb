class RoomsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if  @room.save
      redirect_to :rooms
    else
      render :new
    end
  end


  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def search
    @results = @q.result(distinct: true)
  end


  def owner
    @user = User.find(params[:id])
    @owner = Room.where(user_id: @user.id)
    @rooms = Room.all
  end

  private
  def set_q
    @q = Room.ransack(params[:q])
  end

  def room_params
    params.require(:room).permit(:user_id, :name, :introduction, :price, :address, :image)
  end
end