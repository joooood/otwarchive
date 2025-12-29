class Work::Import
  def initialize(urls:, options:)
    super
    @urls = urls
    @options = options
    @storyparser = StoryParser.new
  end

  def perform
    if @urls.length == 1
      import_single
    else
      import_multiple
    end
  rescue Timeout::Error => e
    add_error(:timeout)
    nil
  rescue StoryParser::Error => e
    add_error(e.message)
    nil
  end

  private

  def import_single
  end

  def import_multiple
  end
end
