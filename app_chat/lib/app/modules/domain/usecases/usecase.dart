import '../entities/model.dart';

/// vai dizer exatamente o que precisa fazer,
/// desde o nome do arquivo até a classe,
/// o que está sendo requerido?
/// qual a regra de negocio que eu vou usar aqui ?
///
///
/// vai ser uma classe abstrata
/// que vai possuir um contrato do que deve ter nas classes que implementarem ela
/// posso criar funçoes e métodos, sabendo o que vai retornar
///
///
abstract class SearchByText {
  Future<List<ResultSearch>> call(String searchText);
}