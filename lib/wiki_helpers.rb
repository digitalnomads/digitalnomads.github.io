module WikiHelpers
  def self.generate_id(title)
    'modal_' + title.delete('&/').gsub(' ', '_')[0..57].downcase
  end
end