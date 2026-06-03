class Flip < Formula
  desc "Print a random table-flipping emoji and copy it to your clipboard"
  homepage "https://github.com/CubedCard/flip"
  url "https://github.com/CubedCard/flip/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "12bc872fcb46988bd594e7eddcee17c368b4a4f42af9592ca513ded802cf8712"
  license "MIT"

  def install
    (share/"flip").install "tables"
    inreplace "flip.sh", 'cd "$(dirname "$0")"', "cd \"#{share}/flip\""
    bin.install "flip.sh" => "flip"
  end

  test do
    assert_match(/[()]/, shell_output("#{bin}/flip"))
  end
end
