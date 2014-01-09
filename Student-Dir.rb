#!/usr/bin/env ruby
require 'date'

@students = [{name: "Berta", cohort: :Jan, birthdate: "1980-01-01", country: :UK},
			{name: "Paul", cohort: :Jan, birthdate: "1981-01-01", country: :France},
			{name: "Megan", cohort: :Jan, birthdate: "1980-01-01", country: :Spain},
			{name: "Rolando", cohort: :Jan, birthdate: "1980-01-01", country: :UK},
			{name: "James", cohort: :Nov, birthdate: "1990-10-07", country: :UK}]



def list_students(students_sorted)
	x = 20 #width of the columms
	students_sorted.each_with_index do |student, i| puts "#{i+1} - #{student[:name].to_s.ljust(x)} #{student[:cohort].to_s.ljust(x)} #{student[:birthdate].to_s.ljust(x)} #{student[:country].to_s.ljust(x)}"
	end
end

def order_by(field)
	#students_sorted = @students.sort{|x,y| x[field].to_s <=> y[field].to_s}
	@students.sort_by {|hsh| hsh[field]}
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
	Date.valid_date?(date.slice(6,4).to_i,date.slice(3,2).to_i,date.slice(0,2).to_i)
end

def get_name()
	print "Enter name: "
	name = gets.chomp.capitalize()
	while (!is_name(name))
			prints "Name not allowed, Try again."
			name = gets.chomp.capitalize()
	end
	name
end

def get_cohort()
	print "Enter cohort: "
	cohort = gets.chomp.capitalize()
	#cohort = default if cohort.empty?
	while (!is_cohort(cohort) && !cohort.empty?)
		puts "again"
		cohort = gets.chomp.capitalize()
	end
	cohort
end

def get_birthdate()
	print "Date of birth (DD/MM/YYYY): "
	birthdate = gets.chomp()
	while (!is_date(birthdate) && !birthdate.empty?) 
		puts "Wrong date, try again: "
		birthdate = gets.chomp()
	end
	birthdate
end

def get_country()
	print "Enter Country of birth: "
	country = gets.delete("\n").capitalize()
end

def new_student()

	loop do 
		name = get_name
		cohort = get_cohort
		birthdate = get_birthdate
		country = get_country

		cohort = cohort.empty? ? nil : cohort.to_sym
		birthdate = nil if birthdate.empty? 
		country = country.empty? ? nil : country.to_sym

		@students << {:name => name, :cohort => cohort, :birthdate => birthdate, :country => country}		
		print "Insert more students? (Y/N) >> "

		return if gets.chomp.capitalize() == "N"
	end
end


def print_header
	puts "\nCLASS DIRECTORY"
	puts "==============="
end

def print_footer
	es = (@students.length != 1) ? "s" : ""
	puts "Now we have #{@students.length} student#{es}"
	puts "-"*80
	puts " " 

end

def show_students
	if !@students.empty? 
		print_header
		list_students(order_by(:name))
		print_footer
		sub_menu1
	else
		puts "There are no students to list.\n"
	end
end

def sub_menu1

	loop do  
	 puts "Sort options: <1> by cohort, <2> by date of birth, <3> by country of birth <9> to go back to main manu."
	 print ">> "
	 case option = gets.chomp 
	 when "1"
	 	list_students(order_by(:cohort))
	 when "2"
	 	list_students(order_by(:birthdate))
	 when "3"
	 	list_students(order_by(:country))
	 when "9"
	 	return
	 else
	 	puts "Option not valid, try again"
	 end
	end

end


def main_menu()
	loop do
		puts ""
		puts "STUDENTS DIRECTORY".center(100)
		puts "=======================================\n".center(100)

		puts "1 - List the studens."
		puts "2 - Insert new students."
		puts "9 - Exit\n\n"

		print "Enter option: "

		selection = gets.chomp

		case selection
		when "1"
			show_students
		when "2"
			new_student
		when "9"
			exit
		else
			print "Option not valid, try again: "
		end
	end
end	


main_menu

#new_student(students)

#puts Date::ABBR_MONTHNAMES
#list(order_by(:cohort))
#print_footer(students.length)