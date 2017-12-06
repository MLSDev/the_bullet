# frozen_string_literal: true

class Backoffice::Session < ApplicationRecord
  belongs_to :superuser

  has_secure_token
end
