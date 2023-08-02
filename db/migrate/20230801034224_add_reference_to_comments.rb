class AddReferenceToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :blog_comments, :article, null: false, foreign_key: { to_table: :blog_articles }
    add_reference :blog_comments, :author, null: false, foreign_key: { to_table: :users }
  end
end
