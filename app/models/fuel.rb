# == Schema Information
#
# Table name: fuels
#
#  id          :integer          not null, primary key
#  category    :string
#  name        :string
#  tanks_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Fuel < ApplicationRecord
  has_many(:tanks, { :class_name => "Tank", :foreign_key => "fuel_id", :dependent => :destroy })
  has_many(:terminals, { :through => :tanks, :source => :terminal })
end
