enum LaunchStage {
  rollout('Rollout', '조립동에서 발사대로 이동'),
  erecting('Erecting', '발사체 수직 기립'),
  boarding('Boarding', '우주인 탑승'),
  fueling('Fueling', '연료 및 산화제 주입'),
  ignition('Ignition', '카운트다운 및 엔진 점화'),
  liftoff('Liftoff', '이륙 및 상승'),
  staging('Staging', '1/2단 분리 (MECO)'),
  descent('Descent', '1단 로켓 자유 낙하 및 하강'),
  landing('Landing', '역추진 및 랜딩 기어 전개 (Touchdown)');

  final String title;
  final String description;

  const LaunchStage(this.title, this.description);
}
