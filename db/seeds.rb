#this is where I will write the seed data for my program 

Patrick = User.create(name: "Patrick", email: "patrick@gmail.com", password: "pw123123")

Erika = User.create(name: "Erika", email: "erika@gmail.com", password: "pw123123")

List.create(title: "shopping list", description:"Buy eggs", due_date: "8/12/20", user_id: faith.id)

List.create(title: "travel packing list", description:"pack jeans" due_date: "8/18/20",user_id: kevin.id)

# Task.create(description:"Buy eggs", user_id: faith.id)

# Task.create(description:"Elephant Bar",user_id: kevin.id)