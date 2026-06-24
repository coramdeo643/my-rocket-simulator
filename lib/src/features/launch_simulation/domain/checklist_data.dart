import 'checklist_item.dart';
import 'launch_stage.dart';

final List<ChecklistItem> initialChecklists = [
  // Rollout (이동)
  const ChecklistItem(
    id: 'ro_1',
    targetStage: LaunchStage.rollout,
    description: '크롤러 트랜스포터 이동 속도 설정',
    choices: [
      ChecklistChoice(label: '천천히 이동 (1mph)', isCorrect: true),
      ChecklistChoice(label: '빠르게 이동 (5mph)', isCorrect: false, failureMessage: '진동 한계치 초과로 로켓 내부 페이로드 손상 및 전복 위험 발생.'),
    ],
  ),
  const ChecklistItem(
    id: 'ro_2',
    targetStage: LaunchStage.rollout,
    description: '돌풍(Wind limit) 대처 확인',
    choices: [
      ChecklistChoice(label: '일정 유지 이동', isCorrect: false, failureMessage: '돌풍 시 이동 강행으로 크롤러 위에서 로켓 균형 상실 및 전복.'),
      ChecklistChoice(label: '이동 중단 및 대기', isCorrect: true),
    ],
  ),
  const ChecklistItem(
    id: 'ro_3',
    targetStage: LaunchStage.rollout,
    description: '크롤러 궤도 점검 및 경로 설정',
    choices: [
      ChecklistChoice(label: '최단 경로 직진', isCorrect: false, failureMessage: '지반 침하 구역 통과 중 크롤러 트랙 파손으로 이동 불가.'),
      ChecklistChoice(label: '지반 침하 구역 우회', isCorrect: true),
    ],
  ),
  const ChecklistItem(
    id: 'ro_4',
    targetStage: LaunchStage.rollout,
    description: '엄빌리컬(Umbilical) 케이블 연결 상태',
    choices: [
      ChecklistChoice(label: '이동 전 통신선 연결', isCorrect: true),
      ChecklistChoice(label: '도착 후 연결', isCorrect: false, failureMessage: '이동 중 텔레메트리 단절로 로켓 내부 상태 모니터링 실패.'),
    ],
  ),

  // Erecting (기립)
  const ChecklistItem(
    id: 'er_1',
    targetStage: LaunchStage.erecting,
    description: '유압 장치 시스템 점검',
    choices: [
      ChecklistChoice(label: '기립 즉시 시작', isCorrect: false, failureMessage: '유압 저하로 인해 기립 도중 로켓을 지탱하지 못하고 추락.'),
      ChecklistChoice(label: '유압 압력 사전 체크', isCorrect: true),
    ],
  ),
  const ChecklistItem(
    id: 'er_2',
    targetStage: LaunchStage.erecting,
    description: '풍속 확인 및 기립 타이밍',
    choices: [
      ChecklistChoice(label: '풍속 15m/s 이하 대기', isCorrect: true),
      ChecklistChoice(label: '현재 풍속(25m/s) 기립', isCorrect: false, failureMessage: '강풍으로 인해 기립 중인 로켓 측면에 과도한 풍하중 발생 (구조 파괴).'),
    ],
  ),
  const ChecklistItem(
    id: 'er_3',
    targetStage: LaunchStage.erecting,
    description: '기립 각도 센서 설정',
    choices: [
      ChecklistChoice(label: '센서 영점 보정', isCorrect: true),
      ChecklistChoice(label: '이전 데이터 재사용', isCorrect: false, failureMessage: '센서 오차로 인해 90도를 초과(Over-rotate)하여 타워 충돌.'),
    ],
  ),
  const ChecklistItem(
    id: 'er_4',
    targetStage: LaunchStage.erecting,
    description: '홀드다운 클램프(Hold-down Clamp) 체결',
    choices: [
      ChecklistChoice(label: '연료 주입 전 체결', isCorrect: false, failureMessage: '체결 지연 중 강풍에 로켓이 발사대에서 미끄러짐.'),
      ChecklistChoice(label: '기립 후 즉시 체결', isCorrect: true),
    ],
  ),

  // Boarding (우주인 탑승)
  const ChecklistItem(
    id: 'bo_1',
    targetStage: LaunchStage.boarding,
    description: '우주복 기압 테스트',
    choices: [
      ChecklistChoice(label: '스킵 (빠른 탑승)', isCorrect: false, failureMessage: '탑승 직후 우주복 기압 이상 알림 발생으로 탑승 중단.'),
      ChecklistChoice(label: '압력 테스트 진행', isCorrect: true),
    ],
  ),
  const ChecklistItem(
    id: 'bo_2',
    targetStage: LaunchStage.boarding,
    description: '사이드 해치 밀폐(Hatch Seal) 점검',
    choices: [
      ChecklistChoice(label: 'O-링 점검/제거', isCorrect: true),
      ChecklistChoice(label: '바로 해치 닫음', isCorrect: false, failureMessage: 'O-링 먼지로 인해 진공 기밀 테스트 실패 (가스 누출).'),
    ],
  ),
  const ChecklistItem(
    id: 'bo_3',
    targetStage: LaunchStage.boarding,
    description: '비상 탈출 시스템(LES) 무장 시점',
    choices: [
      ChecklistChoice(label: '탑승 전 사전 무장', isCorrect: false, failureMessage: '탑승 전 무장 상태에서 정전기로 탈출 모터 오작동 및 점화.'),
      ChecklistChoice(label: '탑승 완료 후 무장', isCorrect: true),
    ],
  ),
  const ChecklistItem(
    id: 'bo_4',
    targetStage: LaunchStage.boarding,
    description: '정전기 방지 패드(Grounding)',
    choices: [
      ChecklistChoice(label: '접지 케이블 연결', isCorrect: true),
      ChecklistChoice(label: '연결 없이 탑승', isCorrect: false, failureMessage: '우주인 이동 중 발생한 정전기로 내부 전장품 스파크 발생.'),
    ],
  ),

  // Fueling (연료 주입)
  const ChecklistItem(
    id: 'fu_1',
    targetStage: LaunchStage.fueling,
    description: '산화제(LOX) 배관 온도 제어',
    choices: [
      ChecklistChoice(label: '직접 고속 주입', isCorrect: false, failureMessage: '영하 183도 액체산소가 상온 배관에 닿아 열충격으로 파손.'),
      ChecklistChoice(label: '배관 예냉(Pre-chill)', isCorrect: true),
    ],
  ),
  const ChecklistItem(
    id: 'fu_2',
    targetStage: LaunchStage.fueling,
    description: '주입 순서(Load Sequence)',
    choices: [
      ChecklistChoice(label: '연료/산화제 압력차 유지', isCorrect: true),
      ChecklistChoice(label: '동시 급가압 주입', isCorrect: false, failureMessage: '공통 격벽(Common Bulkhead) 압력 역전으로 파열.'),
    ],
  ),
  const ChecklistItem(
    id: 'fu_3',
    targetStage: LaunchStage.fueling,
    description: '배기 밸브(Vent Valve) 조작',
    choices: [
      ChecklistChoice(label: '벤팅 밸브 폐쇄', isCorrect: false, failureMessage: '기화 가스로 인해 탱크 압력 초과(Overpressurization) 폭발.'),
      ChecklistChoice(label: '주입 중 벤팅 개방', isCorrect: true),
    ],
  ),
  const ChecklistItem(
    id: 'fu_4',
    targetStage: LaunchStage.fueling,
    description: '연료 밀도화(Densification)',
    choices: [
      ChecklistChoice(label: '주입 직전까지 냉각 순환', isCorrect: true),
      ChecklistChoice(label: '주입 후 장기 대기', isCorrect: false, failureMessage: '오랜 대기로 연료가 기화(Boil-off)되어 팽창 및 밀도 저하.'),
    ],
  ),

  // Ignition (점화)
  const ChecklistItem(
    id: 'ig_1',
    targetStage: LaunchStage.ignition,
    description: '엔진 점화 순서 (T-3초)',
    choices: [
      ChecklistChoice(label: '순차 점화 (Staggered)', isCorrect: true),
      ChecklistChoice(label: '동시 일제 점화', isCorrect: false, failureMessage: '9개 엔진 동시 점화 시 구조적 충격음(Hammering)으로 마운트 파손.'),
    ],
  ),
  const ChecklistItem(
    id: 'ig_2',
    targetStage: LaunchStage.ignition,
    description: '물 분사 시스템(Sound Suppression)',
    choices: [
      ChecklistChoice(label: '분사 생략', isCorrect: false, failureMessage: '음향 충격파(Acoustic shock) 반사로 로켓 하부 파괴.'),
      ChecklistChoice(label: 'T-10초 물 분사 시작', isCorrect: true),
    ],
  ),
  const ChecklistItem(
    id: 'ig_3',
    targetStage: LaunchStage.ignition,
    description: '터보펌프 시동 (Spin-start)',
    choices: [
      ChecklistChoice(label: '메인 밸브 즉시 개방', isCorrect: false, failureMessage: '터보펌프 시동 전 연료 유입으로 연소실 내 하드 스타트(Hard Start) 폭발.'),
      ChecklistChoice(label: '시동 가스(TEATEB) 주입', isCorrect: true),
    ],
  ),
  const ChecklistItem(
    id: 'li_1',
    targetStage: LaunchStage.liftoff, // Note: using liftoff stage for this to happen exactly at launch
    description: '클램프 해제 타이밍',
    choices: [
      ChecklistChoice(label: '추력 100% 도달 후 해제', isCorrect: true),
      ChecklistChoice(label: '점화와 동시에 해제', isCorrect: false, failureMessage: '추력이 로켓 무게를 이기기 전에 해제되어 패드에 주저앉으며 대폭발.'),
    ],
  ),
  
  // Staging
  const ChecklistItem(
    id: 'st_1',
    targetStage: LaunchStage.staging,
    description: '1단 메인 엔진 컷오프 (MECO)',
    choices: [
      ChecklistChoice(label: '정상 컷오프', isCorrect: true),
    ],
  ),
  const ChecklistItem(
    id: 'st_2',
    targetStage: LaunchStage.staging,
    description: '1단 및 2단 기계적 분리 (Staging)',
    choices: [
      ChecklistChoice(label: '공압 분리기 작동', isCorrect: true),
    ],
  ),

  // Descent
  const ChecklistItem(
    id: 'de_1',
    targetStage: LaunchStage.descent,
    description: '1단 자세 제어 트러스터(RCS) 플립 매뉴버',
    choices: [
      ChecklistChoice(label: 'RCS 점화', isCorrect: true),
    ],
  ),

  // Landing
  const ChecklistItem(
    id: 'la_1',
    targetStage: LaunchStage.landing,
    description: '드론쉽 착륙 레이더 통신 확보',
    choices: [
      ChecklistChoice(label: '레이더 록온', isCorrect: true),
    ],
  ),
  const ChecklistItem(
    id: 'la_2',
    targetStage: LaunchStage.landing,
    description: '1단 역추진(Landing Burn) 및 랜딩 기어 전개',
    choices: [
      ChecklistChoice(label: '역추진 시작 및 기어 전개', isCorrect: true),
    ],
  ),
];
