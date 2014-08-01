class Category < ActiveRecord::Base
  has_many :problems, foreign_key: 'category_id', class_name: 'Problem'
end
