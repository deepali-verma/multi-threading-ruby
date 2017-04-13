# class having executable code for thread
class SampleThread
  def testing(name, &block)
    thread = Thread.new do
      puts "Starting thread - #{name}"
      sleep(2)
      puts "Waked up - #{name}"
      yield
    end
  end

end

t1 = SampleThread.new.testing("thread 1") do
  10.times do |i|
    puts "printing #{i} from thread 1"
  end
end

t2 = SampleThread.new.testing("thread 2") do
  10.times do |i|
    puts "printing #{i} from thread 2"
  end
end

t1.join
t2.join
