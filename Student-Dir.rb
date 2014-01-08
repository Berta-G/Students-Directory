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
		puts "#{num.to_s.rjust(3)} - #{students[i][:name].ljust(x)} #{students[i][:cohort].to_s.ljust(x)} #{students[i][:birthdate].ljust(x)} #{students[i][:country].to_s.ljust(x)}"
	    i+=1
	end
end

def order_by(students, field=:name)
	students_sorted = students.sort{|x,y| x[field] <=> y[field]}
end

def insert_students(students)

	puts "INTSERT NEW STUDENTS:"

	puts "(Leave Name blank to exit)"
	print "Enter name: "
	name = gets.chomp.capitalize()

	default = "Unknown"

	while !name.empty?
		print "Enter cohort: "
		cohort = gets.chomp.capitalize()
		cohort = default if cohort.empty?

		print "Enter date of birth: "
		birthdate = gets.chomp()
		birthdate = default if birthdate.empty? 
#a date validation would be good.

		print "Enter Country of birth: "
		country = gets.chomp.capitalize()
		country = default if country.empty?

		students << {:name => name, :cohort => cohort.to_sym, :birthdate => birthdate, :country => country.to_sym}
		
		print "Enter name: "
		name = gets.chomp.capitalize()
	end
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

print_header
list(order_by(students))
print_footer(students.length)

insert_students(students)

list(order_by(students))
