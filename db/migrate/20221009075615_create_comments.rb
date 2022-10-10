class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :member_id
      t.integer :task_id
      t.text :comment_text

      t.timestamps
    end
  end
end
