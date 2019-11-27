abstract class IPrefilter<T, Y> {
  String prefilterType;
  Y execute(List<T> values);
  String hash();
}
