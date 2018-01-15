class Comment < ApplicationRecord
	validates :text, presence: true

	belongs_to :user
	validates :user, presence: true

	belongs_to :task
	validates :task, presence: true
end
