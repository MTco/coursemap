class AddNewFieldsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :shortName, :text
    add_column :courses, :instructors, :text
    add_column :courses, :url, :text
    add_column :courses, :description, :text
  end
end
