#create cats

Cat.create!(name: "Gizmo", birthdate: (Time.now - 5.years), color: 'Striped', sex: 'M')

Cat.create!(name: "Bobby", birthdate: (Time.now - 10.years), color: 'Black', sex: 'F')

Cat.create!(name: "Iguana", birthdate: (Time.now - 2.years), color: 'Orange', sex: 'F')
