class Space < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :reviews,
             :source => :user

  # Validations

end
