class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :name, :string, :limit=>100
      t.column :username, :string, :limit=>20
      t.column :password, :string, :limit=>100
      t.column :email, :string, :limit=>100
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
