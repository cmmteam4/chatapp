class CreateDthreads < ActiveRecord::Migration[5.2]
  def change
    create_table :dthreads do |t|
      t.string :thread_body
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
