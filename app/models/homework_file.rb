class HomeworkFile < ApplicationRecord
  belongs_to :homework
  has_attached_file :file, path: ':rails_root/public/homework_files/:basename.:extension',
                            url: '/public/homework_files/:basename.:extension'
  do_not_validate_attachment_file_type :file
end
