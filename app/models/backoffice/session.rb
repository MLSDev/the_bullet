module Backoffice
  class Session < ApplicationRecord
    belongs_to :superuser

    has_secure_token
  end
end
