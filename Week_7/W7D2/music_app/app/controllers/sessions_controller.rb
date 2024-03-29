class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user
          login!(user)
          redirect_to root_url
        else
          flash.now[:errors] = ["Invalid Credentials"]
          render :new
        end
    end

    def destroy
        if logged_in?
            logout!
          end
          redirect_to new_session_url
    end
end
