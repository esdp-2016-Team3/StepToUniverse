class TextFile < ApplicationRecord
  
  belongs_to :user

  has_attached_file :file, path: ':rails_root/public/text_files/:filename', url: '/public/text_files/:basename.:extension'

  validates_attachment :file, :content_type => {:content_type => ["application/pdf", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"]}

  attr_accessor :file_file_name
end
