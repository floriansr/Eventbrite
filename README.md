A FAIRE: 

- Mettre l'optional sur belongs_to: Admin dans Event Model afin de faire des tests mail à la création d'un event? (avant de mettre la session utilisateur en route)

- Configurer un serveur SMTP afin d'envoyer de real mails via Rails

Environnement en dvlpt :

*Mettre la gem letter_opener dans Gemfile puis B.I

*config/environments/development.rb, colle les lignes config.action_mailer.delivery_method = :letter_opener et config.action_mailer.perform_deliveries = true

