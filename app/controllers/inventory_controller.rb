class InventoryController < InventorysessionsController
  def index
    @list_amount = 5
    if (params.has_key?(:showall))
      @inventorysession = Inventorysession.all.order(sessiondate: :desc)
      @list_amount_message = "Showing all inventory sessions"
      else
      @inventorysession = Inventorysession.all.order(sessiondate: :desc).take(@list_amount)
      @list_amount_message = "Showing the " + @list_amount.to_s + " most recent inventory sessions."
      @show_all_link = true
    end

  end
  def show
        @trucks = @inventorysession.truck.name
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"" + @inventorysession.truck.trucknumber.to_s + "_" + Time.now.in_time_zone("Eastern Time (US & Canada)").to_s + "details-export.csv\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end
end
