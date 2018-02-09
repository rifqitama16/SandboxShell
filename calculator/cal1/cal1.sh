#!/bin/bash
 
while true; do
    touch kallog
    clear
    echo -n "
    Menu:
    1. Penjumlahan
    2. Pengurangan
    3. Perkalian
    4. Pembagian
    5. Lihat log
    6. Bersihkan log
    0. Keluar
 
    Pilihan : "
 
    read pil
    if [[ $pil =~ ^[0-4]$ ]]; then
        if [[ $pil == 0 ]]; then
            echo "Program terminated"; exit 0
        else
            echo -n "Bilangan pertama = "
            read var1
            echo -n "Bilangan kedua = "
            read var2
            if [[ $var1 && $var2 =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
                if [[ $pil == 1 ]]; then
                    hasil=$(echo $var1+$var2 = $(($var1+$var2)))
                elif [[ $pil == 2 ]]; then
                    hasil=$(echo $var1-$var2 = $(($var1-$var2)))
                elif [[ $pil == 3 ]]; then
                    hasil=$(echo $var1*$var2 = $(($var1*$var2)))
                elif [[ $pil == 4 ]]; then
                    hasil=$(echo $var1/$var2 = $(bc -l <<< "scale=2; $var1/$var2"))
                fi
            date >> kallog
            echo $hasil | tee -a kallog
            else
                echo "Wrong format"
            fi
        fi
    elif [[ $pil == 5 ]]; then
        less kallog
    elif [[ $pil == 6 ]]; then
        > kallog && echo "Success"
    fi
    sleep 2
done
