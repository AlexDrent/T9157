class PlcMeetingsController < ApplicationController
  before_action :set_plc_meeting, only: %i[ show edit update destroy ]

  # GET /plc_meetings or /plc_meetings.json
  def index
    @plc_meetings = PlcMeeting.all
  end

  # GET /plc_meetings/1 or /plc_meetings/1.json
  def show
    @plc_meeting = PlcMeeting.find(params[:id])
    @agenda_items = @plc_meeting.agenda_items
  end

  # GET /plc_meetings/new
  def new
    @plc_meeting = PlcMeeting.new
  end

  # GET /plc_meetings/1/edit
  def edit
  end

  # POST /plc_meetings or /plc_meetings.json
  def create
    @plc_meeting = PlcMeeting.new(plc_meeting_params)

    respond_to do |format|
      if @plc_meeting.save
        format.html { redirect_to plc_meeting_url(@plc_meeting), notice: "Plc meeting was successfully created." }
        format.json { render :show, status: :created, location: @plc_meeting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plc_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plc_meetings/1 or /plc_meetings/1.json
  def update
    respond_to do |format|
      if @plc_meeting.update(plc_meeting_params)
        format.html { redirect_to plc_meeting_url(@plc_meeting), notice: "Plc meeting was successfully updated." }
        format.json { render :show, status: :ok, location: @plc_meeting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plc_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plc_meetings/1 or /plc_meetings/1.json
  def destroy
    @plc_meeting.destroy!

    respond_to do |format|
      format.html { redirect_to plc_meetings_url, notice: "Plc meeting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plc_meeting
      @plc_meeting = PlcMeeting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plc_meeting_params
      params.require(:plc_meeting).permit(:date)
    end
end
