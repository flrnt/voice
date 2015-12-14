class Vote < ActiveRecord::Base
  validates :ssn, presence: true, uniqueness: true
  validates :choice, presence: true


  def has_valid_ssn?
    #ensure the ssn is valid through API
  end
end
