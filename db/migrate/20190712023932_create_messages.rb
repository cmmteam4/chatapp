class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :msg_body
      t.boolean :starred
      t.boolean :unread
      t.integer :user_id
      t.references :channel, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
