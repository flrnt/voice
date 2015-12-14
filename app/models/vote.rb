class Vote < ActiveRecord::Base
  validates :ssn, presence: true, uniqueness: true, length: {is: 15 } # length 13 if key is not include
  validates :choice, presence: true


  def has_valid_ssn?
    #ensure the ssn is valid through API
    self.ssn.last(2).to_i == 97 - (self.ssn.to_i % 97)
  end

  def is_male?
    if self.has_valid_ssn?
      self.ssn.slice(0).to_i == 1
    end
  end
end


# my ssn = 1830393045014 ; ssnkey = 10
# to know ssnkey => 97 - (ssn % 97)
