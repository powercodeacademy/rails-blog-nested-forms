class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: :all_blank

  validates_presence_of :name, :content
end
