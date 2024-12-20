class CreateGroupConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :group_conversations do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.belongs_to :conversation, index: true
      t.timestamps
    end
  end
end
