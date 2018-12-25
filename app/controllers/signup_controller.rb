class SignupController < ApplicationController
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]

  GET /resource/sign_up
  def new
    super
  end

  POST /resource
  def create
    super
  end

  GET /resource/edit
  def edit
    super
  end

  PUT /resource
  def update
    super
  end

  DELETE /resource
  def destroy
    super
  end

  GET /resource/cancel
  def cancel
    super
  end

  protected

  def after_sign_up_path_for(resource)
    super(resource)
  end

  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
