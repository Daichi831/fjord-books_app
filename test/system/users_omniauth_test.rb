# frozen_string_literal: true

require 'application_system_test_case'

class UsersOmniauthTest < ApplicationSystemTestCase

  setup do
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      :provider => 'github',
      :uid => '123456',
      :info => { :name => "carol", :email => "carol@example.com" }
    })
  end

  test 'githubログイン' do
    visit root_url

    click_on 'GitHubでログイン'
    assert_text 'GitHub アカウントによる認証に成功しました。'

  end
end
