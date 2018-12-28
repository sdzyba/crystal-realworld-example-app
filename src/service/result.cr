class Result(T)
  def initialize(@data : T)
    @errors = nil
  end

  def initialize(@errors : Hash(String, Array(String)))
    @data = nil
  end

  def successful?
    @errors.nil?
  end

  def errors
    @errors.not_nil!
  end

  def data
    @data.not_nil!
  end
end
