class EnquiriesController < ApplicationController
  before_action :set_enquiry, only: %i[ show edit update destroy ]

  # GET /enquiries or /enquiries.json
  def index
    @enquiries = Enquiry.all
  end

  # GET /enquiries/1 or /enquiries/1.json
  def show
  end

  # GET /enquiries/new
  def new
    @enquiry = Enquiry.new
  end

  # GET /enquiries/1/edit
  def edit
  end

  # POST /enquiries or /enquiries.json
  def create
    @enquiry = Enquiry.new(enquiry_params)

    if @enquiry.save
      redirect_to enquiry_url(@enquiry), notice: "Enquiry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enquiries/1 or /enquiries/1.json
  def update
    if @enquiry.update(enquiry_params)
      redirect_to enquiry_url(@enquiry), notice: "Enquiry was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /enquiries/1 or /enquiries/1.json
  def destroy
    @enquiry.destroy

    redirect_to enquiries_url, notice: "Enquiry was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquiry
      @enquiry = Enquiry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enquiry_params
      params.require(:enquiry).permit(:name, :email, :message, :listing_id)
    end
end
