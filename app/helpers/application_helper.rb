module ApplicationHelper
  def callout_sample
    calout = ['danger','info','warning','success','primary'].sample
  end

  def full_title page_title
    base_title = 'RailsTasks 一个神奇的网站'
    page_title.empty?? base_title : "#{page_title} | #{base_title}"            
  end
end