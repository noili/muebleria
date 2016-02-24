class Visit < ActiveRecord::Base
  belongs_to :client, required: true
  belongs_to :turn, required: true
  has_one :zone, through: :client

  validates :turn, presence: true

  accepts_nested_attributes_for :turn

  after_initialize { self.turn ||= Turn.new }
end
