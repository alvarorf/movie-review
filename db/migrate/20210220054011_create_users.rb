class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :photo
      t.string :coverimage
      t.string :fullname

      t.timestamps
    end
    add_column :users, :count_follower, :integer, :default => 0
    add_column :users, :count_followed, :integer, :default => 0
  end
end
