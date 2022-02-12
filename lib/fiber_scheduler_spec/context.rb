require "rspec"

module FiberSchedulerSpec
  module Context
  end
end

RSpec.shared_context FiberSchedulerSpec::Context do
  unless method_defined?(:scheduler_class)
    let(:scheduler_class) { described_class }
  end
  unless method_defined?(:scheduler)
    subject(:scheduler) { scheduler_class.new }
  end
  def setup
    ::Fiber.set_scheduler(scheduler)

    operations

    scheduler.run
  end

  around do |example|
    result = Thread.new do
      example.run
    end.join(1)

    expect(result).to be_a Thread # failure means spec timed out
  end
end
