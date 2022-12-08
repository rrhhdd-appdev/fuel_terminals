# == Schema Information
#
# Table name: facilities
#
#  id          :integer          not null, primary key
#  address     :string
#  capacity    :integer
#  city        :string
#  commodity   :string
#  county      :string
#  countyfips  :integer
#  latitude    :float
#  longitude   :float
#  marine_in   :string
#  marine_out  :string
#  name        :string
#  operator    :string
#  owner       :string
#  parsel      :string
#  phone       :string
#  pipe_in     :string
#  pipe_out    :string
#  rail_in     :string
#  rail_out    :string
#  source      :string
#  state       :string
#  status      :string
#  tanks_count :integer
#  term_type   :string
#  truck_in    :string
#  truck_out   :string
#  website     :string
#  zip         :string
#  zip4        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  term_id     :string
#
class Facility < ApplicationRecord
  has_many(:tanks, { :class_name => "Tank", :foreign_key => "terminal_id", :dependent => :destroy })
  has_many(:terminal_notes, { :class_name => "TerminalNote", :foreign_key => "terminal_id", :dependent => :destroy })
  validates(:term_id, { :uniqueness => true })
end
