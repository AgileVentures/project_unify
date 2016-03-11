require 'fb_graph2'
module Api::V1::ActivityFeed
  PROD_TOKEN = "#{ENV['FACEBOOK_APP_ID']}|#{ENV['FACEBOOK_APP_SECRET']}"
  TOKEN = PROD_TOKEN || '1621623384764301|52edb8b7ca0af425a4cb406781004803'
  FB_PAGE = 1660157410904515

  def self.get_fb_feed
    page = FbGraph2::Page.new(FB_PAGE).authenticate(TOKEN).fetch
    feed = page.feed
    response = []
    feed.each { |feed_item| response.push(JSON.parse((feed_item.raw_attributes.merge({type: 'facebook'})).to_json)) }
    response
  end
end