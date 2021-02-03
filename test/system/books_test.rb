# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:book1)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'メモ', with: 'book_memo_new'
    fill_in 'タイトル', with: 'book_title_new'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'book_title_new'
    assert_text 'book_memo_new'
    click_on '戻る'
  end

  test 'updating a Book' do
    visit books_url
    assert_text 'book_title'

    click_on '編集', match: :smart

    fill_in 'メモ', with: 'book_memo_update'
    fill_in 'タイトル', with: 'book_title_update'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'book_title_update'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    assert_text 'book_title'

    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
    assert_no_text 'book_title'
  end
end
