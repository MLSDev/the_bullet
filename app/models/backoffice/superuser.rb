# frozen_string_literal: true

class Backoffice::Superuser < ApplicationRecord
  has_many :sessions, dependent: :destroy

  has_secure_password
end
