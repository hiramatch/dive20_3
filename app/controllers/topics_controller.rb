class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic =Topic.new(topics_params)
    if @topic.save
      redirect_to topics_path, notice: "記事を作成しました!"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @topic.update(topics_params)
    redirect_to topics_path, notice: "記事を更新しました!"
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "記事を削除しました!"
  end

  def confirm
    @topic = topic.new(topics_params)
    render :new if @topic.invalid?
  end

  private
    def topics_params
      params.require(:topic).permit(:content)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
