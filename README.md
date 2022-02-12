# Fiber scheduler spec

Building a Ruby fiber scheduler is hard. This gem helps with testing it.

Works with fiber schedulers in ruby 3.1.

This is **NOT** a specification, here are
[the official docs for fiber scheduler](https://docs.ruby-lang.org/en/master/Fiber/SchedulerInterface.html).

### Installation

```
gem install fiber_scheduler_spec
```

### Usage

Run all the specs on `CustomFiberScheduler`:

```ruby
# spec/custom_fiber_scheduler/fiber_scheduler_spec.rb
require "fiber_scheduler_spec"

RSpec.describe CustomFiberScheduler do
  include_examples FiberSchedulerSpec
end
```

**or**

Run a subset of specs (just comment out example groups you don't need):

```ruby
# spec/custom_fiber_scheduler/fiber_scheduler_spec.rb
require "fiber_scheduler_spec"

RSpec.describe CustomFiberScheduler do
  include_examples FiberSchedulerSpec::BlockUnblock
  include_examples FiberSchedulerSpec::Close
  include_examples FiberSchedulerSpec::Fiber
  include_examples FiberSchedulerSpec::IOWait
  include_examples FiberSchedulerSpec::KernelSleep
  include_examples FiberSchedulerSpec::ProcessWait
  include_examples FiberSchedulerSpec::SocketIO
  include_examples FiberSchedulerSpec::TimeoutAfter
end
```

### More info

This gem assumes your fiber scheduler implements:

- All the methods defined in
  [Fiber::SchedulerInterface docs](https://docs.ruby-lang.org/en/master/Fiber/SchedulerInterface.html).
- `#run` method that starts the event loop.

### License

[MIT](LICENSE)
