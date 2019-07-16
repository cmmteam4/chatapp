class CreateUserworkspaces < ActiveRecord::Migration[5.2]
  def change
    create_table :userworkspaces do |t|
      t.references :user, foreign_key: true
      t.references :workspace, foreign_key: true

      t.timestamps
    end
  end
end
