class IonShell < Formula
  desc "Modern system shell that features a simple, yet powerful, syntax"
  homepage "https://github.com/redox-on/ion"
  url "https://github.com/redox-os/ion/archive/refs/tags/1.0.5.tar.gz"
  sha256 "7c7f696060a82669cb9c73cf0ec1d07d4ffefbfd54fc60acad0179ca3f46716d"
  license "MIT"
  head "https://github.com/redox-os/ion.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ion", shell_output("#{bin}/ion -h")
  end
end
