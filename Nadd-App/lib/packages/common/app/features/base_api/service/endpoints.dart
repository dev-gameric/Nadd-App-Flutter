class Endpoints {
  static String baseUrl = 'http://localhost:3000';



  static String url() {
    String url = '';
    return baseUrl+url;
  }

  static usuario(String metodo, int? id, String? cpf, String? email){
    
    String urlUsuario = '$baseUrl/usuario/';
    switch (metodo.toLowerCase()) {
      case "get": 
         String byUser = id==null?'':id.toString();  
         if(byUser==''){
          byUser = cpf==null?'':cpf.toString();  
          if(byUser==''){
            byUser = email==null?'':email.toString();  
          }
         }
        urlUsuario = urlUsuario+ byUser;
        break;
      case 'put':
        String idUser = id==null?'':id.toString();  
        urlUsuario = urlUsuario+ idUser;
        break;
      case 'delete':
        String idUser = id==null?'':id.toString();  
        urlUsuario = urlUsuario+ idUser;
        break;
      default:
    }
    return urlUsuario;
  }
}
