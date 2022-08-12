class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :address
      t.date :available_from

      t.timestamps
    end
  end
end
