class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    # @topics = Topic.all
      @user
      @topics
      if params[:user_id]
        @user = User.find(params[:user_id])
      else
        @user = current_user
      end
      @topics = Topic.where(user_id: @user.id).order("updated_at DESC")
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic =Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to user_topics_path, notice: "記事を作成しました!"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @topic.update(topics_params)
    redirect_to user_topics_path, notice: "記事を更新しました!"
  end

  def destroy
    @topic.destroy
    redirect_to user_topics_path, notice: "記事を削除しました!"
  end

  def confirm
    @topic = topic.new(topics_params)
    render :new if @topic.invalid?
  end

  private
    def topics_params
      params.require(:topic).permit(:content, :image, :p)
    end

    def set_topic
      @user = User.find(params[:user_id])
      @topic = Topic.find(params[:id])
    end
end
