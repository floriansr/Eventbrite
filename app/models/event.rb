class Event < ApplicationRecord

	belongs_to :admin, class_name: "User"

	has_many :attendances
  	has_many :users, through: :attendances

	validates :start_date,
	presence: true
	validate :start_date_cannot_be_in_the_past

	validates :duration,
	presence: true
	validates_numericality_of :duration, greater_than: 0
	validate :duration_is_multiple_of_point_five

	validates :title,
	presence: true,
	length: { in: 5..140 }

	validates :description,
	presence: true,
	length: { in: 20..1000 }

	validates :price,
	presence: true
	validates :price, inclusion: 1..1000

	validates :location,
	presence: true

    def start_date_cannot_be_in_the_past
       if start_date.present? && start_date < Date.today
        errors.add(:start_date, "can't be in the past")
       end
    end 
	

	def duration_is_multiple_of_point_five
   		 if duration % 5 != 0
       		 errors.add(:duration, "must be multiple of 5")
    	end		
	end

end