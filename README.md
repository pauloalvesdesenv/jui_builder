
# Flutter Application README

## Requisitos

- **Flutter 3.22.0**: Certifique-se de ter a versão 3.22.0 do Flutter instalada. Caso contrário, siga as instruções de instalação no [site oficial do Flutter](https://docs.flutter.dev/get-started/install).

## Passos para rodar a aplicação

1. **Instalar dependências**
   Após clonar o repositório, execute o comando abaixo para instalar todas as dependências do projeto:

   ```bash
   flutter pub get
   ```

2. **Gerar código**
   Para rodar o gerador de código (codegen) e resolver eventuais conflitos, utilize o comando:

   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Rodar a aplicação**
   Com as dependências instaladas e o código gerado, você pode rodar a aplicação com:

   ```bash
   flutter run
   ```

## Consumo do JSON

O consumo do JSON na aplicação é realizado na camada de *Data Source* dentro do arquivo `jui_data_source.dart`. Há duas implementações disponíveis:

- **Via Assets**: O JSON é carregado diretamente de um arquivo local. Para modificar o JSON utilizado por esta implementação, altere o arquivo localizado em `assets/jsons/json_dynamic_widget.json`.

- **Via Remoto**: O JSON é consumido de uma API remota. Para testar essa funcionalidade, você pode criar uma API mockada utilizando [Mocky](https://designer.mocky.io/). Após criar o mock, insira o path para o recurso no código.

## Testando a leitura de QR Code

Ao abrir a aplicação pela primeira vez, será exibida uma câmera para a leitura de um QR code. No entanto, para facilitar os testes, após 5 segundos será executada uma função que simula a leitura do QR code. Em um segundo momento, essa função será removida, e um QR code real será gerado para testes de leitura.

## Documentação adicional

- **Exemplo de JSON**: Para entender como estruturar o JSON, consulte a [documentação de exemplo](https://github.com/peiffer-innovations/json_dynamic_widget/tree/main/json_dynamic_widget/example/assets/pages).

- **Documentação da biblioteca**: A biblioteca usada para consumir e converter o JSON em interface pode ser encontrada [aqui](https://github.com/peiffer-innovations/json_dynamic_widget/tree/main/json_dynamic_widget).

---

Seguindo os passos acima, você conseguirá rodar a aplicação e testar diferentes implementações de consumo do JSON.
