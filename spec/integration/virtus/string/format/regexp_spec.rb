require 'spec_helper'
require 'virtus'
require 'aequitas'
require 'aequitas/virtus_integration'

describe Aequitas::VirtusIntegration::ClassMethods do
  let(:class_under_test) do
    Class.new do
      include Virtus
      include Aequitas

      attribute :validated_attribute, String, :format => /a\.b\.c/

      self
    end
  end

  describe '.validation_rules' do
    it 'includes a Rule::Format::Regexp for :validated_attribute' do
      attribute_rules = class_under_test.validation_rules[:validated_attribute]
      refute_predicate attribute_rules, :empty?
      assert_instance_of Aequitas::Rule::Format::Regexp, attribute_rules.first
    end
  end

  describe '#valid?' do
    subject { class_under_test.new(:validated_attribute => attribute_value) }

    describe 'when empty string' do
      let(:attribute_value) { '' }
      it('is not valid') do
        skip 'default skip condition'
        refute_predicate subject, :valid?
      end
    end

    describe 'when nil' do
      let(:attribute_value) { nil }
      it('is not valid') do
        skip 'default skip condition'
        refute_predicate subject, :valid?
      end
    end

    describe 'when a string of the expected format' do
      let(:attribute_value) { 'a.b.c' }
      it('is valid') { assert_predicate subject, :valid? }
    end

    describe 'when a string not of the expected format' do
      let(:attribute_value) { 'quux' }
      it('is not valid') { refute_predicate subject, :valid? }
    end
  end
end
