class Blog::Article < ApplicationRecord

   #Associations
   belongs_to :author, :class_name => 'Blog::Author'
   has_one_attached :image do |attachable|
                      attachable.variant :thumb, resize_to_limit: [100, 100]
   end

   #Validations
   validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
   validates :body, presence: true
   validates :image, presence: true,
             blob: { size_range: 1..(15.megabytes) }
end
