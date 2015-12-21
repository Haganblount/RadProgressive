class AdddStripeIdToCards < ActiveRecord::Migration
  def up
    add_column :cards, :stripe_id, :string
  end

  def down
    remove_column :cards, :stripe_id
  end
end
