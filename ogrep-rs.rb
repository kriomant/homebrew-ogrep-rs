class OgrepRs < Formula
  desc "Outline grep — search in indentation-structured texts (Rust version)"
  homepage "https://github.com/kriomant/ogrep-rs"
  url "https://github.com/kriomant/ogrep-rs/archive/0.4.0.tar.gz"
  sha256 "4f5537b30c4f00488be94704f4514e19cfc1b3482af5e1a0c0a93b5aeffaffa4"
  head "https://github.com/kriomant/ogrep-rs.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/ogrep"
  end

  test do
    (testpath/"test.txt").write("foo")
    system "#{bin}/ogrep", "foo", "#{testpath}/test.txt"
  end
end
