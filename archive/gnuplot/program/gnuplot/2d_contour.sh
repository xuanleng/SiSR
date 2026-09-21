#!/bin/sh

# plot linear absorption spectrum
# Usage:
# ./plot_1d.sh diagonal.ods

for i in $*

do

echo "Processing $i ..."

bname=`basename ${i} .ods`

awk -f addblanks.awk $i > "${bname}_blanks.dat"

# call gnuplot to plot the 1D map
gnuplot << EOF


set term wxt enhanced
#加强的文本模式，可以输出稍复杂一点的文字标签


set datafile separator ","
#设置数据文件中数据的分隔形式，设置为逗号“，”隔开，对应常用的CSV（Comma-Separated Values）文件
datafile = "${bname}_blanks.dat"
#将数据文件命名为“datafile”，方便调用


#set term png
#set output "${bname}.png"
set term post eps color enh solid
set output "${bname}.eps"
#设置图片输出格式和名称


set title 'T = 0 fs'
set xlabel '{/Symbol w_{t}} (cm^{-1})'
set ylabel '{/Symbol w}_t (cm^{-1})'
#设置图片的标题和x,y坐标轴的名称


#set xrange [0:500]
#set yrange [300:800]
#设置数据范围，可以不设置，自动判断


set size 1,1
#设置图片大小


set key right top
#设置图例的位置
#unset key


#set xtics format "%.2f"
#set ytics format "%.0f"
#设置坐标轴刻度的精度，"%.2f"指的是浮点型、精确到小数点后两位


#===================普通绘图===================#
set isosamples 50
#设置网格大小
set view 60, 30
#设置视角，默认视角是60,30,分别表示绕x轴和z轴的旋转角度。另外，一些terminal，例如wxt，支持直接用鼠标拖动图像改变视角。
set xyplane 0.2 
#设置底部平面与曲面距离的相对距离
#或set xyplane at <z坐标> 设置底部平面与曲面距离的绝对距离
set hidden3d
#隐藏曲面重叠部分
#splot datafile with lines
#用线绘制3D曲面


#=================等高线绘图=================#
unset key
set contour base
set cntrparam levels incremental -1000,300,2000
splot datafile with lines title " "

unset surface
set view map
set size square
set cntrparam levels incremental -1000,300,2000
set key at screen 0.85,0.8
replot

set pm3d at b
set key at screen 1.2,1.2
set cntrparam levels incremental -1000,300,2000
set palette rgbformulae 22,13,-31
replot

EOF

#rm "${bname}_blanks.dat"

done
