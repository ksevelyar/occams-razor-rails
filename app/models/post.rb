# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  validates :description, :title, :content, :slug, presence: true
  validates :title, :slug, uniqueness: { case_sensitive: false }

  scope :recent, -> { order(published_at: :desc) }
  scope :published, -> { recent.where('published IS TRUE AND published_at <= ?', Time.zone.now) }

  before_validation do
    self.slug ||= title&.parameterize
  end

  def published?
    published && (published_at <= Time.zone.now)
  end
end
