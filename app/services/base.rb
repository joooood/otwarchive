class AO3::Service
  attr_reader :result, :errors

  def initialize(**kwargs)
    @kwargs = kwargs
    @result = nil
    @errors = []
  end

  def call
    @result = perform
    self
  end

  def self.call(**kwargs)
    service = new(**kwargs)
    service.call
    service
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

  def add_error(message)
    errors << message
  end
end
