class GoalsController < ApplicationController

  before_action :logged_in?

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      @goal = Goal.new
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    # debugger
    begin
      @goal = current_user.goals.find(params[:id])
    rescue
    ensure
      if @goal && @goal.update(goal_params)
        redirect_to goal_url(@goal)
      else
        flash[:errors] = ["that's not your goal!"]
        redirect_to goals_url
      end
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @user = @goal.user
    if @goal.destroy
      redirect_to @user
    else
      flash.now[:errors] = @goal.errors.full_messages
      redirect_to @goal
    end
  end

  def show
    @goal = Goal.find(params[:id])
    if @goal.private == true
      if @goal.user == current_user
        render :show
      else
        flash[:errors] = ["This goal is private"]
        redirect_to goals_url
      end
    else
      render :show
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :details, :private, :completed)
  end
end
