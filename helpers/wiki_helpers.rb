module WikiHelpers
  def self.urlify(str)
    str.downcase.gsub(' ', '_')[0..63]
  end
end