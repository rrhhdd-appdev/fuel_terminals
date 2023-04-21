# == Schema Information
#
# Table name: terminal_notes
#
#  id         :integer          not null, primary key
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  term_id    :integer
#  user_id    :integer
#
class TerminalNote < ApplicationRecord
  belongs_to(:terminal, { :required => true, :class_name => "Facility", :foreign_key => "terminal_id" })
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_one(:company, { :through => :user, :source => :company })
end
