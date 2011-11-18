class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :position
      t.references :imageable, :polymorphic => true
      # Paperclip
      t.string    :asset_file_name
      t.string    :asset_content_type
      t.integer   :asset_file_size
      t.datetime  :asset_updated_at
      t.timestamps
    end
    
    add_index :images, :position
    
  end
end
