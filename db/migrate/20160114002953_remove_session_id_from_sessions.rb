class RemoveSessionIdFromSessions < ActiveRecord::Migration
  def up
    remove_column :sessions, :session_id
  end

  def down
    add_column :sessions, :session_id
  end
end
