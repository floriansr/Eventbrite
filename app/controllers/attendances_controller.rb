class AttendancesController < ApplicationController
 
  before_action :authenticate_user!
  before_action :set_event
  before_action :only_user, only: [:index]

# NEW
  def new
  end

# CREATE/STRIPE

  def create
      # Amount in cents
      @amount = (@event.price)*100

     customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
       })

     charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: "Paiement de N",
        currency: 'eur',
       })

     @attendance = Attendance.new(user_id: current_user.id, event_id: params[:event_id], stripe_customer_id: customer.id)
      if @attendance.save     
          redirect_to event_path(@event)
          flash[:success] = "Vous participez à l'évènement"
      else
       end

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to event_path
  end

# INDEX


  def index
      @attendees = @event.users
  end



  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def only_user
    @event = Event.find(params[:event_id])
    unless current_user == @event.admin
      redirect_to root_path
      flash[:danger] = "This is not yours!"
    end
  end
end
