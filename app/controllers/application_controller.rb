class ApplicationController < ActionController::Base
  include Authentication

  before_action :authenticate, except: [:open, :show, :status, :error_404, :bad_request]
  protect_from_forgery with: :exception

  rescue_from ActionController::UnknownFormat, with: :bad_request
  rescue_from ActionController::InvalidAuthenticityToken, with: :bad_request

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  def status
    render json: { status: 'ok' }, status: :ok
  end

  def error_404
    @requested_path = request.path
    render plain: "No such path #{@requested_path}", status: 404
  end

  def job_status
    @attempted_jobs = DelayedJob.where('attempts > 1');
    render 'messages/job_status'
  end

  def clear_queue
    system 'rake message:clear_queue_and_restart'
    redirect_to :root
  end

  protected

  def bad_request
    render plain: 'Bad request', status: 400
  end
end
