class Model < ApplicationRecord
  has_many :entities
  serialize :schema, Hash
end
