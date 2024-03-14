class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]

    def show
        @user = current_user
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(params.require(:user).permit(:name, :introduce, :avatar))
            flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
            redirect_to root_path
        else
            render "edit"
        end
    end

    def account
        @user = current_user
    end

    def profile
        @user = current_user
    end

end
