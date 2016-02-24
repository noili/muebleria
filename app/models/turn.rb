class Turn < ActiveRecord::Base

  class FutureValidator < ActiveModel::EachValidator
    def validate_each record, attribute, value
      record.errors.add attribute, 'no puede ser una fecha pasada' if
        value && value.past?
    end
  end

  belongs_to :employee, required: true
  has_many :visits
  has_many :clients, through: :visits
  has_many :zones, -> { distinct }, through: :clients

  validates :at, presence: true, future: { on: :create }

  scope :available, -> { where('at >= ?', Date.today) }

  def to_s
    date = I18n.localize at, format: :short
    "#{ date } (#{ employee })"
  end
end
