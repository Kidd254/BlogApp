class AddReconfirmableFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :unconfirmed_email, :string
    add_column :users, :confirmation_sent_at, :datetime
  end
end
