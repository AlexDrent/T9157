class CommitteeMeetingsController < ApplicationController
  before_action :set_committee_meeting, only: %i[ show edit update destroy ]

  # GET /committee_meetings or /committee_meetings.json
  def index
    @committee_meetings = CommitteeMeeting.all
  end

  # GET /committee_meetings/1 or /committee_meetings/1.json
  def show
    @committee_agenda_items = @committee_meeting.committee_agenda_items
  end

  # GET /committee_meetings/new
  def new
    @committee_meeting = CommitteeMeeting.new
  end

  # GET /committee_meetings/1/edit
  def edit
  end

  # POST /committee_meetings or /committee_meetings.json
  def create
    @committee_meeting = CommitteeMeeting.new(committee_meeting_params)

    respond_to do |format|
      if @committee_meeting.save
        format.html { redirect_to committee_meeting_url(@committee_meeting), notice: "Committee meeting was successfully created." }
        format.json { render :show, status: :created, location: @committee_meeting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @committee_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /committee_meetings/1 or /committee_meetings/1.json
  def update
    respond_to do |format|
      if @committee_meeting.update(committee_meeting_params)
        format.html { redirect_to committee_meeting_url(@committee_meeting), notice: "Committee meeting was successfully updated." }
        format.json { render :show, status: :ok, location: @committee_meeting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @committee_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /committee_meetings/1 or /committee_meetings/1.json
  def destroy
    @committee_meeting.destroy!

    respond_to do |format|
      format.html { redirect_to committee_meetings_url, notice: "Committee meeting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee_meeting
      @committee_meeting = CommitteeMeeting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def committee_meeting_params
      params.require(:committee_meeting).permit(:date)
    end
end
