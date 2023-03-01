# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

college = College.create(name: "UEM")

user = User.create(
  name: "Nitek Singh",
  department: "IT",
  admin: true,
  college_id: 1,
  email: "nitekkumarsingh@gmail.com",
  password: "Nitek@2",
  description: "Coding Enthusiast with a Bachelor of Technology, focused in Information technology from B.P. Poddar Institute Of Management and Technology. Experienced with a demonstrated history of working in the e-learning industry.",
  linkedin_url: "https://www.linkedin.com/in/nitek-kumar-singh-69310719b/"
)

exam = Exam.create(
  title: "Demo Test",
  start_time: Time.now,
  duration: 60
)
