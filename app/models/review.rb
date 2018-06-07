class Review < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :user_id, :uniqueness => { :scope => [:space_id] }

end
