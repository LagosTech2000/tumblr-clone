class AddActiveToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :active, :boolean, default: true, null: false
  end
end
