class Position < ApplicationRecord
	has_many :users, dependent: :destroy
end
