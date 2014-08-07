class Organization < ActiveRecord::Base
  has_many :departaments

  validates :orgname, :country, :address, presence: true
  validates :zipcode, numericality: { only_integer: true }

  def to_s
    "#{orgname}"
  end
end
