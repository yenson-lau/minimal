using Pkg; Pkg.activate("."); Pkg.instantiate();
using NodeJS; run(`$(npm_cmd()) install highlight.js`);
using Franklin;
import Franklin;

rm("__site", recursive=true, force=true);

Franklin.def_GLOBAL_VARS!();
Franklin.convert_md(read("config.md", String); isconfig=true);
optimize(prepath=Franklin.globvar(:prepath));