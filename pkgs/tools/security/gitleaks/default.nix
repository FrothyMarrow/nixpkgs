{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "gitleaks";
  version = "8.10.2";

  src = fetchFromGitHub {
    owner = "zricethezav";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-FiR1zJ9aOdysp5807vZ9aX3O7l8GhDXlFDWuyk5zJQw=";
  };

  vendorSha256 = "sha256-X8z9iKRR3PptNHwy1clZG8QsClsjbW45nZb2fHGfSYk=";

  ldflags = [
    "-s"
    "-w"
    "-X github.com/zricethezav/gitleaks/v${lib.versions.major version}/version.Version=${version}"
  ];

  # With v8 the config tests are are blocking
  doCheck = false;

  meta = with lib; {
    description = "Scan git repos (or files) for secrets";
    longDescription = ''
      Gitleaks is a SAST tool for detecting hardcoded secrets like passwords,
      API keys and tokens in git repos.
    '';
    homepage = "https://github.com/zricethezav/gitleaks";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
