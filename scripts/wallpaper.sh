#!/bin/bash

left=$(ls ~/Pictures/papes/p|shuf -n 1)
middle=$(ls ~/Pictures/papes/l|shuf -n 1)
right=$(ls ~/Pictures/papes/l|shuf -n 1)

feh --bg-max ~/Pictures/papes/l/$middle ~/Pictures/papes/l/$right ~/Pictures/papes/p/$left
