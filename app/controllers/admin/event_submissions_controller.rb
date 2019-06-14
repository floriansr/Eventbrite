class Admin::EventSubmissionsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :check_if_admin
  before_action :set_event, only: [:show, :edit, :destroy]


  def index
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_event_submissions_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   private

        def authenticate_user
          unless current_user
              flash[:danger] = "Please sign in!"
              redirect_to user_session_path
          end
        end

        def check_if_admin
          unless current_user.is_admin == true
            redirect_to root_path
            flash[:danger] = "Only admins can access."
          end
        end

        def set_event
            @event = Event.find(params[:id])
        end

        def event_params
            params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :header_image)
        end

end
