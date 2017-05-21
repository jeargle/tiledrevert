# John Eargle (mailto: jeargle at gmail.com)
# 2017
# test

using Libz

# using TiledRevert


# TiledRevert
println("\n*** TiledRevert ***\n")

height = 3
width = 11
dataStr = "eJxjYmBgYARiJiSaCYnPiMbHJc6IQx5dLbo9IDYADewAMw=="
print(dataStr)
print("\n")
data = base64decode(dataStr)
tilemap = Libz.inflate(data)

tilemap2 = reshape(tilemap, 4, width*height)

tilemap3 = transpose(reshape(tilemap2[1,:], width, height))
print(tilemap3)
print("\n")
