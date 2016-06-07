class ParLevelsController < ApplicationController
  before_action :set_par_level, only: [:show, :edit, :update, :destroy]

  # GET /par_levels
  # GET /par_levels.json
  def index
    @par_levels = ParLevel.all
  end

  # GET /par_levels/1
  # GET /par_levels/1.json
  def show
  end

  # GET /par_levels/new
  def new
    @par_level = ParLevel.new
    @trucks = Truck.all
  end

  # GET /par_levels/1/edit
  def edit
    @trucks = Truck.all
  end

  # POST /par_levels
  # POST /par_levels.json
  def create
    @par_level = ParLevel.new(par_level_params)

    respond_to do |format|
      if @par_level.save
        format.html { redirect_to @par_level, notice: 'Par level was successfully created.' }
        format.json { render :show, status: :created, location: @par_level }
      else
        format.html { render :new }
        format.json { render json: @par_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /par_levels/1
  # PATCH/PUT /par_levels/1.json
  def update
    respond_to do |format|
      if @par_level.update(par_level_params)
        format.html { redirect_to @par_level, notice: 'Par level was successfully updated.' }
        format.json { render :show, status: :ok, location: @par_level }
      else
        format.html { render :edit }
        format.json { render json: @par_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /par_levels/1
  # DELETE /par_levels/1.json
  def destroy
    @par_level.destroy
    respond_to do |format|
      format.html { redirect_to par_levels_url, notice: 'Par level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_par_level
      @par_level = ParLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def par_level_params
      params.require(:par_level).permit(:truck_id, :bhproduct_number, :day, :parlevel)
    end
end
