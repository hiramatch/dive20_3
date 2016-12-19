class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.json { render :show, status: :created, location: @comment }
        format.js { render :index }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @topic =  @comment.topic

    @comment.destroy

    respond_to do |format|
       format.html { redirect_to user_topic_path(@topic), notice: 'コメントを削除しました。' }
       format.json { render :show, status: :created, location: @comment }
       format.js { render :index }
    end

  end

  private
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end
end
