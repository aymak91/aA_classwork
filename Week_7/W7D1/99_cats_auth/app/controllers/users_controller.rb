class UsersController < ApplicationController
    # before_action :require_logged_in, except: [:new]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end


    private    
    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end