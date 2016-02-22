class Client < ActiveRecord::Base
  has_many :visits
  belongs_to :zone

  delegate :name, to: :zone, prefix: true

  def to_param
    dni
  end
end
