class CreateBlogComments < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_comments do |t|
      t.string :body

      t.timestamps
    end
  end
end
