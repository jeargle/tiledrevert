# John Eargle (mailto: jeargle at gmail.com)
# 2017
# test

using TiledRevert


# TiledRevert
println("\n*** TiledRevert ***\n")

if length(ARGS) < 2
    println("Usage")
    println("  tiledrevert infile outfile")
    exit()
end

# tiledRevert("../assets/yes.json", "../assets/yes.json.new")
tiledRevert(ARGS[1], ARGS[2])
