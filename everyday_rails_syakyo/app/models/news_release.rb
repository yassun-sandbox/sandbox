class NewsRelease < ActiveRecord::Base
  def title_with_date
    "#{released_on.strftime('%Y-%m-%d')}: #{title}"
  end
end
