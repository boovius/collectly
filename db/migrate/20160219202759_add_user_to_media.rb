class AddUserToMedia < ActiveRecord::Migration
  def change
    add_column :artists, :user_id, :integer
    add_column :albums, :user_id, :integer
    add_column :songs, :user_id, :integer
  end
end
