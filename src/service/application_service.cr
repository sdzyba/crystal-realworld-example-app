require "./validations"

abstract class ApplicationService
  macro inherited
    include Validations
    include CustomValidations
  end

  abstract def perform
end
