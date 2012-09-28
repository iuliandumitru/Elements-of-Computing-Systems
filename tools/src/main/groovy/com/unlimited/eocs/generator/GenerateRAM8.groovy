package com.unlimited.eocs.generator

/**
 * @author Iulian Dumitru
 */


def range = 0..15


for (i in range) {

    println """DMux8Way(in=in[${i}], sel=sel, a=a[${i}], b=b[${i}], c=c[${i}], d=d[${i}], e=e[${i}], f=f[${i}], g=g[${i}], h=h[${i}]);"""

}