class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :channel_name
      t.string :channel_type
      t.references :workspace, foreign_key: true

      t.timestamps
    end
  end
end
