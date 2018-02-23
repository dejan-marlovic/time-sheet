import 'dart:async';
import 'dart:convert';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:fo_components/fo_components.dart' show FoModel;

abstract class Service<T> {
  Service(this._type);

  Future<dynamic> httpGET([String id]) async {
    loading = true;
    if (id != null) {
      _response = await _client
          .get("http://timesheet.minoch.com/api.php/$_type/$id/?transform=1");
      loading = false;

      if (_response.statusCode != 200)
        throw new Exception(_response.statusCode.toString());
      _data[id] = deserialize(JSON.decode(_response.body));

      return _data[id];
    } else {
      _response = await _client
          .get("http://timesheet.minoch.com/api.php/$_type/?transform=1");
      loading = false;

      if (_response.statusCode != 200)
        throw new Exception(_response.statusCode.toString());

      List<Map> serializedModels = JSON.decode(_response.body)[_type];

      for (Map row in serializedModels) {
        T model = deserialize(row);
        _data[row["id"]] = model;
      }
      return _data.values;
    }
  }

  Future httpPOST(T model) async {
    loading = true;
    _response = await _client.post(
        "https://timesheet.minoch.com/api.php/$_type",
        body: JSON.encode(serialize(model)));
    loading = false;

    if (_response.statusCode != 200)
      throw new Exception(_response.statusCode.toString());
  }

  Future httpPUT(T model) async {
    String id = (model as FoModel).id;
    loading = true;
    _response = await _client.put(
        "https://timesheet.minoch.com/api.php/$_type/$id",
        body: JSON.encode(serialize(model)));
    loading = false;

    if (_response.statusCode != 200)
      throw new Exception(_response.statusCode.toString());
  }

  Future httpDELETE(String id) async {
    loading = true;
    _response =
        await _client.delete("https://timesheet.minoch.com/api.php/$_type/$id");
    loading = false;
    if (_response.statusCode != 200)
      throw new Exception(_response.statusCode.toString());

    _data.remove(id);
  }

  T deserialize(Map<String, dynamic> model_data);
  Map<String, dynamic> serialize(T model);
  Map get data => _data;

  Map<String, T> _data = new Map<String, T>();
  final BrowserClient _client = new BrowserClient();
  final String _type;
  Response _response;
  bool loading = false;

  T get(String id) {
    if (_data.containsKey(id))
      return _data[id];
    else
      return null;
  }
}
