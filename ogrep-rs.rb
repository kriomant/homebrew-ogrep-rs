class OgrepRs < Formula
  desc "Outline grep — search in indentation-structured texts (Rust version)"
  homepage "https://github.com/kriomant/ogrep-rs"
  url "https://github.com/kriomant/ogrep-rs/archive/0.6.0.tar.gz"
  sha256 "c9cee9b6ace518ff76de6a348d96fc94f693de1d63c03b6d8d49256319d4cada"
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
