import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import "../resources/repository.dart";

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _items = BehaviorSubject<int>();

  late Stream<Map<int, Future<ItemModel>>> items;
  Stream<List<int>> get topIds => _topIds.stream;

  Function(int) get fetchItem => _items.sink.add;

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  StoriesBloc() {
    items = _items.stream.transform(_itemsTransformer());
  }

  _itemsTransformer() {
    return ScanStreamTransformer((
      Map<int, Future<ItemModel>> cache,
      int id,
      _,
    ) {
      cache[id] = _repository.fetchItem(id) as Future<ItemModel>;
      return cache;
    }, <int, Future<ItemModel>>{});
  }

  dispose() {
    _topIds.close();
    _items.close();
  }
}
