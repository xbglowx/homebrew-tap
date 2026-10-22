class VaultKvSearch < Formula
  desc "Recursively search secrets in HashiCorp Vault KV stores"
  homepage "https://github.com/xbglowx/vault-kv-search"
  url "https://github.com/xbglowx/vault-kv-search/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "d85193a94068a595ef362dac72de41d470956a95398d386c7d97c48857ae987d"
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
