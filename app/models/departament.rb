class Departament < ActiveRecord::Base
  belongs_to :organization
  has_many :users

  attr_accessor :addr

  self.per_page = 10

  def self.search(query)
    where("depname like ? OR adress like ? OR city like ? OR country like ? OR phone like ?",
          "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  def to_s
    "#{depname} #{organization}"
  end

  def addr
    "#{adress} #{city} #{country}"
  end

end
