class Level < ApplicationRecord
	has_many :questions, dependent: :destroy
end
