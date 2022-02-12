# Fiber scheduler spec

Building a fiber scheduler in Ruby is hard. This gem helps with testing it.

This is **not** a specification, here are
[the official docs for fiber scheduler](https://docs.ruby-lang.org/en/master/Fiber/SchedulerInterface.html).

### Installation

```
gem install fiber_scheduler_spec
```

### Usage

Run a set of shared specs on `CustomFiberScheduler`:

```ruby
# spec/custom_fiber_scheduler/spec.rb

require "fiber_scheduler_spec"

RSpec.describe CustomFiberScheduler do
  include_examples FiberSchedulerSpec
end
```

### License

[MIT](LICENSE)
