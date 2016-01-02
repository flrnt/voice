class Vote < ActiveRecord::Base
  validates :ssn, presence: true, uniqueness: true, numericality: true, length: {is: 15 } # length 13 if key is not included
  validates :choice, presence: true
  validate :has_valid_key

  #before_create :has_valid_key

  def has_valid_key
    unless self.ssn.last(2).to_i == 97 - (self.ssn[0...-2].to_i % 97)
      errors.add(:ssn, "n'a pas la clé valide")
    end
  end

  def is_male?
    self.ssn.slice(0).to_i == 1
  end
end

# my ssn = 1830393045014 ; ssnkey = 10
# to know ssnkey => 97 - (ssn % 97)
