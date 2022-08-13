class Enquiry < ApplicationRecord
  belongs_to :listing

  broadcasts_to ->(enquiry) { [enquiry.listing.user, "enquiries"] }, partial: "enquiries/enquiry_item", inserts_by: :prepend
end
