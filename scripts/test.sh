# Esse script será usado pelo CircleCI para executar nossas testes

# Compilando o projeto
npm run build

# Mudando para o diretório de build
pushd build

# Iniciando um servidor básico/estático
php -S localhost:3001 &

# Salvando o PID do processo do servidor
APP_TEST_PID=$(echo $!)

# Executando os testes
PORT=3001 CI=true npm run test:all

# Saindo do diretório de build
popd

# Desligando o servidor
kill $APP_TEST_PID
