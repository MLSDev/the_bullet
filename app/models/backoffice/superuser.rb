# frozen_string_literal: true

module Backoffice
  class Superuser < ApplicationRecord
    has_many :sessions, dependent: :destroy

    has_secure_password
  end
end
