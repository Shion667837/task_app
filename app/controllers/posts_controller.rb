class PostsController < ApplicationController


  def index
    @posts = Post.all
    special_post_ids = Post.where.not(start_on: nil).pluck(:id)
    @special_posts = Post.where(id: special_post_ids).where('start_on <= ?', Date.today).where('end_on >= ?', Date.today)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    Post.create(post_params)
    redirect_to '/posts/index'
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'タスクが編集されました'
      redirect_to @post
    else
      flash.now[:danger] = 'タスクが編集されませんでした'
      render :new
    end
  end

  def delete
    post = Post.find(params[:id])
    post.destroy

    flash[:success] = 'タスクが削除されました'
    redirect_to '/posts/index'
  end


end

private

def post_params
  params.require(:post).permit(:name, :content, :start_on, :end_on)
end