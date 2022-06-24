class DashboardCardModel{
  int? myMissingCheckoutCount;
  int? myghostCount;
  int? myLeaveBalance;
  int? myNoDailyUpdate;
  String? myNotAcknowledged;

  DashboardCardModel({required this.myMissingCheckoutCount, required this.myghostCount, required this.myLeaveBalance, required this.myNoDailyUpdate, required this.myNotAcknowledged});

DashboardCardModel.fromJson(Map<String, dynamic> json){
  myMissingCheckoutCount = json['my_missing_checkout_count'];
  myghostCount = json['my_ghost_count'];
  myLeaveBalance = json['my_leave_balance_count'];
  myNoDailyUpdate = json['my_no_dailyUpdates_count'];
  myNotAcknowledged = json['my_not_acknowledge_dailyUpdates_count'];

}
}