class CreateJobCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :job_companies do |t|
      t.string :title
      t.text :description
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
