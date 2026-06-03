class Flip < Formula
  desc "Print a random table-flipping emoji and copy it to your clipboard"
  homepage "https://github.com/CubedCard/flip"
  url "https://github.com/CubedCard/flip/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "4b470bc75f8bfcfc0eb8ce964e9ee92bc3f40c4e7eb529050bea7a45f225ba9e"
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
