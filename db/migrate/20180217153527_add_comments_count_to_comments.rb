class AddCommentsCountToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :comments_count, :integer, default: 0
  end
end
