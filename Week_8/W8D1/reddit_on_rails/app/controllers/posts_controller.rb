class PostsController < ApplicationController

    before_action :is_author?, only: [:edit, :update, :destroy]

    def new
        @post = Post.new
        @user = current_user
        render :new
    end

  def create
    @post = Post.new(post_params)
    @post.author_id ||= params[:author_id] || current_user.id

    if @post.save
    else
        flash.now[:errors] = @post.errors.full_messages
    end
  end

  def edit
    render :edit
  end

  def update
    if @post.update(post_params)
        redirect_to sub_url(@post)
    else
        flash.now[:errors] = @post.errors.full_messages
        render :edit
    end
  end

  def destroy   
    @post.destroy
    redirect_to users_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_ids, :author_id)
  end

  def is_author?
    @post = Post.find_by(id: params[:id])
    redirect_to users_url unless @post.author == current_user
  end
end
