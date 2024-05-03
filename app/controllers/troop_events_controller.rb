class TroopEventsController < ApplicationController
  before_action :set_troop_event, only: %i[ show edit update destroy ]

  # GET /troop_events or /troop_events.json
  def index
    @troop_events = TroopEvent.all
  end

  # GET /troop_events/1 or /troop_events/1.json
  def show
    @troop_event = TroopEvent.find(params[:id])
    @sign_ups = SignUp.new
    @sign_ups = @troop_event.sign_ups

  end

  # GET /troop_events/new
  def new
    @troop_event = TroopEvent.new
  end

  # GET /troop_events/1/edit
  def edit
  end

  # POST /troop_events or /troop_events.json
  def create
    @troop_event = TroopEvent.new(troop_event_params)

    respond_to do |format|
      if @troop_event.save
        format.html { redirect_to troop_event_url(@troop_event), notice: "Troop event was successfully created." }
        format.json { render :show, status: :created, location: @troop_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @troop_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /troop_events/1 or /troop_events/1.json
  def update
    respond_to do |format|
      if @troop_event.update(troop_event_params)
        format.html { redirect_to troop_event_url(@troop_event), notice: "Troop event was successfully updated." }
        format.json { render :show, status: :ok, location: @troop_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @troop_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /troop_events/1 or /troop_events/1.json
  def destroy
    @troop_event.destroy!

    respond_to do |format|
      format.html { redirect_to troop_events_url, notice: "Troop event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_troop_event
      @troop_event = TroopEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def troop_event_params
      params.require(:troop_event).permit(:start_date, :end_date, :start_time, :end_time, :title, :location, :cost, :description)
    end
end
