class CreateIndustries < ActiveRecord::Migration[7.0]
  def change
    create_table :industries do |t|
      t.string :name
      t.references :sector, foreign_key: { to_table: :industries }
      t.timestamps
    end
    change_column :industries, :id, :bigint, auto_increment: false
  end
end
