class Category < ActiveRecord::Base

  has_many :problems, foreign_key: 'category_id', class_name: 'Problem'

  self.per_page = 10
end
