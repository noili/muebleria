class Client < ActiveRecord::Base
  def to_param
    dni
  end
end
