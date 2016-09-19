class CatRentalRequestsController < ApplicationController
  def new
    @rental_requests = CatRentalRequest.all
    @cats = Cat.all
    render :new
  end

  def create
    @cat_rent = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rent.save!
      redirect_to cats_url
    else
      @cat_rent.errors.full_messages
      redirect_to new_cat_rental_request_url
    end
  end

  def update
    @cat_rent = CatRentalRequest.find_by(cat_id: params[:id])
    if params[:status] == "APPROVED"
      @cat_rent.approve!
    elsif params[:status] == "DENIED"
      @cat_rent.deny!
    end
    redirect_to cats_url
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end

end
