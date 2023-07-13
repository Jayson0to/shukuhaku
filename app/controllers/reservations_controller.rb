class ReservationsController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.new(reservations_params)
    if @reservation.valid?
        session[:reservation_data] = {
        room_id: @room.id,
        checkin: @reservation.checkin,
        checkout: @reservation.checkout,
        people: @reservation.people
        }
      redirect_to reservations_confirm_path
    else
      render 'rooms/show', room: @room
    end
  end

  def confirm
    @reservation_data = session[:reservation_data]
    @room_id = @reservation_data["room_id"]
    @room = Room.find(@room_id)
    @reservation = Reservation.new(checkin: @reservation_data["checkin"], checkout: @reservation_data["checkout"], people: @reservation_data["people"])
    set_reservation_details
  end

  def save
    @reservation = Reservation.new(reservations_params)
    if @reservation.save
      session[:reservation_data] = nil
      redirect_to rooms_path, notice: '予約が完了しました。'
    else
      render 'confirm'
    end
  end
end

  private

  def reservations_params
    params.require(:reservation).permit(:checkin, :checkout, :people , :room_id , :user_id ,:result_price)
  end

  def set_reservation_details
    @nights = (@reservation.checkout - @reservation.checkin).to_i
    @result_price = (@room.price * @reservation.people * @nights).to_i
  end
