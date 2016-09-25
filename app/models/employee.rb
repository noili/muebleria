class Employee < ActiveRecord::Base
  validates :name, presence: true

  has_many :turns
  has_many :visits, through: :turns

  def to_s
    name
  end
end
