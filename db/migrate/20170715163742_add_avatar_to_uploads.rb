class AddAvatarToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :avatar, :string
  end
end
