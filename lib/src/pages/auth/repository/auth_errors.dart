String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou Senha invalidos';

    case 'Invalid session token':
      return 'Token invalido';
    case 'INVALID_FULLNAME':
      return 'nome invalido ao cadastrar';
    case 'INVALID_PHONE':
      return 'celular invalido ao cadastrar';
    case 'INVALID_CPF':
      return 'cpf invalido ao cadastrar';
    default:
      return 'ERRO INDEFINIDO *Alguem anotou a placa?!!*';
  }
}
