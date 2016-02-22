class Turn < ActiveRecord::Base

  class FutureValidator < ActiveModel::EachValidator
    def validate_each record, attribute, value
      record.errors.add attribute, 'no puede ser una fecha pasada' if
        value && value.past?
    end
  end

  belongs_to :employee, required: true
  has_many :visits

  validates :at, presence: true, future: { on: :create }

  scope :available, -> { where('at >= ?', Date.today) }

  def zones
    ['sur', 'norte']
  end

  def to_s
    date = I18n.localize at, format: :short
    "#{ date } (#{ employee })"
  end
end
