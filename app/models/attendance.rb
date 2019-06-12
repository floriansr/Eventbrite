class Attendance < ApplicationRecord
	
	belongs_to :user
    belongs_to :event

    after_create :say_hi_to_admin_for_new_attendance_guest
    after_create :say_hi_to_guest_for_confirmation_payment


	private

    def say_hi_to_admin_for_new_attendance_guest
    AdminMailer.say_hi_to_admin_for_new_attendance_guest(self).deliver_now
 	end

 	def say_hi_to_guest_for_confirmation_payment
 	UserMailer.say_hi_to_guest_for_confirmation_payment(self).deliver_now
 	end
 	
end
