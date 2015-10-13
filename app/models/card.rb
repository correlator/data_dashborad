class Card < ActiveRecord::Base
  belongs_to :admin
  belongs_to :page
  default_scope { order(:order) }
  scope :orphaned, -> do
    where("page_id not in (#{Page.pluck(:id).join(',')}) OR page_id IS NULL")
  end

  def self.icons
    %w(fa-ambulance fa-anchor fa-area-chart fa-automobile fa-balance-scale fa-bank fa-bar-chart
       fa-bed fa-bell-o fa-bicycle fa-binoculars fa-birthday-cake fa-black-tie fa-bolt fa-bomb
       fa-book fa-bookmark fa-briefcase fa-bug fa-building fa-bullhorn fa-bullseye fa-bus fa-cab
       fa-calculator fa-calendar fa-camera fa-car fa-certificate fa-chain fa-child fa-clock-o
       fa-cloud fa-code fa-code-fork fa-coffee fa-cog fa-comment fa-comment-o fa-compass
       fa-credit-card fa-cut fa-cutlery fa-dashboard fa-database fa-diamond fa-dollar fa-dribbble
       fa-envelope fa-eraser fa-eye fa-eyedropper fa-female fa-fighter-jet fa-film fa-filter fa-fire
       fa-fire-extinguisher fa-flag fa-flash fa-flask fa-futbol-o fa-gamepad fa-gavel fa-gear
       fa-gears fa-gift fa-glass fa-globe fa-graduation-cap fa-group fa-headphones fa-heart fa-home
       fa-hospital-o fa-hotel fa-hourglass fa-institution fa-key fa-laptop fa-leaf fa-legal
       fa-life-saver fa-lightbulb-o fa-line-chart fa-lock fa-magic fa-magnet fa-male fa-map fa-map-marker
       fa-microphone fa-mobile fa-money fa-motorcycle fa-music fa-newspaper-o fa-paper-plane fa-paw
       fa-photo fa-pie-chart fa-plane fa-ra fa-rebel fa-recycle fa-retweet fa-road fa-rocket
       fa-scissors fa-search fa-server fa-sheqel fa-shield fa-ship fa-shopping-cart fa-space-shuttle
       fa-star fa-star-o fa-subway fa-suitcase fa-tachometer fa-taxi fa-television fa-ticket fa-train
       fa-trash fa-tree fa-trophy fa-truck fa-tv fa-umbrella fa-university fa-user fa-users
       fa-video-camera fa-wheelchair fa-wifi fa-wrench)
  end
end
