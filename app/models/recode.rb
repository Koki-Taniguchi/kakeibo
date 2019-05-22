class Recode < ApplicationRecord

  belongs_to :user

  enum categories: {
        食費: 0,
        日用品: 1,
        娯楽費: 2,
        教育費: 3,
        ペット費: 4,
        習い事費: 5
  }

  def self.search(search, start, last, user)
    if start.blank? && last.blank?
      if search.blank?
        Recode.where(user_id: user.id).order(date: "DESC")
      else
        Recode.where(user_id: user.id).where(['name LIKE ?', "%#{search}%"]).order(date: "DESC")
      end
    else
      range = start..last
      if search.blank?
        Recode.where(user_id: user.id).where(date: range).order(date: "DESC")
      else
        Recode.where(user_id: user.id).where(['name LIKE ?', "%#{search}%"]).where(date: range).order(date: "DESC")
      end
    end

  end

end
