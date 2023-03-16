# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.firs

colleges = College.create([
  { name: "BP Poddar"}, 
  { name: "IEM"}, 
  { name: "Jadavpur University"}
])

departments = Department.create([
  { name: "Computer Science"}, 
  { name: "Electrical Engineering"}, 
  { name: "Civil Engineering"}
])

user = User.create(
  name: "Nitek Singh",
  admin: true,
  college_id: 1,
  email: "nitekkumarsingh@gmail.com",
  password: "Nitek@2",
  description: "Coding Enthusiast with a Bachelor of Technology, focused in Information technology from B.P. Poddar Institute Of Management and Technology. Experienced with a demonstrated history of working in the e-learning industry.",
  linkedin_url: "https://www.linkedin.com/in/nitek-kumar-singh-69310719b/"
)

exams = Exam.create([
  { title: "Demo Test", user_id: 1, start_time: Time.now, duration: 30, department_id: 1},
  { title: "Rails", user_id: 1, start_time: Time.now, duration: 30, department_id: 1},
  { title: "Java", user_id: 1, start_time: Time.now, duration: 30, department_id: 1}
])

questions = Question.create([
  { question: "The PM Of India Is", answer: "Narendra Modi", option_1: "Narendra Modi", option_2: "Rahul Gandhi", option_3: "Arvind Kejriwal", exam_id: 1},
  { question: "The Capital Of India Is", answer: "Delhi", option_1: "Delhi", option_2: "Kolkata", option_3: "Mumbai", exam_id: 1},
  { question: "Rails is a", answer: "Framework", option_1: "Framework", option_2: "Place", option_3: "Game", exam_id: 2},
  { question: "Java is a", answer: "Programming Language", option_1: "Programming Language", option_2: "Food", option_3: "Place", exam_id: 3}
])

registrations = Registration.create([
  {user_id: 1, exam_id: 2, score: 50, department_id: 1},
  {user_id: 1, exam_id: 3, score: 70, department_id: 1}
])
