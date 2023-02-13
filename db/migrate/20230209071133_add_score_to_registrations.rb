class AddScoreToRegistrations < ActiveRecord::Migration[7.0]
  def change
    add_column :registrations, :score, :integer
  end
end
