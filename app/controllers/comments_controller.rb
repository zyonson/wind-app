class CommentsController < ApplicationController
  before_action :set_store
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.store_id = @store.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_title, :comment_content)
  end

  def set_store
    @store = Store.find(params[:store_id])
  end
end
