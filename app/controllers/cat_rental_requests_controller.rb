class CatRentalRequestsController < ApplicationController


  def new
    render :new
  end

  def create
    @rental = CatRentalRequest.new(request_params)

    if @rental.save
      redirect_to(cat_rental_request_url(@rental))
    else
      render text: "Fail Whale", status: :unprocessable_entity
    end
  end

  def show
    @rental = CatRentalRequest.find(params[:id])

    render :show
  end

  private

  def request_params
    params.require(:rental).permit(:cat_id, :start_date, :end_date, :status)
  end

end
