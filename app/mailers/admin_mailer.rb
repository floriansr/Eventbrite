class AdminMailer < ApplicationMailer
	
	default from: 'no-reply@monsite.fr'

	def say_hi_to_admin_for_new_attendance_guest(attendance)
    #on récupère l'instance attendance pour ensuite pouvoir la passer à la view en @admin
    @attendance = attendance
    @event = @attendance.event
    @admin = @event.admin


    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'htttp: mon lien vers mon event' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Un nouveau participant pour votre event !')
  end
end
