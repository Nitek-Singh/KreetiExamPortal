class AddForeignKeyToUsersCollegeId < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users, :colleges
  end
end
