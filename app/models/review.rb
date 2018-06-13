# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  space_id   :integer
#  ambience   :integer
#  roominess  :integer
#  fooddrink  :integer
#  outlets    :integer
#  wifi       :integer
#  created_at :datetime
#  updated_at :datetime
#  overall    :float
#  comments   :text
#

class Review < ApplicationRecord
  # Direct associations

  belongs_to :space,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :user_id, :uniqueness => { :scope => [:space_id] }

end
