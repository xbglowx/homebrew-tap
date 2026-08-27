class VaultKvMv < Formula
  desc "Move and rename secrets in HashiCorp Vault KV stores"
  homepage "https://github.com/xbglowx/vault-kv-mv"
  url "https://github.com/xbglowx/vault-kv-mv/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "4f033c28bcb589b2cc1d1da7246b4827aa54e5ce9830b453542fc7840d7bddfb"
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
