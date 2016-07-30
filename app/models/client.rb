class Client < ActiveRecord::Base
  has_many :visits
  belongs_to :zone, required: true

  def to_param
    dni
  end
end
