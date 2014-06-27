class Guillaume::Poetics
  def self.enjamb(chance=100, line)
    if rand(100) <= chance
      line_parts = line.split(/(?<=[\.,;!-])/)
      if line_parts.count > 1 # if the line contains any . , ; ! -
        random_index = rand(line_parts.count)
        line_parts[random_index] = line_parts[random_index] + "\n"
        line_parts.join.strip
      end
    end
    line
  end
end
