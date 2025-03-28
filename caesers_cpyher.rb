def caesar_cipher(input, shift)
  shift %= 26 # Ensure the shift is within the range of the alphabet
  input.chars.map do |char|
    if char.match?(/[a-z]/)
      ((char.ord - 'a'.ord + shift) % 26 + 'a'.ord).chr
    elsif char.match?(/[A-Z]/)
      ((char.ord - 'A'.ord + shift) % 26 + 'A'.ord).chr
    else
      char # Non-alphabetic characters remain unchanged
    end
  end.join
end

# Example usage
puts caesar_cipher("This is pure insanity! How can you even read this?!", 5) # => "Bmfy f xywnsl!"