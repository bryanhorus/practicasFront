class Constants {
  //App
  static const String appName = "TecniApp";
  //Url
  static const String urlAuthority =
      "ec2-3-15-37-85.us-east-2.compute.amazonaws.com:8090";
  static const String contenTypeHeader = "application/json";
  //servicio
  static const String pathServiceUsuario = "/api/tecni/auth/new";
  static const String pathServiceListUsuario = "/api/tecni/user/get/all";
  static const String pathServiceDeleteU = "/api/tecni/user/delete/id";
  static const String pathServiceBuscarObservacion = "/api/tecni/observacion/find/observacion/antena";
  static const String pathServiceinsertDpto = "/api/tecni/departament/insert";
  static const String pathServiceinsertMunicipio =
      "/api/tecni/municipio/insert";
  static const String pathServiceMunicipioUpdate =
      "/api/tecni/municipio/update";
  static const String pathServiceMunicipioDelete =
      "/api/tecni/municipio/delete/id";
  static const String pathServiceMinicipiosLista =
      "/api/tecni/municipio/get/all";
  static const String pathServiceObsLista = "/api/tecni/observacion/get/all";
  static const String pathServiceUsuarioUpdate = "/api/tecni/user/update";
  static const String pathServiceContrasenaUpdate = "/api/tecni/auth/update/credentials";
  static const String pathServiceDepartamentoUpdate =
      "/api/tecni/departament/update";
  static const String pathServiceTorreUpdate = "/api/tecni/torre/update";
  static const String pathServiceinsertTorre = "/api/tecni/torre/insert";
  static const String pathServiceDeleteTorre = "/api/tecni/torre/delete/id";
  static const String pathServiceTorre = "/api/tecni/torre/get/all";
  static const String pathServiceDepartamentoDelete =
      "/api/tecni/departament/delete/id";
  static const String pathServiceDepartamento =
      "/api/tecni/departament/get/all";
  static const String pathServiceAntenaInsert = "/api/tecni/antenna/insert";
  static const String pathServiceObservacionInsert =
      "/api/tecni/observacion/insert";
  static const String pathServiceAntenaUpdate = "/api/tecni/antenna/update";
  static const String pathServiceAntenaDelete = "/api/tecni/antenna/delete/id";
  static const String pathServiceAntenasLista = "/api/tecni/antenna/get/all";
  static const String pathServiceTorreInsert = "/api/tecni/torre/insert";
  static const String pathServiceTorreDelete = "/api/tecni/torre/delete/id";
  static const String pathServiceTorreLista = "/api/tecni/torre/get/all";
  static const String pathServiceLogin = "/api/tecni/auth";
  static const String pathServiceAsignar = "/api/tecni/asignar/antena/insert";
  static const String pathServiceAsignarLista = "/api/tecni/asignar/antena/get/all";
  static const String pathServiceAsignarUpdate = "/api/tecni/asignar/antena/update";
  //validacion de campos
  static const String estructura =
      "La estructura no coincide con la solicitada";
  static const String validateName = "El nombre es necesario";
static const String validatePass = "la contraseña es necesario!!";  
  static const String nameStructure = "El campo solo puede contener a-z y A-Z";
  static const String validateLastName = "El nombre es necesario";
  static const String lastNameStructure = "El nombre puede contener a-z y A-Z";
  static const String validateEmail = "El correo es necesario";
  static const String emailStructure = "Correo invalido";
  static const String validateMobile = "El telefono es necesario";
  static const String validateReferencia =
      "La referencia de antena es necesaria";
  static const String mobileStructure = "Debe tener 10 digitos";
  static const String validateAltura = "La altura de antena es necesaria";
  static const String validateOrientacion =
      "La orientacion de antena es necesaria";
  static const String validateInclinacion =
      "La inclinacion de antena es necesaria";
  static const String validateTorre = "La torre de antena es necesaria";
  static const String referenciaStructure =
      "La referencia debe tener 10 digitos";
  static const String alturaStructure = "la altura debe tener 2 numeros";
  static const String orientacionStructure = "es en grados";
  static const String validatePassword = "La contraseña es necesaria";
  static const String passwordStructure =
      "El tamaño de la contraseña debe ser más de 8 carácteres";
  static const String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String patternNombre = r'(^[a-zA-Z ]*$)';
  static const String patterTelefono = r'(^[3][0-9]*$)';
  static const String patterNumero = r'(^[0-9]*$)';
  //Botones
  static const String btnCerrar = "Cerrar";
  static const String btnIngresar = "Ingresar";
  static const String btnRegistar = "Registrar ";
  static const String btnCambiar2 = "Cambiar contraseña ";
  static const String btnSiguiente = "Siguiente ";
  static const String btnModificar = "Editar ";
  static const String btnLista = "Lista ";
  static const String btnListaU = "Lista Usuarios";
  static const String btnRegistarU = "Registrar Usuarios";
  static const String btnListaD = "Lista Departamentos";
  static const String btnRegistarD = "Registrar Departamento";
  static const String btnListaM = "Lista Municipios";
  static const String btnListaO = "Lista Observaciones";
  static const String btnRegistarM = "Registrar Municipios";
  static const String btnListaT = "Lista Torres";
  static const String btnRegistarT = "Registrar Torre";
  static const String btnListaA = "Lista Antena";
  static const String btnRegistarA = "Registrar Antena";
  static const String btnEliminar = "Eliminar ";
  static const String btnAsignar = "Asignar ";
  static const String btnPerfil = "Perfil";
  static const String btnAsignarTorres = "Asignar Torres";
  //AppBar
  static const String appBarPerfil = "Perfil";
  static const String appBarTorre = "Torres Registradas";
  static const String tittleRegistroUsuario = "Registrar Usuarios";
  static const String tittleRegistroDepartamento = "Registrar Departamento";
  static const String tittleRegistroMunicipio = "Registrar Municipio";
  static const String tittleRegistroTorre = "Registrar Torre";
  static const String tittleMapaTorre = "Ubicacion de la Torre";
  static const String tittleObservacion = "Observación de Antena";
  static const String tittleTorreactualizar = "Actualizar Torre";
  static const String tittleListaTorre = "Lista Torres";
  static const String tittleListaObservaciones = "Observaciones realizadas ";
  static const String titleactualizarcontra="Actualizacion de la Contraseña";
  static const String tittleRegistroAntena = "Registrar Antena";
  static const String tittleDepartamentoactualizar = "Actualizar Departamento";
  static const String tittleMunicipioactualizar = "Actualizar Municipio";
  static const String tittleActualizarAsignarAntena = "Actualizar Asignación";
  static const String tittleActualizarAntena = "Actualizar Antena";
  static const String tittleObsDetail = "Kevin Roldán";
  static const String tittleListaAntenas = "Antenas Registrados";
  static const String tittleListaAntenasAsignadas = "Antenas Asignadas";
  static const String tittleListaDepartamentos = "Lista Departamentos";
  static const String tittleListaUsuarios = "Usuarios Registrados";
  static const String tittleListaObs = "Observaciones";
  static const String tittleActualizar = "Actualizar Usuarios";
  static const String tittleUsuario = "Usuario";
  static const String tittleMunicipio = "Municipio";
  static const String titleActu = "Actualiza tu contraseña";
  static const String tittleObs = "Observation";
  static const String tittleDepartamento = "Departamento";
  static const String tittleAntena = "Antena";
  static const String tittleAntenaAsignadas = "Antenas Asignadas";
  static const String tittleListaMunicipio = "Lista Municipios";
  static const String tittleTorre = "Torre";
  static const String tittleAsignarAntena = "Asignar Antenas";
  static const String tittleLogin = "TecniApp";
  static const String tittleHomeCoordinador = "Bienvenido Coordinador";
  static const String cerrarSesion = "Cerrar Sesión";
  //Rutas
  static const String homeRoute = "/";
  static const String homeCoordinadorRoute = "/home_coordinador";
  static const String perfilCoordinadorRoute = "/perfil_coordinador";
  static const String registroRoute = "/registro_usuarios";
  static const String userRoute = "/usuario";
  static const String asignarTorresRoute = "/torre";
  static const String asignarAntenaRoute = "/asignar_antena";
  static const String listaAsignarAntenaRoute = "/lista_asignar_antena";
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
  static const String registrarobservacionRoute = "/observacion";
  static const String observacionesRoute = "/lista_observation";
  static const String homeTecnicoRoute = "/home_tecnico";
  static const String buscarObservacionRoute = "/buscar_observacion";
  static const String listaBusquedaRoute = "/lista_busqueda";
  static const String recuperarContrasenaRoute = "/recuperar_contrasena";
  static const String actualuzarContra="/actualiza_contra";

  //Ruter imagenes
  static const String loginImage = 'assets/imgLogin.jpg';
  static const String registroImage = 'assets/imgRegistro.png';
  static const String perfilImage = 'assets/perfil.jpg';
  static const String asignarImage = 'assets/asignarAntena.jpg';
  static const String image = 'assets/images.png';
  //labels
  static const String labelPassword = "Contraseña";
  static const String labelPassword2 = "Vieja Contraseña";
  static const String labelPassword3 = "Nueva Contraseña";
  static const String labelCorreo = "Correo";
  static const String labelTelefono = "Telefono";
  static const String labelNombre = "Nombre";
  static const String labelDate = "Date";
  static const String labelNombreTecnico = "Nombre del tecnico";
  static const String labelApellido = "Apellido";
  static const String tipoUsuario = "Cargo";
  static const String perfil = "Perfil";
  static const String trabajador = "Trabajador";
  static const String labelReferencia = "Referencia";
  static const String labelAltura = "Altura";
  static const String labelOrientacion = "Orientacion";
  static const String labelInclinacion = "Inclinacion";
  static const String labelIdentificacion = "Identificacion";
  static const String labelDireccion = "Direccion";
  static const String labelCoordenadas = "Coordenadas";
  static const String labelTorre = "Torre";
  static const String labelMunicipio = "Municipio";
  static const String labelTecnologia = "Tecnologia";
  static const String labelNombreAntena = "Antena";
  static const String labelDepartamento = "Departamento";
  static const String labelestado = "Estado";

  static const String labelNombreTorre = "Nombre de la Torre";
  static const String labelDirTorre = "Dirección de la Torre";
  static const String labelCoorTorre = "Coordenadas de la Torre";
  static const String labelAlturaTorre = "Altura de la Torre";
  static const String labelTechTorre = "Tecnología de la Torre";

  //mensajes
  static const String agradecimiento =
      "¡Gracias por ser parte de esta gran familia,nos sentimos orgullosos de que cada día ponga todo su esfuerzo y dedicación para lograr el éxito que deseamos!";
  static const String mensajePerfil = "Mensaje del dia";
  static const String createMessage = "Creación exitosa";
  static const String registroExitoso = "¡Registro exitoso!";
  static const String tittleDialog = "Información";
  static const String actualizacion = "  ¡Actualizado!";
  static const String eliminado = "  ¡Eliminado";
}
