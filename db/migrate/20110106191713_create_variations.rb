class CreateVariations < ActiveRecord::Migration
  def self.up
    create_table :variations do |t|
      t.references :user_print_variant
      t.references :user_frame_variant      
      t.column :price, :decimal
      t.references :photograph
      t.timestamps
    end
  end

  def self.down
    drop_table :variations
  end
end
