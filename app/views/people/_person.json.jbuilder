json.extract! person, :id, :s_n, :register_number, :first_name, :family_name, :lawyer, :contact_persons, :created_at, :updated_at, :comments_count
json.url person_url(person, format: :json)