class User < ApplicationRecord
  has_many :library_files
  has_many :homeworks
  has_many :homework_assignments
	belongs_to :position
  has_many :students, class_name: "User", foreign_key: 'teacher_id'
  has_one :teacher, class_name: "User", primary_key: 'teacher_id', foreign_key: 'id'

  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true, length: {maximum: 50}
  validates :skype, presence: true, length: {maximum: 50}
  validates :phone, presence: true, length: {maximum: 50}

  has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>'},
                    default_url: '/avatars/missing.png'
  validates_attachment_content_type :avatar,
                                    content_type: ['image/jpeg', 'image/gif', 'image/png']

end
