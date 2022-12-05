# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  
  belongs_to(:company, { :class_name => "Company", :foreign_key => "company_id", :counter_cache => true })
  has_many(:terminal_notes, { :class_name => "TerminalNote", :foreign_key => "user_id", :dependent => :nullify })
end
