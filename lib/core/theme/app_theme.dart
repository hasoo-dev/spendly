import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saypay/core/const/app_constant.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // ============================================================================
  // LIGHT THEME (Actually Dark Theme based on your colors)
  // ============================================================================
  static ThemeData get lightTheme {
    final TextTheme baseTextTheme = _buildTextTheme(AppConstant.BLACK);
    
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      
      // --- Primary Colors ---
      primaryColor: AppConstant.PRIMARY,
      primaryColorLight: AppConstant.PRIMARY.withOpacity(0.7),
      primaryColorDark: AppConstant.PRIMARY,
      scaffoldBackgroundColor: AppConstant.BG_COLOR,
      canvasColor: AppConstant.BG_COLOR,
      cardColor: AppConstant.WHITE,
      dividerColor: AppConstant.WHITE.withOpacity(0.12),
      highlightColor: AppConstant.PRIMARY.withOpacity(0.1),
      splashColor: AppConstant.PRIMARY.withOpacity(0.2),
      hoverColor: AppConstant.PRIMARY.withOpacity(0.04),
      focusColor: AppConstant.PRIMARY.withOpacity(0.12),
      
      // --- Typography & Iconography ---
      fontFamily: 'Lufga',
      textTheme: baseTextTheme,
      primaryTextTheme: baseTextTheme,
      
      // --- AppBar Theme ---
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 2,
        backgroundColor: AppConstant.BG_COLOR,
        foregroundColor: AppConstant.WHITE,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black.withOpacity(0.2),
        iconTheme: const IconThemeData(
          color: AppConstant.PRIMARY,
          size: 24,
        ),
        actionsIconTheme: const IconThemeData(
          color: AppConstant.PRIMARY,
          size: 24,
        ),
        titleTextStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppConstant.WHITE,
          letterSpacing: 0.15,
        ),
        toolbarHeight: 56,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      
      // --- Bottom AppBar Theme ---
      bottomAppBarTheme: const BottomAppBarThemeData(
        color: AppConstant.BG_COLOR,
        elevation: 8,
        height: 60,
      ),
      
      // --- Card Theme ---
      cardTheme: CardThemeData(
        color: AppConstant.WHITE,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(8),
      ),
      
      // --- Chip Theme ---
      chipTheme: ChipThemeData(
        backgroundColor: AppConstant.WHITE.withOpacity(0.1),
        selectedColor: AppConstant.PRIMARY,
        secondarySelectedColor: AppConstant.SECONDARY,
        disabledColor: AppConstant.WHITE.withOpacity(0.05),
        labelStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppConstant.WHITE,
        ),
        secondaryLabelStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppConstant.WHITE,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
        pressElevation: 2,
      ),
      
      // --- Dialog Theme ---
      dialogTheme: DialogThemeData(
        backgroundColor: AppConstant.BODY_COLOR,
        elevation: 24,
        shadowColor: Colors.black.withOpacity(0.4),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        titleTextStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppConstant.WHITE,
        ),
        contentTextStyle: TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          color: AppConstant.WHITE.withOpacity(0.87),
        ),
      ),
      
      // --- Bottom Sheet Theme ---
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppConstant.BODY_COLOR,
        elevation: 16,
        modalElevation: 24,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        clipBehavior: Clip.antiAlias,
      ),
      
      // --- Snackbar Theme ---
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppConstant.BODY_COLOR,
        contentTextStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          color: AppConstant.WHITE,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 6,
      ),
      
      // --- Divider Theme ---
      dividerTheme: DividerThemeData(
        color: AppConstant.WHITE.withOpacity(0.12),
        thickness: 1,
        space: 1,
      ),
      
      // --- List Tile Theme ---
      listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        selectedTileColor: AppConstant.PRIMARY.withOpacity(0.1),
        iconColor: AppConstant.WHITE.withOpacity(0.7),
        textColor: AppConstant.WHITE,
        titleTextStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppConstant.WHITE,
        ),
        subtitleTextStyle: TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          color: AppConstant.WHITE.withOpacity(0.6),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      
      // --- Drawer Theme ---
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppConstant.BG_COLOR,
        elevation: 16,
        width: 280,
      ),
      
      // --- Navigation Rail Theme ---
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppConstant.BG_COLOR,
        selectedIconTheme: const IconThemeData(
          color: AppConstant.PRIMARY,
          size: 24,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppConstant.WHITE.withOpacity(0.6),
          size: 24,
        ),
        selectedLabelTextStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppConstant.PRIMARY,
        ),
        unselectedLabelTextStyle: TextStyle(
          fontFamily: 'Lufga',
          fontSize: 12,
          color: AppConstant.WHITE.withOpacity(0.6),
        ),
      ),
      
      // --- Bottom Navigation Bar Theme ---
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppConstant.BG_COLOR,
        elevation: 8,
        selectedItemColor: AppConstant.PRIMARY,
        unselectedItemColor: AppConstant.WHITE.withOpacity(0.6),
        selectedIconTheme: const IconThemeData(
          color: AppConstant.PRIMARY,
          size: 24,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppConstant.WHITE.withOpacity(0.6),
          size: 24,
        ),
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      
      // --- Navigation Bar Theme (Material 3) ---
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppConstant.BG_COLOR,
        elevation: 8,
        height: 80,
        indicatorColor: AppConstant.PRIMARY.withOpacity(0.2),
        iconTheme: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(color: AppConstant.PRIMARY, size: 24);
          }
          return IconThemeData(
            color: AppConstant.WHITE.withOpacity(0.6),
            size: 24,
          );
        }),
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const TextStyle(
              fontFamily: 'Lufga',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppConstant.PRIMARY,
            );
          }
          return TextStyle(
            fontFamily: 'Lufga',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppConstant.WHITE.withOpacity(0.6),
          );
        }),
      ),
      
      // --- Tab Bar Theme ---
      tabBarTheme: TabBarThemeData(
        labelColor: AppConstant.PRIMARY,
        unselectedLabelColor: AppConstant.WHITE.withOpacity(0.6),
        indicatorColor: AppConstant.PRIMARY,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        overlayColor: MaterialStateProperty.all(
          AppConstant.PRIMARY.withOpacity(0.1),
        ),
      ),
      
      // --- Icon Theme ---
      iconTheme: IconThemeData(
        color: AppConstant.WHITE.withOpacity(0.87),
        size: 24,
      ),
      primaryIconTheme: const IconThemeData(
        color: AppConstant.PRIMARY,
        size: 24,
      ),
      
      // --- Button Themes ---
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstant.PRIMARY,
          foregroundColor: AppConstant.WHITE,
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.3),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(64, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Lufga',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppConstant.PRIMARY,
          foregroundColor: AppConstant.WHITE,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(64, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Lufga',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppConstant.PRIMARY,
          side: const BorderSide(color: AppConstant.PRIMARY, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          minimumSize: const Size(64, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Lufga',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppConstant.PRIMARY,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          minimumSize: const Size(64, 36),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Lufga',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppConstant.WHITE.withOpacity(0.87),
          highlightColor: AppConstant.PRIMARY.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          minimumSize: const Size(40, 40),
          iconSize: 24,
        ),
      ),
      
      // --- Floating Action Button Theme ---
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppConstant.PRIMARY,
        foregroundColor: AppConstant.WHITE,
        elevation: 6,
        highlightElevation: 12,
        shape: CircleBorder(),
        iconSize: 24,
      ),
      
      // --- Toggle Buttons Theme ---
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: AppConstant.WHITE,
        fillColor: AppConstant.PRIMARY,
        color: AppConstant.WHITE.withOpacity(0.6),
        selectedBorderColor: AppConstant.PRIMARY,
        borderColor: AppConstant.WHITE.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        borderWidth: 1.5,
        textStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      
      // --- Segmented Button Theme ---
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return AppConstant.PRIMARY;
            }
            return Colors.transparent;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return AppConstant.WHITE;
            }
            return AppConstant.WHITE.withOpacity(0.6);
          }),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontFamily: 'Lufga',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      
      // --- Switch Theme ---
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppConstant.PRIMARY;
          }
          return AppConstant.WHITE.withOpacity(0.6);
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppConstant.PRIMARY.withOpacity(0.5);
          }
          return AppConstant.WHITE.withOpacity(0.3);
        }),
        overlayColor: MaterialStateProperty.all(
          AppConstant.PRIMARY.withOpacity(0.1),
        ),
      ),
      
      // --- Checkbox Theme ---
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppConstant.PRIMARY;
          }
          return Colors.transparent;
        }),
        checkColor: MaterialStateProperty.all(AppConstant.WHITE),
        side: BorderSide(
          color: AppConstant.WHITE.withOpacity(0.6),
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        overlayColor: MaterialStateProperty.all(
          AppConstant.PRIMARY.withOpacity(0.1),
        ),
      ),
      
      // --- Radio Theme ---
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppConstant.PRIMARY;
          }
          return AppConstant.WHITE.withOpacity(0.6);
        }),
        overlayColor: MaterialStateProperty.all(
          AppConstant.PRIMARY.withOpacity(0.1),
        ),
      ),
      
      // --- Slider Theme ---
      sliderTheme: SliderThemeData(
        activeTrackColor: AppConstant.PRIMARY,
        inactiveTrackColor: AppConstant.WHITE.withOpacity(0.3),
        thumbColor: AppConstant.PRIMARY,
        overlayColor: AppConstant.PRIMARY.withOpacity(0.2),
        valueIndicatorColor: AppConstant.PRIMARY,
        valueIndicatorTextStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 12,
          color: AppConstant.WHITE,
        ),
        trackHeight: 4,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
      ),
      
      // --- Progress Indicator Theme ---
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppConstant.PRIMARY,
        linearTrackColor: AppConstant.BODY_COLOR,
        circularTrackColor: AppConstant.BODY_COLOR,
        linearMinHeight: 4,
      ),
      
      // --- Input Decoration Theme ---
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppConstant.WHITE.withOpacity(0.05),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppConstant.WHITE.withOpacity(0.3),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppConstant.WHITE.withOpacity(0.3),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppConstant.PRIMARY,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppConstant.WHITE.withOpacity(0.1),
            width: 1,
          ),
        ),
        labelStyle: TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          color: AppConstant.WHITE.withOpacity(0.6),
        ),
        floatingLabelStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          color: AppConstant.PRIMARY,
        ),
        hintStyle: TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          color: AppConstant.WHITE.withOpacity(0.4),
        ),
        errorStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 12,
          color: Colors.redAccent,
        ),
        prefixIconColor: AppConstant.WHITE.withOpacity(0.6),
        suffixIconColor: AppConstant.WHITE.withOpacity(0.6),
      ),
      
      // --- Dropdown Menu Theme ---
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          color: AppConstant.WHITE,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppConstant.WHITE.withOpacity(0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        menuStyle: MenuStyle(
          backgroundColor: MaterialStateProperty.all(
            AppConstant.BODY_COLOR,
          ),
          elevation: MaterialStateProperty.all(8),
        ),
      ),
      
      // --- Menu Theme ---
      menuTheme: MenuThemeData(
        style: MenuStyle(
          backgroundColor: MaterialStateProperty.all(
            AppConstant.BODY_COLOR,
          ),
          elevation: MaterialStateProperty.all(8),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 8),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      
      menuButtonTheme: MenuButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(AppConstant.WHITE),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontFamily: 'Lufga', fontSize: 14),
          ),
        ),
      ),
      
      // --- Popup Menu Theme ---
      popupMenuTheme: PopupMenuThemeData(
        color: AppConstant.BODY_COLOR,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          color: AppConstant.WHITE,
        ),
      ),
      
      // --- Tooltip Theme ---
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppConstant.BODY_COLOR,
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 12,
          color: AppConstant.WHITE,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        margin: const EdgeInsets.all(4),
        waitDuration: const Duration(milliseconds: 500),
        showDuration: const Duration(seconds: 2),
      ),
      
      // --- Banner Theme ---
      bannerTheme: MaterialBannerThemeData(
        backgroundColor: AppConstant.BODY_COLOR,
        contentTextStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          color: AppConstant.WHITE,
        ),
        padding: const EdgeInsets.all(16),
      ),
      
      // --- Expansion Tile Theme ---
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        textColor: AppConstant.WHITE,
        iconColor: AppConstant.WHITE.withOpacity(0.7),
        collapsedTextColor: AppConstant.WHITE.withOpacity(0.87),
        collapsedIconColor: AppConstant.WHITE.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      
      // --- Search Bar Theme ---
      searchBarTheme: SearchBarThemeData(
        backgroundColor: MaterialStateProperty.all(
          AppConstant.WHITE.withOpacity(0.05),
        ),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontFamily: 'Lufga', fontSize: 14, color: AppConstant.WHITE),
        ),
        hintStyle: MaterialStateProperty.all(
          TextStyle(
            fontFamily: 'Lufga',
            fontSize: 14,
            color: AppConstant.WHITE.withOpacity(0.4),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      
      // --- Search View Theme ---
      searchViewTheme: SearchViewThemeData(
        backgroundColor: AppConstant.BG_COLOR,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        dividerColor: AppConstant.WHITE.withOpacity(0.12),
        headerTextStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 16,
          color: AppConstant.WHITE,
        ),
        headerHintStyle: TextStyle(
          fontFamily: 'Lufga',
          fontSize: 16,
          color: AppConstant.WHITE.withOpacity(0.4),
        ),
      ),
      
      // --- Badge Theme ---
      badgeTheme: BadgeThemeData(
        backgroundColor: Colors.redAccent,
        textColor: AppConstant.WHITE,
        smallSize: 6,
        largeSize: 16,
        textStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      // --- Date Picker Theme ---
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppConstant.BODY_COLOR,
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.4),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        headerBackgroundColor: AppConstant.PRIMARY,
        headerForegroundColor: AppConstant.WHITE,
        headerHeadlineStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        weekdayStyle: TextStyle(
          fontFamily: 'Lufga',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppConstant.WHITE.withOpacity(0.6),
        ),
        dayStyle: const TextStyle(fontFamily: 'Lufga', fontSize: 14),
        yearStyle: const TextStyle(fontFamily: 'Lufga', fontSize: 14),
        dayForegroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppConstant.WHITE;
          }
          if (states.contains(MaterialState.disabled)) {
            return AppConstant.WHITE.withOpacity(0.3);
          }
          return AppConstant.WHITE;
        }),
        dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppConstant.PRIMARY;
          }
          return Colors.transparent;
        }),
        todayBorder: const BorderSide(color: AppConstant.PRIMARY, width: 1),
        todayForegroundColor: MaterialStateProperty.all(AppConstant.PRIMARY),
      ),
      
      // --- Time Picker Theme ---
      timePickerTheme: TimePickerThemeData(
        backgroundColor: AppConstant.BODY_COLOR,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hourMinuteTextColor: AppConstant.WHITE,
        hourMinuteColor: AppConstant.WHITE.withOpacity(0.1),
        dayPeriodTextColor: AppConstant.WHITE,
        dayPeriodColor: AppConstant.WHITE.withOpacity(0.1),
        dialBackgroundColor: AppConstant.WHITE.withOpacity(0.1),
        dialHandColor: AppConstant.PRIMARY,
        dialTextColor: AppConstant.WHITE,
        entryModeIconColor: AppConstant.PRIMARY,
        hourMinuteTextStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
        dayPeriodTextStyle: const TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        helpTextStyle: TextStyle(
          fontFamily: 'Lufga',
          fontSize: 14,
          color: AppConstant.WHITE.withOpacity(0.6),
        ),
      ),
      
      // --- Color Scheme ---
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppConstant.PRIMARY,
        onPrimary: AppConstant.WHITE,
        primaryContainer: AppConstant.PRIMARY.withOpacity(0.7),
        onPrimaryContainer: AppConstant.WHITE,
        secondary: AppConstant.SECONDARY,
        onSecondary: AppConstant.WHITE,
        secondaryContainer: AppConstant.SECONDARY.withOpacity(0.7),
        onSecondaryContainer: AppConstant.WHITE,
        tertiary: const Color(0xFF7C4DFF),
        onTertiary: AppConstant.WHITE,
        tertiaryContainer: const Color(0xFF5E35B1),
        onTertiaryContainer: AppConstant.WHITE,
        error: Colors.redAccent,
        onError: AppConstant.WHITE,
        errorContainer: const Color(0xFFCF6679),
        onErrorContainer: AppConstant.WHITE,
        background: AppConstant.BG_COLOR,
        onBackground: AppConstant.WHITE,
        surface: AppConstant.BODY_COLOR,
        onSurface: AppConstant.WHITE,
        surfaceVariant: AppConstant.BODY_COLOR,
        onSurfaceVariant: AppConstant.WHITE,
        outline: AppConstant.WHITE.withOpacity(0.3),
        outlineVariant: AppConstant.WHITE.withOpacity(0.1),
        shadow: Colors.black,
        scrim: Colors.black54,
        inverseSurface: AppConstant.WHITE,
        onInverseSurface: AppConstant.BG_COLOR,
        inversePrimary: AppConstant.PRIMARY,
        surfaceTint: AppConstant.PRIMARY,
      ),
      
      // --- Platform Specific Overrides ---
      platform: TargetPlatform.android,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      
      // --- Scrollbar Theme ---
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(
          AppConstant.WHITE.withOpacity(0.3),
        ),
        trackColor: MaterialStateProperty.all(
          AppConstant.WHITE.withOpacity(0.1),
        ),
        trackBorderColor: MaterialStateProperty.all(Colors.transparent),
        radius: const Radius.circular(4),
        thickness: MaterialStateProperty.all(6),
        thumbVisibility: MaterialStateProperty.all(false),
        trackVisibility: MaterialStateProperty.all(false),
        interactive: true,
      ),
      
      // --- Page Transitions ---
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  // ============================================================================
  // TEXT THEME BUILDER
  // ============================================================================
  static TextTheme _buildTextTheme(Color baseColor) {
    return TextTheme(
      // Display styles (largest text)
      displayLarge: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        color: AppConstant.WHITE,
        height: 1.12,
      ),
      displayMedium: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 45,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: AppConstant.WHITE,
        height: 1.16,
      ),
      displaySmall: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: AppConstant.WHITE,
        height: 1.22,
      ),
      
      // Headline styles
      headlineLarge: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 32,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: AppConstant.WHITE,
        height: 1.25,
      ),
      headlineMedium: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: AppConstant.WHITE,
        height: 1.29,
      ),
      headlineSmall: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: AppConstant.WHITE,
        height: 1.33,
      ),
      
      // Title styles
      titleLarge: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 22,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: AppConstant.WHITE,
        height: 1.27,
      ),
      titleMedium: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: AppConstant.WHITE,
        height: 1.50,
      ),
      titleSmall: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: AppConstant.WHITE,
        height: 1.43,
      ),
      
      // Body styles
      bodyLarge: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: AppConstant.WHITE,
        height: 1.50,
      ),
      bodyMedium: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppConstant.WHITE,
        height: 1.43,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Lufga',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: AppConstant.WHITE.withOpacity(0.6),
        height: 1.33,
      ),
      
      // Label styles
      labelLarge: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: AppConstant.WHITE,
        height: 1.43,
      ),
      labelMedium: const TextStyle(
        fontFamily: 'Lufga',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: AppConstant.WHITE,
        height: 1.33,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Lufga',
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: AppConstant.WHITE.withOpacity(0.8),
        height: 1.45,
      ),
    );
  }
}