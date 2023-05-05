class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :events, class_name: "Event", foreign_key: "creator_id"

	has_many :event_attendances, foreign_key: :attended_event_id
	has_many :attended_events, through: :event_attendances, source: :attendee

	belongs_to :creator, class_name: "User", optional: true
end
