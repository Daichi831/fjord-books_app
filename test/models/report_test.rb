# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#created_on' do
    report = reports(:report1)
    assert_equal report.created_at.to_date, report.created_on
  end

  test '#editable?' do
    report = reports(:report1)
    assert report.editable?(users(:alice))
  end
end
