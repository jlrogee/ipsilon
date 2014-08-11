class Organization < ActiveRecord::Base
  has_many :departaments

  validates :orgname, presence: true, length: { maximum: 100 }
  validates :country, :address, presence: true, length: { maximum: 250 }
  validates :phone, presence: true,length: { maximum: 18 }, format: { with: /\((\+\d{1,2}\s)?(\d{3})\)?(\d{3})[.-](\d{4})/,
                                                       message: "Phone number format - +XX(XXX)XXX-XXXX or +x(xxx)xxx-xxxxx" },
            on: [:create, :update], allow_nil: true

  def to_s
    "#{orgname}"
  end
end
