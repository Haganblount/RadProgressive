class AddColorToCardItems < ActiveRecord::Migration
  def up
    add_column :card_items, :color, :string
  end

  def down
    remove_column :card_items, :color
  end
end
