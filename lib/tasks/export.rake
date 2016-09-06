namespace :export do

  desc "Erstellt ein json Objekt mit allen Personen und sichert es unter tmp/people.json"
  task :people_to_json do
    json = Person.all.to_json
    puts json
    File.open("tmp/people.json", "w") do |f|
      #f.write(JSON.pretty_generate(JSON.parse(json)))
      f.write(json)
    end
  end
end
