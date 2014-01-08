#!/usr/bin/env ruby

students = [{name: "Berta", cohort: :Jan, birthdate: "1980-01-01", country: :UK},
			{name: "Paul", cohort: :Jan, birthdate: "1980-01-01", country: :France},
			{name: "Megan", cohort: :Jan, birthdate: "1980-01-01", country: :Spain},
			{name: "Rolando", cohort: :Jan, birthdate: "1980-01-01", country: :UK},
			{name: "James", cohort: :Nov, birthdate: "1990-10-07", country: :UK}]

def list(students)

#	users.each_with_index do |student, i|   print "#{i+1} - #{student[:name]} (#{student[:cohort]} cohort)\n" if student[:name].length < 12
#	end

#Change each for challenge 4
	x = 20 # Width of each 'column'
	i=0
	puts "\n      " + "NAME".ljust(x) + "COHORT".ljust(x) + "DATE OF BIRTH".ljust(x) + "COUNTRY OF BIRTH".ljust(x)
	puts "="*80  

	while i < students.length do
		num= i+1
		puts "#{num.to_s.rjust(3)} - #{students[i][:name].to_s.ljust(x)} #{students[i][:cohort].to_s.ljust(x)} #{students[i][:birthdate].to_s.ljust(x)} #{students[i][:country].to_s.ljust(x)}"
	    i+=1
	end
end

def order_by(students, field=:name)
	students_sorted = students.sort{|x,y| x[field] <=> y[field]}
end

def is_name(name)
	!/[a-zA-Z]{3,10}/.match(name).nil? && /\d+/.match(name).nil? && name.length <= 18
end

def is_cohort(cohort)
	mnths =["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sept", "oct", "nov", "dec"]
	sub = cohort.slice(0,3).downcase
	mnths.include?(sub)
end

def is_date(date)

	require 'date'
	Date.valid_date?(date.slice(6,4).to_i,date.slice(3,2).to_i,date.slice(0,2).to_i)

end

def insert_student(students)

	print "Enter name: "
	name = gets.chomp.capitalize()
	while (!is_name(name))
			puts "Not allowed, Try again."
			name = gets.chomp.capitalize()
	end

	print "Enter cohort: "
	cohort = gets.chomp.capitalize()
	#cohort = default if cohort.empty?
	while (!(is_cohort(cohort) || cohort.empty?))
		puts "again"
		cohort = gets.chomp.capitalize()
	end
	cohort = cohort.empty? ? nil : cohort.to_sym

	print "Enter date of birth: "
	birthdate = gets.chomp()
	
	while (!(is_date(birthdate) || birthdate.empty?))
		puts "again"
		birthdate = gets.chomp.capitalize()
	end

	birthdate = nil if birthdate.empty? 


	print "Enter Country of birth: "
	country = gets.chomp.capitalize()
	country = country.empty? ? nil : country.to_sym

	students << {:name => name, :cohort => cohort, :birthdate => birthdate, :country => country}
		
	
end

def print_header
	puts "\nCLASS DIRECTORY"
	puts "==============="
end

def print_footer(n)
	
	puts "Number of students: #{n}"
	puts "-"*80
	puts " " 

end
puts "Testing"
puts is_name("David mike")

print_header
list(order_by(students))
print_footer(students.length)

insert_student(students)

list(order_by(students))
