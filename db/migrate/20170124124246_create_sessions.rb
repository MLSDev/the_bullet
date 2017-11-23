# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :token

      t.timestamps
    end

    add_index :sessions, :token, unique: true
  end
end
