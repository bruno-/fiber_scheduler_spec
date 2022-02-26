require "libev_scheduler"

RSpec.describe Libev::Scheduler do
  # include_examples FiberSchedulerSpec::BlockUnblock
  include_examples FiberSchedulerSpec::Close
  include_examples FiberSchedulerSpec::Fiber
  # include_examples FiberSchedulerSpec::IOWait
  # include_examples FiberSchedulerSpec::KernelSleep
  # include_examples FiberSchedulerSpec::NestedFiberSchedule
  # include_examples FiberSchedulerSpec::ProcessWait
  # include_examples FiberSchedulerSpec::SocketIO
  # include_examples FiberSchedulerSpec::TimeoutAfter
end
