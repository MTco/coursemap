class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :name
      t.text :largeIcon
      t.text :photo
      t.text :shortDescription
      t.text :video
      t.text :longDescription

      t.timestamps
    end
  end
end
