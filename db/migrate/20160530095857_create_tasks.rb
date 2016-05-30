class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :business_process_id
      t.boolean :executed
      t.integer :route_id
      t.integer :route_point_id
      t.integer :performer_id
      t.integer :executor_id
      t.datetime :execution_date
      t.text :comment

      t.timestamps
    end
  end
end
