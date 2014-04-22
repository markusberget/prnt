# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


config = Configuration.create(description: "Standard")

user =  User.create(name: "Mattias Appelgren", email: "matapp@student.chalmers.se")
user2 = User.create(name: "Markus Berget", email: "berget@student.chalmers.se")


printer = Printer.create(name: "Canon Superprinter", configuration: config,
                         location:'{"lat":57.7011465776028, "lng":11.959337711334229}',
                        user: user)
printer2 = Printer.create(name: "PC Load letter", configuration: config,
                          location: '{"lat":57.70772723097088, "lng":11.964916706085205}',
                          user: user)

Job.create(document: "Link to something", configuration: config, printer: printer, user: user2)

