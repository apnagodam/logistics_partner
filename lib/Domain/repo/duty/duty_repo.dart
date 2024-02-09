abstract class DutyRepo
{
  Future<Map<String, dynamic>> getLpDutyStatus({required int status});
  Future<Map<String, dynamic>> getAutoAcceptStatus(int status);
}