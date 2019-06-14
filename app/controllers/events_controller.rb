class EventsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :only_user, only: [:edit, :destroy]



  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
        @end_date = @event.start_date + (@event.duration * 60)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.admin_id = current_user.id
    @event.save

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
            if current_user.is_admin == true
                   if current_user.id == @event.admin.id
                      format.html { redirect_to @event, notice: 'Event was successfully updated.' }
                      format.json { render :show, status: :ok, location: @event }
                   else
                      format.html { redirect_to admin_event_submissions_path, notice: 'Event was successfully updated.' }
                      format.json { render :show, status: :ok, location: @event }
                   end
            else
                      format.html { redirect_to @event, notice: 'Event was successfully updated.' }
                      format.json { render :show, status: :ok, location: @event }
            end
      else
                      format.html { render :edit }
                      format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    def only_user
      @event = Event.find(params[:id])
      unless current_user == @event.admin
        redirect_to root_path
        flash[:danger] = "This is not yours!"
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :header_image)
    end
end
