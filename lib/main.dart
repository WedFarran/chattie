import 'package:chattie/core/strings/colors.dart';
import 'package:chattie/features/auth/presentation/phone_number.dart';
import 'package:chattie/features/settings/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:chattie/core/widgets/bottom_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'exports.dart';
import 'features/auth/presentation/OTP_screen.dart';
import 'features/auth/splash_screen.dart';
import 'features/chats/presentation/chat_screen.dart';
import 'features/chats/presentation/chats_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ChatNotifier()),
    ChangeNotifierProvider(create: (context) => AddFriendNotifier()),
    ChangeNotifierProvider(create: (context) => DeleteFriendNotifier()),
    ChangeNotifierProvider(create: (context) => FriendProfileNotifier()),
    ChangeNotifierProvider(create: (context) => LogoutNotifier()),
    ChangeNotifierProvider(create: (context) => ProfileNotifier()),
    ChangeNotifierProvider(create: (context) => SearchNotifier()),
    ChangeNotifierProvider(create: (context) => LoginNotifier()),
  ], child: const Chattie()));
}

class Chattie extends StatelessWidget {
  const Chattie({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
              colorScheme: const ColorScheme(
                  brightness: Brightness.light,
                  primary: BACKGROUND,
                  onPrimary: BACKGROUND,
                  secondary: BACKGROUND,
                  onSecondary: BACKGROUND,
                  error: BACKGROUND,
                  onError: BACKGROUND,
                  background: BACKGROUND,
                  onBackground: BACKGROUND,
                  surface: BACKGROUND,
                  onSurface: BACKGROUND)),
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.id,
          routes: <String, WidgetBuilder>{
            SplashScreen.id: (context) => const SplashScreen(),
            PhoneNumberAuth.id: (context) => const PhoneNumberAuth(),
            OTPScreen.id: (context) => const OTPScreen(),
            ChattieBottomNavigationBar.id: (context) =>
                const ChattieBottomNavigationBar(),
            AddFriends.id: (context) => const AddFriends(),
            ChatsScreen.id: (context) => const ChatsScreen(),
            ChatScreen.id: (context) => const ChatScreen(),
            FriendProfile.id: (context) => const FriendProfile(),
            SettingsScreen.id: (context) => const SettingsScreen(),
            EditProfileScreen.id: (context) => const EditProfileScreen(),
          },
        );
      },
    );
  }
}
