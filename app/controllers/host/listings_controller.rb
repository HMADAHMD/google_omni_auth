class Host::ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listings = current_user.listings
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_create_params)
    if @listing.save
      redirect_to host_listings_path(@listing)
    else
      flash.now[:errors] = @listing.errors.full_messages
      render :new
    end
  end

  def update
    @listing = current_user.listings.find(params[:id])
    if @listing.update(listing_update_params)
      redirect_to host_listings_path(@listing)
    else
      flash.now[:errors] = @listing.errors.full_messages
      render :new
    end
  end

  def edit
    @listing = current_user.listings.find(params[:id])
  end

  def show
    @listing = current_user.listings.find(params[:id])
  end

  def destroy
    @listing = current_user.listings.find(params[:id])
    if @listing.present?
      @listing.update(status: :archived)
      redirect_to host_listings_path
    else
      flash.now[:errors] = @listing.errors.full_messages
      render :new
    end
  end

  private

  def listing_create_params
    params.require(:listing).permit(:title, :about, :max_guests, :address_line_1, :address_line_2, :city, :state, :postal_code, :country)
  end

  def listing_update_params
    params.require(:listing).permit(:title, :about, :max_guests)
  end

  def set_listing
  end
end
