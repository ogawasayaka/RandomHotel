class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :city
      t.string :review_url
      t.string :name_url

      t.timestamps
    end
  end
end
