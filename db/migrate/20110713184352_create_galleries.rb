class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name, :null => false
      t.integer :position
      t.timestamps
    end
    add_index :galleries, :position
    
  end
end
