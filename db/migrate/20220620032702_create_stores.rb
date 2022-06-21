class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name,          null:false, unique: true
      t.string :address,       null:false
      t.text :description,     null:false
      t.string :reserve_way,   null:false
      t.string :open,          null:false
      t.string :holiday,       null:false
      t.integer :price,        null:false
      t.string :near_station,  null:false
      t.string :image
      t.string :space_of_surf, null:false

      t.timestamps
    end
  end
end
