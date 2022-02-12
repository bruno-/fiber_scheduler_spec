require "open-uri"

namespace :fetch do
  task :ruby do
    url = "https://raw.githubusercontent.com/ruby/ruby/master/test/fiber/scheduler.rb"
    File.write(
      "spec/support/fiber_scheduler/ruby.rb",
      URI.parse(url).open.read,
      mode: "w"
    )
  end
end

task fetch: %i[fetch:ruby]
