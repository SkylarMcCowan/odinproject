def stock_picker(prices)
  max_profit = 0
  best_days = []

  prices.each_with_index do |buy_price, buy_day|
    prices[buy_day + 1..-1].each_with_index do |sell_price, sell_day|
      profit = sell_price - buy_price
      if profit > max_profit
        max_profit = profit
        best_days = [buy_day, buy_day + 1 + sell_day]
      end
    end
  end

  { days: best_days, profit: max_profit }
end

# Example usage:
result = stock_picker([17,3,6,9,15,8,6,1,10])
puts "Best days to trade: #{result[:days]}"
puts "Maximum profit: $#{result[:profit]}"
# Output:
# Best days to trade: [1, 4]
# Maximum profit: $12