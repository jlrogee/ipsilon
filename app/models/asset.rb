class Asset < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :user

  validates_presence_of :name

  extend Enumerize
  enumerize :type, in: { hardware: 1, software: 2 }

  self.per_page = 10
  self.inheritance_column = :_type_disabled
  scope :search, -> (query) { where("name like ? OR account_number like ?", "%#{query}%", "%#{query}%") }
  scope :usersa, -> (query) { where("user_id = ?", "#{query}") }

  def to_s
    "#{name}, type: #{type}, account number #{account_number}"
  end

end
