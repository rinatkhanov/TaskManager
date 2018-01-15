class Project < ApplicationRecord
	validates :name, presence: true

	belongs_to :user
	validates :user, presence: true

	has_many :tasks, inverse_of: :project

	def task_count
		tasks.size
	end
end
