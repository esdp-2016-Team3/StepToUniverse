class HomeworkResult < ApplicationRecord
  has_one :homework_assignment
  has_attached_file :file, path: ':rails_root/public/homework_results/:filename', url: '/public/homework_results/:basename.:extension'
  validates_attachment :file, :content_type => {:content_type => ["application/pdf", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"]}
end
