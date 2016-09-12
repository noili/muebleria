class Client < ActiveRecord::Base
  has_many :visits
  belongs_to :zone, required: true
  validates :address, presence: true
  validate :phone_or_cellphone

  def phone_or_cellphone
    if phone.empty? && cellphone.empty?
      errors.add(:phones, "o bien Telefono o Celular deben estar completos")
    end
  end

  def to_param
    dni
  end
end
