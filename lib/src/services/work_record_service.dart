import '../models/work_record.dart';
import 'package:angular/di.dart';
import 'package:intl/intl.dart';
import 'service.dart';

@Injectable()
class WorkRecordService extends Service<WorkRecord> {
  WorkRecordService() : super("work_record");

  @override
  WorkRecord deserialize(Map<String, dynamic> model_data) {
    model_data["id"] = model_data["id"].toString();
    model_data["date"] = DateTime.parse(model_data["date"].toString());
    model_data["hours"] = model_data["hours"].toDouble();

    return new WorkRecord()..addAll(model_data);
  }

  @override
  Map<String, dynamic> serialize(WorkRecord model) {
    DateFormat dateFormatter = new DateFormat('yyyy-MM-dd');
    Map<String, dynamic> modelData = model.toMap();

    if (model.id != null) modelData["id"] = int.parse(model.id);

    try {
      modelData["date"] = dateFormatter.format(model.date);
    } on NoSuchMethodError {
      modelData["date"] = dateFormatter.format(new DateTime.now());
    }
    return modelData;
  }
}
