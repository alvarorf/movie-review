class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :photo
      t.string :coverimage
      t.string :fullname
      t.integer :count_follower, :default => 0
      t.integer :count_followed, :default => 0
      t.integer :opinion_count, :default => 0
      t.timestamps
    end
  end
end
