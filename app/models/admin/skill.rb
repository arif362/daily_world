class Admin::Skill < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
