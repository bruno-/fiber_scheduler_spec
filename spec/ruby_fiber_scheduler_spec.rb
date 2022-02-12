RSpec.describe "Ruby fiber scheduler" do
  let(:scheduler_class) { IOBufferScheduler }

  include_examples FiberSchedulerSpec
end
