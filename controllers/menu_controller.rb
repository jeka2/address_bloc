require_relative '../models/address_book'

class MenuController
    attr_reader :address_book
    
    def initialize
        @address_book = AddressBook.new
    end
    
    puts #{address_book.entries}
    
    def main_menu
       puts "Main Menu - #{address_book.entries.count} entries"
       puts "1 - View all entries"
       puts "2 - Create an entry"
       puts "3 - Search for an entry"
       puts "4 - Import entries from a CSV"
       puts "5 - View Entry by number"
       puts "6 - Exit"
       print "Enter your selection: "
       
       selection = gets.to_i
     case selection
       when 1
         system "clear"
         view_all_entries
         main_menu
       when 2
         system "clear"
         create_entry
         main_menu
       when 3
         system "clear"
         search_entries
         main_menu
       when 4
         system "clear"
         read_csv
         main_menu
       when 5
         system "clear"
         view_individual_entry
         main_menu
       when 6
         puts "Good-bye!"
         exit(0)
       else
         system "clear"
         puts "Sorry, that is not a valid input"
         main_menu
     end
    end
    
    
    def view_all_entries
        address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
            
            entry_submenu(entry)
        end
        
        system "clear"
        puts "End of Entries"
    end
 
    def create_entry
        system "clear"
        puts "New AddressBloc Entry"
        
        print "Name: "
        name = gets.chomp
        print "Phone number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp
        
        address_book.add_entry(name, phone, email)
        
        system "clear"
        puts "New entry created"
    end
 
    def search_entries
        
    end
 
    def read_csv
        
    end
    
    def view_individual_entry
        print "View the entry for: \n"
        address_book.entries.each_with_index do |value, index|
           puts "#{index + 1}: #{value.name}\n" 
        end
        selection = (gets.chomp).to_i
        if selection <= address_book.entries.count && selection > 0
            puts "#{(address_book.entries[selection - 1]).to_s}\n\n"
        else
            puts "The entry isn't valid, please enter a valid input\n\n"
            view_individual_entry
        end
    end
    
    def entry_submenu(entry)
       puts "n - next entry"
       puts "d - delete entry"
       puts "e - edit the entry"
       puts "m - return to main menu"
       
       selection = gets.chomp
       
       case selection
       
        when "n"
        
        when "d"
            
        when "e"
            
        when "m"
            system "clear"
            main_menu
        else
            system "clear"
            puts "#{selection} is not a valid input"
            entry_submenu(entry)
       end
    end
end
