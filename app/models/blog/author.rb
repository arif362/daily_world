class Blog::Author < User
  has_many :articles, -> { order(created_at: :desc) },:class_name => 'Blog::Article'
end
