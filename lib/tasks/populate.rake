namespace :db do
	
  desc "Create 10 companies with random names and addresses"
  task :populate => :environment do
	require 'populator'
	require 'ffaker'
		def range (min, max)
	    	rand * (max-min) + min
		end
	
		Company.populate 5 do |company|
			company.name = FFaker::Company.name
			company.city = FFaker::Address.city
			company.state = FFaker::AddressUS.state
			company.zipcode = FFaker::AddressUS.zip_code
			company.address = FFaker::AddressUS.street_address
			company.phone_number = FFaker::PhoneNumber.phone_number
			Order.populate(1..5) do |order|
				order.company_id = company.id
				order.agency_id = 1..2
				order.title = FFaker::Skill.specialty 
				order.notes = FFaker::BaconIpsum.sentences
				order.number_needed = 1..4
				order.active = true
				orber.urgrnt = false
				# Job.populate(1..2) do |job|
				# 	job.order_id = order.id
				# 	job.title = FFaker::Job.title
				# 	job.employee_id = job.id
				# 	job.pay_rate = range(8.10, 27.57)
				# 	job.description = FFaker::BaconIpsum.sentences
				# 	job.active = true
				# 	puts job.employee_id
			 # 	end
			end
			
		end
	  puts 'All done!!!'
  end
  
  desc "Create random shifts"
  task :pop_shifts => :environment do
	require 'populator'
	require 'ffaker'
	def random_hour(from, to)
  		(Date.today + rand(from..to).hour + rand(0..60).minutes).to_datetime
	end
	puts random_hour(10, 15)
		
  end

  
  desc "Create 25 employees with random names and addresses"
  task :pop_emp => :environment do
	require 'populator'
	require 'ffaker'
	password = "password"
	  User.populate 50 do |user|
		user.first_name = FFaker::Name.first_name
		user.last_name = FFaker::Name.last_name
		user.email = FFaker::Internet.email
		user.city = FFaker::Address.city
		user.state = FFaker::AddressUS.state
		user.zipcode = FFaker::AddressUS.zip_code
		user.address = FFaker::AddressUS.street_address
		user.role = "Employee"
		user.encrypted_password = User.new(:password => password).encrypted_password
		user.sign_in_count = 0
		Employee.populate 1 do |employee|
			employee.user_id = user.id
			employee.first_name = user.first_name
			employee.last_name = user.last_name
			employee.email = user.email
			employee.ssn = 1234..9999
			employee.phone_number = FFaker::PhoneNumber.short_phone_number

			
	
	
			
			puts employee.first_name
		  end
		


		
		puts user.first_name
	  end
	  puts 'All done!!!'
  end
  
  desc "Create 25 employees with random names and addresses"
  task :pop_admin => :environment do
	require 'populator'
	require 'ffaker'
	password = "password"
	  
	  Agency.populate 1 do |agency|
		agency.name = "Global Technical Recruiters"
		puts agency.name
	  end
	  Agency.populate 2 do |agency|
		agency.name = FFaker::Company.name
		puts agency.name
	  end
	  Admin.populate 1 do |admin|
		admin.first_name = "Brittany"
		admin.last_name = "Hicks"
		admin.email = "bhicks@email.com"
		admin.agency_id = 1
		admin.role = "Owner"
		admin.encrypted_password = Admin.new(:password => password).encrypted_password
		admin.sign_in_count = 0
		admin.failed_attempts = 0
		puts admin.first_name
	  end
	  Admin.populate 5 do |admin|
		admin.first_name = FFaker::Name.first_name
		admin.last_name = FFaker::Name.last_name
		admin.email = FFaker::Internet.email
		admin.agency_id = 1
		admin.role = "Recruiter"
		admin.encrypted_password = Admin.new(:password => password).encrypted_password
		admin.sign_in_count = 0
		admin.failed_attempts = 0
		puts admin.first_name
	  end
	  Admin.populate 2 do |admin|
		admin.first_name = FFaker::Name.first_name
		admin.last_name = FFaker::Name.last_name
		admin.email = FFaker::Internet.email
		admin.agency_id = 1
		admin.role = "Account Manager"
		admin.encrypted_password = Admin.new(:password => password).encrypted_password
		admin.sign_in_count = 0
		admin.failed_attempts = 0
		puts admin.first_name
	  end
	  Admin.populate 5 do |admin|
		admin.first_name = FFaker::Name.first_name
		admin.last_name = FFaker::Name.last_name
		admin.email = FFaker::Internet.email
		admin.agency_id = 2
		admin.role = "Recruiter"
		admin.encrypted_password = Admin.new(:password => password).encrypted_password
		admin.sign_in_count = 0
		admin.failed_attempts = 0
		puts admin.first_name
	  end
	  Admin.populate 2 do |admin|
		admin.first_name = FFaker::Name.first_name
		admin.last_name = FFaker::Name.last_name
		admin.email = FFaker::Internet.email
		admin.agency_id = 2
		admin.role = "Account Manager"
		admin.encrypted_password = Admin.new(:password => password).encrypted_password
		admin.sign_in_count = 0
		admin.failed_attempts = 0
		puts admin.first_name
	  end
	  Admin.populate 1 do |admin|
		admin.first_name = FFaker::Name.first_name
		admin.last_name = FFaker::Name.last_name
		admin.email = FFaker::Internet.email
		admin.agency_id = 2
		admin.role = "Owner"
		admin.encrypted_password = Admin.new(:password => password).encrypted_password
		admin.sign_in_count = 0
		admin.failed_attempts = 0
		puts admin.first_name
	  end
	  Admin.populate 1 do |admin|
		admin.first_name = FFaker::Name.first_name
		admin.last_name = FFaker::Name.last_name
		admin.email = FFaker::Internet.email
		admin.agency_id = 1
		admin.role = "Owner"
		admin.encrypted_password = Admin.new(:password => password).encrypted_password
		admin.sign_in_count = 0
		admin.failed_attempts = 0
		puts admin.first_name
	  end
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  puts 'All done!!!'
  end
  

  
  
  
  
  
  
  
  
  
  
  
  
  
end



# require "as-duration"
# FFaker::Time.between(2.days.ago, Time.now, :all) #=> "2014-09-19 07:03:30 -0700"
# FFaker::Time.between(2.days.ago, Time.now, :day) #=> "2014-09-18 16:28:13 -0700"
# FFaker::Time.between(2.days.ago, Time.now, :night) #=> "2014-09-20 19:39:38 -0700"
# FFaker::Time.between(2.days.ago, Time.now, :morning) #=> "2014-09-19 08:07:52 -0700"
# FFaker::Time.between(2.days.ago, Time.now, :afternoon) #=> "2014-09-18 12:10:34 -0700"
# FFaker::Time.between(2.days.ago, Time.now, :evening) #=> "2014-09-19 20:21:03 -0700"
# FFaker::Time.between(2.days.ago, Time.now, :midnight) #=> "2014-09-20 00:40:14 -0700"


desc "Create 25 employees with random names and addresses"
  task :pop_emp => :environment do
	require 'populator'
	require 'ffaker'
	password = "password"
	  User.populate 50 do |user|
		user.first_name = FFaker::Name.first_name
		user.last_name = FFaker::Name.last_name
		user.email = FFaker::Internet.email
		user.city = FFaker::Address.city
		user.state = FFaker::AddressUS.state
		user.zipcode = FFaker::AddressUS.zip_code
		user.address = FFaker::AddressUS.street_address
		user.role = "Employee"
		user.encrypted_password = User.new(:password => password).encrypted_password
		user.sign_in_count = 0
		Employee.populate 1 do |employee|
			employee.user_id = user.id
			employee.first_name = user.first_name
			employee.last_name = user.last_name
			employee.email = user.email
			employee.ssn = 1234..9999
			employee.phone_number = FFaker::PhoneNumber.short_phone_number

			
	
	
			
			puts employee.first_name
		  end
		


		
		puts user.first_name
	  end
	  puts 'All done!!!'
  end
  
 # task :shifts => :environment do
 # 	def random_hour(from, to)
 # 		(Date.today + rand(from..to).hour + rand(0..60).minutes).to_datetime
	# end

	# puts random_hour(10, 15)
	
 #   # Shift.populate 100 do |t|
 #   #   t.time_in = 
    
 #   #   t.employee_id = rand(6)+1 # random group_id [1..6]
 #   #   t.state = "clocked_out"
 #   #   t.priority_id = rand(3)+1 # random priority_id [1..3]
 #   #   t.contact_id = rand(NUM_CONTACTS)+1 # random contact_id [1..NUM_CONTACTS]
 #   #   t.creator_id = rand(6)+2 # random created_by [2..7]
 #   #   t.created_at = CREATION_PERIOD.sample
 #   # end
 # end