class AddPasswordDigestToViewers < ActiveRecord::Migration[7.1]
  def change
    add_column :viewers, :password_digest, :string
  end
end
