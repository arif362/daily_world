class Blog::Article < ApplicationRecord

   #Associations
   belongs_to :author, :class_name => 'Blog::Author'
   has_many :comments, :class_name => 'Blog::Comment', dependent: :destroy
   has_one_attached :image do |attachable|
                      attachable.variant :thumb, resize_to_limit: [100, 100]
   end

   #Validations
   validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
   validates :body, presence: true
   validates :image,
             blob: { size_range: 1..(15.megabytes) },
             allow_blank: true
end
