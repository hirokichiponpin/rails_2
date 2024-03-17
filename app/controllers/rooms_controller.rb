class RoomsController < ApplicationController
    def index
        if params[:search].present?
            @rooms = Room.search(params[:search])
        else
            @rooms = Room.all
        end
    end

    def new
        @room = Room.new
    end

    def create
        @room = current_user.rooms.build(params.require(:room).permit(:roomname, :introduce, :price, :image, :address))
        
        if @room.save
            redirect_to room_path(@room)
        else
            render "new"
        end
    end

    def show
        @room = Room.find(params[:id])
        @user = current_user
        @reservation = Reservation.new

    end

    def edit
        @room = Room.find(params[:id])
    end

    def update
        @room = Room.find(params[:id])
        if @room.update(params.require(:room).permit(:roomname, :introduce, :price, :image, :address))
            flash[:notice] = "部屋情報を更新しました"
            redirect_to own_rooms_rooms_path
        else
            render "edit"
        end
    end

    def search
        @rooms = Room.where("address LIKE ? OR introduce LIKE ?", "%#{params[:address]}%", "%#{params[:introduce]}%")
    
        render 'rooms/index'
    end

    def own
        @user_rooms = current_user.rooms
    end

    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        flash[:notice] = "部屋情報を削除しました"
        redirect_to own_rooms_rooms_path
    end
end
