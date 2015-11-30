until nc -z $DB_1_PORT_3306_TCP_ADDR 3306; do
    echo "$(date) - waiting for mysql..."
    sleep 1
done
python manage.py runserver 0.0.0.0:8000 --insecure
