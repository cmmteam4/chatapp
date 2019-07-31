class RemoveMsgBodyFromMessage < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :msg_body, :string
  end
end
