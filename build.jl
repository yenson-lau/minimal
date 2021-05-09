using Pkg; Pkg.activate("."); Pkg.instantiate();
import Franklin;

if !Franklin.FD_CAN_HIGHLIGHT
  # This whole bit exists simply because the constants in Franklin
  # can't be updated even after highlight.js is installed

  # e.g. /home/user/.julia
  juliapath = pathof(Franklin);
  juliapath = juliapath[1:findfirst("packages", juliapath)[1]-2];

  Pkg.rm("Franklin");
  rm("$(juliapath)/packages/Franklin", recursive=true, force=true);
  rm("$(juliapath)/compiled/Franklin", recursive=true, force=true);

  using NodeJS; run(`$(npm_cmd()) install highlight.js`)
  Pkg.add("Franklin")
  run(`julia build.jl`)

else
  # Once highlight.js is installed

  rm("__site", recursive=true, force=true);

  Franklin.def_GLOBAL_VARS!();
  Franklin.convert_md(read("config.md", String); isconfig=true);
  Franklin.optimize(prepath=Franklin.globvar(:prepath));
end
