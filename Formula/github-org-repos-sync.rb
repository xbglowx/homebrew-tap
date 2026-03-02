class GithubOrgReposSync < Formula
  desc "Sync all repositories from a GitHub organization locally"
  homepage "https://github.com/xbglowx/github-org-repos-sync"
  url "https://github.com/xbglowx/github-org-repos-sync/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "a9a36e6eb18d5d406f0af4f51aff52b0e8b93477c21bdb154dff76ab6b26294d"
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
