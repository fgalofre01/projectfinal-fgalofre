from flask import Flask
from dotenv import load_dotenv
from utils.db import db,init_db
from views.Heladeria_controller import heladeria_routes
from views.API import heladeria_apis
from flask_restful import Api
from datetime import timedelta
import os


load_dotenv(override=True)

app = Flask(__name__)

secret_key = os.urandom(24)
app.config['SECRET_KEY'] = secret_key

app.config["SQLALCHEMY_DATABASE_URI"]= 'sqlite:///app.db'
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["PERMANENT_SESSION_LIFETIME"] = timedelta(hours=1)
app.config["SESSION_COOKIE_SECURE"] = True

db.init_app(app)#SQLAlchemy(app)
init_db(app)
api = Api(app)

heladeria_routes(app)
heladeria_apis(api)

if __name__ == "__main__":
    app.run(debug=True)