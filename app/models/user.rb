class User < ApplicationRecord

	belongs_to :position

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true, length: {maximum: 50}
  validates :skype, presence: true, length: {maximum: 50}
  validates :phone, presence: true, length: {maximum: 50}

end
