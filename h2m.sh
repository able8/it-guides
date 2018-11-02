#!/bin/bash

BookUrl="http://cw.hubwiz.com/card/c/54ee8d2de564e519b8f8dad3/1/1/1/"

curl -s "${BookUrl}" | grep '" $' | awk -F '"' '{print "http://cw.hubwiz.com"$2}' > url.txt

MdFileName='js.md'
for url in $(cat url.txt)
do
    echo $url
    Html=$(echo $url | awk -F '/' '{print $6"-"$7"-"$8"-"$9}')".html"
    #5359f6f6ec7452081a7873d8-1-1-1

    #curl -s $url -o "${Html}"

    # 输出目录1级标题
    if [ "$(echo $url | awk -F / '{print $9}')" = "1" ]
    then
        Nu=$(echo $url | awk -F / '{print $8}')
        grep '"list-group-item"><b>' ${Html} | awk -F '[><]' -v nu="$Nu" 'NR==nu{print "# "nu" "$5}' >> ${MdFileName}
    fi

    # 输出目录2级标题
    Nu=$(echo $url | awk -F / '{print $8}')
    Nu2=$(echo $url | awk -F / '{print $9}')
    grep -B 4 "<article "  ${Html} | awk -F '[><]' -v nu="$Nu"  -v nu2="$Nu2" '{print "\n## "nu"."nu2" "$3}' | head -2 >> ${MdFileName}

    cat ${Html} | sed -n '/<article/,$p' |  sed -n '2,/article>/p' | sed '/article>/d' | LC_ALL=C sed 's/^[[:space:]]*//g' | \
    sed -E 's/<h1 id[^>]*>/### /g;s/<\/h1>/∑/g;s/<h2 id[^>]*>/#### /g;s/<\/h2>/∑/g;s/<h3 id[^>]*>/##### /g;s/<\/h3>/∑/g;s/<h4 id[^>]*>/##### /g;s/<\/h4>/∑/g;s/<hr>/-----------------/g;s/<strong>/**/g;;s/<\/strong>/**/g;s/<em>/*/g;s/<\/em>/*/g;s/<p>//g;s/<pre><code>/```javascript∑/g;s/<\/code><\/pre>/```∑∑/g;'          |\
    sed "s/<div class='cw-exe'>/∑> /g"   |\
    sed 's/<div class="cw-exe">/∑> /g'   |\
    sed 's/^<\/div>$/∑/g'    |\
    sed "s/&#39;/'/g" |\
    sed 's/&quot;/"/g' |\
    sed 's/&lt;/</g;s/&gt;/>/g'  |\
    sed -E 's/<code>|<\/code>/`/g;s/<\/p>/∑/g' | tr '∑' '\n' >> ${MdFileName}

done