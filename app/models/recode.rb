class Recode < ApplicationRecord

  belongs_to :user

  enum categories: {
        食費: 0,
        日用品: 1,
        娯楽費: 2,
        教育費: 3,
        ペット費: 4,
        習い事費: 5,
        その他: 6
  }

  enum bops: {
    支出: 0,
    収入: 1
  }

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true
  validates :category, presence: true
  validates :bop, presence: true, inclusion: { in: 0..1 }

  def self.search(search, start, last, bop, user)
    if bop.blank?
      recodes = Recode.where(user_id: user.id)
     else
      recodes = Recode.where(user_id: user.id).where(bop: bop)
    end

    if start.blank? && last.blank?
      if search.blank?
        this_month_range = Date.today.beginning_of_month..Date.today.end_of_month
        recodes.where(date: this_month_range).order(date: "DESC")
      else
        recodes.where(['name LIKE ?', "%#{search}%"]).order(date: "DESC")
      end
    else
      range = start..last
      if search.blank?
        recodes.where(date: range).order(date: "DESC")
      else
        recodes.where(['name LIKE ?', "%#{search}%"]).where(date: range).order(date: "DESC")
      end
    end

  end

end
