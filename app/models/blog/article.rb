class Blog::Article < ApplicationRecord

   #Associations
   belongs_to :author, :class_name => 'Blog::Author', foreign_key: :author_id
   has_many :comments, :class_name => 'Blog::Comment', dependent: :destroy
   has_one_attached :image do |attachable|
                      attachable.variant :thumb, resize_to_limit: [100, 100]
   end
   has_many :notifications, as: :notificationable, dependent: :destroy

   #Validations
   validates :body, presence: true
   validates :image,
             blob: { size_range: 1..(15.megabytes) },
             allow_blank: true
end
