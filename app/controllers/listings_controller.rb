class ListingsController < ApplicationController
  before_action :logged_in_user

  def listing_index
  	@listing = current_user.listings.all
  end

  def index
  end

  def show
    # @listing = Business.find(params[:id])
  end

  def edit
    # @business = Business.find(params[:id])
  end

  def update
    # @business = Business.find(params[:id])
    # @business.update(business_params)
    # redirect_to ivconnect_index_path
  end

  def new
    @listing = current_user.listings.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    @listing.save
    redirect_to index_path
  end

  def destroy
  end

  private

    def listing_params
      params.require(:listing).permit(:description,
      								  :price,
      								  :address,
      								  :city,
      								  :state,
      								  :zipcode,
      								  :start_date,
      								  :end_date)
    end

end
