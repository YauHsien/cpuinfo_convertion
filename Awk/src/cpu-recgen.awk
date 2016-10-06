## example: $ awk -f cpu-recgen.awk /proc/cpuinfo

function take_bag() {
    bag = "{ "
}

BEGIN {
    FS  = ": "  ;
    take_bag()
}

NF == 0 {
    bag = bag " }"
    print bag  ;
    take_bag()
}

NF > 0 {
    gsub(/[\s\t]+$/, "", $1)
    bag = bag "\"" $1 "\": \"" $2 "\","
}
