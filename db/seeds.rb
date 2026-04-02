user = User.find_or_create_by!(email: "admin@test.com") do |u|
  u.password = "123456"
  u.password_confirmation = "123456"
end

user.characters.find_or_create_by!(name: "Warrior")
