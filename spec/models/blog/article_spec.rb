require 'rails_helper'

RSpec.describe Blog::Article, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "with 2 or more comments" do
    it "orders them in descending order" do
      user = User.create!(full_name: 'Md Ariful Islam', email: 'ariful.islam@misfit.tech', password: 'password', password_confirmation: 'password')
      author = user.create_author
      article1 = author.articles.create!(:body => "first article")
      article2 = author.articles.create!(:body => "second article")
      expect(author.reload.articles).to eq([article2, article1])
    end
  end

end
