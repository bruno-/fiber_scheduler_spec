require_relative "context"

module FiberSchedulerSpec
  module Fiber
  end
end

RSpec.shared_examples FiberSchedulerSpec::Fiber do
  include_context FiberSchedulerSpec::Context

  shared_examples :examples do
    let(:fibers) { [] }
    let(:fiber) { fibers.first }

    it "calls #fiber" do
      expect_any_instance_of(scheduler_class)
        .to receive(:fiber).once
        .and_call_original

      setup
    end

    it "creates a fiber" do
      # Prevent GC running inbetween two ObjectSpace calls.
      GC.disable

      before = ObjectSpace.each_object(Fiber).count
      setup
      after = ObjectSpace.each_object(Fiber).count

      # The 'after - before' is > 1 with some selectors.
      expect(after - before).to be >= 1
    ensure
      GC.enable
    end

    it "creates a non-blocking fiber" do
      setup

      expect(fiber).to be_a Fiber
      expect(fiber).not_to be_blocking
    end
  end

  context "Fiber.schedule with an empty block" do
    def operations
      fibers << Fiber.schedule {}
    end

    include_examples :examples
  end

  context "Fiber.schedule with a non-blocking operation" do
    def operations
      fibers << Fiber.schedule { sleep 0 }
    end

    include_examples :examples
  end

  context "Fiber.schedule with a blocking operation" do
    def operations
      fibers << Fiber.schedule { "." }
    end

    include_examples :examples
  end
end
