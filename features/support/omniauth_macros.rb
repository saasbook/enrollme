# in spec/support/omniauth_macros.rb
module OmniauthMacros
  def mock_auth_hash(email)
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:google] = {
    # 'provider' => 'twitter',
    # 'uid' => '123545',
    # 'user_info' => {
    # 'name' => 'mockuser',
    # 'image' => 'mock_user_thumbnail_url'
    # },
    # 'credentials' => {
    # 'token' => 'mock_token',
    # 'secret' => 'mock_secret'
    # }
      :info => {
        :email => email
      }
    }
  end
end