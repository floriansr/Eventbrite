class AdminMailer < ApplicationMailer
	
	default from: 'flo@place2be.com'

	def say_hi_to_admin_for_new_attendance_guest(attendance)
    #on récupère l'instance attendance pour ensuite pouvoir la passer à la view en @admin
    @attendance = attendance
    @event = @attendance.event
    @admin = @event.admin

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://cryptic-stream-41844.herokuapp.com/' 
    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Un nouveau participant pour votre event !')
    end

    def confirmation_event_set(event)
    @event = event
    @admin = @event.admin
    @url  = 'https://cryptic-stream-41844.herokuapp.com/'
    mail(to: @admin.email, subject: 'Vous avez bien créé un event!') 
    end
end
