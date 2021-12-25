{ lib
, buildPythonPackage
, fetchFromGitHub
, flit-core
, pytest
}:

buildPythonPackage rec {
  pname = "pytest-raisin";
  version = "0.3";
  format = "flit";

  src = fetchFromGitHub {
    owner = "wimglenn";
    repo = "pytest-raisin";
    rev = "v${version}";
    sha256 = "73cOrsqlE04m6X3a6VwtRzfi24oqkdO3HjKQH61bU88=";
  };

  nativeBuildInputs = [
    flit-core
  ];

  propagatedBuildInputs = [
    pytest
  ];

  # tests cause circular pytest-raisin already registered with pytest error
  doCheck = false;

  meta = with lib; {
    description = "Plugin enabling the use of exception instances with pytest.raises context";
    homepage = "https://github.com/wimglenn/pytest-raisin";
    license = licenses.mit;
    maintainers = with maintainers; [ aadibajpai ];
  };
}
