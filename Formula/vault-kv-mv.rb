class VaultKvMv < Formula
  desc "Move and rename secrets in HashiCorp Vault KV stores"
  homepage "https://github.com/xbglowx/vault-kv-mv"
  url "https://github.com/xbglowx/vault-kv-mv/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c1f9885454015af8469d7daef156efd8d8101400c5610b07610a092b8221b7f3"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ldflags = "-X main.Version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vault-kv-mv --version")
  end
end
