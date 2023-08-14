class Blog::Author < User
  #Associations
  has_many :articles, -> { order(created_at: :desc) },:class_name => 'Blog::Article', dependent: :destroy
  has_many :comments, -> { order(created_at: :desc) }, :class_name => 'Blog::Comment', dependent: :destroy
  has_one_attached :profile_photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end


end
