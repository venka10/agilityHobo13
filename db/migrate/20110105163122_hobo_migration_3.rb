class M < ActiveRecord::Migration
  def self.up
    create_table :requirement_statuses do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    rename_column :requirements, :status, :status_id
    change_column :requirements, :status_id, :integer, :limit => nil

    add_index :requirements, [:status_id], :name => 'requirement_status_index'
  end

  def self.down
    rename_column :requirements, :status_id, :status
    change_column :requirements, :status, :string

    drop_table :requirement_statuses

    remove_index :requirements, :name => :requirement_status_index rescue ActiveRecord::StatementInvalid
  end
end
