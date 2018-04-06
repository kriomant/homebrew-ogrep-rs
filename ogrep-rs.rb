class OgrepRs < Formula
  desc "Outline grep — search in indentation-structured texts (Rust version)"
  homepage "https://github.com/kriomant/ogrep-rs"
  url "https://github.com/kriomant/ogrep-rs/archive/0.3.0.tar.gz"
  sha256 "c2358cde5061339084fe86a7454b67106eff73fc585c696a57cf0e24cfdb586e"
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
