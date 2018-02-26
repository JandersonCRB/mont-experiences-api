json.id        @provider.id
json.name      @provider.name
json.employees @provider.users do |employee|
	json.id         employee.id
	json.first_name employee.first_name
	json.last_name  employee.last_name
	json.email      employee.email
end
json.experiences @provider.experiences do |experience|
	json.id   experience.id
	json.name experience.name
end