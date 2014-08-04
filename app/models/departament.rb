class Departament < ActiveRecord::Base
  belongs_to :organization
  has_many :users

  self.per_page = 10

  def self.search(query)
    where("depname like ? OR adress like ? OR city like ? OR country like ? OR phone like ?",
          "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
  end
end
