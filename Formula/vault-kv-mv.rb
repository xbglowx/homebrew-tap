class VaultKvMv < Formula
  desc "Move and rename secrets in HashiCorp Vault KV stores"
  homepage "https://github.com/xbglowx/vault-kv-mv"
  url "https://github.com/xbglowx/vault-kv-mv/archive/refs/tags/v0.0.14.tar.gz"
  sha256 "e646ee81df679295e401be22910ac909bdc5f681824cd5785d2515f5776fea15"
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
