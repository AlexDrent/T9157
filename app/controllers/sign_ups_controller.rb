class SignUpsController < ApplicationController
  before_action :set_sign_up, only: %i[ show edit update destroy ]
  before_action :set_troop_event, only: [:new, :create]

  # GET /sign_ups or /sign_ups.json
  def index
    @sign_ups = SignUp.all
  end

  # GET /sign_ups/1 or /sign_ups/1.json
  def show
  end

  # GET /sign_ups/new
  def new
    @sign_up = SignUp.new
  end

  # GET /sign_ups/1/edit
  def edit
    @troop_event = TroopEvent.find(params[:troop_event_id])
    @sign_up = @troop_event.sign_ups.find(params[:id])

    if @sign_up.update(sign_up_params)
      redirect_to @troop_event, notice: 'Paid status updated successfully.'
    else
      render 'troop_events/show'  # or render :edit depending on your design
    end
  end

  # POST /sign_ups or /sign_ups.json
  def create
    @troop_event = TroopEvent.find(params[:troop_event_id])
    @sign_up = @troop_event.sign_ups.new(sign_up_params)

    respond_to do |format|
      if @sign_up.save
        format.html { redirect_to @troop_event, notice: "Sign up was successfully created." }
        format.json { render :show, status: :created, location: @sign_up }
      else    @troop_event = TroopEvent.find(params[:troop_event_id])
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sign_ups/1 or /sign_ups/1.json
  def update
    @troop_event = TroopEvent.find(params[:troop_event_id])
    @sign_up = @troop_event.sign_ups.find(params[:id])

    if @sign_up.update(sign_up_params)
      puts "Update successful!"
      puts @sign_up.inspect
      redirect_to @troop_event, notice: 'Paid status updated successfully.'
    else
      render 'troop_events/show'  # or render :edit depending on your design
    end
  end

  # DELETE /sign_ups/1 or /sign_ups/1.json
  def destroy
    @troop_event = TroopEvent.find(params[:troop_event_id])
    @sign_up = @troop_event.sign_ups.find(params[:id])
    @sign_up.destroy!

    respond_to do |format|
      format.html { redirect_to @troop_event, notice: "Sign up was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_troop_event
    @troop_event = TroopEvent.find(params[:troop_event_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_sign_up
      @sign_up = SignUp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sign_up_params
      params.require(:sign_up).permit(:first_name, :last_name, :paided, :troop_event_id)
    end
end
