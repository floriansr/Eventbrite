class UserMailer < ApplicationMailer
	 default from: 'flo@place2be.com'
 
 	def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://cryptic-stream-41844.herokuapp.com/users/'
    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Welcome!') 
 	end

  	def say_hi_to_guest_for_confirmation_payment(attendance)
  	@attendance = attendance
    @event = @attendance.event
  	@guest = @attendance.user
  	@url  = 'https://cryptic-stream-41844.herokuapp.com'
  	mail(to: @guest.email, subject: 'Vous êtes bien inscrit sur un event!') 
  	end

    # def validation_event_by_admin(event)
    #   if event.validated == true
    #     @admin = event.admin
    #      @url  = 'https://cryptic-stream-41844.herokuapp.com/'
    #       mail(to: @admin.email, subject: 'Votre event est bien validé') 
    #   end
    # end

end