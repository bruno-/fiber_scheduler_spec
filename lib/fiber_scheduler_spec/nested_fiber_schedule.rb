require_relative "context"

module FiberSchedulerSpec
  module NestedFiberSchedule
  end
end

RSpec.shared_examples FiberSchedulerSpec::NestedFiberSchedule do
  describe "nested Fiber.schedule" do
    include_context FiberSchedulerSpec::Context

    let(:order) { [] }

    context "with blocking operations" do
      context "Kernel.sleep" do
        def operations
          Fiber.schedule do
            order << 1
            sleep 0
            order << 3

            Fiber.schedule do
              order << 4
              sleep 0
              order << 6
            end
            order << 5
          end

          order << 2
        end

        it "completes all scheduled fibers" do
          setup

          expect(order).to eq (1..6).to_a
        end
      end
    end

    context "without blocking operations" do
      def operations
        Fiber.schedule do
          order << 1
          Fiber.schedule do
            order << 2
          end
          order << 3
        end
      end

      it "completes all scheduled fibers" do
        setup

        expect(order).to eq (1..3).to_a
      end
    end
  end
end
