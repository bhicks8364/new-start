# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string
#  company_id             :integer
#  first_name             :string
#  last_name              :string
#  deleted_at             :datetime
#  can_edit               :boolean
#

class User < ActiveRecord::Base
  has_one :employee
  belongs_to :company

  accepts_nested_attributes_for :employee
  accepts_nested_attributes_for :company
  
  validates :company_id,  presence: true
  validates :role,  presence: true

  
  after_commit :set_employee

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
        
  scope :manager_users, -> { where(role: "Manager")}
  
  def name
    "#{first_name} #{last_name}"
  end

  
  def not_an_employee?
    self.present? && role != "Employee"
  end
        
  def employee?
    role == "Employee"
  end
  
  def manager?
    role == "Manager"
  end
  
  def payroll?
    role == "Payroll"
  end
  
  def admin?
    role == "Admin"
  end
  
  # def manager_timesheets
  #   if self.manager?
  #     self.orders.collect { |a| a.book } 
  #   end
  # end  
  
  def orders
    Order.by_manager(self.id)
  end
  
  
  
  
  
  
  
  
  def set_employee
    if role == "Employee"
      Employee.find_or_create_by(email: self.email) do |employee|
        employee.user_id = self.id
        employee.first_name = self.first_name
        employee.last_name = self.last_name
        employee.ssn = 1234
      end

    end
  end
  
  











        
end