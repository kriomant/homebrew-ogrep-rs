class OgrepRs < Formula
  desc "Outline grep — search in indentation-structured texts (Rust version)"
  homepage "https://github.com/kriomant/ogrep-rs"
  url "https://github.com/kriomant/ogrep-rs/archive/0.5.0.tar.gz"
  sha256 "1a7c5fc6836eeb763abf7dd1ddd4854aac63e42ca08a2ca4ba514e64dd491d4e"
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
