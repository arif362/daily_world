class CreateAdminSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_skills do |t|
      t.string :name

      t.timestamps
    end
  end
end
