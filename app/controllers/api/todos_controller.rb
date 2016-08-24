class Api::TodosController < ApplicationController

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      flash.now[:errors] = @todo.errors.full_messages
    end
  end

  def index
    @todos = Todo.all
    render json: @todos
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      render text: "destroyed"
    else
      flash.now[:errors] = @todo.errors.full_messages
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render json: @todo
    else
      flash.now[:errors] = @todo.errors.full_messages
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end

end
