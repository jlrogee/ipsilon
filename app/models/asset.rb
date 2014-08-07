class Asset < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :user

  validates :name, :account_number, presence: true, length: { maximum: 100 }

  validates_presence_of :name
  validates_associated :organization, :user

  extend Enumerize
  enumerize :type, in: { hardware: 1, software: 2 }

  self.per_page = 10
  self.inheritance_column = :_type_disabled
  scope :search, -> (query) { where("name like ? OR account_number like ?", "%#{query}%", "%#{query}%") }

end
