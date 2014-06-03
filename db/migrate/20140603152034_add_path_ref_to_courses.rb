class AddPathRefToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :path, index: true
  end
end
