class AddDepartmentIdToRegistrations < ActiveRecord::Migration[7.0]
  def change
    add_reference :registrations, :department, null: false, foreign_key: true
  end
end
