class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_correct_user,  {only: [:edit, :update, :destroy]}

  def index
    # 投稿を新しい順に表示
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    last = Post.order("id DESC").limit(1)
    if Post.count == 0
      @img_id = 1
    else
      @img_id = last[0].id + 1
    end

    @post = Post.new(
      cafe: params[:cafe],
      content: params[:content],
      user_id: @current_user.id
    )
    if params[:post_img]
      @post.post_img = "#{@img_id}.jpg"
      image = params[:post_img]
      File.binwrite("public/post_images/#{@post.post_img}", image.read)
    end
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  # def edit
  #   @post = Post.find_by(id: params[:id])
  # end

  # def update
  #   @post = Post.find_by(id: params[:id])
  #   @post.cafe = params[:cafe]
  #   @post.content = params[:content]
  #   if params[:post_img]
  #     @post.post_img = "#{@post.id}.jpg"
  #     image = params[:post_img]
  #     File.binwrite("public/post_images/#{@post.post_img}", image.read)
  #   end
  #   if @post.save
  #     flash[:notice] = "投稿を編集しました"
  #     redirect_to("/posts/index")
  #   else
  #     render("posts/edit")
  #   end
  # end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

end
