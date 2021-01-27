# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#created_on" do
    report = Report.create!(user: users(:alice), title: 'sample', content: 'sample')
    assert_equal report.created_at.to_date, report.created_on
  end

  test "#editable?" do
    report = Report.create!(user: users(:alice), title: 'sample', content: 'sample')
    assert report.editable?(users(:alice))
  end
end
