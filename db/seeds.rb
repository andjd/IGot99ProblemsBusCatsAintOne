# #create cats
#
# Cat.create!(name: "Gizmo", birthdate: (Time.now - 5.years), color: 'Striped', sex: 'M')
#
# Cat.create!(name: "Bobby", birthdate: (Time.now - 10.years), color: 'Black', sex: 'F')
#
# Cat.create!(name: "Iguana", birthdate: (Time.now - 2.years), color: 'Orange', sex: 'F')

CatRentalRequest.new(cat_id: 2, start_date: Time.now + 2.days, end_date: Time.now + 10.days, status: "PENDING", user_id: 1)

CatRentalRequest.new(cat_id: 2, start_date: Time.now + 1.days, end_date: Time.now + 4.days, status: "PENDING", user_id: 2)

CatRentalRequest.new(cat_id: 2, start_date: Time.now + 9.days, end_date: Time.now + 11.days, status: "PENDING", user_id: 3)
