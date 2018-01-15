class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :token, presence: true, uniqueness: true

  before_validation :create_token

  has_many :projects, inverse_of: :user
  has_many :tasks, inverse_of: :user
  has_many :comments, inverse_of: :user

  def create_token
    self.token = SecureRandom.hex(6)
  end

end
