class CommitteeAgendaItemsController < ApplicationController
  before_action :set_committee_agenda_item, only: %i[ show edit update destroy ]
  before_action :set_committee_meeting, only: [:new, :create]

  # GET /committee_agenda_items or /committee_agenda_items.json
  def index
    @committee_agenda_items = CommitteeAgendaItem.all
  end

  # GET /committee_agenda_items/1 or /committee_agenda_items/1.json
  def show
  end

  # GET /committee_agenda_items/new
  def new
    @committee_agenda_item = CommitteeAgendaItem.new
  end

  # GET /committee_agenda_items/1/edit
  def edit
  end

  # POST /committee_agenda_items or /committee_agenda_items.json
  # def create
  #   @committee_agenda_item = CommitteeAgendaItem.new(committee_agenda_item_params)
  #
  #   respond_to do |format|
  #     if @committee_agenda_item.save
  #       format.html { redirect_to committee_agenda_item_url(@committee_agenda_item), notice: "Committee agenda item was successfully created." }
  #       format.json { render :show, status: :created, location: @committee_agenda_item }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @committee_agenda_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @committee_agenda_item = @committee_meeting.committee_agenda_items.new(committee_agenda_item_params)

    if @committee_agenda_item.save
      redirect_to committee_meeting_url(@committee_meeting), notice: "Agenda item was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /committee_agenda_items/1 or /committee_agenda_items/1.json
  def update
    @committee_meeting = CommitteeMeeting.find(params[:committee_meeting_id])
    @committee_agenda_item = @committee_meeting.committee_agenda_items.find(params[:id])

    if @committee_agenda_item.update(committee_agenda_item_params)
      redirect_to committee_meeting_url(@committee_meeting), notice: "Agenda item updated successfully."
    else
      render :show
    end
  end

  # DELETE /committee_agenda_items/1 or /committee_agenda_items/1.json
  def destroy
    @committee_agenda_item.destroy!

    respond_to do |format|
      format.html { redirect_to committee_agenda_items_url, notice: "Committee agenda item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee_agenda_item
      @committee_agenda_item = CommitteeAgendaItem.find(params[:id])
    end
  def set_committee_meeting
    @committee_meeting = CommitteeMeeting.find(params[:committee_meeting_id])
  end


  # Only allow a list of trusted parameters through.
    def committee_agenda_item_params
      params.require(:committee_agenda_item).permit(:subject, :details, :done, :resolutions)
    end
end
