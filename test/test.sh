# John Eargle (mailto: jeargle at gmail.com)
# 2017
# test

#!/bin/bash

echo Test tiledrevert
echo julia ../src/tiledrevert.jl ../assets/yes.json yes.new.json
julia ../src/tiledrevert.jl ../assets/yes.json yes.new.json
