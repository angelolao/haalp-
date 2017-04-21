class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied, with: lambda { |e| access_denied(e) }


  private

  def access_denied(e)
    logger.info "CanCan AccessDenied!!! #{e}"
    respond_to do |format|
      format.json { head :forbidden }
      format.html {
        if user_signed_in?
          redirect_to root_url
        else
          redirect_to root_url, alert: t("not_authorized")
        end
      }
    end
  end
end

