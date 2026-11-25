class VaultKvMv < Formula
  desc "Move and rename secrets in HashiCorp Vault KV stores"
  homepage "https://github.com/xbglowx/vault-kv-mv"
  url "https://github.com/xbglowx/vault-kv-mv/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "9c4b069ed67aeaf4ddd18f31201769d7b223bfba9fc015e28e3b69a8f620b261"
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
