class ListingsController < ApplicationController
  before_action :logged_in_user

  def listing_index
  	@listing = current_user.listings.all
  end

  def master_listing
  	@listing = Listing.all
  end

  def buy
    @listing = Listing.find(params[:id])
    @user = User.find(@listing.user_id)
    if(current_user.balance < @listing.price)
      flash[:notice] = "NOT ENUFF MOOLAH"
      redirect_to show_listing_path(:id => @listing.id)
    else
      @current = User.find(current_user.id)
      @current.balance = @current.balance - @listing.price
      @user.balance = @user.balance + @listing.price
      @listing.sold = true
      @listing.buyer_id = current_user.id
      @listing.save
      @current.save
      @user.save
      flash[:notice] = "SUCCESSFUL TRANSACTION"
      redirect_to show_listing_path(:id => @listing.id)
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @user = User.find(@listing.user_id)
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
  	@listing = Listing.find(params[:id])
  	@listing.update(listing_params)
  	redirect_to listing_index_path
  end

  def new
    @listing = current_user.listings.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    @listing.save
    redirect_to listing_index_path
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listing_index_path
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
