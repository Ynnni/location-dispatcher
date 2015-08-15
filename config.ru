$:.unshift File.expand_path '../', __FILE__
$:.unshift File.expand_path '../lib', __FILE__
$:.unshift File.expand_path '../models', __FILE__

require 'application'
run LocationDispatcher