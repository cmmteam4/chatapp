class AddWksNameEmailUsernameWksPasswordOwnerToUserworkspace < ActiveRecord::Migration[5.2]
  def change
    add_column :userworkspaces, :wks_name, :string
    add_column :userworkspaces, :email, :string
    add_column :userworkspaces, :username, :string
    add_column :userworkspaces, :wks_password, :string
    add_column :userworkspaces, :owner, :boolean
  end
end
