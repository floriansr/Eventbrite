class Event < ApplicationRecord

	belongs_to :admin, class_name: "User"

	after_create :confirmation_event_set

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

	has_one_attached :header_image
	validate :correct_header_image_type

	private

	def correct_header_image_type
		if header_image.attached? && !header_image.content_type.in?(%w(image/jpeg image/png))
		errors.add(:header_image, 'must be a JPEG or PNG')
		elsif header_image.attached? == false
		errors.add(:header_image, 'required.')
		end
	end

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

	def confirmation_event_set
		AdminMailer.confirmation_event_set(self).deliver_now
	end
end