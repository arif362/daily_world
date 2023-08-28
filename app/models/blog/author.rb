class Blog::Author < Profile
  #Associations
  belongs_to :user
  has_many :articles, -> { order(created_at: :desc) },:class_name => 'Blog::Article', foreign_key: :author_id, dependent: :destroy
  has_many :comments, -> { order(created_at: :desc) }, :class_name => 'Blog::Comment', dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
end
