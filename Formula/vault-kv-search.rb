class VaultKvSearch < Formula
  desc "Recursively search secrets in HashiCorp Vault KV stores"
  homepage "https://github.com/xbglowx/vault-kv-search"
  url "https://github.com/xbglowx/vault-kv-search/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "1835eb5d7e1870d39e2fa0026a73457b4fb8149a765d013a46818649bacda2e5"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -X github.com/xbglowx/vault-kv-search/cmd.Version=v#{version}
      -X github.com/xbglowx/vault-kv-search/cmd.Revision=v#{version}
      -X github.com/xbglowx/vault-kv-search/cmd.Branch=main
      -X github.com/xbglowx/vault-kv-search/cmd.BuildDate=#{time.strftime("%Y%m%d-%H:%M:%S")}
      -X github.com/xbglowx/vault-kv-search/cmd.BuildUser=homebrew
    ]
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vault-kv-search version")
  end
end
