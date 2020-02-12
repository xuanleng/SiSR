#!/bin/sh

# plot linear absorption spectrum
# Usage:
# ./plot_1d.sh diagonal.ods

for i in $*

do

echo "Processing $i ..."

bname=`basename ${i} .ods`

# call gnuplot to plot the 1D map
gnuplot << EOF


set term wxt enhanced
#加强的文本模式，可以输出稍复杂一点的文字标签


set datafile separator ","
#设置数据文件中数据的分隔形式，设置为逗号“，”隔开，对应常用的CSV（Comma-Separated Values）文件
datafile = "${i}"
#将数据文件命名为“datafile”，方便调用


#set term png
#set output "${bname}.png"
set term post eps color enh solid
set output "${bname}.eps"
#设置图片输出格式和名称


set title 'Linear Absorption'
set xlabel '{/Symbol w} (cm^{-1})'
set ylabel 'Absorption (a.u.)'
#设置图片的标题和x,y坐标轴的名称


#set xrange [0:500]
#set yrange [300:800]
#设置数据范围，可以不设置，自动判断


set size 1,1
#设置图片大小


set key right top
#设置图例的位置


#set xtics format "%.2f"
#set ytics format "%.0f"
#设置坐标轴刻度的精度，"%.2f"指的是浮点型、精确到小数点后两位


plot datafile using 1:2 with lines  linewidth 2 title "B820 absorption"

EOF

done
