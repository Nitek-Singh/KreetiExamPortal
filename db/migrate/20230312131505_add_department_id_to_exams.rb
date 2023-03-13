class AddDepartmentIdToExams < ActiveRecord::Migration[7.0]
  def change
    add_reference :exams, :department, null: false, foreign_key: true
  end
end
