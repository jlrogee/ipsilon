class Organization < ActiveRecord::Base
  has_many :departaments

  validates_associated :departaments, allow_nil: true
  validates :orgname, :country, :address, presence: true
  validates :zipcode, numericality: { only_integer: true }

  def to_s
    "#{orgname}"
  end
end
