from werkzeug.security import check_password_hash, generate_password_hash
import secrets
class Example():

    def __init__(self, usuario, password, es_admin,es_empleado, es_cliente):
        self.usuario = usuario
        self.password = password
        self.es_admin = es_admin
        self.es_empleado = es_empleado
        self.es_cliente = es_cliente

    @classmethod
    def check_password(self, hashed_password,password):
        return check_password_hash(hashed_password,password)

print(generate_password_hash("96547"))


print(secrets.token_hex(32))