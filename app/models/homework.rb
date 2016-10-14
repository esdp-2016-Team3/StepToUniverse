class Homework < ApplicationRecord
  belongs_to :user
  has_many :text_files
end
