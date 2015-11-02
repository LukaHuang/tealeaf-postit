class Post < ActiveRecord::Base

  before_save :generate_slug

  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments

  def to_param
    self.slug
  end

  private

  def generate_slug
    self.slug = self.title.gsub(" ", "-").downcase
  end
end
