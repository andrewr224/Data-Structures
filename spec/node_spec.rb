require 'node'


RSpec.describe BinaryTree do
  describe Node do
    let(:random) { rand(1...100) }
    let(:parent) { Node.new(random) }
    let(:child) { Node.new(2) }
    let(:second_child) { Node.new(3) }

    describe '#key' do
      context "when has key 1" do
        it "doesn't return nil" do
          expect(parent.key).to_not be_nil
        end
      end

      context "when it has key" do
        it "returns it" do
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

      it "allows to set a parent" do
        second_child.parent = parent
        expect(second_child.parent).to eql(parent)
      end

      context "when obtains a parent" do
        specify "the parent obtains a child" do
          second_child.parent = parent
          expect(parent.children).to include(second_child)
        end

        context "when already has a parent" do
          it "can change a parent" do
            second_child.parent = parent
            second_child.parent = child
            expect(second_child.parent).to eq(child)
          end

          specify "a new parent becomes a child of an old one" do
            second_child.parent = parent
            second_child.parent = child
            expect(child.parent).to eq(parent)
          end
        end
      end
    end

    describe '#remove_parent' do
      it "removes a parent" do
        child.parent = parent
        child.remove_parent
        expect(child.parent).to be_nil
      end

      specify "parent loses a child" do
        child.parent = parent
        child.remove_parent
        expect(parent.children).to_not include(child)
      end
    end

    describe '#children' do
      context "when has no children" do
        it { expect(child.children).to eq([]) }
      end

      context "when has children" do
        it "returns an array of children" do
          parent.add_child(child)
          parent.add_child(second_child)
          expect(parent.children).to include(child, second_child)
        end
      end

      it "allows adding children" do
        parent.add_child(second_child)
        expect(parent.children).to include second_child
      end

      it "becomes a perent of a child" do
        parent.add_child(second_child)
        expect(second_child.parent).to eq(parent)
      end
    end

    describe '#remove_child' do
      it "removes a child" do
        parent.add_child(child)
        parent.remove_child(child)
        expect(parent.children).to_not include(child)
      end

      specify "child looses parent" do
        parent.add_child(child)
        parent.remove_child(child)
        expect(child.parent).to be_nil
      end
    end
  end
end
