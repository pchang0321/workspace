# == Schema Information
#
# Table name: spaces
#
#  id                        :integer          not null, primary key
#  address                   :string
#  phone_number              :string
#  picture                   :string
#  created_at                :datetime
#  updated_at                :datetime
#  reviews_count             :integer
#  address_latitude          :float
#  address_longitude         :float
#  address_formatted_address :string
#  name                      :string
#

require 'open-uri'
class Space < ApplicationRecord
  before_validation :geocode_address
  
  phony_normalize :phone_number, default_country_code: 'US'


  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :picture, PictureUploader

  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :reviews,
             :source => :user

  # Validations
  
  validates :phone_number, numericality: { only_integer: true }

end
