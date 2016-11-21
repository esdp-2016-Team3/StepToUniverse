class HomeworkResult < ApplicationRecord
  has_one :homework_assignment
  has_attached_file :file, path: ':rails_root/public/homework_results/:basename.:extension',
                            url: '/public/homework_results/:basename.:extension'
  do_not_validate_attachment_file_type :file
end
