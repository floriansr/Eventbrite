class Attendance < ApplicationRecord
	belongs_to :user, :optional => true
    belongs_to :event, :optional => true

    after_create :say_hi_to_admin_for_new_attendance_guest

    def say_hi_to_admin_for_new_attendance_guest
    AdminMailer.say_hi_to_admin_for_new_attendance_guest(self).deliver_now
 	end
end
