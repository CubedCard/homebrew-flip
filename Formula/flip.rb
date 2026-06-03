class Flip < Formula
  desc "Print a random table-flipping emoji and copy it to your clipboard"
  homepage "https://github.com/CubedCard/flip"
  url "https://github.com/CubedCard/flip/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "db699914ac4da5ce91d87e71c91dc733462be0e265895dddaec953205758301d"
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
