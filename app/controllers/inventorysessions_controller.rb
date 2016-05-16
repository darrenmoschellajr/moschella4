class InventorysessionsController < ApplicationController
  before_action :set_inventorysession, only: [:show, :edit, :update, :destroy]

  # GET /inventorysession
  # GET /inventorysession.json
  def index
    @inventorysession = Inventorysession.all
  end

  # GET /inventorysession/1
  # GET /inventorysession/1.json
  def show
  end

  # GET /inventorysession/new
  def new
    @inventorysession = Inventorysession.new
    @trucks = Truck.all
    @submit_text = "Start Inventory"
  end

  # GET /inventorysession/1/edit
  def edit
    @trucks = Truck.all
    @submit_text = "Update Inventory"
  end

  # POST /inventorysession
  # POST /inventorysession.json
  def create
    @inventorysession = Inventorysession.new(inventorysession_params)

    respond_to do |format|
      if @inventorysession.save
        @sessionid = @inventorysession.id
        format.html { redirect_to new_detail_path(:inventorysession_id => @sessionid ) }
        format.json { render :show, status: :created, location: @inventorysession }
      else
        format.html { render :new }
        format.json { render json: @inventorysession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventorysession/1
  # PATCH/PUT /inventorysession/1.json
  def update
    respond_to do |format|
      if @inventorysession.update(inventorysession_params)
        format.html { redirect_to @inventorysession, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventorysession }
      else
        format.html { render :edit }
        format.json { render json: @inventorysession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventorysession/1
  # DELETE /inventorysession/1.json
  def destroy
    @inventorysession.destroy
    respond_to do |format|
      format.html { redirect_to @inventorysession, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventorysession
      @inventorysession = Inventorysession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventorysession_params
      params.require(:inventorysession).permit(:sessiondate, :truck_id)
    end
end
