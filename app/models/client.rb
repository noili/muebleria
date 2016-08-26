class Client < ActiveRecord::Base
  has_many :visits
  belongs_to :zone, required: true
  validates :address, presence: true
  validates_presence_of :phone, unless: :cellphone?
  validates_presence_of :cellphone, unless: :phone?

  def to_param
    dni
  end
end
