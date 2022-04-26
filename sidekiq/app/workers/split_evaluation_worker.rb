require 'sidekiq'

class SplitEvaluationWorker
  include Sidekiq::Worker

  def perform(key, split_name)
    result = SPLIT_CLIENT.get_treatment(key, split_name)

    puts "### Evaluation result: #{result}. key = #{key} || split = #{split_name}"
  end
end
