# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.firs

colleges = College.create([
                            { name: 'BP Poddar' },
                            { name: 'Techno India' },
                            { name: 'Institute Of Engineering And Management' },
                            { name: 'Narula Institute Of Engineering' },
                            { name: 'Heritage Institute Of Technology' },
                            { name: 'Academy Of Technology' },
                            { name: 'Jadavpur University' }
                          ])

departments = Department.create([
                                  { name: 'Computer Science' },
                                  { name: 'Electrical Engineering' },
                                  { name: 'Information Technology' },
                                  { name: 'Electronics And Communications' },
                                  { name: 'Mechanical Engineering' },
                                  { name: 'Civil Engineering' }
                                ])

users = User.create([
                      {
                        name: 'Nitek Singh',
                        admin: true,
                        college_id: 1,
                        email: 'nitekkumarsingh@gmail.com',
                        password: 'Nitek@2',
                        description: 'Coding Enthusiast with a Bachelor of Technology, focused in Information technology from B.P. Poddar Institute Of Management and Technology. Experienced with a demonstrated history of working in the e-learning industry.',
                        linkedin_url: 'https://www.linkedin.com/in/nitek-kumar-singh-69310719b/'
                      },
                      {
                        name: 'Rahul Chaudhary',
                        admin: false,
                        college_id: 5,
                        email: 'rahul@gmail.com',
                        password: 'Rahul@2',
                        description: 'Hey there, Myself Rahul',
                        linkedin_url: 'https://www.linkedin.com/in/nitek-kumar-singh-69310719b/'
                      },
                      {
                        name: 'Shilpi Yadav',
                        admin: false,
                        college_id: 4,
                        email: 'shilpi@gmail.com',
                        password: 'Shilpi@2',
                        description: 'Hey there, Myself Shilpi',
                        linkedin_url: 'https://www.linkedin.com/in/nitek-kumar-singh-69310719b/'
                      },
                      {
                        name: 'Shubham Singh',
                        admin: false,
                        college_id: 7,
                        email: 'shubham@gmail.com',
                        password: 'Shubham@2',
                        description: 'Hey there, Myself Shubham',
                        linkedin_url: 'https://www.linkedin.com/in/nitek-kumar-singh-69310719b/'
                      }
                    ])

exams = Exam.create([
                      { title: 'Demo Test', user_id: 1, start_time: Time.now, duration: 30, department_id: 1 },
                      { title: 'Ruby On Rails', user_id: 1, start_time: Time.now, duration: 40, department_id: 1 },
                      { title: 'Javascript', user_id: 1, start_time: Time.now, duration: 50, department_id: 1 },
                      { title: 'Software Development', user_id: 1, start_time: Time.now, duration: 35,
                        department_id: 3 },
                      { title: 'DBMS', user_id: 1, start_time: Time.now, duration: 30, department_id: 3 },
                      { title: 'Java', user_id: 1, start_time: Time.now, duration: 30, department_id: 3 }
                    ])

questions = Question.create([
                              { question: 'The PM Of India Is', answer: 'Narendra Modi', option_1: 'Narendra Modi', option_2: 'Rahul Gandhi',
                                option_3: 'Arvind Kejriwal', exam_id: 1 },
                              { question: 'The CM Of Kolkata is', answer: 'Mamta Baneerjee', option_1: 'Mamta Baneerjee', option_2: 'Rahul Gandhi',
                                option_3: 'Arvind Kejriwal', exam_id: 1 },
                              { question: 'Highest Mountain peak of India is', answer: 'K2', option_1: 'K2', option_2: 'Kanchanjangha',
                                option_3: 'Mount Everest', exam_id: 1 },
                              { question: 'The Capital Of India Is', answer: 'Delhi', option_1: 'Delhi', option_2: 'Kolkata', option_3: 'Mumbai',
                                exam_id: 1 },
                              { question: 'Rails is a', answer: 'Framework', option_1: 'Framework', option_2: 'Place', option_3: 'Game',
                                exam_id: 2 },
                              { question: 'What is the default database used by Rails?', answer: 'SQLite3',
                                option_1: 'MySQL', option_2: 'PostgreSQL', option_3: 'SQLite3', exam_id: 2 },
                              { question: 'What is the command to create a new Rails application?',
                                answer: 'rails new', option_1: 'rails create', option_2: 'rails generate', option_3: 'rails new', exam_id: 2 },
                              { question: 'Rails supports which language', answer: 'Ruby', option_1: 'Javascript', option_2: 'Ruby', option_3: 'Python',
                                exam_id: 2 },
                              { question: 'Javascript is a', answer: 'Programming Language', option_1: 'Programming Language', option_2: 'Food',
                                option_3: 'Place', exam_id: 3 },
                              { question: 'Node js supports', answer: 'Javascript', option_1: 'Javascript', option_2: 'Python', option_3: 'C++',
                                exam_id: 3 },
                              { question: 'Rails is a', answer: 'Framework', option_1: 'Framework', option_2: 'Place', option_3: 'Game',
                                exam_id: 3 },
                              { question: 'Javascript can be used in backend development', answer: 'True', option_1: 'True', option_2: 'False', option_3: 'Absurd',
                                exam_id: 3 }
                            ])

registrations = Registration.create([
                                      { user_id: 1, exam_id: 2, score: 30, department_id: 1 },
                                      { user_id: 1, exam_id: 3, score: 40, department_id: 1 },
                                      { user_id: 2, exam_id: 2, score: 40, department_id: 2 },
                                      { user_id: 2, exam_id: 3, score: 40, department_id: 2 },
                                      { user_id: 3, exam_id: 2, score: 20, department_id: 1 },
                                      { user_id: 4, exam_id: 2, score: 30, department_id: 3 }
                                    ])
