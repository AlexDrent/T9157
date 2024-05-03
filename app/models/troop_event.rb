class TroopEvent < ApplicationRecord
  has_many :sign_ups, dependent: :destroy
end
