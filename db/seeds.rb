# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	# User creation (admin)
	u = User.new
	u.name = 'admin'
	u.email = 'admin@mail.com'
	u.password = 'password'
	u.save
	u.admins.create
	
	# Klass creation
	c = Klass.new
	c.name = 'ING2'
	c.save
	
	# Room creation
	r = Room.new
	r.name = '1.6'
	r.nb_places = '40'
	r.nb_computers = '40'
	r.save
	
	# Subject creation
	s = Subject.new
	s.name = 'Ruby'
	s.save

########################################################################################################
########################################################################################################
########################################################################################################	

