class CreateEnquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :enquiries do |t|
      t.string :name
      t.string :email
      t.text :message
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
