# == Schema Information
#
# Table name: agencies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :integer
#  subdomain  :string
#

FactoryGirl.define do
  factory :agency do
    name "MyString"
  end

end
