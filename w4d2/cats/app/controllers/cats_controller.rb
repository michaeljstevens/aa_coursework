class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by_id(params[:id])
    render :show
  end

  def new
    @cat = Cat.new(birth_date: "", color: "Blank", name: "", sex: "", description: "")
    render :new
  end

  def update
    @cat = Cat.find_by_id(params[:id])
    if @cat.update(cat_params)
      render :show
    else
      @cat.errors.full_messages
    end
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      render :show
    else
      @cat.errors.full_messages
    end
  end

  def destroy
    @cat = Cat.find_by_id(params[:id])
    if @cat.delete
      redirect_to cats_url
    else
      @cat.errors.full_messages
    end
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
    render :edit
  end
  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end

end
