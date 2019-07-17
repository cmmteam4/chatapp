class AddRoleToUserworkspace < ActiveRecord::Migration[5.2]
  def change
    add_column :userworkspaces, :role, :string
  end
end
