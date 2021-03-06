class CreateBackgrounds < ActiveRecord::Migration
  def change
    create_table :backgrounds do |t|
      t.string :image_file_name 
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :position

      t.timestamps
    end
  end
end