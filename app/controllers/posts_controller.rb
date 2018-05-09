class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.where(user_id: current_user.friends).or(Post.where(user_id: current_user.id)).order(created_at: :desc).paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.js { render 'partials/post_page' }
    end
  end

  def create
    @newpost = Post.new(post_params)
    @newpost.user_id = current_user.id

    if @newpost.save
      flash[:notice] = "New post created!"

      ActionCable.server.broadcast 'news_feed', post: render_post(@newpost)
      head 200
    else
      flash[:error] = "An error occured while creating the post."
    end
  end

  def like_toggle
    @post = Post.find(params[:id])

    if @post.likes.exists?(user_id: current_user.id)
      @post.unlike(current_user)
    else
      @post.like(current_user)
    end

    respond_to do |format|
      format.js
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  private

  def render_post(post)
    render_to_string(partial: 'post', locals: { post: post })
  end
end
