class GithubOrgReposSync < Formula
  desc "Sync all repositories from a GitHub organization locally"
  homepage "https://github.com/xbglowx/github-org-repos-sync"
  url "https://github.com/xbglowx/github-org-repos-sync/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "0907dd980d6ce7326e077056494506f430cd081bf9655d13afcc0c9cb7ee9be8"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ldflags = "-X github.com/xbglowx/github-org-repos-sync/cmd.Version=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/github-org-repos-sync version")
  end
end
