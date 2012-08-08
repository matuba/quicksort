# coding: utf-8

require './sort'

describe Qsort do
  describe "#qsort" do
    let(:sort1) {Qsort.new([2, 1])}
    context "配列長２" do
      it 'pivot' do
        result = sort1.getPivot(0, 1)
        result.should == 1
      end

      it 'searchLeft' do
        result = sort1.searchLeft(1, 0, 1)
        result.should == 0
      end

      it 'searchRight' do
        result = sort1.searchRight(1, 0, 1)
        result.should == 1
      end

      it 'swap' do
        result = sort1.swap(0, 1)
        result.should == [0, 1]
        sort1.ary.should == [1, 2]
      end

      it 'sort' do
        sort1.sort(0, 1)
        sort1.ary.should == [1, 2]
      end
    end

    let(:sort2) {Qsort.new([3, 2, 1])}
    context "配列長３" do
      it 'pivot' do
        result = sort2.getPivot(0, 2)
        result.should == 2
      end

      it 'searchLeft' do
        result = sort2.searchLeft(2, 0, 2)
        result.should == 0
      end

      it 'searchRight' do
        result = sort2.searchRight(2, 0, 2)
        result.should == 2
      end

      it 'swap' do
        result = sort2.swap(0, 2)
        result.should == [0, 2]
        sort2.ary.should == [1, 2, 3]
      end

      it 'sort' do
        sort2.sort(0, 2)
        sort2.ary.should == [1, 2, 3]
      end
    end

    let(:sort3) {Qsort.new([8, 4, 3, 7, 6, 5, 2, 1])}
    context "配列長８" do
      it 'pivot' do
        result = sort3.getPivot(0, 7)
        result.should == 6
      end

      it 'searchLeft' do
        result = sort3.searchLeft(6, 0, 7)
        result.should == 0
      end

      it 'searchRight' do
        result = sort3.searchRight(6, 0, 7)
        result.should == 7
      end

      it 'swap' do
        result = sort3.swap(0, 7)
        result.should == [0, 7]
        sort3.ary.should == [1, 4, 3, 7, 6, 5, 2, 8]
      end

      it 'sort' do
        sort3.sort(0,7)
        sort3.ary.should == [1, 2, 3, 4, 5, 6, 7, 8]
      end
    end

    let(:sort4) {Qsort.new([1, 4, 3, 2, 6, 5, 7, 8])}
    context "配列長８[6]-[7]検索範囲指定" do
      it 'pivot' do
        result = sort4.getPivot(6, 7)
        result.should == 8
      end

      it 'searchLeft' do
        result = sort4.searchLeft(8, 6, 7)
        result.should == 7
      end

      it 'searchRight' do
        result = sort4.searchRight(8, 6, 7)
        result.should == 7
      end

      it 'swap' do
        result = sort4.swap(6, 7)
        result.should == [7, 7]
        sort4.ary.should == [1, 4, 3, 2, 6, 5, 7, 8]
      end

      it 'sort' do
        sort4.sort(6, 7)
        sort4.ary.should == [1, 4, 3, 2, 6, 5, 7, 8]
      end
    end

    let(:sort5) {Qsort.new([1, 4, 3, 3, 2, 6, 5, 7, 8, 3])}
    context "長い配列をソート中身は適当" do
      it 'sort' do
        sort5.sort(0, 9)
        sort5.ary.should == [1, 2, 3, 3, 3, 4, 5, 6, 7, 8]
      end
    end

    let(:sort6) {Qsort.new([1, 1, 1])}
    context "同じ数テスト" do
      it 'pivot' do
        result = sort6.getPivot(0, 2)
        result.should == 1
      end
      it 'searchLeft' do
        result = sort6.searchLeft(1, 0, 2)
        result.should == 0
      end

      it 'searchRight' do
        result = sort6.searchRight(1, 0, 2)
        result.should == 2
      end

      it 'swap' do
        result = sort6.swap(0, 2)
        result.should == [0, 2]
        sort6.ary.should == [1, 1, 1]
      end
    end
  end
end
