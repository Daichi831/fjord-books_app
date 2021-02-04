# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase

  setup do
    #アカウント登録画面を開く
    visit 'users/sign_up'
    
    fill_in 'Eメール', with: 'David@example.com'
    fill_in '氏名', with: 'David'
    fill_in 'パスワード', with: 'dddddd'
    fill_in 'パスワード（確認用）', with: 'dddddd'

    click_button 'アカウント登録'
    assert_text 'アカウント登録が完了しました。'
  end

  test '自己紹介文作成' do
    #アカウント編集画面を開く
    visit 'users/edit'

    fill_in '自己紹介文', with: '宜しくお願いします。'

    click_button '更新'
    assert_text 'アカウント情報を変更しました。'
    assert_text '宜しくお願いします。'
  end

  test 'ログアウトする' do
    click_on 'ログアウト'
    assert_text 'ログアウトしました。'
  end
 
end
