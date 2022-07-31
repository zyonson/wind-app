class CommentsController < ApplicationController
  before_action :set_store

  def create
    @store = Store.find(params[:store_id])
    @comment = current_user.comments.new(comment_params)
    @comment.store_id = @store.id
    comment_count = Comment.where(store_id: params[:store_id]).where(user_id: current_user.id).count
    if @comment.valid?
      if comment_count < 1
        @comment.save
        redirect_back(fallback_location: root_path)
      else
        flash[:notice] = "すでにコメント済みです"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:notice] = "レビューの保存に失敗しました"
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
