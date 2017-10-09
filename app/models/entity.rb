class Entity < ApplicationRecord
  belongs_to :model
  validate :schema_valid
  serialize :content, Hash

  private

  def schema_valid
    validator = HashValidator.validate(content, model.schema)
    unless validator.valid?
      validator.errors.each do |k, v|
        errors.add(:content, {k => v})
      end
    end
  end
end
