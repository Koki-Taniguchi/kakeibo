module RecodesHelper
  def total_price(recodes)
    expenditure = recodes.select(&:bop_check).pluck(:price).sum
    revenue = recodes.reject(&:bop_check).pluck(:price).sum
    "合計支出　￥#{revenue - expenditure}"
  end
end
