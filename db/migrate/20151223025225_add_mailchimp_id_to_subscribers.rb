class AddMailchimpIdToSubscribers < ActiveRecord::Migration
  def up
    add_column :subscribes, :mailchimp_id, :string
  end

  def down
    remove_column :subscribes, :mailchimp_id
  end
end
