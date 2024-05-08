# my_django_app 

## Back-End (Django)

### Steps to run the project:


1. Enter the client directory.
```bash
cd ./lumx_hackaton/my_django_app
```

2. Run the Django server.
```bash
pip install -r requirements.txt
```

```bash
python manage.py migrate
python manage.py makemigrations
python manage.py runserver
```
4. To confirm that data is successfully retrieved from the database and reaching the Django server, proceed by: http://127.0.0.1:8000/


### OBS: 
In case of an error, confirm that there are no pending migrations or try the command:
`python3 manage.py makemigrations app_lumxs --empty`


