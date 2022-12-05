# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  company_name :string
#  users_count  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Company < ApplicationRecord
  has_many(:users, { :class_name => "User", :foreign_key => "company_id", :dependent => :nullify })
  has_many(:terminal_notes, { :through => :users, :source => :terminal_notes })
end
