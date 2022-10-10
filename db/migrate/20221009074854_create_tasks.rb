class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|

      t.integer :member_id
      t.string :content
      t.string :memo
      t.boolean :status
      t.datetime :start_time

      t.timestamps
    end
  end
end
