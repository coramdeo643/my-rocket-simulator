import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/launch_stage.dart';
import '../../domain/checklist_item.dart';
import '../../application/simulation_notifier.dart';

class ChecklistPanel extends ConsumerWidget {
  final LaunchStage currentStage;
  final List<ChecklistItem> checklists;

  const ChecklistPanel({
    super.key,
    required this.currentStage,
    required this.checklists,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stageItems = checklists.where((item) => item.targetStage == currentStage).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            currentStage.title.toUpperCase(),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            currentStage.description,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const Divider(color: Colors.white24, height: 32),
          
          Expanded(
            child: stageItems.isEmpty 
              ? const Center(child: Text('진행할 체크리스트가 없습니다.', style: TextStyle(color: Colors.white54)))
              : ListView.builder(
              itemCount: stageItems.length,
              itemBuilder: (context, index) {
                final item = stageItems[index];
                return _ChecklistItemTile(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ChecklistItemTile extends ConsumerWidget {
  final ChecklistItem item;

  const _ChecklistItemTile({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: item.isCompleted ? Colors.green.withAlpha(51) : Colors.black26, // withOpacity 대체
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: item.isCompleted ? Colors.green : Colors.white24,
        ),
      ),
      child: ListTile(
        leading: Icon(
          item.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: item.isCompleted ? Colors.green : Colors.white54,
        ),
        title: Text(
          item.description,
          style: TextStyle(
            color: item.isCompleted ? Colors.green.shade200 : Colors.white,
            decoration: item.isCompleted ? TextDecoration.lineThrough : null,
            fontSize: 14,
          ),
        ),
        onTap: () {
          ref.read(simulationProvider.notifier).toggleChecklistItem(item.id);
        },
      ),
    );
  }
}
