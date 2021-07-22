class Party < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :capacity  
  validates_numericality_of :capacity

  belongs_to :host, foreign_key: :user_id
  belongs_to :theme
  has_many :rsvps, dependent: :destroy
  has_many :guests, through: :rsvps, foreign_key: :user_id
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :theme

  scope :popular_parties, -> {
    left_joins(:rsvps)
    .select("parties.*, count(rsvps.id) AS total_rsvps")
    .group("parties.id")
    .order("total_rsvps DESC")
}

  scope :newest_party, -> {order("created_at DESC")}
  scope :oldest_party, -> {order("created_at ASC")}

  # scope :theme_search, -> (theme_name){
  #   left_joins(:themes)
  #   .select("restaurants.*")
  #   .where("theme.name LIKE ?", "%#{theme_name}%")
  # }

  def theme_attributes=(theme)
    self.theme = Theme.find_or_create_by(name: theme[:name])
    self.theme.update(theme)
  end

  def self.filter_by_params(input)
    if !input.empty?
      params= input.values
      Party.send(params.first)
    else
      Party.all
    end
  end


end
