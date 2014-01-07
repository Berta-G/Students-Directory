#!/usr/bin/env ruby

students = [{name: "Berta", cohort: :Jan},
			{name: "Paul", cohort: :Jan},
			{name: "Megan", cohort: :Jan},
			{name: "Rolando", cohort: :Jan}]

def list(students)
	users = students.sort{|x,y| x[:name] <=> y[:name]}

	users.each_with_index do |student, i|   print "#{i+1} - #{student[:name]} (#{student[:cohort]} cohort)\n" if student[:name].start_with?('B')
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

	while !name.empty?
		print "Enter cohort: "
		cohort = gets.chomp.capitalize()

		students << {:name => name, :cohort => cohort}
		
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