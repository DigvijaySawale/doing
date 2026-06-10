class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      # Core task information
      t.string :title, null: false
      t.text :description

      # Scheduling
      t.date :scheduled_date, null: false
      t.date :due_date

      # Time-based tasks
      t.boolean :has_time, null: false, default: false
      t.time :start_time
      t.time :end_time
      t.integer :duration_minutes

      # Status & Priority
      t.integer :priority, null: false, default: 0
      t.integer :status, null: false, default: 0

      # Completion tracking
      t.datetime :completed_at

      # Recurrence
      t.boolean :is_recurring, null: false, default: false

      t.timestamps
    end

    add_index :tasks, :scheduled_date
    add_index :tasks, :due_date
    add_index :tasks, :status
    add_index :tasks, :priority
    add_index :tasks, :completed_at
  end
end