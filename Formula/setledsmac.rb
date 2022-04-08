class Setledsmac < Formula
  desc "Command-line tool that lets you set your keyboard LEDs."
  homepage "https://github.com/damieng/setledsmac"
  url "https://github.com/damieng/setledsmac/archive/refs/tags/0.2.tar.gz"
  sha256 "cc242e8587d260e54d64842930e6bd59c3c2ad54826a2a0d677390edc95314cb"
  license "GPL-2.0"
  head "https://github.com/damieng/setledsmac.git", branch: "master"

  depends_on :macos
  depends_on xcode: :build

  def install
    xcodebuild "-project", "Source/SetLEDs.xcodeproj", "SYMROOT=build"
    bin.install "Source/build/Release/setleds"
  end

  test do
    assert_match "SetLEDs", shell_output("#{bin}/setleds -h")
  end
end
