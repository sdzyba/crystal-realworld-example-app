require "validations"

module CustomValidations
  include Validations

  rule :required do |attr, value, rule|
    invalidate(attr, "is required") if value.nil?
  end
end
