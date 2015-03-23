module WikiHelpers
  def self.urlify(str)
    str.gsub(' ', '_')[0..63]
  end
end