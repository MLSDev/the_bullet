# frozen_string_literal: true

class AddUniqIndexOnUsersResetToken < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :reset_token, unique: true
  end
end
