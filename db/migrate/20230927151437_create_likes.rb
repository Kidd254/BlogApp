class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.datetime :updated_at
      t.datetime :created_at

      t.timestamps
    end

    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end # END: abpxx6d04wxr
  end
