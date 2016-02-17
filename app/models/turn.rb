class Turn < ActiveRecord::Base
  belongs_to :employee
  has_many :visits

  def zones
    ['sur', 'norte']
  end
end
