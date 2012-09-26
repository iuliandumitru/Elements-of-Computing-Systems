def range = 0..15


for (i in range) {

    println """FullAdder(a=a[${i}],b=b[${i}],c=c${i},sum=out[${i}],carry=c${i+1});
"""

}