class Blog::Article < ApplicationRecord
   validates :title, presence: true, uniqueness: true, length: { minimum: 5 }
   validates :body, presence: true
end
