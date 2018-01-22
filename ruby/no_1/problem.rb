class Bank
  def initialize
  end

  def break(money)
    case money.currency
    when :jpy then
      after = []
      money.value.div(100).times do
        after.push(Money.new(100, :jpy))
      end
    when :usd then
      after = []
      money.value.div(1).times do
        after.push(Money.new(1, :usd))
      end
    else
    end
    after
  end

  def exchange(money, currency)
    case currency
    when :jpy then
      yen = exchange_from_usd_to_jpy(money.value)
      Money.new(yen, :jpy)
    when :usd then
      dollar = exchange_from_jpy_to_usd(money.value)
      Money.new(dollar, :usd)
    else
    end
  end

  private

  def exchange_from_jpy_to_usd(value)
    value / 100
  end

  def exchange_from_usd_to_jpy(value)
    value * 100
  end
end


class Money
  def initialize(value, currency)
    @value = value
    @currency = currency.to_sym
  end

  def value
    @value
  end

  def currency
    @currency
  end
end
