class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :notifiable, polymorphic: true, null: false
      t.references :notificationable, polymorphic: true, null: false
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
