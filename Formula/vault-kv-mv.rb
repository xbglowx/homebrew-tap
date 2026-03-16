class VaultKvMv < Formula
  desc "Move and rename secrets in HashiCorp Vault KV stores"
  homepage "https://github.com/xbglowx/vault-kv-mv"
  url "https://github.com/xbglowx/vault-kv-mv/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "171c4590b60bc3bf38fea5be18524fd81c99a5d33d163bb993c8608735d5e010"
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
