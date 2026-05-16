class Ninode < Formula
  desc "Terminal-based server monitoring built with React 19 and OpenTUI"
  homepage "https://github.com/michaelsieminski/ninode"
  version "0.1.4"
  license "MIT"

  depends_on arch: :arm64 if OS.mac?

  on_macos do
    on_arm do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-darwin-arm64"
      sha256 "7980d37ce96348d697d6ea419210fe5873f5cd1bf516265339de5bea2eb5acf3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-linux-arm64"
      sha256 "7197e4debbfca96e57dde5e7dc0ad198891465058c5405d56293f028c54a6a38"
    end
    on_intel do
      url "https://github.com/michaelsieminski/ninode/releases/download/v#{version}/ninode-linux-x64"
      sha256 "15b105bc7486ad661d67e3efd6bc10dd049782de1685dfa984750cc5c7b91b4d"
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
