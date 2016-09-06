namespace :export do

  desc "Erstellt ein json Objekt mit allen Personen und sichert es unter tmp/people.json"
  task :people_to_json do
    people = Person.all #Person.where("id < 20")
    json = people.to_json
    #target_directory = "tmp/"
    target_directory = "../middleman_sandbox/data/"
    File.open("#{target_directory}people.json", "w") do |f|
      f.write(JSON.pretty_generate(JSON.parse(json)))
    end

    people.each do |p|
      File.open("#{target_directory}_#{p.id}.json", "w") do |f|
        f.write(JSON.pretty_generate(JSON.parse(p.to_json(methods: :comments))))
      end
    end
  end
end
