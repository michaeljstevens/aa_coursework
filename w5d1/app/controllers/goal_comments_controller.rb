class GoalCommentsController < ApplicationController

  def create
    @goal_comment = GoalComment.new(goal_comment_params)
    @goal_comment.author = current_user
    @goal = @goal_comment.goal
    if @goal_comment.save
        redirect_to goal_url(@goal)
    else
        flash[:errors] = @goal_comment.errors.full_messages
        redirect_to goal_url(@goal)
    end

  end

  def destroy
    @comment = current_user.authored_comments.find(params[:id])
    @goal = @comment.goal
    if @comment.destroy
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to goal_url(@goal)
    end
  end

  def goal_comment_params
    params.require(:goal_comment).permit(:body, :goal_id)
  end

end
