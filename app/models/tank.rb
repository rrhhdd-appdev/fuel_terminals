# == Schema Information
#
# Table name: tanks
#
#  id               :integer          not null, primary key
#  product_capacity :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  fuel_id          :integer
#  terminal_id      :integer
#
class Tank < ApplicationRecord
  belongs_to(:terminal, { :required => true, :class_name => "Facility", :foreign_key => "terminal_id", :counter_cache => true })
  belongs_to(:fuel, { :required => true, :class_name => "Fuel", :foreign_key => "fuel_id", :counter_cache => true })
end
