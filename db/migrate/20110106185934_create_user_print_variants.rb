class CreateUserPrintVariants < ActiveRecord::Migration
  def self.up
    create_table :user_print_variants do |t|
      t.column :height, :integer
      t.column :width, :integer
      t.column :finish, :string
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :user_print_variants
  end
end
