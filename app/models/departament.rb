class Departament < ActiveRecord::Base
  belongs_to :organization
  has_many :users
end
