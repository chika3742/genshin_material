/// format of versions: `major`.`minor`.`patch`
bool isMinorVersionUpdated(String previous, String current) {
  final previousParts = previous.split(".");
  final currentParts = current.split(".");

  if (previousParts.length != 3 || currentParts.length != 3) {
    return false;
  }

  return previousParts[1] != currentParts[1] || previousParts[0] != currentParts[0];
}
