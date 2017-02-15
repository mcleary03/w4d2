class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    render :new
  end

  def show
    # @request = CatRentalRequest.find(params[:id])
    @requests = CatRentalRequest.where(status: 'PENDING').order(:start_date)
    render :show
  end

  def create
    @request = CatRentalRequest.new(cat_rental_requests_params)

    if @request.save!
      # render json: @request
      redirect_to cat_rental_requests_url(@request)
    else
      redirect_to cat_rental_requests_create_url
    end
  end

  def index
    @requests = CatRentalRequest.all
    render :index
  end

  def cat_rental_requests_params
    params.require(:cat_rental_request).permit(:status, :cat_id, :start_date, :end_date)
  end
end
