# frozen_string_literal: true

require 'test_helper'
require 'generators/jet_ui/eject/eject_generator'

class EjectGeneratorTest < Minitest::Test
  def test_manifest_keys_appear_in_desc
    help = JetUi::Generators::EjectGenerator.desc

    JetUi::Generators::EjectGenerator::MANIFEST.each_key do |name|
      assert_includes help, name
    end
  end
end
