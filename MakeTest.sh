if [ -z "$1" ]; then
    echo 'Usage: MakeTest name'
    exit
fi

CASENAME=$1

if [ ! -d "$CASENAME" ]; then
    mkdir "$CASENAME"
    sed -r "s/casename/"$CASENAME"/g" UnitTestsTemplate.cpp.in > "$CASENAME"/"$CASENAME".cpp
    sed  -r "s/CASENAME = casename/CASENAME = "$CASENAME"/; s/casename.cpp/"$CASENAME".cpp/;" UnitTestsTemplate.pro.in > "$CASENAME"/"$CASENAME".pro
    #git add "$CASENAME"/"$CASENAME".pro
    #git add "$CASENAME"/"$CASENAME".cpp
fi

exit
