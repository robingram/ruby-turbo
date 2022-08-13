class Listing < ApplicationRecord
  belongs_to :user
  has_many :enquiries

  validates :title, :address, presence: true
end
