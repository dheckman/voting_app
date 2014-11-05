# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Candidate.delete_all
Voter.delete_all
Vote.delete_all


c1 = Candidate.create(name: "Bob", party: "Democrat")
c2 = Candidate.create(name: "Jim", party: "Republican")
v1 = Voter.create(name: "Sidney", party: "Republican")
v2 = Voter.create(name: "Heather", party: "Independent")
vote = Vote.create(voter_id: 1, candidate: c1)
