class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to listing_url(@listing), notice: "Listing was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    if @listing.update(listing_params)
      redirect_to listing_url(@listing), notice: "Listing was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy

    redirect_to listings_url, notice: "Listing was successfully destroyed."
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:title, :address, :available_from)
  end
end
