class Homework < ApplicationRecord
  belongs_to :user
  has_many :text_files

  accepts_nested_attributes_for :text_files, allow_destroy: true
end
