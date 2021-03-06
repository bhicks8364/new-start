# == Schema Information
#
# Table name: invoices
#
#  id         :integer          not null, primary key
#  company_id :integer
#  agency_id  :integer
#  week       :integer
#  due_by     :datetime
#  paid       :boolean
#  total      :decimal(, )
#  amt_paid   :decimal(, )
#  date_paid  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :invoice do
    company_id 1
agency_id 1
week 1
due_by "2015-10-06 21:22:17"
paid false
total "9.99"
amt_paid "9.99"
date_paid "2015-10-06 21:22:17"
  end

end
