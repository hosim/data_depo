# coding: utf-8

require 'spec_helper'
require 'data_depo'

describe DataDepo do
  describe ".[]" do
    context "when passing only one argument" do
      it "returns a Query instance" do
        query = DataDepo[:key]
        expect(query).to be_an_instance_of(DataDepo::Query)
      end

      it "returns an object that has the argument's value as 'name'" do
        query = DataDepo[:key]
        name = query.instance_variable_get(:@name)
        expect(name).to eq :key
      end

      it "returns an object that has an array of the same one as 'path'" do
        query = DataDepo[:key]
        path = query.instance_variable_get(:@path)
        expect(path).to eq [:key]
      end
    end

    context "when passing some arguments" do
      it "returns a Query instance" do
        query = DataDepo[:foo, :baa, :baz]
        expect(query).to be_an_instance_of(DataDepo::Query)
      end

      it "returns an object that has a first parameters as 'name'" do
        query = DataDepo[:foo, :baa, :baz]
        name = query.instance_variable_get(:@name)
        expect(name).to be :foo
      end

      it "returns an object that has all of arguments as 'path'" do
        query = DataDepo[:foo, :baa, :baz]
        path = query.instance_variable_get(:@path)
        expect(path).to eq [:foo, :baa, :baz]
      end
    end

    context 'when chain call' do
      context 'when passing only one argument' do
        it "returns a Query instance" do
          query = DataDepo[:key0][:key1]
          expect(query).to be_an_instance_of(DataDepo::Query)
        end

        it "returns an object that has first call's argument as 'name'" do
          query = DataDepo[:key0][:key1]
          name = query.instance_variable_get(:@name)
          expect(name).to be :key0
        end

        it "returns an object that has all call's argument value as 'path'" do
          query = DataDepo[:key0][:key1]
          path = query.instance_variable_get(:@path)
          expect(path).to eq [:key0, :key1]
        end
      end

      context "when passing some arguments" do
        it "returns a Query instance" do
          query = DataDepo[:foo, :baa, :baz][:pee, :kaa, :boo]
          expect(query).to be_an_instance_of(DataDepo::Query)
        end

        it "returns an object that has first call's first argument value as 'name'" do
          query = DataDepo[:foo, :baa, :baz][:pee, :kaa, :boo]
          name = query.instance_variable_get(:@name)
          expect(name).to be :foo
        end

        it "returns an object that has all of arguments values as 'path'" do
          query = DataDepo[:foo, :baa, :baz][:pee, :kaa, :boo]
          path = query.instance_variable_get(:@path)
          expect(path).to eq [:foo, :baa, :baz, :pee, :kaa, :boo]
        end
      end
    end
  end

  describe ".method_missing" do
    context "when calling without any arguments" do
      it "returns a Query instance" do
        query = DataDepo.foo
        expect(query).to be_an_instance_of(DataDepo::Query)
      end

      it "returns an object that has a method name as 'name'" do
        query = DataDepo.foo
        name = query.instance_variable_get(:@name)
        expect(name).to be :foo
      end

      it "returns an object that has an array of the same value as 'path'" do
        query = DataDepo.foo
        path = query.instance_variable_get(:@path)
        expect(path).to eq [:foo]
      end
    end

    context "when calling with some arguments" do
      it "returns a Query instance" do
        query = DataDepo.foo(:baa, :baz)
        expect(query).to be_an_instance_of(DataDepo::Query)
      end

      it "returns an object that has a first argument value as 'name'" do
        query = DataDepo.foo(:baa, :baz)
        name = query.instance_variable_get(:@name)
        expect(name).to be :foo
      end

      it "returns an object that has an array of a method name and all of arguments as 'path'" do
        query = DataDepo.foo(:baa, :baz)
        path = query.instance_variable_get(:@path)
        expect(path).to eq [:foo, :baa, :baz]
      end
    end
  end
end
