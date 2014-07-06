#
# TODO: move when to enjamb in here
# TODO: move weighted_randomizer here
# TODO: sometimes start many lines with same word
# TODO: topic staying/straying
#
class Guillaume::Poetics
  def self.enjamb(line, critical_chars = 50)
    if line.length >= critical_chars
      $LOGGER.debug("    Enjambing line!")
      line_parts = line.split(/(?<=[ \.,;!])/)
      halfway = line_parts.count / 2
      random_index = halfway + rand(-halfway / 2 .. halfway / 2) # split somewhere near the middle
      line_parts[random_index] = line_parts[random_index] + "\n"
      line_parts.join.strip
    else
      line
    end
  end
end
