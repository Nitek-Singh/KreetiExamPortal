class InitDatabase < ActiveRecord::Migration[7.0]
  def change
    create_table :colleges do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :users do |t|
      t.string :name, null: false
      t.string :department, null: false
      t.boolean :admin, default: false
      t.references :college
      t.string :email, null: false
      t.string :hashed_password
      t.string :description
      t.string :linkedin_url
      t.timestamps
    end

    create_table :exams do |t|
      t.string :title
      t.references :user
      t.datetime :start_time
      t.integer :duration
      t.timestamps
    end

    create_table :registrations do |t|
      t.references :user
      t.references :exam
      t.timestamps
    end

    create_table :questions do |t|
      t.text :question
      t.string :answer
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.references :exam
      t.timestamps
    end
  end
end
