class Task < ApplicationRecord
	validates :text, presence: true

	belongs_to :user
	validates :user, presence: true

	belongs_to :project, optional: true

	has_many :comments, inverse_of: :task
end
