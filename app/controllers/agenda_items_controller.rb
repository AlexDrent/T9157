class AgendaItemsController < ApplicationController
  before_action :set_agenda_item, only: %i[ show edit update destroy ]
  before_action :set_plc_meeting, only: [:new, :create]

  # GET /agenda_items or /agenda_items.json
  def index
    @agenda_items = AgendaItem.all
  end

  # GET /agenda_items/1 or /agenda_items/1.json
  def show
  end

  # GET /agenda_items/new
  def new
    @agenda_item = AgendaItem.new
    # @agenda_item = @plc_meeting.agenda_items.build
  end

  # GET /agenda_items/1/edit
  def edit
  end

  # POST /agenda_items or /agenda_items.json
  # def create
  #   @agenda_item = AgendaItem.new(agenda_item_params)
  #
  #   respond_to do |format|
  #     if @agenda_item.save
  #       format.html { redirect_to agenda_item_url(@agenda_item), notice: "Agenda item was successfully created." }
  #       format.json { render :show, status: :created, location: @agenda_item }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @agenda_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def create
    @agenda_item = @plc_meeting.agenda_items.new(agenda_item_params)

    if @agenda_item.save
      redirect_to plc_meeting_url(@plc_meeting), notice: "Agenda item was successfully created."
    else
      render :new
    end
  end


  # PATCH/PUT /agenda_items/1 or /agenda_items/1.json
  def update
    @plc_meeting = PlcMeeting.find(params[:plc_meeting_id])
    @agenda_item = @plc_meeting.agenda_items.find(params[:id])

    if @agenda_item.update(agenda_item_params)
      redirect_to plc_meeting_url(@plc_meeting), notice: "Agenda item updated successfully."
    else
      render :show
    end
  end

  # DELETE /agenda_items/1 or /agenda_items/1.json
  def destroy
    @agenda_item.destroy!

    respond_to do |format|
      format.html { redirect_to agenda_items_url, notice: "Agenda item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agenda_item
      @agenda_item = AgendaItem.find(params[:id])
    end
  def set_plc_meeting
    @plc_meeting = PlcMeeting.find(params[:plc_meeting_id])
  end

    # Only allow a list of trusted parameters through.
  def agenda_item_params
    params.require(:agenda_item).permit(:subject, :details, :done, :resolutions)
  end
end
