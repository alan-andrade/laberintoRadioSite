user = User.create(email: 'alan.andradec@gmail.com', password: 'changeme', admin: true)
user.create_profile(name: 'Alan Andrade', nickname: 'Gallo')

