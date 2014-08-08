class Category < ActiveRecord::Base

  has_many :problems, foreign_key: 'category_id', class_name: 'Problem'

  validates :catname, :description, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates_associated :problems

  self.per_page = 10

  scope :search, -> (query) {where("catname like ? OR description like ?", "%#{query}%", "%#{query}%")}

  def to_s
    "#{catname}"
  end
end
