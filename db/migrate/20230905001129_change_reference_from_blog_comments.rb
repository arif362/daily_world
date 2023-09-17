class ChangeReferenceFromBlogComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :blog_comments, :author
    add_reference :blog_comments, :author, null: false, foreign_keys: { to_table: :profiles }
  end
end
