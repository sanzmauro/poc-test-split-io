class HomeController < ApplicationController
  def show
    render json: { ok: true }
  end

  def show_test_global_feature_flag
    status = SPLIT_CLIENT.get_treatment('global', 'test_global_feature_flag')
    render json: { ok: true, status: status }
  end
end
