class Client < ActiveRecord::Base
  has_many :visits
  belongs_to :zone, required: true
  validates :address, presence: true
  validate :contact_number_presence


  def to_param
    dni
  end

  private

  def contact_number_presence
    if phone.empty? && cellphone.empty?
      errors.add(:phones, "debe ingresar algun numero de contacto")
    end
  end
end
