class CreateJobPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.references :job_company, null: false, foreign_key: true
      t.text :description
      t.datetime :deadline

      t.timestamps
    end
  end
end
