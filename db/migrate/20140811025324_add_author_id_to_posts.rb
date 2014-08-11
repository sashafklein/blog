class AddAuthorIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :author_id, :string
    remove_column :posts, :author
    add_index :posts, :author_id
  end
end
