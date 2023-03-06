class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    sample_packs_path
  end
end
