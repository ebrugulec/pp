class AddLastReadAdToChatroomUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :chatroom_users, :last_read_at, :datetime
  end
end
