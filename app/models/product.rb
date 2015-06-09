class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :title, :description, :price
  validates_format_of :price, :with => /\A\d+\.*\d{0,2}\z/

  def average_rating
    ratings = []
    reviews.each do |r|
      ratings << r.rating
    end
    ratings.sum / ratings.size.to_f
  end
end
