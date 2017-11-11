class ChangeDataInPosts < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :data, :date
  end
end
