class CreateUserPreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :user_preferences do |t|
      t.string :name
      t.string :sector
      t.boolean :terms

      t.timestamps
    end
  end
end
