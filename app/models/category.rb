class Category < ActiveRecord::Base

  has_many :problems, foreign_key: 'category_id', class_name: 'Problem'

  validates :description, presence: true, length: { maximum: 250 }
  validates :catname, presence: true, length: { minimum: 2, maximum: 100 }

  self.per_page = 10

  scope :search, -> (query) {where("catname like ? OR description like ?", "%#{query}%", "%#{query}%")}

  def to_s
    "#{catname}"
  end
end
