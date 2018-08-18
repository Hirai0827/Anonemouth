class CreateFavs < ActiveRecord::Migration[5.2]
  def change
    create_table :favs do |t|
      t.integer :post_id

      t.timestamps
    end
  end
end
