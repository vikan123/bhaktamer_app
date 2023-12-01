import 'package:bhaktamer_app/modal/datamodal.dart';



class DataList{
List<DataModal> dataModal;
DataList(
{
  required this.dataModal
}
    );

factory DataList.fromJson(List<dynamic> parsedJson) {
  List<DataModal> dataModal =<DataModal>[];
  dataModal = parsedJson.map((i) => DataModal.fromJson(i)).toList();
  return DataList(dataModal: dataModal);
}
}
