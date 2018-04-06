class OgrepRs < Formula
  desc "Outline grep — search in indentation-structured texts (Rust version)"
  homepage "https://github.com/kriomant/ogrep-rs"
  url "https://github.com/kriomant/ogrep-rs/archive/0.3.0.tar.gz"
  sha256 "b7d150ac08695548569f1c343fddc8d64262f508b63ab5b8aa928ed431be7703"
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
