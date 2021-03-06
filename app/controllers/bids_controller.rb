class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]
  before_action :current_item, only: [:new, :create, :update]
  # GET /bids
  # GET /bids.json
  def index
    if current_item != nil
      @bids = @current_item.bids
    else
      @bids = Bid.all
    end
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids
  # POST /bids.json
  def create

    @bid = Bid.find_or_initialize_by(user_id: current_user, item_id: current_item)
    @bid.current_bid = params[:bid][:current_bid]
    @bid.item = current_item
    @bid.user = current_user

    respond_to do |format|
      if @bid.save
        format.html { redirect_to @bid, notice: 'Bid was successfully created.' }
        format.json { render :show, status: :created, location: @bid }
      else
        format.html { render :new }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to bids_url, notice: 'Bid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bid
    @bid = Bid.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bid_params
    params.require(:bid).permit(:item_id, :user_id, :current_bid)
  end

  def current_item
    @current_item ||= Item.find(params[:item_id]) if params[:item_id]
  end
end
