class CreateCardItems < ActiveRecord::Migration
  def change
    create_table :card_items do |t|
      t.integer :card_id
      t.integer :count, default: 1
      t.string :size
      t.boolean :paid, default: false

      t.timestamps
    end

    add_index :card_items, :card_id
  end
end
