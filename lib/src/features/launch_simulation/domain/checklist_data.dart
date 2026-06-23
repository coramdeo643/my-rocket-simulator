import 'checklist_item.dart';
import 'launch_stage.dart';

final List<ChecklistItem> initialChecklists = [
  // Rollout
  const ChecklistItem(id: 'ro_1', targetStage: LaunchStage.rollout, description: '크롤러 트랜스포터 구동 및 연결 확인'),
  const ChecklistItem(id: 'ro_2', targetStage: LaunchStage.rollout, description: '조립동(VAB) 도어 개방'),
  const ChecklistItem(id: 'ro_3', targetStage: LaunchStage.rollout, description: '발사대(Pad)로 이동 승인'),
  // Erecting
  const ChecklistItem(id: 'er_1', targetStage: LaunchStage.erecting, description: '발사대 고정 장치 체결'),
  const ChecklistItem(id: 'er_2', targetStage: LaunchStage.erecting, description: '수직 기립 시스템(TEL) 작동'),
  const ChecklistItem(id: 'er_3', targetStage: LaunchStage.erecting, description: '기립 완료 및 정렬 핀 확인'),
  // Boarding
  const ChecklistItem(id: 'bo_1', targetStage: LaunchStage.boarding, description: '크루 엑세스 암(CAA) 전개'),
  const ChecklistItem(id: 'bo_2', targetStage: LaunchStage.boarding, description: '우주인 탑승 완료 및 사이드 해치 닫힘'),
  const ChecklistItem(id: 'bo_3', targetStage: LaunchStage.boarding, description: '통신 및 우주복 생명 유지 장치 점검'),
  // Fueling
  const ChecklistItem(id: 'fu_1', targetStage: LaunchStage.fueling, description: '1/2단 액체 산소(LOX) 주입 승인'),
  const ChecklistItem(id: 'fu_2', targetStage: LaunchStage.fueling, description: '1/2단 RP-1(케로신) 주입 승인'),
  const ChecklistItem(id: 'fu_3', targetStage: LaunchStage.fueling, description: '연료 탱크 가압 완료 및 주입구 차단'),
  // Ignition
  const ChecklistItem(id: 'ig_1', targetStage: LaunchStage.ignition, description: '크루 엑세스 암(CAA) 후퇴'),
  const ChecklistItem(id: 'ig_2', targetStage: LaunchStage.ignition, description: '내부 전력 전환 및 자율 비행 컴퓨터 제어권 이양'),
  const ChecklistItem(id: 'ig_3', targetStage: LaunchStage.ignition, description: 'T-10초 오토 시퀀스 시작 및 엔진 칠다운'),
  // Liftoff
  const ChecklistItem(id: 'li_1', targetStage: LaunchStage.liftoff, description: '홀드다운 클램프 해제 (Liftoff)'),
  const ChecklistItem(id: 'li_2', targetStage: LaunchStage.liftoff, description: '최대 동적 압력점(Max-Q) 통과'),
  // Staging
  const ChecklistItem(id: 'st_1', targetStage: LaunchStage.staging, description: '1단 메인 엔진 컷오프 (MECO)'),
  const ChecklistItem(id: 'st_2', targetStage: LaunchStage.staging, description: '1단 및 2단 기계적 분리 (Staging)'),
  const ChecklistItem(id: 'st_3', targetStage: LaunchStage.staging, description: '2단 진공 엔진 점화 (SES-1)'),
  // Descent
  const ChecklistItem(id: 'de_1', targetStage: LaunchStage.descent, description: '1단 자세 제어 트러스터(RCS) 플립 매뉴버'),
  const ChecklistItem(id: 'de_2', targetStage: LaunchStage.descent, description: '부스트백 번(Boostback Burn) 실행'),
  const ChecklistItem(id: 'de_3', targetStage: LaunchStage.descent, description: '그리드 핀(Grid Fins) 전개'),
  // Landing
  const ChecklistItem(id: 'la_1', targetStage: LaunchStage.landing, description: '드론쉽 착륙 레이더 통신 확보'),
  const ChecklistItem(id: 'la_2', targetStage: LaunchStage.landing, description: '1단 역추진(Landing Burn) 엔진 재점화'),
  const ChecklistItem(id: 'la_3', targetStage: LaunchStage.landing, description: '랜딩 기어 전개 (Touchdown)'),
];
