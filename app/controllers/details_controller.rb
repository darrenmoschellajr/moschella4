class DetailsController < ApplicationController
  before_action :set_detail, only: [:show, :edit, :update, :destroy]

  # GET /details
  # GET /details.json
  def index
    @details = Detail.all
  end

  # GET /details/1
  # GET /details/1.json
  def show
  end

  # GET /details/new
  def new
    @detail = Detail.new
    @inventorysession = Inventorysession.all
    @inv_session = params[:inventorysession_id]
  end

  # GET /details/1/edit
  def edit
    @inventorysession = Inventorysession.all
    @inv_session = @detail.inventorysession_id
  end

  # POST /details
  # POST /details.json
  def create
    @detail = Detail.new(detail_params)

    respond_to do |format|
      if @detail.save
        @sessionid = @detail.inventorysession_id
        @success_message = @detail.quantity.to_s + " pieces - " + Product.find_by(bhproduct_number: @detail.bhproduct_number).name
        format.html { redirect_to new_detail_path(:inventorysession_id => @sessionid), notice: @success_message}
        format.json { render :show, status: :created, location: @detail }
      else
        format.html { render :new }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /details/1
  # PATCH/PUT /details/1.json
  def update
    respond_to do |format|
      if @detail.update(detail_params)
        format.html { redirect_to "/inventories/" + @detail.inventorysession_id.to_s, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail }
      else
        format.html { render :edit }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1
  # DELETE /details/1.json
  def destroy
    @detail.destroy
    respond_to do |format|
      format.html { redirect_to details_url, notice: 'Detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail
      @detail = Detail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_params
      params.require(:detail).permit(:bhproduct_number, :inventorysession_id, :quantity, :count_type)
    end
end
