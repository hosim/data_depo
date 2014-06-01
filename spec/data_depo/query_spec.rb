# coding: utf-8
require 'spec_helper'
require 'data_depo'

describe DataDepo::Query do
  describe "#[]" do
    context "when passing only one argument" do
      it "returns a Query instance" do
        query = described_class.new
        expect(query[:foo]).to be_an_instance_of(DataDepo::Query)
      end

      it "returns an object that has the argument's value as 'name'" do
        query = described_class.new[:foo]
        name = query.instance_variable_get(:@name)
        expect(name).to be :foo
      end

      it "returns an object that has an array of the same one as 'path'" do
        query = described_class.new[:foo]
        path = query.instance_variable_get(:@path)
        expect(path).to eq [:foo]
      end
    end
  end

  describe "each" do
    context "when a file that is specified by 'path' exists" do
      before do
        DataDepo.definition_path = \
          File.join(File.dirname(__FILE__), '..', 'samples')
      end

      context "when no block is passed" do
        it "returns an Enumerator instance" do
          query = described_class.new[:single]
          expect(query.each).to be_an_instance_of(Enumerator)
        end
      end
    end
  end
end
