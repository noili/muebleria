class Client < ActiveRecord::Base
  has_many :visits
  belongs_to :zone

  def to_param
    dni
  end
end
