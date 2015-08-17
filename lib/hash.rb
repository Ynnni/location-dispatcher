class Hash
  def deep_fetch(key, default)
    fetch(key, nil) || self.find { |k, v| break v.deep_fetch(key, default) if v.is_a? Hash } || default
  end
end