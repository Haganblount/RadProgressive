class AddSexToCardItems < ActiveRecord::Migration
  def up
    add_column :card_items, :sex, :string
  end

  def down
    remove_column :card_items, :sex
  end
end
