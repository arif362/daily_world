class AddReferenceToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :blog_articles, :author, null: false, foreign_key: { to_table: :users }
  end
end
