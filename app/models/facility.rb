# == Schema Information
#
# Table name: facilities
#
#  id               :integer          not null, primary key
#  address          :string
#  asphalt          :boolean
#  avgas            :boolean
#  biodiesel        :boolean
#  butane           :boolean
#  capacity         :integer
#  chemicals        :boolean
#  city             :string
#  commodity        :string
#  county           :string
#  countyfips       :integer
#  crude_oil        :boolean
#  distillate       :boolean
#  ethanol          :boolean
#  exstars_i        :string
#  gasoline         :boolean
#  jetfuel          :boolean
#  latitude         :float
#  longitude        :float
#  marine_in        :string
#  marine_out       :string
#  naics_code       :integer
#  naics_desc       :string
#  name             :string
#  operator         :string
#  owner            :string
#  parsel           :string
#  phone            :string
#  pipe_in          :string
#  pipe_out         :string
#  propane          :boolean
#  rail_in          :string
#  rail_out         :string
#  refined          :boolean
#  renewable_diesel :boolean
#  source           :string
#  state            :string
#  status           :string
#  term_type        :string
#  truck_in         :string
#  truck_out        :string
#  website          :string
#  zip              :string
#  zip4             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  term_id          :string
#
class Facility < ApplicationRecord
  has_many(:terminal_notes, { :class_name => "TerminalNote", :foreign_key => "terminal_id", :dependent => :destroy })
  validates(:term_id, { :uniqueness => true })
end
