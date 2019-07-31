class AddMsgBodyToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :msg_body, :text
  end
end
