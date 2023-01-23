class Blog::Author < User
  has_many :articles, :class_name => 'Blog::Article'
end
