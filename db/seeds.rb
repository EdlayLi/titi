# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do # rubocop:disable Metrics/BlockLength
  user = User.create!(first_name: "Admin", last_name: "2", email: "test82@gmail.com", password: ENV["ADMIN_PASS"],
                      password_confirmation: ENV["ADMIN_PASS"])
  user.skip_confirmation!
  user.save

  chukotka = RailwayStation.create!(title: "Чукотка")
  crimea = RailwayStation.create!(title: "Крым")
  moscow = RailwayStation.create!(title: "Москва")
  stations = [chukotka, crimea, moscow]

  route1 = Route.new(name: "Чукотка - Москва")
  route2 = Route.new(name: "Москва - Чукотка")
  route1.railway_stations << stations
  route2.railway_stations << stations
  route1.save
  route2.save

  chukotka.update_position(route1, 1)
  crimea.update_position(route1, 2)
  moscow.update_position(route1, 3)
  chukotka.update_time(route1, "2:28", "2:30")
  crimea.update_time(route1, "4:28", "4:30")
  moscow.update_time(route1, "6:28", "6:30")
  chukotka.save
  crimea.save
  moscow.save

  chukotka.update_position(route2, 3)
  crimea.update_position(route2, 2)
  moscow.update_position(route2, 1)
  chukotka.update_time(route2, "2:28", "2:30")
  crimea.update_time(route2, "4:28", "4:30")
  moscow.update_time(route2, "6:28", "6:30")
  chukotka.save
  crimea.save
  moscow.save

  train1 = Train.new(number: "222-88")
  train2 = Train.new(number: "888-88")
  train1.route = route1
  train1.current_station = chukotka
  train1.save
  train2.route = route2
  train2.current_station = moscow
  train2.save

  carriage = Carriage.new(number: "0091", type: "SeatedCarriage", seat_places: 10)
  train1.carriages << carriage
end
