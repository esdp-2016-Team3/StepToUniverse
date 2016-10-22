class HomeworkFile < ApplicationRecord
  belongs_to :homework
  has_attached_file :file, path: ':rails_root/public/homework_files/:filename', url: '/public/homework_files/:basename.:extension'
  validates_attachment :file, :content_type => {:content_type => ["application/pdf", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"]}
  attr_accessor :file_file_name
end
