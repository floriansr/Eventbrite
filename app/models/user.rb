class User < ApplicationRecord

	has_many :administrated_events, class_name: "Event", foreign_key: "admin_id"
	has_many :attendances
  	has_many :events, through: :attendances
end
