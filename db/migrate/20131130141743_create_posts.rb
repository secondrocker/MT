class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.boolean :winner

      t.timestamps
    end
  end
end
