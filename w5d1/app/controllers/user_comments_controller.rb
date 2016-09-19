class UserCommentsController < ApplicationController

  def create
    @comment = UserComment.new(user_comment_params)
    @comment.author = current_user
    @user = @comment.user
    if @comment.save
        redirect_to user_url(@user)
    else
        flash[:errors] = @comment.errors.full_messages
        redirect_to user_url(@user)
    end

  end

  def destroy
    @comment = current_user.authored_comments.find(params[:id])
    @user = @comment.user
    if @comment.destroy
      redirect_to user_url(@user)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to user_url(@user)
    end
  end

  def user_comment_params
    params.require(:user_comment).permit(:body, :user_id)
  end

end
