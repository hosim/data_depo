# coding: utf-8
require 'spec_helper'
require 'data_depo'

describe DataDepo::ArrayData do
  describe '.gen' do
    context "when passing `foo' as name" do
      let(:foo) do
        DataDepo::ArrayData.gen('foo', [:a, :b, :c, :d, :e])
      end

      it "has `foo' as an instance variable `name'" do
        name = foo.instance_variable_get(:@name)
        expect(name).to eq 'foo'
      end

      context "when DataDepo::FooAction module is defined and " \
              "it has `abcde' method" do
        before do
          module DataDepo::FooAction
            def abcde; self; end
          end
        end

        after do
          DataDepo.class_eval { remove_const(:FooAction) }
        end

        it "responds to `abcde'" do
          expect(foo).to respond_to(:abcde)
        end
      end

      context "when DataDepo::BaaAction module is defined and " \
              "it has `vwxyz' method" do
        before do
          module DataDepo::BaaAction
            def vwxyz; self; end
          end
        end

        after do
          DataDepo.class_eval { remove_const(:BaaAction) }
        end

        it "does not respond to `vwxyz'" do
          expect(foo).not_to respond_to(:vwxyz)
        end
      end
    end
  end
end
