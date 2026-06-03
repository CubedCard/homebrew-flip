class Flip < Formula
  desc "Print a random table-flipping emoji and copy it to your clipboard"
  homepage "https://github.com/CubedCard/flip"
  url "https://github.com/CubedCard/flip/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "09e56ab88e20ed20c9eb426a79073a38edbc0d0f51235a4a652df3baf32ff0e9  -"
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
