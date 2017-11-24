class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :text
      t.date :scheduled_at
      t.boolean :done

      t.timestamps
    end
  end
end
