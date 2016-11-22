class LibraryFile < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_attached_file :literature, path: ':rails_root/public/library_files/:basename.:extension',
                                  url: '/public/library_files/:basename.:extension'
  do_not_validate_attachment_file_type :literature
end
