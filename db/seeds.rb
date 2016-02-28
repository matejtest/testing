# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#roles
roles = Role.create([ {:name => 'admin'}, {:name => 'regular'} ])

#filters
filters = Filter.create([ {:name => 'All'}, {:name => 'Last Week'}, {:name => 'Last Month'}, {:name => 'Amount < 100'}, {:name => 'Amount >= 100'}, {:name => 'Today'} ])