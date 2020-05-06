


class StatusEvent {
  String labelId;
  RequestStatus status;
  int cid;
  int loadstatus;
  int loadnum;

  StatusEvent(this.labelId, this.status,this.loadstatus, {this.cid});
}


enum RequestStatus {
  /// 网络请求成功
  success,
  /// 网络请求失败
  fail,
  /// 网络请求空数据
  noMore
}