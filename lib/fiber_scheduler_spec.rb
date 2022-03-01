require_relative "fiber_scheduler_spec/block_unblock"
require_relative "fiber_scheduler_spec/close"
require_relative "fiber_scheduler_spec/fiber"
require_relative "fiber_scheduler_spec/io_wait"
require_relative "fiber_scheduler_spec/kernel_sleep"
require_relative "fiber_scheduler_spec/nested_fiber_schedule"
require_relative "fiber_scheduler_spec/process_wait"
require_relative "fiber_scheduler_spec/socket_io"

if RUBY_VERSION >= "3.1.0"
  require_relative "fiber_scheduler_spec/address_resolve"
  require_relative "fiber_scheduler_spec/timeout_after"
end

RSpec.shared_examples FiberSchedulerSpec do
  include_examples FiberSchedulerSpec::BlockUnblock
  include_examples FiberSchedulerSpec::Close
  include_examples FiberSchedulerSpec::Fiber
  include_examples FiberSchedulerSpec::IOWait
  include_examples FiberSchedulerSpec::KernelSleep
  include_examples FiberSchedulerSpec::NestedFiberSchedule
  include_examples FiberSchedulerSpec::ProcessWait
  include_examples FiberSchedulerSpec::SocketIO

  if RUBY_VERSION >= "3.1.0"
    include_examples FiberSchedulerSpec::AddressResolve
    include_examples FiberSchedulerSpec::TimeoutAfter
  end
end
