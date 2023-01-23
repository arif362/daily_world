class Blog::Article < ApplicationRecord

   #Associations
   belongs_to :author, :class_name => 'Blog::Author'

   #Validations
   validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
   validates :body, presence: true
end
