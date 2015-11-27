class AddSessionIdToCardItems < ActiveRecord::Migration
  def up
    add_column :card_items, :session_id, :integer
    
    add_index :card_items, :session_id
  end

  def down
    remove_column :card_items, :session_id
  end
end
