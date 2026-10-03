class GithubOrgReposSync < Formula
  desc "Sync all repositories from a GitHub organization locally"
  homepage "https://github.com/xbglowx/github-org-repos-sync"
  url "https://github.com/xbglowx/github-org-repos-sync/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "4eef7925bded1289bac8a376e3221913f34181a30377b99504b2210ad3e8722d"
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
