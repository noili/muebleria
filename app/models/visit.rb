class Visit < ActiveRecord::Base
  belongs_to :client, required: true
  belongs_to :turn, required: true
end
