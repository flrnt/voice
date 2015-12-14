class Vote < ActiveRecord::Base
  validates :ssn, presence: true, uniqueness: true, length: {is: 15 } # length 13 if key is not include
  validates :choice, presence: true


  def has_valid_ssn?
    #ensure the ssn is valid through API
  end
end
