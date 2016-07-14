class Visit < ActiveRecord::Base
  belongs_to :client, required: true
  belongs_to :turn, required: true

  store :details, accessors: [ :address, :zone ]

  validates :turn, presence: true

  accepts_nested_attributes_for :turn

  after_initialize { self.turn ||= Turn.new }

  before_validation on: :create do
    self.address = client.address
    self.zone = client.zone.to_s
  end
end
