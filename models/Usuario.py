from utils.db import db
from flask_login import UserMixin
from werkzeug.security import check_password_hash, generate_password_hash

class Usuario(UserMixin, db.Model):
    __tablename__ = 'usuarios'
    id = db.Column(db.Integer, primary_key=True)
    usuario = db.Column(db.String(80), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False)
    es_admin = db.Column(db.Boolean)
    es_empleado = db.Column(db.Boolean)
    es_cliente = db.Column(db.Boolean)


    def __init__(self, usuario, password, es_admin,es_empleado, es_cliente):
        self.usuario = usuario
        self.password = password
        self.es_admin = es_admin
        self.es_empleado = es_empleado
        self.es_cliente = es_cliente

    @staticmethod
    def autenticar(usuario):
        usuario = Usuario.query.filter_by(usuario=usuario).first()
        if usuario.usuario and usuario.password:
            return usuario
        return None
    
    def set_password(self, password):
        """Crea un hash para la contraseña."""
        self.password = generate_password_hash(password)

    def check_password(self, password):
        """Verifica si la contraseña coincide con el hash almacenado."""
        return check_password_hash(self.password, password)
    

    