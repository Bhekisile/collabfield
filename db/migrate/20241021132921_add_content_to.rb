class AddContentTo < ActiveRecord::Migration[7.1]
  def change
    add_column :group_messages, :content, :text
  end
end
