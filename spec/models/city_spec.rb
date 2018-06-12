require "rails_helper"

RSpec.describe City do
  context "relations" do
    it { should belong_to(:user) }
  end

  context "attributes" do
    it { should respond_to(:name)     }
    it { should respond_to(:state)    }
    it { should respond_to(:zip_code) }
    it { should respond_to(:country)  }
    it { should respond_to(:user_id)  }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:name)             }
    it { is_expected.to validate_presence_of(:country)          }
    it { is_expected.to validate_presence_of(:state)            }
    it { is_expected.to validate_presence_of(:user_id)          }
  end
end
