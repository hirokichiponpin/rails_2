class ReservationsController < ApplicationController
    def index
        @user_reservations = current_user.reservations.includes(:room)
    end

    def confirm
        @reservation = Reservation.new(reservation_params)
        @user = current_user
        @room = @reservation.room

        if @reservation.valid?
            render "confirm"
        else
            render controller: 'rooms', action: 'show'
        end
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @room = @reservation.room

        if @reservation.save
            redirect_to reservations_path, notice: "予約が確定しました"
        else
            render "create"
        end
    end

    private

    def reservation_params
      params.require(:reservation).permit(:checkin, :checkout, :count, :user_id, :room_id)
    end

end
