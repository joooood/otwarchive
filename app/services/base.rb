class AO3::Service
  attr_reader :result, :errors

  def initialize(*args)
    @args = args
    @result = nil
    @errors = []
  end

  def call
    @result = perform
    success?
  end

  def perform
    raise NotImplementedError, "Subclasses must implement #perform"
  end

  def success?
    errors.empty?
  end

  def failure?
    !success?
  end

  def add_errors(message)
    errors << message
  end
end
