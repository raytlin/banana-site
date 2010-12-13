class CreateBananas < ActiveRecord::Migration
  def self.up
    create_table :bananas do |t|
      t.integer :number_of_bananas
      t.datetime :when_bought
      t.datetime :when_brown
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bananas
  end
end
