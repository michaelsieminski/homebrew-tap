class Ninode < Formula
  desc "Terminal-based server monitoring built with React 19 and OpenTUI"
  homepage "https://github.com/michaelsieminski/ninode"
  version "0.1.3"
  license "MIT"

  depends_on arch: :arm64 if OS.mac?

  on_macos do
    on_arm do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-darwin-arm64"
      sha256 "f36e6fcd449e1c88bd6acffbd60e8a3825c9d8e7348f0cc749059dfdc6639b19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-linux-arm64"
      sha256 "f3ff1eb1b693daba561bdbce52c3f9dcc26355221d7ea962201cb8ca8d41ae30"
    end
    on_intel do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-linux-x64"
      sha256 "de3fd0895560af03c5023b786e6986b4e8faa32a2bc6f15ff299c4f3bc627e4c"
    end
  end

  def install
    binary = Dir["ninode-*"].first
    odie "no ninode binary found in download" if binary.nil?
    bin.install binary => "ninode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ninode --version")
  end
end
