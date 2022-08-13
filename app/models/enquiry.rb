class Enquiry < ApplicationRecord
  belongs_to :listing

  after_create_commit -> { broadcast_prepend_to "enquiries", partial: "enquiries/enquiry_item", locals: { enquiry: self }, target: "enquiries" }
end
