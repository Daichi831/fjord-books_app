# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @me = users(:me)
    @she = users(:she)
    @he = users(:he)
  end

  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    # メールアドレスが返ってくれば成功
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    # 名前が返ってくれば成功
    assert_equal 'Foo Bar', user.name_or_email
  end

  test '#follow' do
    # フォローしていなければ成功
    assert_not @me.following?(@she)

    @me.follow(@she)
    # フォローしていれば成功
    assert @me.following?(@she)
  end

  test '#unfollow' do
    # フォローしていなければ成功
    assert_not @me.following?(@she)
  end

  test '#following?' do
    assert_not @me.following?(@she)
    assert_not @me.following?(@he)

    @me.follow(@she)

    assert @me.following?(@she)
    assert_not @me.following?(@he)
  end

  test '#followed_by?' do
    assert_not @me.followed_by?(@she)
    assert_not @me.followed_by?(@he)

    @she.follow(@me)

    assert @me.followed_by?(@she)
    assert_not @me.followed_by?(@he)
  end
end
