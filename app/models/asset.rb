class Asset < ActiveRecord::Base
  extend Enumerize
  enumerize :type, in: { hardware: 1, software: 2 }
  belongs_to  :organization
  belongs_to  :user
  validates_presence_of :name
end
