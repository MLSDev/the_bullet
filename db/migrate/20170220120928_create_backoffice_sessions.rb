# frozen_string_literal: true

class CreateBackofficeSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :backoffice_sessions do |t|
      t.integer :superuser_id
      t.string :token

      t.timestamps
    end
  end
end
