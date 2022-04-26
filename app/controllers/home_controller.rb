class HomeController < ApplicationController
  def show
    render json: { ok: true }
  end

  def show_test_global_feature_flag
    key_param = params[:key]
    split_name_param = params[:split_name]
    SplitEvaluationWorker.perform_async(key_param, split_name_param)

    render json: { ok: true }
  end
end
