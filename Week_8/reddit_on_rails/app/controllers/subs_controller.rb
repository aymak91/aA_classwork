class SubsController < ApplicationController
    before_action :require_logged_in, except: [:index, :show]
    before_action :require_mod_status, only: [:edit, :update, :destroy]

    def index
        @subs = Sub.all
        render :index
    end

    def create
        @sub = Sub.new(sub_params)

        if @sub.save
            render :show
        else
            flash.now[:errors] = @sub.errors.full_messages
            redirect_to new_sub_url
        end
    end

    def new
        @sub = Sub.new
        render :new
    end

    def edit
        # @sub = Sub.find_by(id: params[:id]) # optional because of before_action
        render :edit
    end

    def show
        @sub = Sub.find(params[:id])
        @posts = @sub.posts
        render :show
    end

    def update
        # @sub = Sub.find_by(id: params[:id]) # optional because of before_action

        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def destroy
        # @sub = Sub.find(params[:id]) #optional because of before_action
        @sub.destroy
        redirect_to subs_url
    end

    private

    def require_mod_status
      @sub = Sub.find(params[:id])
      redirect_to subs_url unless @sub.moderator_id == current_user.id
    end

    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
