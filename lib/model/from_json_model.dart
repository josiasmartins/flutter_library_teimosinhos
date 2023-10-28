abstract class FromJsonContract<T> {

  T fromJson(Map<String, dynamic> json);
  T toJson();
}
