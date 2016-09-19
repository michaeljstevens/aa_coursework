class CommentsController < ApplicationController

  def index
    if params.has_key?(:contact_id)
      @comment = Comment.where(commentable_id: params[:contact_id], commentable_type: "Contact")
    elsif params.has_key?(:user_id)
      @comment = Comment.where(commentable_id: params[:user_id], commentable_type: "User")
    end
    render json: @comment
  end

  def author_index
    if params.has_key?(:user_id)
      @authored_comments = Comment.where(user_id: params[:user_id])
    end
    render json: @authored_comments
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end


  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    if @comment.destroy
      render json: @comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :commentable_id, :commentable_type)
  end
end
