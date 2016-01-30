class Client < ActiveRecord::Base
  has_many :visits

  def to_param
    dni
  end
end
