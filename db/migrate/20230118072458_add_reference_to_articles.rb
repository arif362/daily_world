class AddReferenceToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :blog_articles, :author,  foreign_key: { to_table: :profiles }
  end
end
