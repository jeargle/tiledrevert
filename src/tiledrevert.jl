# John Eargle (mailto: jeargle at gmail.com)
# 2017
# tiledrevert

using JSON
using Libz


# =======================================
# 
# =======================================


# Convert base64 encoded string into tilemap
function extractTilemap(dataStr, height, width)
    println("data: ", dataStr)
    data = base64decode(dataStr)
    tilemap = Libz.inflate(data)
    tilemap = reshape(tilemap, 4, width*height)
    tilemap = transpose(reshape(tilemap[1,:], width, height))
    println(tilemap)
    tilemap = tilemap[:]
    
    return tilemap
end


# Revert Tiled output files to previous format
# infile: Tiled file
function tiledRevert(infile, outfile)
    tiled = JSON.parsefile(infile)

    layer1 = tiled["layers"][1]
    dataStr = layer1["data"]
    height = layer1["height"]
    width = layer1["width"]
    tilemap = extractTilemap(dataStr, height, width)
    delete!(layer1, "compression")
    delete!(layer1, "encoding")
    layer1["data"] = tilemap
    
    # writing to files is very similar:
    f = open(outfile, "w")
    JSON.print(f, tiled)
    close(f)
end


function main()
    if length(ARGS) < 2
        println("Usage: tiledrevert infile outfile")
        exit()
    end

    tiledRevert(ARGS[1], ARGS[2])
end

main()
