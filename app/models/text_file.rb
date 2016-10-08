class Text_file < ApplicationRecord
  has_attached_file :file, path: ':rails_root/public/text_filess/:filename', url: ':rails_root/public/text_files/:filename'

  validates_attachment :file, :content_type => {:content_type => ["application/pdf", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"]}

  attr_accessor :file_file_name
end
