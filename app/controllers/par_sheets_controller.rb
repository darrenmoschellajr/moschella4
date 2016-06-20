class ParSheetsController < ApplicationController
  before_action :set_par_sheet, only: [:show, :edit, :update, :destroy]

  # GET /par_sheets
  # GET /par_sheets.json
  def index
    @par_sheets = ParSheet.all
    @trucks = Truck.all
  end

  # GET /par_sheets/1
  # GET /par_sheets/1.json
  def show
    @trucks = Truck.all
  end

  # GET /par_sheets/new
  def new
    @par_sheet = ParSheet.new
    @trucks = Truck.all
  end

  # GET /par_sheets/1/edit
  def edit
    @trucks = Truck.all
  end

  # POST /par_sheets
  # POST /par_sheets.json
  def create
    @par_sheet = ParSheet.new(par_sheet_params)

    respond_to do |format|
      if @par_sheet.save
        format.html { redirect_to @par_sheet, notice: 'Par sheet was successfully created.' }
        format.json { render :show, status: :created, location: @par_sheet }
      else
        format.html { render :new }
        format.json { render json: @par_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /par_sheets/1
  # PATCH/PUT /par_sheets/1.json
  def update
    respond_to do |format|
      if @par_sheet.update(par_sheet_params)
        format.html { redirect_to @par_sheet, notice: 'Par sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @par_sheet }
      else
        format.html { render :edit }
        format.json { render json: @par_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /par_sheets/1
  # DELETE /par_sheets/1.json
  def destroy
    @par_sheet.destroy
    respond_to do |format|
      format.html { redirect_to par_sheets_url, notice: 'Par sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_par_sheet
      @par_sheet = ParSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def par_sheet_params
      params.require(:par_sheet).permit(:day, :truck_id)
    end
end
