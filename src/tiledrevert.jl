# John Eargle (mailto: jeargle at gmail.com)
# 2017
# tiledrevert

module TiledRevert

export extractTilemap, tiledRevert

using JSON
using Libz


# =======================================
# 
# =======================================


# Convert base64 encoded string into tilemap
function extractTilemap(dataStr, height, width)
    print(dataStr)
    print("\n")
    data = base64decode(dataStr)
    tilemap = Libz.inflate(data)

    tilemap2 = reshape(tilemap, 4, width*height)

    tilemap3 = transpose(reshape(tilemap2[1,:], width, height))
    return tilemap3
end


# Revert Tiled output files to previous format
# infile: Tiled file
function tiledRevert(infile)
    tiled = JSON.parsefile(infile)
    # println(tiled["layers"])

    layer1 = tiled["layers"][1]
    dataStr = layer1["data"]
    height = layer1["height"]
    width = layer1["width"]
    tilemap = extractTilemap(dataStr, height, width)
    print(tilemap)
    print("\n")
    
    # outfile = "outfile.json"
    # # writing to files is very similar:
    # f = open(outfile, "w")
    # # both print and println can be used as usual but with f as their first arugment
    # println(f, "some content")
    # print(f, "more content")
    # print(f, " more on the same line")
    # close(f)
end


end
