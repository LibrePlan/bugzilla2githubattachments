if [ "$1" == "--help" -o "$1" == "-h" ]; then
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "    --crazy    execute query every 5 seconds instead of 5 minutes"
    exit 0
fi

sql="SELECT COUNT(id) FROM task_element WHERE id NOT IN (SELECT id FROM task_source) AND id NOT IN (SELECT task_element_id FROM task_milestone);"

export PGPASSFILE=`mktemp`
echo "*:*:*:*:libreplan" > $PGPASSFILE

echo "Checking database looking for inconsistent rows..."
echo "More info: http://bugs.libreplan.org/show_bug.cgi?id=1295"
echo "Stop with Ctrl+C"
echo ""

while true; do

    result=`psql -U libreplan -h localhost -c "$sql" -d libreplandev -t`

    if [ $result -gt 0 ]; then
        date=`date`
        echo "ALERT: Some rows found"
        echo "       Rows: $result"
        echo "       Date: $date"
        # Beep
        echo -en "\007"
    else
        echo -n "."
    fi

    if [ "$1" == "--crazy" ]; then
        sleep 5s
    else
        sleep 5m
    fi

done
