class Asset < ActiveRecord::Base
  belongs_to  :organization
  belongs_to  :user

  validates_presence_of :name

  extend Enumerize
  enumerize :type, in: { hardware: 1, software: 2 }
end
