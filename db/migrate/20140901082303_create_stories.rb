class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :link
      t.integer :comment_count
      t.string :comment_link
      t.string :owner_name
      t.string :owner_link

      t.timestamps
    end
  end
end
