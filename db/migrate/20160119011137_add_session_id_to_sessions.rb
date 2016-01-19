class AddSessionIdToSessions < ActiveRecord::Migration
  def up
    add_column :sessions, :session_id, :string
  end

  def down
    remove_column :sessions, :session_id
  end
end

