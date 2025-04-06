def substrings(word, dictionary)
  word = word.downcase
  result = Hash.new(0)

  dictionary.each do |substring|
    matches = word.scan(/#{substring}/)
    result[substring] += matches.length unless matches.empty?
  end

  result
end

# Example usage:
dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)