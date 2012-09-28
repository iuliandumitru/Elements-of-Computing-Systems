package com.unlimited.eocs.generator

/**
 * @author Iulian Dumitru
 */

def range = 0..15


for (i in range) {

    println """Bit(in=in[${i}], load=load, out=out[${i}]);"""


}
