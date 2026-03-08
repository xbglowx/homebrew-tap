class GithubOrgReposSync < Formula
  desc "Sync all repositories from a GitHub organization locally"
  homepage "https://github.com/xbglowx/github-org-repos-sync"
  url "https://github.com/xbglowx/github-org-repos-sync/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "cb5d28be91dd329a43e97077bbfaddd489ae5bf13a1ab2f14b05c9f376eee625"
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
