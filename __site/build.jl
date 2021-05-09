using Pkg; Pkg.activate("."); Pkg.instantiate();
using NodeJS; run(`$(npm_cmd()) install highlight.js`);
using Franklin;

rm("__site", recursive=true, force=true)
optimize(prepath="minimal")