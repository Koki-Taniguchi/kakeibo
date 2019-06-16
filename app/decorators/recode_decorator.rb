module RecodeDecorator
  def date_format
    date.strftime('%Y/%m/%d')
  end

  def price_add_bop
    if bop == 0
      "￥-" + price.to_s
    elsif bop == 1
      "￥" + price.to_s
    end
  end

  def bop_check
    bop == 0 ? true : false
  end
end
