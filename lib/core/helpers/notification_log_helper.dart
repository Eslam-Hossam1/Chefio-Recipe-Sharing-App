import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationLogHelper {
  static void logRemoteNotification({required RemoteMessage remoteMessage}) {
    // Log full RemoteMessage
    log('📦 RemoteMessage: $remoteMessage');

    // Log message ID (if available)
    log('🆔 Message ID: ${remoteMessage.messageId}');

    // Log sent time
    log('🕒 Sent Time: ${remoteMessage.sentTime}');

    // Log category (iOS-specific)
    log('📱 Category: ${remoteMessage.category}');

    // Log collapseKey
    log('📥 Collapse Key: ${remoteMessage.collapseKey}');

    // Log from (sender ID)
    log('📡 From: ${remoteMessage.from}');

    // Log data map
    log('📊 Data map:');
    log(remoteMessage.data.toString());
    // Log data payload
    log('📊 Data:');
    remoteMessage.data.forEach((key, value) {
      log('  🔑 $key: $value');
    });
    // Log notification payload (if exists)
    final notification = remoteMessage.notification;
    if (notification != null) {
      log('📩 Notification:');
      log('  📝 Title: ${notification.title}');
      log('  📄 Body: ${notification.body}');
      log('  📷 Image: ${notification.android?.imageUrl ?? notification.apple?.imageUrl}');
      log('  📲 Android channelId: ${notification.android?.channelId}');
      log('  🍎 Apple badge: ${notification.apple?.badge}');
    } else {
      log('📭 No notification payload present');
    }
  }
}
