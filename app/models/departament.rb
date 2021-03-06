class Departament < ActiveRecord::Base
  belongs_to :organization
  has_many :users

  attr_reader :addr

  validates :adress, :city, :country, length: { maximum: 250 }
  validates :depname, presence: true, length: { minimum: 2, maximum: 100 }
  validates :organization_id, presence: true
  validates :phone, length: { maximum: 18, minimum: 11 }, format: { with: /\((\+\d{1,2}\s)?(\d{3})\)?(\d{3})[.-](\d{4})/,
                                                       message: I18n.t(:phone_validates) },
            on: [:create, :update], allow_nil: true


  self.per_page = 10

  scope :search, -> (query) { where("depname like ? OR adress like ? OR city like ? OR country like ? OR phone like ?",
          "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%") }

  def to_s
    "#{depname}, #{organization}"
  end

  def addr
    "#{adress} #{city} #{country}"
  end

end
