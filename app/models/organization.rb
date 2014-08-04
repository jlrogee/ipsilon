class Organization < ActiveRecord::Base
  has_many :departaments

  def to_s
    "#{orgname}"
  end
end
