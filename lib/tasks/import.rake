require 'roo'


def get_vorname_nachname_titel row
  vornamen = []
  nachnamen = []
  titel = []

  nachname_found = false
  #puts row.join(", ")
  row.each_with_index do |candidate, index|

    if index >= 2 && !(candidate.nil? || candidate.empty?)
      #puts candidate
      if candidate == candidate.upcase
        nachnamen << candidate
        nachname_found = true
      else
        if nachname_found
          titel << candidate
        else
          vornamen << candidate
        end
      end
    end
  end
  [vornamen, nachnamen, titel]
end

namespace :import do


  desc "Importiert aus Excel"
  task :import_people_from_excel do
    #File.open("tmp/20160831_liste.xlsx", "w") do |f|
    excel = Roo::Spreadsheet.open('tmp/20160831_liste.xlsx')

    people = []

    sheet = excel.sheet(0)
    sheet.each_with_index() do |row, i|
      #puts row
      case i
        when 0
          #titel
        else
          sn = row[0]
          registratur = row[1]

          vornamen, nachnamen, titel = get_vorname_nachname_titel(row)
          puts "Vorname: #{vornamen.join(', ')}"
          puts "Nachname: #{nachnamen.join(', ')}"
          puts "Titel: #{titel.join(', ')}"
          people << {s_n: sn, register_number: registratur, first_name: vornamen.join(" "), family_name: nachnamen.join(' '), lawyer: titel.join(' '), }
      end
    end

    Person.create!(people[1..10])


  end
end
