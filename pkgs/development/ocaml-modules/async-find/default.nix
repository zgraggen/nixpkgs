{stdenv, buildOcaml, fetchurl, async, core, sexplib}:

buildOcaml rec {
  name = "async-find";
  version = "111.28.00";

  minimumSupportedOcamlVersion = "4.02";

  src = fetchurl {
    url = "https://github.com/janestreet/async_find/archive/${version}.tar.gz";
    sha256 = "4e3fda72f50174f05d96a5a09323f236c041b1a685890c155822956f3deb8803";
  };

  propagatedBuildInputs = [ async core sexplib ];

  meta = with stdenv.lib; {
    homepage = https://github.com/janestreet/async_find;
    description = "Directory traversal with Async";
    license = licenses.asl20;
    maintainers = [ maintainers.ericbmerritt ];
  };
}