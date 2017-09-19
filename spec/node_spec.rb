require 'node'

RSpec.describe Node do
  let(:random) { rand(1...100) }
  let(:parent) { Node.new(random) }
  let(:child) { Node.new(2) }
  let(:second_child) { Node.new(3) }

  describe '#key' do
    context "when it has key" do
      it "returns it's value" do
        expect(parent.key).to eql(random)
      end
    end
  end

  describe '#parent' do
    context "when has no parent" do
      it "returns no parent" do
        expect(child.parent).to be_nil
      end
    end
  end

  describe '#left_child, #right_child' do

    context "when has no children" do
      it { expect(child.left_child).to be_nil }
      it { expect(child.right_child).to be_nil }
    end

    it "allows adding children" do
      parent.left_child = child
      parent.right_child = second_child
      expect(parent.right_child).to eq(second_child)
    end

    it "becomes a perent of a child" do
      parent.left_child = child
      expect(child.parent).to eq(parent)
    end
  end
end

RSpec.describe BinaryTree do
  let!(:tree) { BinaryTree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) }
  it "has a root node" do
    expect(tree.root).to_not be_nil
  end

  it "has a root node with right child" do
    expect(tree.root.right_child).to_not be_nil
  end

  it "has a root node with left child" do
    expect(tree.root.left_child).to_not be_nil
  end

  describe '#breadth_first_search' do
    it "returns nil if there is not such value" do
      expect(tree.breadth_first_search(42)).to be_nil
    end

    it "returns a node that contains the value if it is there" do
      expect(tree.breadth_first_search(23)).to_not be_nil
    end
  end

  describe '#depth_first_search' do
    it "returns nil if there is not such value" do
      expect(tree.depth_first_search(42)).to be_nil
    end

    it "returns a node that contains the value if it is there" do
      expect(tree.depth_first_search(9)).to_not be_nil
    end
  end

  describe '#dfs_rec' do
    it "returns nil if there is not such value" do
      expect(tree.dfs_rec(42)).to be_nil
    end

    it "returns a node that contains the value if it is there" do
      expect(tree.dfs_rec(3)).to_not be_nil
    end
  end

end
