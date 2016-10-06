class User < ApplicationRecord

	belongs_to :position
  has_many :students, class_name: "User", foreign_key: 'teacher_id'
  has_one :teacher, class_name: "User", primary_key: 'teacher_id', foreign_key: 'id'

 
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true, length: {maximum: 50}
  validates :skype, presence: true, length: {maximum: 50}
  validates :phone, presence: true, length: {maximum: 50}

end
