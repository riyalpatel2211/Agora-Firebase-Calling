// lib/services/call_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';

class CallService {
  CallService._();
  static final CallService I = CallService._();

  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  /// Create an invite for targetUserId; caller creates this doc and callee's listener will pick it up.
  /// If you already create a call_room document, keep that logic — we create a "signal" doc under call_invites/{calleeId}.
  Future<void> sendCallInvite({
    required String callerId,
    required String callerName,
    required String calleeId,
    required String roomId,
    required String callType, // 'audio' or 'video'
    Duration ttl = const Duration(seconds: 45),
  }) async {
    final ref = _fs.collection('call_invites').doc(calleeId);
    final payload = {
      'callerId': callerId,
      'callerName': callerName,
      'roomId': roomId,
      'channelId': AppConstants.channelName, // using static channel; or pass roomId channel if dynamic
      'callType': callType,
      'createdAt': FieldValue.serverTimestamp(),
    };

    await ref.set(payload);

    // auto clear after TTL to avoid stale invites
    Future.delayed(ttl, () async {
      final snap = await ref.get();
      if (snap.exists) {
        final data = snap.data() as Map<String, dynamic>;
        // only remove if same roomId (to avoid deleting a newer invite)
        if (data['roomId'] == roomId) {
          await ref.delete();
        }
      }
    });
  }

  /// Callee can call this to clear invite (on accept/reject)
  Future<void> clearInviteFor(String calleeId) async {
    try {
      await _fs.collection('call_invites').doc(calleeId).delete();
    } catch (_) {}
  }
}
