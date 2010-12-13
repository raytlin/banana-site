class AddBrownToBananas < ActiveRecord::Migration
  def self.up
    add_column :bananas, :brown_bananas, :integer
  end

  def self.down
    remove_column :bananas, :brown_bananas
  end
end
