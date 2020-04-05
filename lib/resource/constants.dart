class Constants{

  //App
  static const String appName = "TecniApp"; 
  //Url
  static const String urlAuthority = "ec2-3-15-37-85.us-east-2.compute.amazonaws.com:8090";
  static const String contenTypeHeader = "application/json";
//servicio
  static const String pathServiceUsuario ="/api/tecni/user/insert";
  static const String pathServiceinsertDpto ="/api/tecni/departament/insert";
  static const String pathServiceMinicipiosLista ="/api/tecni/municipio/get/all";
  static const String pathServiceUsuarioUpdate ="/user/update";
  static const String pathServiceDepartamentoUpdate ="/api/tecni/departament/update";
  static const String pathServiceDepartamentoDelete ="/api/tecni/departament/delete/id";
  static const String pathServiceDepartamento = "/api/tecni/departament/get/all";
  static const String pathServiceAntena ="/antenna";
  static const String pathServiceLogin ="/usuarios/login";

  static const String createMessage = "Creación exitosa";
  //validacion de campos
  static const String validateName = "El nombre es necesario";
  static const String nameStructure = "El nombre puede contener a-z y A-Z";
  static const String validateLastName = "El nombre es necesario";
  static const String lastNameStructure = "El nombre puede contener a-z y A-Z";
  static const String validateEmail = "El correo es necesario";
  static const String emailStructure = "Correo invalido";
  static const String validateMobile = "El telefono es necesario";
  static const String validateReferencia = "La referencia de antena es necesaria";
  static const String mobileStructure = "El numero debe tener 10 digitos";
  static const String validateAltura = "La altura de antena es necesaria";
  static const String validateOrientacion = "La orientacion de antena es necesaria";
  static const String validateInclinacion = "La inclinacion de antena es necesaria";
  static const String validateTorre = "La torre de antena es necesaria";
  static const String referenciaStructure = "La referencia debe tener 10 digitos";
  static const String alturaStructure = "la altura debe tener 2 numeros";
  static const String orientacionStructure = "es en grados";
  static const String validatePassword = "La contraseña es necesaria";
  static const String passwordStructure = "El tamaño de la contraseña debe ser más de 8 carácteres";
  static const String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String patternNombre = r'(^[a-zA-Z ]*$)';
  //Botones
  static const String btnIngresar = "Ingresar";
  static const String btnRegistar = "Registrar ";
  static const String btnSiguiente = "Siguiente ";
  static const String btnModificar = "Editar ";
  static const String btnLista = "Lista ";
  static const String btnEliminar = "Eliminar ";
  static const String btnAsignar = "Asignar ";
  static const String btnPerfil = "Perfil";
  static const String btnAsignarTorres = "Asignar Torres";
  //AppBar
  static const String appBarPerfil = "Perfil Coordinador";
  static const String appBarTorre = "Torres Registradas";
  static const String tittleRegistroUsuario = "Registrar Usuarios";
  static const String tittleRegistroDepartamento = "Registrar Departamento";
  static const String tittleRegistroMunicipio = "Registrar Municipio";
  static const String tittleRegistroTorre = "Registrar Torre";
  static const String tittleTorreactualizar = "Actualizar Torre";
  static const String tittleListaTorre = "Lista Torres";
  static const String tittleRegistroAntena = "Registrar Antena";
  static const String tittleDepartamentoactualizar = "Actualizar Departamento";
  static const String tittleMunicipioactualizar = "Actualizar Municipio";
  static const String tittleActualizarAntena = "Actualizar Antena";
  static const String tittleListaAntenas = "Antenas Registrados";
  static const String tittleListaDepartamentos = "Lista Departamentos";
  static const String tittleListaUsuarios = "Usuarios Registrados";
  static const String tittleActualizar = "Actualizar Usuarios";
  static const String tittleUsuario = "Usuario";
  static const String tittleMunicipio = "Municipio";
  static const String tittleDepartamento = "Departamento";
  static const String tittleAntena = "Antena";
  static const String tittleListaMunicipio = "Lista Municipios";
  static const String tittleTorre = "Torre";
  static const String tittleAsignarAntena = "Asignar Antenas";
  static const String tittleLogin = "TecniApp";
  static const String tittleHomeCoordinador = "Bienvenido Coordinador";
  static const String color = "Colors.blueGrey.shade200";
  //Rutas
  static const String homeRoute = "/";
  static const String homeCoordinadorRoute = "/home_coordinador";
  static const String perfilCoordinadorRoute = "/perfil_coordinador";
  static const String registroRoute = "/registro_usuarios";
  static const String asignarTorresRoute = "/torre";
  static const String registrarTorreRoute = "/registrar_torre";
  static const String registrarantenaRoute = "/registrar_antena";
  static const String actualizarAntenaRoute = "/actualizar_antena";
  static const String actualizarTorreRoute = "/actualizar_torre";
  static const String actualizarUsuarioRoute = "/actualizar_usuario";
  static const String listaAntenasRoute = "/lista_antenas";
  static const String listaTorresRoute = "/lista_torres";
  static const String listaUsuariosRoute = "/lista_usuarios";
  static const String listaMunicipiosRoute = "/lista_municipios";
  static const String listaDepartamentosRoute = "/lista_departamento";
  static const String registrarDepartamentosRoute = "/crear_Departamento";
  static const String registrarMunicipiosRoute = "/registrar_Municipio";
  static const String actualizarMunicipioRoute = "/actualizar_Municipio";
  static const String actualizarDepartamentosRoute = "/actualizar_Departamento";
  //Ruter imagenes
  static const String loginImage = 'assets/imgLogin.jpg';
  static const String registroImage = 'assets/imgRegistro.png';
  static const String perfilImage = 'assets/perfil.jpg';
  static const String asignarImage = 'assets/asignarAntena.jpg';
  //labels
  static const String labelPassword ="Contraseña";
  static const String labelCorreo ="Correo";
  static const String labelTelefono ="Telefono";
  static const String labelNombre ="Nombre";
  static const String labelNombreTecnico ="Nombre del tecnico";
  static const String labelApellido ="Apellido";
  static const String tipoUsuario ="Cargo";
  static const String perfil ="Perfil";
  static const String trabajador ="Trabajador";
  static const String labelReferencia ="Referencia";
  static const String labelAltura ="Altura";
  static const String labelOrientacion ="Orientacion";
  static const String labelInclinacion ="Inclinacion";
  static const String labelTorre ="Torre";
  static const String labelNombreAntena ="Nombre de la Antena";

  //mensajes
  static const String agradecimiento = "¡Gracias por ser parte de esta gran familia,nos sentimos orgullosos de que cada día ponga todo su esfuerzo y dedicación para lograr el éxito que deseamos!";
  static const String mensajePerfil = "Mensaje del dia";


}