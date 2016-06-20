class ParMainController < ApplicationController
  def index
  end

  def order
    if params.has_key?(:par_sheet)
      @par_sheet = ParSheet.find(params[:par_sheet])
      @truck = Truck.find(@par_sheet.truck_id)
      @inv_sessions = Inventorysession.where(:truck_id => @truck.id).order(sessiondate: :desc).take(5)
    end
  end

  def run
    if params.has_key?(:par_sheet) && params.has_key?(:inventorysession_id)
      @order_array = []
      @par_sheet = ParSheet.find(params[:par_sheet])
      @inv_session = Inventorysession.find(params[:inventorysession_id])
      @par_levels = ParLevel.where(:par_sheets_id => @par_sheet.id)
      @details = Detail.where(:inventorysession_id => @inv_session.id)
      @par_levels.each do |par_level|
        @order_amt = 0
        @product = Product.find_by bhproduct_number: par_level.bhproduct_number
        @case_count = @product.case_amount
        @par_amount = 0
        if par_level.count_type == 'Piece'
          @par_amount = par_level.parlevel
          else
          @par_amount = par_level.parlevel * @case_count
        end
        @cur_count = 0
        @detail_tmp = @details.find_by bhproduct_number: par_level.bhproduct_number
        if @detail_tmp.nil?
          @order_amt = @par_amount
          else
          Array(@detail_tmp).each do |detail|
            if @detail_tmp.count_type == 'Piece'
              @cur_count = @cur_count + @detail_tmp.quantity
              else
              @cur_count = @cur_count + (@detail_tmp.quantity * @case_count)
            end
          end
          @order_amt = @par_amount - @cur_count
        end
        if @order_amt > 0
          if @product.count_preference == 'Case'
            @order = @order_amt / @case_count
            if @order % @case_count > 0
              @order = @order + 1
            end
            @order_array.push(@product.name + " " + @order.to_s + " CS")
            else
              @order_array.push(@product.name + " " + @order_amt.to_s + " PC")
           end
        end
      end
    end
  end
end
