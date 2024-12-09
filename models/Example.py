from werkzeug.security import check_password_hash, generate_password_hash

class Example():

    def __init__(self, usuario, password, es_admin,es_empleado, es_cliente):
        self.usuario = usuario
        self.password = password
        self.es_admin = es_admin
        self.es_empleado = es_empleado
        self.es_cliente = es_cliente

    def set_password(self, password):
        """Crea un hash para la contraseña."""
        self.password = generate_password_hash(password)

    def check_password(self, password):
        """Verifica si la contraseña coincide con el hash almacenado."""
        return check_password_hash(self.password, password)

print(generate_password_hash("35895"))