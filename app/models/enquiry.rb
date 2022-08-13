class Enquiry < ApplicationRecord
  belongs_to :listing

  after_create_commit -> { broadcast_prepend_to "enquiries", partial: "enquiries/enquiry_item", locals: { enquiry: self }, target: "enquiries" }
  after_update_commit -> { broadcast_replace_to "enquiries", partial: "enquiries/enquiry_item" }
  after_destroy_commit -> { broadcast_remove_to "enquiries" }
  # broadcasts_to ->(enquiry) { "enquiries" }, partial: "enquiries/enquiry_item", inserts_by: :prepend
end
