class Blog::Comment < ApplicationRecord
  #Associations
  belongs_to :author, :class_name => 'Blog::Author'
  belongs_to :article, :class_name => 'Blog::Article'


end
