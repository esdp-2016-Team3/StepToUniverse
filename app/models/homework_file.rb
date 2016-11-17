class HomeworkFile < ApplicationRecord
  belongs_to :homework
  attr_accessor :file_file_name
  has_attached_file :file, path: ':rails_root/public/homework_files/:filename', url: '/public/homework_files/:basename.:extension'
  # validates_attachment :file, :content_type => {:content_type => ["application/pdf",
  #                                                                 "application/msword",
  #                                                                 "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  #                                                                 "text/plain",
  #                                                                 "audio/mpeg",
  #                                                                 "audio/mpeg3",
  #                                                                 "audio/x-wav",
  #                                                                 "image/pjpeg",
  #                                                                 "image/jpeg",
  #                                                                 "application/zip"
  # ]
  # }
  do_not_validate_attachment_file_type :file
end
