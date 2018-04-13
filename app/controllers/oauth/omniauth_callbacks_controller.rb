class Oauth::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  include ActionView::Rendering

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  def omniauth_success
    get_resource_from_auth_hash
    set_token_on_resource
    create_auth_params

    if confirmable_enabled?
      # don't send confirmation email!!!
      @resource.skip_confirmation!
    end

    sign_in(:user, @resource, store: false, bypass: false)

    @resource.save!

    yield @resource if block_given?
    render_data_or_redirect('deliverCredentials', @auth_params.as_json, @resource.as_json)
  end

  def render_data(message, data)
    @data = data.merge({
      message: message
    })

    render :layout => nil, :template => "devise_token_auth/omniauth_external_window"
  end

  def render_data_or_redirect(message, data, user_data = {})

    # We handle inAppBrowser and newWindow the same, but it is nice
    # to support values in case people need custom implementations for each case
    # (For example, nbrustein does not allow new users to be created if logging in with
    # an inAppBrowser)
    #
    # See app/views/devise_token_auth/omniauth_external_window.html.erb to understand
    # why we can handle these both the same.  The view is setup to handle both cases
    # at the same time.
    if ['inAppBrowser', 'newWindow'].include?(omniauth_window_type)
      return render_data(message, user_data.merge(data))

    elsif auth_origin_url # default to same-window implementation, which forwards back to auth_origin_url

      # build and redirect to destination url
      redirect_to DeviseTokenAuth::Url.generate(auth_origin_url, data.merge(blank: true))
    else

      # there SHOULD always be an auth_origin_url, but if someone does something silly
      # like coming straight to this url or refreshing the page at the wrong time, there may not be one.
      # In that case, just render in plain text the error message if there is one or otherwise
      # a generic message.
      fallback_render data[:error] || 'An error occurred'
    end
  end

  def redirect_callbacks
    super 
  end
end