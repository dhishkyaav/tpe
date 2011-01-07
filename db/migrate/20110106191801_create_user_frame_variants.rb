class CreateUserFrameVariants < ActiveRecord::Migration
  def self.up
    create_table :user_frame_variants do |t|
      t.column :type, :string
      t.column :color, :string
      t.column :base_color, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :user_frame_variants
  end
end
