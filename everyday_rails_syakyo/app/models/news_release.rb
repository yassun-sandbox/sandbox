class NewsRelease < ActiveRecord::Base
  validates :title, presence: true
  validates :released_on, presence: true
  validates :body, presence: true

  def title_with_date
    "#{released_on.strftime('%Y-%m-%d')}: #{title}"
  end
end
