#!/bin/sh

func () {
    img_files=$(ls $1)
    logfile="$1_result/summary.txt"
    resultdir="$1_result"
    rm -rf $1/*.log
    rm -rf $resultdir
    mkdir $resultdir

    echo === Generate summary file for $1 ===
    touch $logfile

    for file in $img_files
    do
        echo === Bash $1 $file ===
        sleep 1
        cp $1/$file .
        ./$exec $file
        gprof $exec > $1_result/"${file%.bmp}.txt"

        echo "=== Profile for $file ===" >> $logfile
        cat $resultdir/"${file%.bmp}.txt" | awk '\
            NR==5 {printf"%s\t%s\t%s\n",$1,$2,$7} \
            NR==6 {printf"%s%%\t%s\t%s\n",$1,$2,$7} \
            NR==7 {printf"%s%%\t%s\t%s\n",$1,$2,$7}' >> $logfile
        echo "==" >> $logfile

        echo === Summarising $1 $file ===
        rm $file
        mv dst_$file $resultdir/dst_$file

    done

}

exec=software
test=nocircle

if [ -f $exec ]; then
    func ../"Test_$test"
fi
