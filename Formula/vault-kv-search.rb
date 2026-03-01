class VaultKvSearch < Formula
  desc "Recursively search secrets in HashiCorp Vault KV stores"
  homepage "https://github.com/xbglowx/vault-kv-search"
  url "https://github.com/xbglowx/vault-kv-search/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "86f53f99645b37426881db022395889d2779954578c539dd109c7e34b1890ef2"
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
