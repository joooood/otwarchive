class Work::Create < AO3::Service
  def initialize(params:, user:)
    super
    @params = params
    @user = user
  end

  def perform
    work = @user.works.new(@params)
    unless work.save
      work.errors.full_messages.each { |e| add_error(e) }
    end
    work
  end
end
