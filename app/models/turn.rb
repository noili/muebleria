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

  def zones
    ['sur', 'norte']
  end
end
