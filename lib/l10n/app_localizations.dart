import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @vietnamese.
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get vietnamese;

  /// No description provided for @taiwanese.
  ///
  /// In en, this message translates to:
  /// **'Taiwanese'**
  String get taiwanese;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in;

  /// No description provided for @sign_out.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get sign_out;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @email_address.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get email_address;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get remember_me;

  /// No description provided for @sign_in_to_start_your_session.
  ///
  /// In en, this message translates to:
  /// **'Sign in to start your session'**
  String get sign_in_to_start_your_session;

  /// No description provided for @confirm_sign_out.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get confirm_sign_out;

  /// No description provided for @basic_data.
  ///
  /// In en, this message translates to:
  /// **'Basic data'**
  String get basic_data;

  /// No description provided for @enter_data.
  ///
  /// In en, this message translates to:
  /// **'Enter data'**
  String get enter_data;

  /// No description provided for @synchronize_the_card.
  ///
  /// In en, this message translates to:
  /// **'Back up'**
  String get synchronize_the_card;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @group_worker.
  ///
  /// In en, this message translates to:
  /// **'Group/Worker'**
  String get group_worker;

  /// No description provided for @worker_card.
  ///
  /// In en, this message translates to:
  /// **'Worker Card'**
  String get worker_card;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'CARD'**
  String get card;

  /// No description provided for @card_issuance.
  ///
  /// In en, this message translates to:
  /// **'Card issuance'**
  String get card_issuance;

  /// No description provided for @card_lower.
  ///
  /// In en, this message translates to:
  /// **'card'**
  String get card_lower;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'product'**
  String get product;

  /// No description provided for @size_list.
  ///
  /// In en, this message translates to:
  /// **'Size list'**
  String get size_list;

  /// No description provided for @account_list.
  ///
  /// In en, this message translates to:
  /// **'Account List'**
  String get account_list;

  /// No description provided for @worker_leave_list.
  ///
  /// In en, this message translates to:
  /// **'Worker Leave List'**
  String get worker_leave_list;

  /// No description provided for @permission_list.
  ///
  /// In en, this message translates to:
  /// **'Permission list'**
  String get permission_list;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'Copyright'**
  String get copyright;

  /// No description provided for @all_rights_reserved.
  ///
  /// In en, this message translates to:
  /// **'All rights reserved'**
  String get all_rights_reserved;

  /// No description provided for @click_me.
  ///
  /// In en, this message translates to:
  /// **'Click me'**
  String get click_me;

  /// No description provided for @worker.
  ///
  /// In en, this message translates to:
  /// **'Worker'**
  String get worker;

  /// No description provided for @attendance_title.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendance_title;

  /// No description provided for @attendance_actions_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get attendance_actions_close;

  /// No description provided for @attendance_time_month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get attendance_time_month;

  /// No description provided for @attendance_time_year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get attendance_time_year;

  /// No description provided for @attendance_table_stt.
  ///
  /// In en, this message translates to:
  /// **'#'**
  String get attendance_table_stt;

  /// No description provided for @attendance_table_worker_code.
  ///
  /// In en, this message translates to:
  /// **'Worker Code'**
  String get attendance_table_worker_code;

  /// No description provided for @attendance_table_worker_name.
  ///
  /// In en, this message translates to:
  /// **'Worker Name'**
  String get attendance_table_worker_name;

  /// No description provided for @attendance_table_group_name.
  ///
  /// In en, this message translates to:
  /// **'Group Name'**
  String get attendance_table_group_name;

  /// No description provided for @attendance_table_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get attendance_table_total;

  /// No description provided for @attendance_management_title.
  ///
  /// In en, this message translates to:
  /// **'Attendance Management'**
  String get attendance_management_title;

  /// No description provided for @attendance_management_manager.
  ///
  /// In en, this message translates to:
  /// **'Attendance Manager'**
  String get attendance_management_manager;

  /// No description provided for @attendance_management_monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly Attendance'**
  String get attendance_management_monthly;

  /// No description provided for @attendance_management_daily.
  ///
  /// In en, this message translates to:
  /// **'Daily Attendance'**
  String get attendance_management_daily;

  /// No description provided for @attendance_worker_code.
  ///
  /// In en, this message translates to:
  /// **'Worker Code'**
  String get attendance_worker_code;

  /// No description provided for @attendance_worker_name.
  ///
  /// In en, this message translates to:
  /// **'Worker Name'**
  String get attendance_worker_name;

  /// No description provided for @attendance_worker_group_name.
  ///
  /// In en, this message translates to:
  /// **'Group Name'**
  String get attendance_worker_group_name;

  /// No description provided for @attendance_grid_auto_size_columns.
  ///
  /// In en, this message translates to:
  /// **'Auto size columns'**
  String get attendance_grid_auto_size_columns;

  /// No description provided for @attendance_grid_reset_columns.
  ///
  /// In en, this message translates to:
  /// **'Reset columns'**
  String get attendance_grid_reset_columns;

  /// No description provided for @attendance_grid_pin_worker_code.
  ///
  /// In en, this message translates to:
  /// **'Pin Worker Code'**
  String get attendance_grid_pin_worker_code;

  /// No description provided for @attendance_grid_unpin_worker_code.
  ///
  /// In en, this message translates to:
  /// **'Unpin Worker Code'**
  String get attendance_grid_unpin_worker_code;

  /// No description provided for @attendance_grid_column_pinned.
  ///
  /// In en, this message translates to:
  /// **'Worker Code pinned'**
  String get attendance_grid_column_pinned;

  /// No description provided for @attendance_grid_column_unpinned.
  ///
  /// In en, this message translates to:
  /// **'Worker Code unpinned'**
  String get attendance_grid_column_unpinned;

  /// No description provided for @attendance_grid_export_csv.
  ///
  /// In en, this message translates to:
  /// **'Export to CSV'**
  String get attendance_grid_export_csv;

  /// No description provided for @attendance_filters_all_groups.
  ///
  /// In en, this message translates to:
  /// **'All groups'**
  String get attendance_filters_all_groups;

  /// No description provided for @attendance_filters_select_month.
  ///
  /// In en, this message translates to:
  /// **'Select month'**
  String get attendance_filters_select_month;

  /// No description provided for @attendance_filters_select_year.
  ///
  /// In en, this message translates to:
  /// **'Select year'**
  String get attendance_filters_select_year;

  /// No description provided for @attendance_filters_select_group.
  ///
  /// In en, this message translates to:
  /// **'Select group'**
  String get attendance_filters_select_group;

  /// No description provided for @attendance_filters_search_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Search by code, name'**
  String get attendance_filters_search_placeholder;

  /// No description provided for @attendance_import_excel.
  ///
  /// In en, this message translates to:
  /// **'Import from excel'**
  String get attendance_import_excel;

  /// No description provided for @attendance_import_preparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing import...'**
  String get attendance_import_preparing;

  /// No description provided for @attendance_import_processing.
  ///
  /// In en, this message translates to:
  /// **'Processing data...'**
  String get attendance_import_processing;

  /// No description provided for @attendance_import_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed!'**
  String get attendance_import_completed;

  /// No description provided for @attendance_import_select_file.
  ///
  /// In en, this message translates to:
  /// **'Please select a file'**
  String get attendance_import_select_file;

  /// No description provided for @attendance_import_successful.
  ///
  /// In en, this message translates to:
  /// **'Import successful'**
  String get attendance_import_successful;

  /// No description provided for @attendance_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Import failed'**
  String get attendance_import_failed;

  /// No description provided for @attendance_export_successful.
  ///
  /// In en, this message translates to:
  /// **'Export successful'**
  String get attendance_export_successful;

  /// No description provided for @attendance_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Export failed'**
  String get attendance_export_failed;

  /// No description provided for @attendance_messages_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading data...'**
  String get attendance_messages_loading;

  /// No description provided for @attendance_messages_no_data.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get attendance_messages_no_data;

  /// No description provided for @attendance_messages_error_loading.
  ///
  /// In en, this message translates to:
  /// **'Error loading data'**
  String get attendance_messages_error_loading;

  /// No description provided for @attendance_messages_error_pin_column.
  ///
  /// In en, this message translates to:
  /// **'Error pinning/unpinning column'**
  String get attendance_messages_error_pin_column;

  /// No description provided for @internal_size.
  ///
  /// In en, this message translates to:
  /// **'Internal size'**
  String get internal_size;

  /// No description provided for @shrimp_type_code.
  ///
  /// In en, this message translates to:
  /// **'Shrimp type'**
  String get shrimp_type_code;

  /// No description provided for @material_code.
  ///
  /// In en, this message translates to:
  /// **'Material code '**
  String get material_code;

  /// No description provided for @material_description.
  ///
  /// In en, this message translates to:
  /// **'Material'**
  String get material_description;

  /// No description provided for @subtraction.
  ///
  /// In en, this message translates to:
  /// **'Subtraction'**
  String get subtraction;

  /// No description provided for @product_type.
  ///
  /// In en, this message translates to:
  /// **'shrimp type'**
  String get product_type;

  /// No description provided for @stage_code.
  ///
  /// In en, this message translates to:
  /// **'Stage code '**
  String get stage_code;

  /// No description provided for @size_code.
  ///
  /// In en, this message translates to:
  /// **'Size code '**
  String get size_code;

  /// No description provided for @material_batch_code.
  ///
  /// In en, this message translates to:
  /// **'Material batch code'**
  String get material_batch_code;

  /// No description provided for @antibiotic_group_code.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic'**
  String get antibiotic_group_code;

  /// No description provided for @part_code.
  ///
  /// In en, this message translates to:
  /// **'Part'**
  String get part_code;

  /// No description provided for @basket.
  ///
  /// In en, this message translates to:
  /// **'Basket'**
  String get basket;

  /// No description provided for @shift.
  ///
  /// In en, this message translates to:
  /// **'Shift'**
  String get shift;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @manual_add_title.
  ///
  /// In en, this message translates to:
  /// **'Add manually'**
  String get manual_add_title;

  /// No description provided for @import.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get import;

  /// No description provided for @import_excel.
  ///
  /// In en, this message translates to:
  /// **'Import excel'**
  String get import_excel;

  /// No description provided for @exporting.
  ///
  /// In en, this message translates to:
  /// **'Exporting...'**
  String get exporting;

  /// No description provided for @export_excel.
  ///
  /// In en, this message translates to:
  /// **'Export excel'**
  String get export_excel;

  /// No description provided for @export_excel_edit.
  ///
  /// In en, this message translates to:
  /// **'Export excel edit'**
  String get export_excel_edit;

  /// No description provided for @pto_tub_edit.
  ///
  /// In en, this message translates to:
  /// **'Pto_tub_edit'**
  String get pto_tub_edit;

  /// No description provided for @select_excel_file.
  ///
  /// In en, this message translates to:
  /// **'Select excel file'**
  String get select_excel_file;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @note_add.
  ///
  /// In en, this message translates to:
  /// **'Add note'**
  String get note_add;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @enter_keywords.
  ///
  /// In en, this message translates to:
  /// **'Enter keywords'**
  String get enter_keywords;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @records.
  ///
  /// In en, this message translates to:
  /// **'records'**
  String get records;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @stt.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get stt;

  /// No description provided for @no_data_available.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get no_data_available;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save_changes.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get save_changes;

  /// No description provided for @confirm_deletion.
  ///
  /// In en, this message translates to:
  /// **'Confirm deletion'**
  String get confirm_deletion;

  /// No description provided for @are_you_sure_you_want_to_delete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete'**
  String get are_you_sure_you_want_to_delete;

  /// No description provided for @this_action_cannot_be_undone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get this_action_cannot_be_undone;

  /// No description provided for @agree_to_delete.
  ///
  /// In en, this message translates to:
  /// **'Agree to delete!'**
  String get agree_to_delete;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @pto.
  ///
  /// In en, this message translates to:
  /// **'PTO'**
  String get pto;

  /// No description provided for @pes.
  ///
  /// In en, this message translates to:
  /// **'PES'**
  String get pes;

  /// No description provided for @is_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get is_active;

  /// No description provided for @quit.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get quit;

  /// No description provided for @unit_salary_code.
  ///
  /// In en, this message translates to:
  /// **'Unit salary code'**
  String get unit_salary_code;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @card_number_lookup.
  ///
  /// In en, this message translates to:
  /// **'Card number lookup'**
  String get card_number_lookup;

  /// No description provided for @parent.
  ///
  /// In en, this message translates to:
  /// **'Belong section'**
  String get parent;

  /// No description provided for @edit_pto_tub.
  ///
  /// In en, this message translates to:
  /// **'EDIT PTO TUB'**
  String get edit_pto_tub;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// No description provided for @percentage.
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get percentage;

  /// No description provided for @group.
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get group;

  /// No description provided for @group_list.
  ///
  /// In en, this message translates to:
  /// **'Group list'**
  String get group_list;

  /// No description provided for @group_code.
  ///
  /// In en, this message translates to:
  /// **'Group code  '**
  String get group_code;

  /// No description provided for @group_name.
  ///
  /// In en, this message translates to:
  /// **'Group name '**
  String get group_name;

  /// No description provided for @group_code_required.
  ///
  /// In en, this message translates to:
  /// **'Group code is required'**
  String get group_code_required;

  /// No description provided for @group_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Group code is invalid'**
  String get group_code_invalid;

  /// No description provided for @group_name_required.
  ///
  /// In en, this message translates to:
  /// **'Group name is required'**
  String get group_name_required;

  /// No description provided for @total_group.
  ///
  /// In en, this message translates to:
  /// **'Total group: '**
  String get total_group;

  /// No description provided for @edit_group.
  ///
  /// In en, this message translates to:
  /// **'Edit group'**
  String get edit_group;

  /// No description provided for @delete_group.
  ///
  /// In en, this message translates to:
  /// **'Delete group'**
  String get delete_group;

  /// No description provided for @worker_count.
  ///
  /// In en, this message translates to:
  /// **'Worker count'**
  String get worker_count;

  /// No description provided for @pto_group_statistics.
  ///
  /// In en, this message translates to:
  /// **'PTO_group'**
  String get pto_group_statistics;

  /// No description provided for @pto_worker_statistics.
  ///
  /// In en, this message translates to:
  /// **'PTO_worker'**
  String get pto_worker_statistics;

  /// No description provided for @pto_tai_statistics.
  ///
  /// In en, this message translates to:
  /// **'PTO_tai'**
  String get pto_tai_statistics;

  /// No description provided for @pto_product_statistics.
  ///
  /// In en, this message translates to:
  /// **'PTO_product'**
  String get pto_product_statistics;

  /// No description provided for @pto_kalv_statistics.
  ///
  /// In en, this message translates to:
  /// **'PTO_WorkShift'**
  String get pto_kalv_statistics;

  /// No description provided for @pto_tub_statistics.
  ///
  /// In en, this message translates to:
  /// **'PTO_Tub'**
  String get pto_tub_statistics;

  /// No description provided for @pto_detail_statistics.
  ///
  /// In en, this message translates to:
  /// **'PTO_Detail'**
  String get pto_detail_statistics;

  /// No description provided for @pto_pro_summary_statistics.
  ///
  /// In en, this message translates to:
  /// **'Pto_ProSummary_statistics'**
  String get pto_pro_summary_statistics;

  /// No description provided for @pto_worktime.
  ///
  /// In en, this message translates to:
  /// **'PTO Worktime'**
  String get pto_worktime;

  /// No description provided for @pto_conveyor.
  ///
  /// In en, this message translates to:
  /// **'PTO Conveyor'**
  String get pto_conveyor;

  /// No description provided for @pto_worker.
  ///
  /// In en, this message translates to:
  /// **'PTO Worker'**
  String get pto_worker;

  /// No description provided for @pto_group.
  ///
  /// In en, this message translates to:
  /// **'PTO Group'**
  String get pto_group;

  /// No description provided for @pto_basket.
  ///
  /// In en, this message translates to:
  /// **'PTO Tub'**
  String get pto_basket;

  /// No description provided for @pto_product.
  ///
  /// In en, this message translates to:
  /// **'PTO Product'**
  String get pto_product;

  /// No description provided for @pto_detail.
  ///
  /// In en, this message translates to:
  /// **'PTO Detail'**
  String get pto_detail;

  /// No description provided for @pto_error.
  ///
  /// In en, this message translates to:
  /// **'Error Records'**
  String get pto_error;

  /// No description provided for @pto_error_summary.
  ///
  /// In en, this message translates to:
  /// **'Error Summary'**
  String get pto_error_summary;

  /// No description provided for @pto_statistics_report_by_worktime.
  ///
  /// In en, this message translates to:
  /// **'PTO Statistics Report by Worktime'**
  String get pto_statistics_report_by_worktime;

  /// No description provided for @pto_statistics_report_by_conveyor.
  ///
  /// In en, this message translates to:
  /// **'PTO Statistics Report by Conveyor'**
  String get pto_statistics_report_by_conveyor;

  /// No description provided for @pto_statistics_report_by_worker.
  ///
  /// In en, this message translates to:
  /// **'PTO Statistics Report by Worker'**
  String get pto_statistics_report_by_worker;

  /// No description provided for @pto_statistics_report_by_group.
  ///
  /// In en, this message translates to:
  /// **'PTO Statistics Report by Group'**
  String get pto_statistics_report_by_group;

  /// No description provided for @pto_statistics_report_by_basket.
  ///
  /// In en, this message translates to:
  /// **'PTO Statistics Report by Basket'**
  String get pto_statistics_report_by_basket;

  /// No description provided for @pto_statistics_report_by_product.
  ///
  /// In en, this message translates to:
  /// **'PTO Statistics Report by Product'**
  String get pto_statistics_report_by_product;

  /// No description provided for @pto_statistics_report_by_detail.
  ///
  /// In en, this message translates to:
  /// **'PTO Statistics Report by Detail'**
  String get pto_statistics_report_by_detail;

  /// No description provided for @worker_list.
  ///
  /// In en, this message translates to:
  /// **'Worker list'**
  String get worker_list;

  /// No description provided for @rfid_card.
  ///
  /// In en, this message translates to:
  /// **'rfid card'**
  String get rfid_card;

  /// No description provided for @group_worker_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Worker group created successfully'**
  String get group_worker_created_successfully;

  /// No description provided for @group_worker_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Worker group updated successfully'**
  String get group_worker_updated_successfully;

  /// No description provided for @group_worker_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Worker group deleted successfully'**
  String get group_worker_deleted_successfully;

  /// No description provided for @group_worker_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Worker group creation failed'**
  String get group_worker_creation_failed;

  /// No description provided for @group_worker_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Worker group deletion failed'**
  String get group_worker_deletion_failed;

  /// No description provided for @group_worker_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Worker group update failed'**
  String get group_worker_update_failed;

  /// No description provided for @groups.
  ///
  /// In en, this message translates to:
  /// **'groups'**
  String get groups;

  /// No description provided for @groups_data.
  ///
  /// In en, this message translates to:
  /// **'GroupsData'**
  String get groups_data;

  /// No description provided for @group_worker_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Worker group exported successfully'**
  String get group_worker_exported_successfully;

  /// No description provided for @group_worker_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Worker group export failed'**
  String get group_worker_export_failed;

  /// No description provided for @group_worker_import_successfully.
  ///
  /// In en, this message translates to:
  /// **'Worker group imported successfully'**
  String get group_worker_import_successfully;

  /// No description provided for @group_worker_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Worker group import failed'**
  String get group_worker_import_failed;

  /// No description provided for @worker_group_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Worker group data statistics'**
  String get worker_group_data_statistics;

  /// No description provided for @worker_group_not_found.
  ///
  /// In en, this message translates to:
  /// **'Worker group not found'**
  String get worker_group_not_found;

  /// No description provided for @import_completed_with_some_errors.
  ///
  /// In en, this message translates to:
  /// **'Import completed with some errors'**
  String get import_completed_with_some_errors;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error: '**
  String get error;

  /// No description provided for @row.
  ///
  /// In en, this message translates to:
  /// **'Row '**
  String get row;

  /// No description provided for @error_occurred.
  ///
  /// In en, this message translates to:
  /// **'Error occurred: '**
  String get error_occurred;

  /// No description provided for @error_inserting_data_data_in_file_is_invalid_or_duplicated.
  ///
  /// In en, this message translates to:
  /// **'Error inserting data: Data in File is invalid or duplicated.'**
  String get error_inserting_data_data_in_file_is_invalid_or_duplicated;

  /// No description provided for @group_.
  ///
  /// In en, this message translates to:
  /// **'Line'**
  String get group_;

  /// No description provided for @worker_code.
  ///
  /// In en, this message translates to:
  /// **'Worker code '**
  String get worker_code;

  /// No description provided for @worker_name.
  ///
  /// In en, this message translates to:
  /// **'Worker name '**
  String get worker_name;

  /// No description provided for @worker_code_required.
  ///
  /// In en, this message translates to:
  /// **'Worker code is required'**
  String get worker_code_required;

  /// No description provided for @worker_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Worker code is invalid'**
  String get worker_code_invalid;

  /// No description provided for @worker_name_required.
  ///
  /// In en, this message translates to:
  /// **'Worker name is required'**
  String get worker_name_required;

  /// No description provided for @group_required.
  ///
  /// In en, this message translates to:
  /// **'Group is required'**
  String get group_required;

  /// No description provided for @select_group.
  ///
  /// In en, this message translates to:
  /// **'Select group'**
  String get select_group;

  /// No description provided for @select_card.
  ///
  /// In en, this message translates to:
  /// **'Select card'**
  String get select_card;

  /// No description provided for @total_worker.
  ///
  /// In en, this message translates to:
  /// **'Total worker: '**
  String get total_worker;

  /// No description provided for @edit_worker.
  ///
  /// In en, this message translates to:
  /// **'Edit worker'**
  String get edit_worker;

  /// No description provided for @delete_worker.
  ///
  /// In en, this message translates to:
  /// **'Delete worker'**
  String get delete_worker;

  /// No description provided for @worker_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Worker created successfully'**
  String get worker_created_successfully;

  /// No description provided for @worker_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Worker updated successfully'**
  String get worker_updated_successfully;

  /// No description provided for @worker_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Worker deleted successfully'**
  String get worker_deleted_successfully;

  /// No description provided for @worker_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Worker creation failed'**
  String get worker_creation_failed;

  /// No description provided for @worker_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Worker update failed'**
  String get worker_update_failed;

  /// No description provided for @worker_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Worker deletion failed'**
  String get worker_deletion_failed;

  /// No description provided for @worker_not_found.
  ///
  /// In en, this message translates to:
  /// **'Worker not found'**
  String get worker_not_found;

  /// No description provided for @specification.
  ///
  /// In en, this message translates to:
  /// **'Specification'**
  String get specification;

  /// No description provided for @workers.
  ///
  /// In en, this message translates to:
  /// **'Workers'**
  String get workers;

  /// No description provided for @workers_data.
  ///
  /// In en, this message translates to:
  /// **'WorkersData'**
  String get workers_data;

  /// No description provided for @worker_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Worker data statistics'**
  String get worker_data_statistics;

  /// No description provided for @worker_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Worker imported successfully'**
  String get worker_imported_successfully;

  /// No description provided for @worker_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Worker import failed'**
  String get worker_import_failed;

  /// No description provided for @worker_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Worker exported successfully'**
  String get worker_exported_successfully;

  /// No description provided for @worker_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Worker export failed'**
  String get worker_export_failed;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @size_shrimp.
  ///
  /// In en, this message translates to:
  /// **'Size shrimp'**
  String get size_shrimp;

  /// No description provided for @size_name.
  ///
  /// In en, this message translates to:
  /// **'Size name '**
  String get size_name;

  /// No description provided for @size_code_required.
  ///
  /// In en, this message translates to:
  /// **'Size code is required'**
  String get size_code_required;

  /// No description provided for @size_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Size code is invalid'**
  String get size_code_invalid;

  /// No description provided for @size_name_required.
  ///
  /// In en, this message translates to:
  /// **'Size name is required'**
  String get size_name_required;

  /// No description provided for @total_size.
  ///
  /// In en, this message translates to:
  /// **'Total size: '**
  String get total_size;

  /// No description provided for @edit_size.
  ///
  /// In en, this message translates to:
  /// **'Edit size'**
  String get edit_size;

  /// No description provided for @delete_size.
  ///
  /// In en, this message translates to:
  /// **'Delete size'**
  String get delete_size;

  /// No description provided for @size_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Size created successfully'**
  String get size_created_successfully;

  /// No description provided for @size_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Size updated successfully'**
  String get size_updated_successfully;

  /// No description provided for @size_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Size deleted successfully'**
  String get size_deleted_successfully;

  /// No description provided for @size_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Size creation failed'**
  String get size_creation_failed;

  /// No description provided for @size_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Size deletion failed'**
  String get size_deletion_failed;

  /// No description provided for @size_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Size update failed'**
  String get size_update_failed;

  /// No description provided for @size_not_found.
  ///
  /// In en, this message translates to:
  /// **'Size not found'**
  String get size_not_found;

  /// No description provided for @size_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Size data statistics'**
  String get size_data_statistics;

  /// No description provided for @size_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Size imported successfully'**
  String get size_imported_successfully;

  /// No description provided for @size_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Size import failed'**
  String get size_import_failed;

  /// No description provided for @size_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Size exported successfully'**
  String get size_exported_successfully;

  /// No description provided for @size_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Size export failed'**
  String get size_export_failed;

  /// No description provided for @product_type_list.
  ///
  /// In en, this message translates to:
  /// **'shrimp type list'**
  String get product_type_list;

  /// No description provided for @product_type_code.
  ///
  /// In en, this message translates to:
  /// **'shrimp type code '**
  String get product_type_code;

  /// No description provided for @product_type_name.
  ///
  /// In en, this message translates to:
  /// **'shrimp type name '**
  String get product_type_name;

  /// No description provided for @product_type_code_required.
  ///
  /// In en, this message translates to:
  /// **'shrimp type code is required'**
  String get product_type_code_required;

  /// No description provided for @product_type_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'shrimp type code is invalid'**
  String get product_type_code_invalid;

  /// No description provided for @product_type_name_required.
  ///
  /// In en, this message translates to:
  /// **'shrimp type name is required'**
  String get product_type_name_required;

  /// No description provided for @total_product_type.
  ///
  /// In en, this message translates to:
  /// **'total shrimp type: '**
  String get total_product_type;

  /// No description provided for @edit_product_type.
  ///
  /// In en, this message translates to:
  /// **'edit shrimp type'**
  String get edit_product_type;

  /// No description provided for @delete_product_type.
  ///
  /// In en, this message translates to:
  /// **'delete shrimp type'**
  String get delete_product_type;

  /// No description provided for @product_type_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'shrimp type created successfully'**
  String get product_type_created_successfully;

  /// No description provided for @product_type_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'shrimp type updated successfully'**
  String get product_type_updated_successfully;

  /// No description provided for @product_type_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'shrimp type deleted successfully'**
  String get product_type_deleted_successfully;

  /// No description provided for @product_type_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'shrimp type creation failed'**
  String get product_type_creation_failed;

  /// No description provided for @product_type_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'shrimp type deletion failed'**
  String get product_type_deletion_failed;

  /// No description provided for @product_type_update_failed.
  ///
  /// In en, this message translates to:
  /// **'shrimp type update failed'**
  String get product_type_update_failed;

  /// No description provided for @product_type_not_found.
  ///
  /// In en, this message translates to:
  /// **'shrimp type not found'**
  String get product_type_not_found;

  /// No description provided for @product_type_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'shrimp type data statistics'**
  String get product_type_data_statistics;

  /// No description provided for @product_type_data.
  ///
  /// In en, this message translates to:
  /// **'shrimp type data'**
  String get product_type_data;

  /// No description provided for @product_type_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'shrimp type imported successfully'**
  String get product_type_imported_successfully;

  /// No description provided for @product_type_import_failed.
  ///
  /// In en, this message translates to:
  /// **'shrimp type import failed'**
  String get product_type_import_failed;

  /// No description provided for @product_type_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'shrimp type exported successfully'**
  String get product_type_exported_successfully;

  /// No description provided for @product_type_export_failed.
  ///
  /// In en, this message translates to:
  /// **'shrimp type export failed'**
  String get product_type_export_failed;

  /// No description provided for @product_list.
  ///
  /// In en, this message translates to:
  /// **'product list'**
  String get product_list;

  /// No description provided for @product_code.
  ///
  /// In en, this message translates to:
  /// **'product code '**
  String get product_code;

  /// No description provided for @product_name.
  ///
  /// In en, this message translates to:
  /// **'product name '**
  String get product_name;

  /// No description provided for @sap_code.
  ///
  /// In en, this message translates to:
  /// **'SAP code '**
  String get sap_code;

  /// No description provided for @g_min.
  ///
  /// In en, this message translates to:
  /// **'g min'**
  String get g_min;

  /// No description provided for @g_max.
  ///
  /// In en, this message translates to:
  /// **'g max'**
  String get g_max;

  /// No description provided for @product_code_required.
  ///
  /// In en, this message translates to:
  /// **'product code is required'**
  String get product_code_required;

  /// No description provided for @product_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'product code is invalid'**
  String get product_code_invalid;

  /// No description provided for @product_name_required.
  ///
  /// In en, this message translates to:
  /// **'product name is required'**
  String get product_name_required;

  /// No description provided for @g_min_invalid.
  ///
  /// In en, this message translates to:
  /// **'g min is invalid'**
  String get g_min_invalid;

  /// No description provided for @g_max_invalid.
  ///
  /// In en, this message translates to:
  /// **'g max is invalid'**
  String get g_max_invalid;

  /// No description provided for @g_min_lower_g_max.
  ///
  /// In en, this message translates to:
  /// **'g min has to lower than g max'**
  String get g_min_lower_g_max;

  /// No description provided for @g_max_greater_g_min.
  ///
  /// In en, this message translates to:
  /// **'g max has to greater g min'**
  String get g_max_greater_g_min;

  /// No description provided for @total_product.
  ///
  /// In en, this message translates to:
  /// **'total product: '**
  String get total_product;

  /// No description provided for @edit_product.
  ///
  /// In en, this message translates to:
  /// **'edit product'**
  String get edit_product;

  /// No description provided for @delete_product.
  ///
  /// In en, this message translates to:
  /// **'delete product'**
  String get delete_product;

  /// No description provided for @product_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'product created successfully'**
  String get product_created_successfully;

  /// No description provided for @product_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'product updated successfully'**
  String get product_updated_successfully;

  /// No description provided for @product_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'product deleted successfully'**
  String get product_deleted_successfully;

  /// No description provided for @product_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'product creation failed'**
  String get product_creation_failed;

  /// No description provided for @product_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'product deletion failed'**
  String get product_deletion_failed;

  /// No description provided for @product_update_failed.
  ///
  /// In en, this message translates to:
  /// **'product update failed'**
  String get product_update_failed;

  /// No description provided for @product_not_found.
  ///
  /// In en, this message translates to:
  /// **'product not found'**
  String get product_not_found;

  /// No description provided for @product_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'product data statistics'**
  String get product_data_statistics;

  /// No description provided for @product_data.
  ///
  /// In en, this message translates to:
  /// **'product data'**
  String get product_data;

  /// No description provided for @product_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'product imported successfully'**
  String get product_imported_successfully;

  /// No description provided for @product_import_failed.
  ///
  /// In en, this message translates to:
  /// **'product import failed'**
  String get product_import_failed;

  /// No description provided for @product_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'product exported successfully'**
  String get product_exported_successfully;

  /// No description provided for @product_export_failed.
  ///
  /// In en, this message translates to:
  /// **'product export failed'**
  String get product_export_failed;

  /// No description provided for @antibiotic.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic group'**
  String get antibiotic;

  /// No description provided for @antibiotic_list.
  ///
  /// In en, this message translates to:
  /// **'antibiotic group list'**
  String get antibiotic_list;

  /// No description provided for @antibiotic_code.
  ///
  /// In en, this message translates to:
  /// **'antibiotic group code '**
  String get antibiotic_code;

  /// No description provided for @antibiotic_name.
  ///
  /// In en, this message translates to:
  /// **'antibiotic group name '**
  String get antibiotic_name;

  /// No description provided for @antibiotic_code_required.
  ///
  /// In en, this message translates to:
  /// **'The antibiotic code is required'**
  String get antibiotic_code_required;

  /// No description provided for @antibiotic_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'The antibiotic code is invalid'**
  String get antibiotic_code_invalid;

  /// No description provided for @antibiotic_name_required.
  ///
  /// In en, this message translates to:
  /// **'The antibiotic group name is required'**
  String get antibiotic_name_required;

  /// No description provided for @total_antibiotic.
  ///
  /// In en, this message translates to:
  /// **'total antibiotic group'**
  String get total_antibiotic;

  /// No description provided for @edit_antibiotic.
  ///
  /// In en, this message translates to:
  /// **'Edit antibiotic group '**
  String get edit_antibiotic;

  /// No description provided for @delete_antibiotic.
  ///
  /// In en, this message translates to:
  /// **'delete antibiotic group'**
  String get delete_antibiotic;

  /// No description provided for @antibiotic_code_already_exists.
  ///
  /// In en, this message translates to:
  /// **'The antibiotic code already exists'**
  String get antibiotic_code_already_exists;

  /// No description provided for @antibiotic_code_must_not_exceed_20_characters.
  ///
  /// In en, this message translates to:
  /// **'The antibiotic code must not exceed 20 characters'**
  String get antibiotic_code_must_not_exceed_20_characters;

  /// No description provided for @antibiotic_description_required.
  ///
  /// In en, this message translates to:
  /// **'The Antibiotic description is required'**
  String get antibiotic_description_required;

  /// No description provided for @antibiotic_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'\'Antibiotic deleted successfully'**
  String get antibiotic_deleted_successfully;

  /// No description provided for @antibiotic_not_found.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic not found'**
  String get antibiotic_not_found;

  /// No description provided for @antibiotic_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic data statistics'**
  String get antibiotic_data_statistics;

  /// No description provided for @antibiotic_data.
  ///
  /// In en, this message translates to:
  /// **'AntibioticData'**
  String get antibiotic_data;

  /// No description provided for @antibiotic_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic imported successfully'**
  String get antibiotic_imported_successfully;

  /// No description provided for @antibiotic_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic import failed'**
  String get antibiotic_import_failed;

  /// No description provided for @antibiotic_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic exported successfully'**
  String get antibiotic_exported_successfully;

  /// No description provided for @antibiotic_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic export failed'**
  String get antibiotic_export_failed;

  /// No description provided for @antibiotic_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic created successfully'**
  String get antibiotic_created_successfully;

  /// No description provided for @antibiotic_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic updated successfully'**
  String get antibiotic_updated_successfully;

  /// No description provided for @antibiotic_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic creation failed'**
  String get antibiotic_creation_failed;

  /// No description provided for @antibiotic_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic deletion failed'**
  String get antibiotic_deletion_failed;

  /// No description provided for @antibiotic_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic update failed'**
  String get antibiotic_update_failed;

  /// No description provided for @material_batch.
  ///
  /// In en, this message translates to:
  /// **'Material batch'**
  String get material_batch;

  /// No description provided for @material_batch_list.
  ///
  /// In en, this message translates to:
  /// **'Material batch list'**
  String get material_batch_list;

  /// No description provided for @material_batch_name.
  ///
  /// In en, this message translates to:
  /// **'Material batch name'**
  String get material_batch_name;

  /// No description provided for @material_batch_code_required.
  ///
  /// In en, this message translates to:
  /// **'Material batch code is required'**
  String get material_batch_code_required;

  /// No description provided for @material_batch_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Material batch code is invalid'**
  String get material_batch_code_invalid;

  /// No description provided for @material_batch_name_required.
  ///
  /// In en, this message translates to:
  /// **'Material batch name is required'**
  String get material_batch_name_required;

  /// No description provided for @total_material_batch.
  ///
  /// In en, this message translates to:
  /// **'Total material batch: '**
  String get total_material_batch;

  /// No description provided for @edit_material_batch.
  ///
  /// In en, this message translates to:
  /// **'Edit material batch'**
  String get edit_material_batch;

  /// No description provided for @delete_material_batch.
  ///
  /// In en, this message translates to:
  /// **'Delete material batch'**
  String get delete_material_batch;

  /// No description provided for @material_code_required.
  ///
  /// In en, this message translates to:
  /// **'Material code is required'**
  String get material_code_required;

  /// No description provided for @material_code_already_exists.
  ///
  /// In en, this message translates to:
  /// **'The material code already exists'**
  String get material_code_already_exists;

  /// No description provided for @material_code_must_not_exceed_20_characters.
  ///
  /// In en, this message translates to:
  /// **'The material code must not exceed 20 characters'**
  String get material_code_must_not_exceed_20_characters;

  /// No description provided for @material_description_required.
  ///
  /// In en, this message translates to:
  /// **'The material description is required'**
  String get material_description_required;

  /// No description provided for @material.
  ///
  /// In en, this message translates to:
  /// **'material'**
  String get material;

  /// No description provided for @material_list.
  ///
  /// In en, this message translates to:
  /// **'Material list'**
  String get material_list;

  /// No description provided for @material_name.
  ///
  /// In en, this message translates to:
  /// **'Material name '**
  String get material_name;

  /// No description provided for @material_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Material code is invalid'**
  String get material_code_invalid;

  /// No description provided for @material_name_required.
  ///
  /// In en, this message translates to:
  /// **'Material name is required'**
  String get material_name_required;

  /// No description provided for @total_material.
  ///
  /// In en, this message translates to:
  /// **'Total material: '**
  String get total_material;

  /// No description provided for @edit_material.
  ///
  /// In en, this message translates to:
  /// **'Edit material'**
  String get edit_material;

  /// No description provided for @delete_material.
  ///
  /// In en, this message translates to:
  /// **'Delete material'**
  String get delete_material;

  /// No description provided for @material_not_found.
  ///
  /// In en, this message translates to:
  /// **'Material not found'**
  String get material_not_found;

  /// No description provided for @material_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Material deleted successfully'**
  String get material_deleted_successfully;

  /// No description provided for @material_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Material data statistics'**
  String get material_data_statistics;

  /// No description provided for @material_data.
  ///
  /// In en, this message translates to:
  /// **'MaterialData'**
  String get material_data;

  /// No description provided for @material_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Material imported successfully'**
  String get material_imported_successfully;

  /// No description provided for @material_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Material import failed'**
  String get material_import_failed;

  /// No description provided for @material_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Material exported successfully'**
  String get material_exported_successfully;

  /// No description provided for @material_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Material export failed'**
  String get material_export_failed;

  /// No description provided for @material_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Material created successfully'**
  String get material_created_successfully;

  /// No description provided for @material_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Material updated successfully'**
  String get material_updated_successfully;

  /// No description provided for @material_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Material creation failed'**
  String get material_creation_failed;

  /// No description provided for @material_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Material deletion failed'**
  String get material_deletion_failed;

  /// No description provided for @material_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Material update failed'**
  String get material_update_failed;

  /// No description provided for @lot_code_required.
  ///
  /// In en, this message translates to:
  /// **'The Lot code is required'**
  String get lot_code_required;

  /// No description provided for @lot_code_already_exists.
  ///
  /// In en, this message translates to:
  /// **'The Lot code already exists'**
  String get lot_code_already_exists;

  /// No description provided for @lot_code_must_not_exceed_20_characters.
  ///
  /// In en, this message translates to:
  /// **'The Lot code must not exceed 20 characters'**
  String get lot_code_must_not_exceed_20_characters;

  /// No description provided for @lot_description_required.
  ///
  /// In en, this message translates to:
  /// **'The Lot description is required'**
  String get lot_description_required;

  /// No description provided for @lot_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Lot deleted successfully'**
  String get lot_deleted_successfully;

  /// No description provided for @lot_not_found.
  ///
  /// In en, this message translates to:
  /// **'Lot not found'**
  String get lot_not_found;

  /// No description provided for @lot_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Lot data statistics'**
  String get lot_data_statistics;

  /// No description provided for @lot_data.
  ///
  /// In en, this message translates to:
  /// **'LotData'**
  String get lot_data;

  /// No description provided for @lot_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Lot imported successfully'**
  String get lot_imported_successfully;

  /// No description provided for @lot_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Lot import failed'**
  String get lot_import_failed;

  /// No description provided for @lot_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Lot exported successfully'**
  String get lot_exported_successfully;

  /// No description provided for @lot_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Lot export failed'**
  String get lot_export_failed;

  /// No description provided for @lot_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Lot created successfully'**
  String get lot_created_successfully;

  /// No description provided for @lot_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Lot updated successfully'**
  String get lot_updated_successfully;

  /// No description provided for @lot_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Lot creation failed'**
  String get lot_creation_failed;

  /// No description provided for @lot_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Lot deletion failed'**
  String get lot_deletion_failed;

  /// No description provided for @lot_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Lot update failed'**
  String get lot_update_failed;

  /// No description provided for @import_file_success.
  ///
  /// In en, this message translates to:
  /// **'Import File Success'**
  String get import_file_success;

  /// No description provided for @import_file_success_but_some_data_may_have_errors.
  ///
  /// In en, this message translates to:
  /// **'Import Success. But some data may have errors.'**
  String get import_file_success_but_some_data_may_have_errors;

  /// No description provided for @stage.
  ///
  /// In en, this message translates to:
  /// **'Stage'**
  String get stage;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @select_unit.
  ///
  /// In en, this message translates to:
  /// **'select unit'**
  String get select_unit;

  /// No description provided for @process_code.
  ///
  /// In en, this message translates to:
  /// **'Process code'**
  String get process_code;

  /// No description provided for @stage_list.
  ///
  /// In en, this message translates to:
  /// **'Stage list'**
  String get stage_list;

  /// No description provided for @stage_name.
  ///
  /// In en, this message translates to:
  /// **'Stage name '**
  String get stage_name;

  /// No description provided for @stage_code_required.
  ///
  /// In en, this message translates to:
  /// **'Stage code is required'**
  String get stage_code_required;

  /// No description provided for @stage_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Stage code is invalid'**
  String get stage_code_invalid;

  /// No description provided for @stage_name_required.
  ///
  /// In en, this message translates to:
  /// **'Stage name is required'**
  String get stage_name_required;

  /// No description provided for @process_code_required.
  ///
  /// In en, this message translates to:
  /// **'Process code is required'**
  String get process_code_required;

  /// No description provided for @process_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Process code is invalid'**
  String get process_code_invalid;

  /// No description provided for @unit_required.
  ///
  /// In en, this message translates to:
  /// **'Unit is required'**
  String get unit_required;

  /// No description provided for @total_stage.
  ///
  /// In en, this message translates to:
  /// **'Total stage: '**
  String get total_stage;

  /// No description provided for @edit_stage.
  ///
  /// In en, this message translates to:
  /// **'Edit stage'**
  String get edit_stage;

  /// No description provided for @delete_stage.
  ///
  /// In en, this message translates to:
  /// **'Delete stage'**
  String get delete_stage;

  /// No description provided for @stage_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Stage created successfully'**
  String get stage_created_successfully;

  /// No description provided for @stage_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Stage updated successfully'**
  String get stage_updated_successfully;

  /// No description provided for @stage_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Stage deleted successfully'**
  String get stage_deleted_successfully;

  /// No description provided for @stage_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Stage creation failed'**
  String get stage_creation_failed;

  /// No description provided for @stage_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Stage deletion failed'**
  String get stage_deletion_failed;

  /// No description provided for @stage_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Stage update failed'**
  String get stage_update_failed;

  /// No description provided for @stage_not_found.
  ///
  /// In en, this message translates to:
  /// **'Stage not found'**
  String get stage_not_found;

  /// No description provided for @stage_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Stage data statistics'**
  String get stage_data_statistics;

  /// No description provided for @stage_data.
  ///
  /// In en, this message translates to:
  /// **'StageData'**
  String get stage_data;

  /// No description provided for @stage_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Stage imported successfully'**
  String get stage_imported_successfully;

  /// No description provided for @stage_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Stage import failed'**
  String get stage_import_failed;

  /// No description provided for @stage_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Stage exported successfully'**
  String get stage_exported_successfully;

  /// No description provided for @stage_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Stage export failed'**
  String get stage_export_failed;

  /// No description provided for @user_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'User created successfully'**
  String get user_created_successfully;

  /// No description provided for @user_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'User updated successfully'**
  String get user_updated_successfully;

  /// No description provided for @user_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'User deleted successfully'**
  String get user_deleted_successfully;

  /// No description provided for @user_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'User creation failed'**
  String get user_creation_failed;

  /// No description provided for @user_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'User deletion failed'**
  String get user_deletion_failed;

  /// No description provided for @user_update_failed.
  ///
  /// In en, this message translates to:
  /// **'User update failed'**
  String get user_update_failed;

  /// No description provided for @user_not_found.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get user_not_found;

  /// No description provided for @user_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'User data statistics'**
  String get user_data_statistics;

  /// No description provided for @user_data.
  ///
  /// In en, this message translates to:
  /// **'UserData'**
  String get user_data;

  /// No description provided for @user_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'User imported successfully'**
  String get user_imported_successfully;

  /// No description provided for @user_import_failed.
  ///
  /// In en, this message translates to:
  /// **'User import failed'**
  String get user_import_failed;

  /// No description provided for @user_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'User exported successfully'**
  String get user_exported_successfully;

  /// No description provided for @user_export_failed.
  ///
  /// In en, this message translates to:
  /// **'User export failed'**
  String get user_export_failed;

  /// No description provided for @specification_list.
  ///
  /// In en, this message translates to:
  /// **'Specification list'**
  String get specification_list;

  /// No description provided for @specification_code.
  ///
  /// In en, this message translates to:
  /// **'Specification code  '**
  String get specification_code;

  /// No description provided for @specification_name.
  ///
  /// In en, this message translates to:
  /// **'Specification name  '**
  String get specification_name;

  /// No description provided for @specification_code_required.
  ///
  /// In en, this message translates to:
  /// **'Specification code is required'**
  String get specification_code_required;

  /// No description provided for @specification_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Specification code is invalid'**
  String get specification_code_invalid;

  /// No description provided for @specification_name_required.
  ///
  /// In en, this message translates to:
  /// **'Specification name is required'**
  String get specification_name_required;

  /// No description provided for @specification_netweight_required.
  ///
  /// In en, this message translates to:
  /// **'Specification netweight is required'**
  String get specification_netweight_required;

  /// No description provided for @specification_netweight_greater_than_0.
  ///
  /// In en, this message translates to:
  /// **'Specification netweight has to be greater or equal than 0'**
  String get specification_netweight_greater_than_0;

  /// No description provided for @total_specification.
  ///
  /// In en, this message translates to:
  /// **'Total specification'**
  String get total_specification;

  /// No description provided for @edit_specification.
  ///
  /// In en, this message translates to:
  /// **'Edit specification'**
  String get edit_specification;

  /// No description provided for @delete_specification.
  ///
  /// In en, this message translates to:
  /// **'Delete specification'**
  String get delete_specification;

  /// No description provided for @specification_netweight.
  ///
  /// In en, this message translates to:
  /// **'Net weight'**
  String get specification_netweight;

  /// No description provided for @specification_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Specification created successfully'**
  String get specification_created_successfully;

  /// No description provided for @specification_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Specification updated successfully'**
  String get specification_updated_successfully;

  /// No description provided for @specification_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Specification deleted successfully'**
  String get specification_deleted_successfully;

  /// No description provided for @specification_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Specification creation failed'**
  String get specification_creation_failed;

  /// No description provided for @specification_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Specification deletion failed'**
  String get specification_deletion_failed;

  /// No description provided for @specification_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Specification update failed'**
  String get specification_update_failed;

  /// No description provided for @specification_not_found.
  ///
  /// In en, this message translates to:
  /// **'Specification not found'**
  String get specification_not_found;

  /// No description provided for @specification_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Specification data statistics'**
  String get specification_data_statistics;

  /// No description provided for @specification_data.
  ///
  /// In en, this message translates to:
  /// **'SpecificationData'**
  String get specification_data;

  /// No description provided for @specification_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Specification imported successfully'**
  String get specification_imported_successfully;

  /// No description provided for @specification_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Specification import failed'**
  String get specification_import_failed;

  /// No description provided for @specification_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Specification exported successfully'**
  String get specification_exported_successfully;

  /// No description provided for @specification_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Specification export failed'**
  String get specification_export_failed;

  /// No description provided for @worktime_list.
  ///
  /// In en, this message translates to:
  /// **'Worktime list'**
  String get worktime_list;

  /// No description provided for @worktime_code.
  ///
  /// In en, this message translates to:
  /// **'Worktime code  '**
  String get worktime_code;

  /// No description provided for @worktime_name.
  ///
  /// In en, this message translates to:
  /// **'Description  '**
  String get worktime_name;

  /// No description provided for @start_time.
  ///
  /// In en, this message translates to:
  /// **'Start time  '**
  String get start_time;

  /// No description provided for @worktime_code_required.
  ///
  /// In en, this message translates to:
  /// **'Worktime code is required'**
  String get worktime_code_required;

  /// No description provided for @worktime_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Worktime code is invalid'**
  String get worktime_code_invalid;

  /// No description provided for @worktime_name_required.
  ///
  /// In en, this message translates to:
  /// **'Worktime name is required'**
  String get worktime_name_required;

  /// No description provided for @start_time_required.
  ///
  /// In en, this message translates to:
  /// **'Start time is required'**
  String get start_time_required;

  /// No description provided for @select_start_time.
  ///
  /// In en, this message translates to:
  /// **'Select start time'**
  String get select_start_time;

  /// No description provided for @total_worktime.
  ///
  /// In en, this message translates to:
  /// **'Total worktime'**
  String get total_worktime;

  /// No description provided for @edit_worktime.
  ///
  /// In en, this message translates to:
  /// **'Edit worktime'**
  String get edit_worktime;

  /// No description provided for @delete_worktime.
  ///
  /// In en, this message translates to:
  /// **'Delete worktime'**
  String get delete_worktime;

  /// No description provided for @shift_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Shift created successfully'**
  String get shift_created_successfully;

  /// No description provided for @shift_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Shift updated successfully'**
  String get shift_updated_successfully;

  /// No description provided for @shift_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Shift deleted successfully'**
  String get shift_deleted_successfully;

  /// No description provided for @shift_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Shift creation failed'**
  String get shift_creation_failed;

  /// No description provided for @shift_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Shift deletion failed'**
  String get shift_deletion_failed;

  /// No description provided for @shift_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Shift update failed'**
  String get shift_update_failed;

  /// No description provided for @shift_not_found.
  ///
  /// In en, this message translates to:
  /// **'Shift not found'**
  String get shift_not_found;

  /// No description provided for @basket_list.
  ///
  /// In en, this message translates to:
  /// **'Basket list'**
  String get basket_list;

  /// No description provided for @basket_code.
  ///
  /// In en, this message translates to:
  /// **'Basket code  '**
  String get basket_code;

  /// No description provided for @basket_name.
  ///
  /// In en, this message translates to:
  /// **'Basket name  '**
  String get basket_name;

  /// No description provided for @number_of_baskets.
  ///
  /// In en, this message translates to:
  /// **'Number of basket'**
  String get number_of_baskets;

  /// No description provided for @basket_code_required.
  ///
  /// In en, this message translates to:
  /// **'Basket code is required'**
  String get basket_code_required;

  /// No description provided for @basket_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Basket code is invalid'**
  String get basket_code_invalid;

  /// No description provided for @basket_name_required.
  ///
  /// In en, this message translates to:
  /// **'Basket name is required'**
  String get basket_name_required;

  /// No description provided for @total_basket.
  ///
  /// In en, this message translates to:
  /// **'Total basket'**
  String get total_basket;

  /// No description provided for @edit_basket.
  ///
  /// In en, this message translates to:
  /// **'Edit basket'**
  String get edit_basket;

  /// No description provided for @delete_basket.
  ///
  /// In en, this message translates to:
  /// **'Delete basket'**
  String get delete_basket;

  /// No description provided for @coi_list.
  ///
  /// In en, this message translates to:
  /// **'Pulper list'**
  String get coi_list;

  /// No description provided for @coi_code.
  ///
  /// In en, this message translates to:
  /// **'Pulper code  '**
  String get coi_code;

  /// No description provided for @coi_name.
  ///
  /// In en, this message translates to:
  /// **'Pulper name  '**
  String get coi_name;

  /// No description provided for @number_of_cois.
  ///
  /// In en, this message translates to:
  /// **'Number of Pulper'**
  String get number_of_cois;

  /// No description provided for @coi_code_required.
  ///
  /// In en, this message translates to:
  /// **'Pulper code is required'**
  String get coi_code_required;

  /// No description provided for @coi_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Pulper code is invalid'**
  String get coi_code_invalid;

  /// No description provided for @coi_name_required.
  ///
  /// In en, this message translates to:
  /// **'Pulper name is required'**
  String get coi_name_required;

  /// No description provided for @total_coi.
  ///
  /// In en, this message translates to:
  /// **'Total Pulper'**
  String get total_coi;

  /// No description provided for @edit_coi.
  ///
  /// In en, this message translates to:
  /// **'Edit Pulper'**
  String get edit_coi;

  /// No description provided for @delete_coi.
  ///
  /// In en, this message translates to:
  /// **'Delete Pulper'**
  String get delete_coi;

  /// No description provided for @basket_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Basket created successfully'**
  String get basket_created_successfully;

  /// No description provided for @basket_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Basket updated successfully'**
  String get basket_updated_successfully;

  /// No description provided for @basket_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Basket deleted successfully'**
  String get basket_deleted_successfully;

  /// No description provided for @basket_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Basket creation failed'**
  String get basket_creation_failed;

  /// No description provided for @basket_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Basket deletion failed'**
  String get basket_deletion_failed;

  /// No description provided for @basket_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Basket update failed'**
  String get basket_update_failed;

  /// No description provided for @basket_not_found.
  ///
  /// In en, this message translates to:
  /// **'Basket not found'**
  String get basket_not_found;

  /// No description provided for @basket_data.
  ///
  /// In en, this message translates to:
  /// **'BasketData'**
  String get basket_data;

  /// No description provided for @basket_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Basket data statistics'**
  String get basket_data_statistics;

  /// No description provided for @basket_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Basket imported successfully'**
  String get basket_imported_successfully;

  /// No description provided for @basket_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Basket import failed'**
  String get basket_import_failed;

  /// No description provided for @basket_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Basket exported successfully'**
  String get basket_exported_successfully;

  /// No description provided for @basket_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Basket export failed'**
  String get basket_export_failed;

  /// No description provided for @tub_pto.
  ///
  /// In en, this message translates to:
  /// **'Tub PTO'**
  String get tub_pto;

  /// No description provided for @product_pto.
  ///
  /// In en, this message translates to:
  /// **'Product PTO'**
  String get product_pto;

  /// No description provided for @card_list.
  ///
  /// In en, this message translates to:
  /// **'Card list'**
  String get card_list;

  /// No description provided for @card_code.
  ///
  /// In en, this message translates to:
  /// **'Card code  '**
  String get card_code;

  /// No description provided for @card_code_required.
  ///
  /// In en, this message translates to:
  /// **'Card code is required'**
  String get card_code_required;

  /// No description provided for @card_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Card code is invalid'**
  String get card_code_invalid;

  /// No description provided for @enter_card_name.
  ///
  /// In en, this message translates to:
  /// **'Enter card name'**
  String get enter_card_name;

  /// No description provided for @enter_id_or_name.
  ///
  /// In en, this message translates to:
  /// **'Card id or card name'**
  String get enter_id_or_name;

  /// No description provided for @total_card.
  ///
  /// In en, this message translates to:
  /// **'Total card'**
  String get total_card;

  /// No description provided for @edit_card.
  ///
  /// In en, this message translates to:
  /// **'Edit card'**
  String get edit_card;

  /// No description provided for @delete_card.
  ///
  /// In en, this message translates to:
  /// **'Delete card'**
  String get delete_card;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan card'**
  String get scan;

  /// No description provided for @info_card.
  ///
  /// In en, this message translates to:
  /// **'Card Information'**
  String get info_card;

  /// No description provided for @search_history.
  ///
  /// In en, this message translates to:
  /// **'Search history'**
  String get search_history;

  /// No description provided for @enter_card_code_or_scan_card.
  ///
  /// In en, this message translates to:
  /// **'Enter card code or scan card'**
  String get enter_card_code_or_scan_card;

  /// No description provided for @no_card_information.
  ///
  /// In en, this message translates to:
  /// **'No card information'**
  String get no_card_information;

  /// No description provided for @please_enter_card_code_to_search_information.
  ///
  /// In en, this message translates to:
  /// **'Please enter card code to search information'**
  String get please_enter_card_code_to_search_information;

  /// No description provided for @card_type.
  ///
  /// In en, this message translates to:
  /// **'Card type'**
  String get card_type;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @rfid_card_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'RfidCard created successfully'**
  String get rfid_card_created_successfully;

  /// No description provided for @rfid_card_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'RfidCard updated successfully'**
  String get rfid_card_updated_successfully;

  /// No description provided for @rfid_card_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'RfidCard deleted successfully'**
  String get rfid_card_deleted_successfully;

  /// No description provided for @rfid_card_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'RfidCard creation failed'**
  String get rfid_card_creation_failed;

  /// No description provided for @rfid_card_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'RfidCard deletion failed'**
  String get rfid_card_deletion_failed;

  /// No description provided for @rfid_card_update_failed.
  ///
  /// In en, this message translates to:
  /// **'RfidCard update failed'**
  String get rfid_card_update_failed;

  /// No description provided for @rfid_card_not_found.
  ///
  /// In en, this message translates to:
  /// **'RfidCard not found'**
  String get rfid_card_not_found;

  /// No description provided for @rfid_card_data.
  ///
  /// In en, this message translates to:
  /// **'RfidCardData'**
  String get rfid_card_data;

  /// No description provided for @rfid_card_data_empty.
  ///
  /// In en, this message translates to:
  /// **'RfidCardDataEmpty'**
  String get rfid_card_data_empty;

  /// No description provided for @rfid_card_data_empty_statistics.
  ///
  /// In en, this message translates to:
  /// **'RfidCard data empty statistics'**
  String get rfid_card_data_empty_statistics;

  /// No description provided for @rfid_card_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'RfidCard imported successfully'**
  String get rfid_card_imported_successfully;

  /// No description provided for @rfid_card_import_failed.
  ///
  /// In en, this message translates to:
  /// **'RfidCard import failed'**
  String get rfid_card_import_failed;

  /// No description provided for @rfid_card_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'RfidCard exported successfully'**
  String get rfid_card_exported_successfully;

  /// No description provided for @rfid_card_export_failed.
  ///
  /// In en, this message translates to:
  /// **'RfidCard export failed'**
  String get rfid_card_export_failed;

  /// No description provided for @rfidcard_add_warning.
  ///
  /// In en, this message translates to:
  /// **'Please select a worker code and enter the card code!'**
  String get rfidcard_add_warning;

  /// No description provided for @rfid_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Rfid created successfully'**
  String get rfid_created_successfully;

  /// No description provided for @rfid_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Rfid deleted successfully'**
  String get rfid_deleted_successfully;

  /// No description provided for @rfid_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Rfid creation failed'**
  String get rfid_creation_failed;

  /// No description provided for @rfid_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Rfid deletion failed'**
  String get rfid_deletion_failed;

  /// No description provided for @rfid_not_found.
  ///
  /// In en, this message translates to:
  /// **'Rfid not found'**
  String get rfid_not_found;

  /// No description provided for @this_basket_already_has_an_rfid.
  ///
  /// In en, this message translates to:
  /// **'This basket already has an RFID'**
  String get this_basket_already_has_an_rfid;

  /// No description provided for @sizing.
  ///
  /// In en, this message translates to:
  /// **'Sizing'**
  String get sizing;

  /// No description provided for @sizing_detail.
  ///
  /// In en, this message translates to:
  /// **'Sizing detail'**
  String get sizing_detail;

  /// No description provided for @sizing_product_antibiotics.
  ///
  /// In en, this message translates to:
  /// **'Sizing Product Antibiotics'**
  String get sizing_product_antibiotics;

  /// No description provided for @sizing_scale.
  ///
  /// In en, this message translates to:
  /// **'Sizing scale'**
  String get sizing_scale;

  /// No description provided for @sizing_general.
  ///
  /// In en, this message translates to:
  /// **'Sizing general'**
  String get sizing_general;

  /// No description provided for @sizing_error.
  ///
  /// In en, this message translates to:
  /// **'Error records'**
  String get sizing_error;

  /// No description provided for @work_time_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Work time created successfully!'**
  String get work_time_created_successfully;

  /// No description provided for @work_time_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'WorkTime creation failed'**
  String get work_time_creation_failed;

  /// No description provided for @work_time_not_found.
  ///
  /// In en, this message translates to:
  /// **'WorkTime not found'**
  String get work_time_not_found;

  /// No description provided for @work_time_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'WorkTime updated successfully'**
  String get work_time_updated_successfully;

  /// No description provided for @work_time_update_failed.
  ///
  /// In en, this message translates to:
  /// **'WorkTime update failed'**
  String get work_time_update_failed;

  /// No description provided for @work_time_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'WorkTime deleted successfully'**
  String get work_time_deleted_successfully;

  /// No description provided for @work_time_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'WorkTime deletion failed'**
  String get work_time_deletion_failed;

  /// No description provided for @sizing_general_statistics.
  ///
  /// In en, this message translates to:
  /// **'Sizing_general'**
  String get sizing_general_statistics;

  /// No description provided for @sizing_scale_statistics.
  ///
  /// In en, this message translates to:
  /// **'Sizing_scale'**
  String get sizing_scale_statistics;

  /// No description provided for @sizing_detail_statistics.
  ///
  /// In en, this message translates to:
  /// **'Sizing_detail'**
  String get sizing_detail_statistics;

  /// No description provided for @sizing_product_statistics.
  ///
  /// In en, this message translates to:
  /// **'Sizing_product_antibiotic'**
  String get sizing_product_statistics;

  /// No description provided for @sizing_statistics_report_of_operational_error.
  ///
  /// In en, this message translates to:
  /// **'Sizing Statistics Report of Operational Error'**
  String get sizing_statistics_report_of_operational_error;

  /// No description provided for @detailed_sizing_statistics_report.
  ///
  /// In en, this message translates to:
  /// **'Detailed Sizing Statistics Report'**
  String get detailed_sizing_statistics_report;

  /// No description provided for @general_sizing_statistics_report.
  ///
  /// In en, this message translates to:
  /// **'General Sizing Statistics Report'**
  String get general_sizing_statistics_report;

  /// No description provided for @scale_sizing_statistics_report.
  ///
  /// In en, this message translates to:
  /// **'Scale Sizing Statistics Report'**
  String get scale_sizing_statistics_report;

  /// No description provided for @antibiotic_product_sizing_statistics_report.
  ///
  /// In en, this message translates to:
  /// **'Antibiotic Product Sizing Statistics Report'**
  String get antibiotic_product_sizing_statistics_report;

  /// No description provided for @rfid_validation_failed.
  ///
  /// In en, this message translates to:
  /// **'Invalid data'**
  String get rfid_validation_failed;

  /// No description provided for @rfid_load_error.
  ///
  /// In en, this message translates to:
  /// **'Rfid card load error'**
  String get rfid_load_error;

  /// No description provided for @rfid_card_already_exists.
  ///
  /// In en, this message translates to:
  /// **'Card ID already exists in the system'**
  String get rfid_card_already_exists;

  /// No description provided for @rfid_create_success.
  ///
  /// In en, this message translates to:
  /// **'RFID card created successfully'**
  String get rfid_create_success;

  /// No description provided for @rfid_general_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later'**
  String get rfid_general_error;

  /// No description provided for @card_detail.
  ///
  /// In en, this message translates to:
  /// **'Card detail'**
  String get card_detail;

  /// No description provided for @card_number.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get card_number;

  /// No description provided for @auto_trans.
  ///
  /// In en, this message translates to:
  /// **'Auto transfer'**
  String get auto_trans;

  /// No description provided for @end_of_list.
  ///
  /// In en, this message translates to:
  /// **'End of the list'**
  String get end_of_list;

  /// No description provided for @select_object.
  ///
  /// In en, this message translates to:
  /// **'Select object'**
  String get select_object;

  /// No description provided for @no_description.
  ///
  /// In en, this message translates to:
  /// **'No description'**
  String get no_description;

  /// No description provided for @no_matching_card.
  ///
  /// In en, this message translates to:
  /// **'No matching card'**
  String get no_matching_card;

  /// No description provided for @card_exist_data.
  ///
  /// In en, this message translates to:
  /// **'Card already exists data'**
  String get card_exist_data;

  /// No description provided for @no_worker_found.
  ///
  /// In en, this message translates to:
  /// **'No worker found'**
  String get no_worker_found;

  /// No description provided for @no_cards_have_been_linked_yet.
  ///
  /// In en, this message translates to:
  /// **'No cards have been linked yet!'**
  String get no_cards_have_been_linked_yet;

  /// No description provided for @inventory_card_list.
  ///
  /// In en, this message translates to:
  /// **'Inventory card list'**
  String get inventory_card_list;

  /// No description provided for @standard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get standard;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @scale.
  ///
  /// In en, this message translates to:
  /// **'Scale'**
  String get scale;

  /// No description provided for @lot.
  ///
  /// In en, this message translates to:
  /// **'Lot'**
  String get lot;

  /// No description provided for @material_date.
  ///
  /// In en, this message translates to:
  /// **'Material date'**
  String get material_date;

  /// No description provided for @date_material.
  ///
  /// In en, this message translates to:
  /// **'Date material'**
  String get date_material;

  /// No description provided for @worktime.
  ///
  /// In en, this message translates to:
  /// **'Worktime'**
  String get worktime;

  /// No description provided for @work_time.
  ///
  /// In en, this message translates to:
  /// **'Worktime'**
  String get work_time;

  /// No description provided for @work_date.
  ///
  /// In en, this message translates to:
  /// **'Work date'**
  String get work_date;

  /// No description provided for @output_time.
  ///
  /// In en, this message translates to:
  /// **'Output time'**
  String get output_time;

  /// No description provided for @time_begin.
  ///
  /// In en, this message translates to:
  /// **'Time begin'**
  String get time_begin;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @weight_out.
  ///
  /// In en, this message translates to:
  /// **'Weight out'**
  String get weight_out;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @conveyor.
  ///
  /// In en, this message translates to:
  /// **'Conveyor'**
  String get conveyor;

  /// No description provided for @number_of_trays.
  ///
  /// In en, this message translates to:
  /// **'Number of trays'**
  String get number_of_trays;

  /// No description provided for @productivity.
  ///
  /// In en, this message translates to:
  /// **'Productivity'**
  String get productivity;

  /// No description provided for @material_weight.
  ///
  /// In en, this message translates to:
  /// **'Material weight'**
  String get material_weight;

  /// No description provided for @reject_weight.
  ///
  /// In en, this message translates to:
  /// **'Reject weight'**
  String get reject_weight;

  /// No description provided for @quality.
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get quality;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @salary_calculation_method.
  ///
  /// In en, this message translates to:
  /// **'Salary calculation method'**
  String get salary_calculation_method;

  /// No description provided for @convert_to_headcount.
  ///
  /// In en, this message translates to:
  /// **'Convert headcount'**
  String get convert_to_headcount;

  /// No description provided for @productt.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get productt;

  /// No description provided for @basket_weight.
  ///
  /// In en, this message translates to:
  /// **'Basket weight'**
  String get basket_weight;

  /// No description provided for @basket_create_time.
  ///
  /// In en, this message translates to:
  /// **'Basket created time'**
  String get basket_create_time;

  /// No description provided for @productname.
  ///
  /// In en, this message translates to:
  /// **'Product name'**
  String get productname;

  /// No description provided for @weighing_time.
  ///
  /// In en, this message translates to:
  /// **'Weighing time'**
  String get weighing_time;

  /// No description provided for @output_weight.
  ///
  /// In en, this message translates to:
  /// **'Output weight'**
  String get output_weight;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @user_list.
  ///
  /// In en, this message translates to:
  /// **'User list'**
  String get user_list;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_password;

  /// No description provided for @username_required.
  ///
  /// In en, this message translates to:
  /// **'Username is required'**
  String get username_required;

  /// No description provided for @name_required.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get name_required;

  /// No description provided for @password_required.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get password_required;

  /// No description provided for @edit_user.
  ///
  /// In en, this message translates to:
  /// **'Edit user'**
  String get edit_user;

  /// No description provided for @delete_user.
  ///
  /// In en, this message translates to:
  /// **'Delete user'**
  String get delete_user;

  /// No description provided for @total_user.
  ///
  /// In en, this message translates to:
  /// **'Total user:'**
  String get total_user;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @role_name.
  ///
  /// In en, this message translates to:
  /// **'Role name'**
  String get role_name;

  /// No description provided for @role_list.
  ///
  /// In en, this message translates to:
  /// **'Role list'**
  String get role_list;

  /// No description provided for @role_required.
  ///
  /// In en, this message translates to:
  /// **'Role is required'**
  String get role_required;

  /// No description provided for @role_name_not_blank.
  ///
  /// In en, this message translates to:
  /// **'Role name have to not blank'**
  String get role_name_not_blank;

  /// No description provided for @assign_permission.
  ///
  /// In en, this message translates to:
  /// **'Assign permission'**
  String get assign_permission;

  /// No description provided for @assign_permission_user.
  ///
  /// In en, this message translates to:
  /// **'Assign permission to user'**
  String get assign_permission_user;

  /// No description provided for @edit_role.
  ///
  /// In en, this message translates to:
  /// **'Edit role'**
  String get edit_role;

  /// No description provided for @delete_role.
  ///
  /// In en, this message translates to:
  /// **'Delete role'**
  String get delete_role;

  /// No description provided for @total_role.
  ///
  /// In en, this message translates to:
  /// **'Total role:'**
  String get total_role;

  /// No description provided for @permission.
  ///
  /// In en, this message translates to:
  /// **'Permission'**
  String get permission;

  /// No description provided for @permission_name.
  ///
  /// In en, this message translates to:
  /// **'Permission name'**
  String get permission_name;

  /// No description provided for @permission_required.
  ///
  /// In en, this message translates to:
  /// **'Permission is required'**
  String get permission_required;

  /// No description provided for @permission_group.
  ///
  /// In en, this message translates to:
  /// **'Permission group'**
  String get permission_group;

  /// No description provided for @edit_permission.
  ///
  /// In en, this message translates to:
  /// **'Edit permission'**
  String get edit_permission;

  /// No description provided for @delete_permission.
  ///
  /// In en, this message translates to:
  /// **'Delete permission'**
  String get delete_permission;

  /// No description provided for @total_permission.
  ///
  /// In en, this message translates to:
  /// **'Total permission:'**
  String get total_permission;

  /// No description provided for @select_all.
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get select_all;

  /// No description provided for @permission_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Permission created successfully'**
  String get permission_created_successfully;

  /// No description provided for @permission_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Permission creation failed'**
  String get permission_creation_failed;

  /// No description provided for @permission_not_found.
  ///
  /// In en, this message translates to:
  /// **'Permission not found'**
  String get permission_not_found;

  /// No description provided for @permission_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Permission updated successfully'**
  String get permission_updated_successfully;

  /// No description provided for @permission_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Permission update failed'**
  String get permission_update_failed;

  /// No description provided for @permission_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Permission deleted successfully'**
  String get permission_deleted_successfully;

  /// No description provided for @permission_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Permission deletion failed'**
  String get permission_deletion_failed;

  /// No description provided for @no_matching_permissions_found.
  ///
  /// In en, this message translates to:
  /// **'No permissions matched keyword search'**
  String get no_matching_permissions_found;

  /// No description provided for @tub_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Tub updated successfully'**
  String get tub_updated_successfully;

  /// No description provided for @tub_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Tub update failed'**
  String get tub_update_failed;

  /// No description provided for @error_code.
  ///
  /// In en, this message translates to:
  /// **'Error code'**
  String get error_code;

  /// No description provided for @error_description.
  ///
  /// In en, this message translates to:
  /// **'Error description'**
  String get error_description;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @history_tub_edit.
  ///
  /// In en, this message translates to:
  /// **'Tub Edit History'**
  String get history_tub_edit;

  /// No description provided for @account_has_been_locked.
  ///
  /// In en, this message translates to:
  /// **'Account has been locked'**
  String get account_has_been_locked;

  /// No description provided for @error_pto.
  ///
  /// In en, this message translates to:
  /// **'ErrorPTO'**
  String get error_pto;

  /// No description provided for @pto_error_statistics.
  ///
  /// In en, this message translates to:
  /// **'ErrorPTO'**
  String get pto_error_statistics;

  /// No description provided for @pto_error_summary_statistics.
  ///
  /// In en, this message translates to:
  /// **'SummaryErrorPTO'**
  String get pto_error_summary_statistics;

  /// No description provided for @role_data.
  ///
  /// In en, this message translates to:
  /// **'RoleData'**
  String get role_data;

  /// No description provided for @permission_data.
  ///
  /// In en, this message translates to:
  /// **'PermissionData'**
  String get permission_data;

  /// No description provided for @role_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Role imported successfully'**
  String get role_imported_successfully;

  /// No description provided for @role_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Role import failed'**
  String get role_import_failed;

  /// No description provided for @role_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Role exported successfully'**
  String get role_exported_successfully;

  /// No description provided for @role_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Role export failed'**
  String get role_export_failed;

  /// No description provided for @role_group_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Role data statistics'**
  String get role_group_data_statistics;

  /// No description provided for @permission_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Permission imported successfully'**
  String get permission_imported_successfully;

  /// No description provided for @permission_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Permission import failed'**
  String get permission_import_failed;

  /// No description provided for @permission_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Permission exported successfully'**
  String get permission_exported_successfully;

  /// No description provided for @permission_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Permission export failed'**
  String get permission_export_failed;

  /// No description provided for @permission_group_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Permission data statistics'**
  String get permission_group_data_statistics;

  /// No description provided for @headless.
  ///
  /// In en, this message translates to:
  /// **'Headless'**
  String get headless;

  /// No description provided for @headless_list.
  ///
  /// In en, this message translates to:
  /// **'Headless list'**
  String get headless_list;

  /// No description provided for @agency_code.
  ///
  /// In en, this message translates to:
  /// **'Agency code'**
  String get agency_code;

  /// No description provided for @agency_name.
  ///
  /// In en, this message translates to:
  /// **'Agency name'**
  String get agency_name;

  /// No description provided for @agency.
  ///
  /// In en, this message translates to:
  /// **'Agency'**
  String get agency;

  /// No description provided for @agency_code_required.
  ///
  /// In en, this message translates to:
  /// **'Agency code is required'**
  String get agency_code_required;

  /// No description provided for @giolentom.
  ///
  /// In en, this message translates to:
  /// **'Time to catch shrimp'**
  String get giolentom;

  /// No description provided for @glt_required.
  ///
  /// In en, this message translates to:
  /// **'Time is required'**
  String get glt_required;

  /// No description provided for @nnl_required.
  ///
  /// In en, this message translates to:
  /// **'Material date is required'**
  String get nnl_required;

  /// No description provided for @headless_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Headless created successfully'**
  String get headless_created_successfully;

  /// No description provided for @headless_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Headless creation failed'**
  String get headless_creation_failed;

  /// No description provided for @headless_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Headless updated successfully'**
  String get headless_updated_successfully;

  /// No description provided for @headless_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Headless update failed'**
  String get headless_update_failed;

  /// No description provided for @headless_not_found.
  ///
  /// In en, this message translates to:
  /// **'Headless not found'**
  String get headless_not_found;

  /// No description provided for @headless_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Headless deleted successfully'**
  String get headless_deleted_successfully;

  /// No description provided for @headless_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Headless deletion failed'**
  String get headless_deletion_failed;

  /// No description provided for @whiteleg_shrimp.
  ///
  /// In en, this message translates to:
  /// **'Whiteleg shrimp'**
  String get whiteleg_shrimp;

  /// No description provided for @tiger_shrimp.
  ///
  /// In en, this message translates to:
  /// **'Tiger shrimp'**
  String get tiger_shrimp;

  /// No description provided for @total_headless.
  ///
  /// In en, this message translates to:
  /// **'Total headless: '**
  String get total_headless;

  /// No description provided for @edit_headless.
  ///
  /// In en, this message translates to:
  /// **'Edit headless'**
  String get edit_headless;

  /// No description provided for @delete_headless.
  ///
  /// In en, this message translates to:
  /// **'Delete headless'**
  String get delete_headless;

  /// No description provided for @export_excel_BP.
  ///
  /// In en, this message translates to:
  /// **'Export excel group'**
  String get export_excel_BP;

  /// No description provided for @export_excel_all.
  ///
  /// In en, this message translates to:
  /// **'Export excel all'**
  String get export_excel_all;

  /// No description provided for @whiteleg_shrimp_data_already_exists.
  ///
  /// In en, this message translates to:
  /// **'Whiteleg shrimp data already exists in the card '**
  String get whiteleg_shrimp_data_already_exists;

  /// No description provided for @tiger_shrimp_data_already_exists.
  ///
  /// In en, this message translates to:
  /// **'Tiger shrimp data already exists in the card '**
  String get tiger_shrimp_data_already_exists;

  /// No description provided for @this_data_already_exists.
  ///
  /// In en, this message translates to:
  /// **'This data already exists in the card '**
  String get this_data_already_exists;

  /// No description provided for @service_card.
  ///
  /// In en, this message translates to:
  /// **'Service card'**
  String get service_card;

  /// No description provided for @headless_whiteleg_shrimp_detail.
  ///
  /// In en, this message translates to:
  /// **'Whiteleg shrimp headless detail'**
  String get headless_whiteleg_shrimp_detail;

  /// No description provided for @headless_tiger_shrimp_detail.
  ///
  /// In en, this message translates to:
  /// **'Tiger shrimp headless detail'**
  String get headless_tiger_shrimp_detail;

  /// No description provided for @headless_whiteleg_shrimp_general.
  ///
  /// In en, this message translates to:
  /// **'Whiteleg shrimp headless general'**
  String get headless_whiteleg_shrimp_general;

  /// No description provided for @headless_tiger_shrimp_general.
  ///
  /// In en, this message translates to:
  /// **'Tiger shrimp headless general'**
  String get headless_tiger_shrimp_general;

  /// No description provided for @time_shrimp.
  ///
  /// In en, this message translates to:
  /// **'Time shrimp'**
  String get time_shrimp;

  /// No description provided for @headless_white_general_statistics.
  ///
  /// In en, this message translates to:
  /// **'HeadlessWhiteShrimp_General'**
  String get headless_white_general_statistics;

  /// No description provided for @headless_tiger_general_statistics.
  ///
  /// In en, this message translates to:
  /// **'HeadlessTigerShrimp_General'**
  String get headless_tiger_general_statistics;

  /// No description provided for @headless_white_detail_statistics.
  ///
  /// In en, this message translates to:
  /// **'HeadlessWhiteShrimp_Detail'**
  String get headless_white_detail_statistics;

  /// No description provided for @headless_tiger_detail_statistics.
  ///
  /// In en, this message translates to:
  /// **'HeadlessTigerShrimp_Detail'**
  String get headless_tiger_detail_statistics;

  /// No description provided for @headless_shrimp_scale.
  ///
  /// In en, this message translates to:
  /// **'HeadlessShrimp_Scale'**
  String get headless_shrimp_scale;

  /// No description provided for @detailed_headless_ws_statistics_report.
  ///
  /// In en, this message translates to:
  /// **'Detailed Headless Whiteleg Shrimp Statistics Report'**
  String get detailed_headless_ws_statistics_report;

  /// No description provided for @general_headless_ws_statistics_report.
  ///
  /// In en, this message translates to:
  /// **'General Headless Whiteleg Shrimp Statistics Report'**
  String get general_headless_ws_statistics_report;

  /// No description provided for @detailed_headless_ts_statistics_report.
  ///
  /// In en, this message translates to:
  /// **'Detailed Headless Tiger Shrimp Statistics Report'**
  String get detailed_headless_ts_statistics_report;

  /// No description provided for @general_headless_ts_statistics_report.
  ///
  /// In en, this message translates to:
  /// **'General Headless Tiger Shrimp Statistics Report'**
  String get general_headless_ts_statistics_report;

  /// No description provided for @service_card_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard created successfully'**
  String get service_card_created_successfully;

  /// No description provided for @service_card_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard updated successfully'**
  String get service_card_updated_successfully;

  /// No description provided for @service_card_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard deleted successfully'**
  String get service_card_deleted_successfully;

  /// No description provided for @service_card_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard creation failed'**
  String get service_card_creation_failed;

  /// No description provided for @service_card_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard deletion failed'**
  String get service_card_deletion_failed;

  /// No description provided for @service_card_update_failed.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard update failed'**
  String get service_card_update_failed;

  /// No description provided for @service_card_not_found.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard not found'**
  String get service_card_not_found;

  /// No description provided for @service_card_data.
  ///
  /// In en, this message translates to:
  /// **'ServiceCardData'**
  String get service_card_data;

  /// No description provided for @service_card_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard data statistics'**
  String get service_card_data_statistics;

  /// No description provided for @service_card_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard imported successfully'**
  String get service_card_imported_successfully;

  /// No description provided for @service_card_import_failed.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard import failed'**
  String get service_card_import_failed;

  /// No description provided for @service_card_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard exported successfully'**
  String get service_card_exported_successfully;

  /// No description provided for @service_card_export_failed.
  ///
  /// In en, this message translates to:
  /// **'ServiceCard export failed'**
  String get service_card_export_failed;

  /// No description provided for @agency_name_required.
  ///
  /// In en, this message translates to:
  /// **'Agency name is required'**
  String get agency_name_required;

  /// No description provided for @agency_code_invalid.
  ///
  /// In en, this message translates to:
  /// **'Agency code is invalid'**
  String get agency_code_invalid;

  /// No description provided for @edit_agency.
  ///
  /// In en, this message translates to:
  /// **'Edit agency'**
  String get edit_agency;

  /// No description provided for @delete_agency.
  ///
  /// In en, this message translates to:
  /// **'Delete agency'**
  String get delete_agency;

  /// No description provided for @agency_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Agency data statistics'**
  String get agency_data_statistics;

  /// No description provided for @agency_data.
  ///
  /// In en, this message translates to:
  /// **'AgencyData'**
  String get agency_data;

  /// No description provided for @agency_list.
  ///
  /// In en, this message translates to:
  /// **'Agency List'**
  String get agency_list;

  /// No description provided for @total_agency.
  ///
  /// In en, this message translates to:
  /// **'Total agency: '**
  String get total_agency;

  /// No description provided for @spe_headless.
  ///
  /// In en, this message translates to:
  /// **'Headless specification'**
  String get spe_headless;

  /// No description provided for @change_pass.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get change_pass;

  /// No description provided for @current_pass.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get current_pass;

  /// No description provided for @new_pass.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_pass;

  /// No description provided for @confirm_pass.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_pass;

  /// No description provided for @current_password_incorrect.
  ///
  /// In en, this message translates to:
  /// **'Current password is incorrect'**
  String get current_password_incorrect;

  /// No description provided for @password_change_successful.
  ///
  /// In en, this message translates to:
  /// **'Password change successful'**
  String get password_change_successful;

  /// No description provided for @are_you_sure_you_want_to_log_out.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get are_you_sure_you_want_to_log_out;

  /// No description provided for @excel_export_by_month.
  ///
  /// In en, this message translates to:
  /// **'Excel export by month'**
  String get excel_export_by_month;

  /// No description provided for @finished_pto_tub.
  ///
  /// In en, this message translates to:
  /// **'Successfully completed tub'**
  String get finished_pto_tub;

  /// No description provided for @cancel_pto_tub.
  ///
  /// In en, this message translates to:
  /// **'Successfully destroy tub'**
  String get cancel_pto_tub;

  /// No description provided for @finished_tub.
  ///
  /// In en, this message translates to:
  /// **'Finished tub'**
  String get finished_tub;

  /// No description provided for @finished_pto_tub_all.
  ///
  /// In en, this message translates to:
  /// **'Finished all tub'**
  String get finished_pto_tub_all;

  /// No description provided for @finished_pto_tub_all_cancel.
  ///
  /// In en, this message translates to:
  /// **'Detroy all tub'**
  String get finished_pto_tub_all_cancel;

  /// No description provided for @thu_tu.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get thu_tu;

  /// No description provided for @worker_by_group.
  ///
  /// In en, this message translates to:
  /// **'Worker data statistics by group '**
  String get worker_by_group;

  /// No description provided for @statistic_empty_employee.
  ///
  /// In en, this message translates to:
  /// **'No employee information Weighing'**
  String get statistic_empty_employee;

  /// No description provided for @statistic_workers_without_employee_info.
  ///
  /// In en, this message translates to:
  /// **'Workers without employee info'**
  String get statistic_workers_without_employee_info;

  /// No description provided for @statistic_updated_workers_log.
  ///
  /// In en, this message translates to:
  /// **'Updated WorkersLog'**
  String get statistic_updated_workers_log;

  /// No description provided for @updated_by.
  ///
  /// In en, this message translates to:
  /// **'Updated by'**
  String get updated_by;

  /// No description provided for @updated_at.
  ///
  /// In en, this message translates to:
  /// **'Updated at'**
  String get updated_at;

  /// No description provided for @auto_updated.
  ///
  /// In en, this message translates to:
  /// **'Auto updated'**
  String get auto_updated;

  /// No description provided for @look_up_worker.
  ///
  /// In en, this message translates to:
  /// **'Look up workers'**
  String get look_up_worker;

  /// No description provided for @enter_worker_code.
  ///
  /// In en, this message translates to:
  /// **'Enter worker code'**
  String get enter_worker_code;

  /// No description provided for @download_sample_data.
  ///
  /// In en, this message translates to:
  /// **'Download sample data'**
  String get download_sample_data;

  /// No description provided for @import_employee_check_file.
  ///
  /// In en, this message translates to:
  /// **'import employee check file'**
  String get import_employee_check_file;

  /// No description provided for @updated.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get updated;

  /// No description provided for @current_worker.
  ///
  /// In en, this message translates to:
  /// **'Current worker'**
  String get current_worker;

  /// No description provided for @select_new_worker.
  ///
  /// In en, this message translates to:
  /// **'Select new worker'**
  String get select_new_worker;

  /// No description provided for @no_worker_in_the_system.
  ///
  /// In en, this message translates to:
  /// **'No worker in the system'**
  String get no_worker_in_the_system;

  /// No description provided for @all_employees_already_exist_in_the_system.
  ///
  /// In en, this message translates to:
  /// **'All employees already exist in the system'**
  String get all_employees_already_exist_in_the_system;

  /// No description provided for @employee_list_does_not_exist_yet.
  ///
  /// In en, this message translates to:
  /// **'Employee list does not exist yet'**
  String get employee_list_does_not_exist_yet;

  /// No description provided for @worker_bp.
  ///
  /// In en, this message translates to:
  /// **'Group and Worker'**
  String get worker_bp;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get news;

  /// No description provided for @list_of_cards_not_issued_to_workers.
  ///
  /// In en, this message translates to:
  /// **'List of cards not issued to workers'**
  String get list_of_cards_not_issued_to_workers;

  /// No description provided for @tub_scale.
  ///
  /// In en, this message translates to:
  /// **'Scale_Tub'**
  String get tub_scale;

  /// No description provided for @tub_id.
  ///
  /// In en, this message translates to:
  /// **'Tub'**
  String get tub_id;

  /// No description provided for @production_output_summary.
  ///
  /// In en, this message translates to:
  /// **'Production output summary'**
  String get production_output_summary;

  /// No description provided for @weight_material.
  ///
  /// In en, this message translates to:
  /// **'Weight material'**
  String get weight_material;

  /// No description provided for @weight_btp.
  ///
  /// In en, this message translates to:
  /// **'Weight BTP'**
  String get weight_btp;

  /// No description provided for @employee_code_required.
  ///
  /// In en, this message translates to:
  /// **'Worker code is required'**
  String get employee_code_required;

  /// No description provided for @export_dynamic.
  ///
  /// In en, this message translates to:
  /// **'Export Summary'**
  String get export_dynamic;

  /// No description provided for @export_by_error_code.
  ///
  /// In en, this message translates to:
  /// **'Export by Error Code'**
  String get export_by_error_code;

  /// No description provided for @history_change_card_report.
  ///
  /// In en, this message translates to:
  /// **'History Change Card Report'**
  String get history_change_card_report;

  /// No description provided for @history_change_card.
  ///
  /// In en, this message translates to:
  /// **'History Change Card'**
  String get history_change_card;

  /// No description provided for @card_id.
  ///
  /// In en, this message translates to:
  /// **'Card ID'**
  String get card_id;

  /// No description provided for @first_used_date.
  ///
  /// In en, this message translates to:
  /// **'First Used Date'**
  String get first_used_date;

  /// No description provided for @last_used_date.
  ///
  /// In en, this message translates to:
  /// **'Last Used Date'**
  String get last_used_date;

  /// No description provided for @total_records.
  ///
  /// In en, this message translates to:
  /// **'Total Records'**
  String get total_records;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @end_time.
  ///
  /// In en, this message translates to:
  /// **'End time'**
  String get end_time;

  /// No description provided for @stage_.
  ///
  /// In en, this message translates to:
  /// **'Specification Production'**
  String get stage_;

  /// No description provided for @type_note.
  ///
  /// In en, this message translates to:
  /// **'Type error'**
  String get type_note;

  /// No description provided for @weight_pc.
  ///
  /// In en, this message translates to:
  /// **'Sizng weight (kg)'**
  String get weight_pc;

  /// No description provided for @weight_pto.
  ///
  /// In en, this message translates to:
  /// **'PTO weight (kg)'**
  String get weight_pto;

  /// No description provided for @production_role.
  ///
  /// In en, this message translates to:
  /// **'Production role'**
  String get production_role;

  /// No description provided for @production_role_code.
  ///
  /// In en, this message translates to:
  /// **'Code production role'**
  String get production_role_code;

  /// No description provided for @production_stages_code.
  ///
  /// In en, this message translates to:
  /// **'Production stages code'**
  String get production_stages_code;

  /// No description provided for @production_role_list.
  ///
  /// In en, this message translates to:
  /// **'List Production Role'**
  String get production_role_list;

  /// No description provided for @total_production_role.
  ///
  /// In en, this message translates to:
  /// **'Total Production Role'**
  String get total_production_role;

  /// No description provided for @edit_production_role.
  ///
  /// In en, this message translates to:
  /// **'Edit production role'**
  String get edit_production_role;

  /// No description provided for @delete_production_role.
  ///
  /// In en, this message translates to:
  /// **'Delete production role'**
  String get delete_production_role;

  /// No description provided for @created_by.
  ///
  /// In en, this message translates to:
  /// **'Created by'**
  String get created_by;

  /// No description provided for @edited_by.
  ///
  /// In en, this message translates to:
  /// **'Edited by'**
  String get edited_by;

  /// No description provided for @production_role_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Production role data statistics'**
  String get production_role_data_statistics;

  /// No description provided for @production_role_data.
  ///
  /// In en, this message translates to:
  /// **'Production role data'**
  String get production_role_data;

  /// No description provided for @weight_kg.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weight_kg;

  /// No description provided for @weight_con.
  ///
  /// In en, this message translates to:
  /// **'Weight (con)'**
  String get weight_con;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get backup;

  /// No description provided for @permission_constraint.
  ///
  /// In en, this message translates to:
  /// **'Permission constraint'**
  String get permission_constraint;

  /// No description provided for @pto_statistics_report_by_product_summary.
  ///
  /// In en, this message translates to:
  /// **'PTO Statistics Report by Product Summary'**
  String get pto_statistics_report_by_product_summary;

  /// No description provided for @min_time.
  ///
  /// In en, this message translates to:
  /// **'Min Time'**
  String get min_time;

  /// No description provided for @max_time.
  ///
  /// In en, this message translates to:
  /// **'Max Time'**
  String get max_time;

  /// No description provided for @average_time.
  ///
  /// In en, this message translates to:
  /// **'Average Time'**
  String get average_time;

  /// No description provided for @number.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get number;

  /// No description provided for @no_worker_card_found.
  ///
  /// In en, this message translates to:
  /// **'No worker card found'**
  String get no_worker_card_found;

  /// No description provided for @no_service_card_found.
  ///
  /// In en, this message translates to:
  /// **'No service card found'**
  String get no_service_card_found;

  /// No description provided for @pto_statistics_report_by_product_general.
  ///
  /// In en, this message translates to:
  /// **'PTO Statistics Report by Stage'**
  String get pto_statistics_report_by_product_general;

  /// No description provided for @product_general.
  ///
  /// In en, this message translates to:
  /// **'PTO Stage'**
  String get product_general;

  /// No description provided for @tub_code.
  ///
  /// In en, this message translates to:
  /// **'Tub code'**
  String get tub_code;

  /// No description provided for @no_tub_sizing_in_the_system.
  ///
  /// In en, this message translates to:
  /// **'No tub sizing in the system'**
  String get no_tub_sizing_in_the_system;

  /// No description provided for @model_lot.
  ///
  /// In en, this message translates to:
  /// **'Lot'**
  String get model_lot;

  /// No description provided for @model_antibiotic.
  ///
  /// In en, this message translates to:
  /// **'antibiotic'**
  String get model_antibiotic;

  /// No description provided for @model_product.
  ///
  /// In en, this message translates to:
  /// **'product'**
  String get model_product;

  /// No description provided for @model_type.
  ///
  /// In en, this message translates to:
  /// **'product type'**
  String get model_type;

  /// No description provided for @model_material.
  ///
  /// In en, this message translates to:
  /// **'material'**
  String get model_material;

  /// No description provided for @model_stage.
  ///
  /// In en, this message translates to:
  /// **'stage'**
  String get model_stage;

  /// No description provided for @model_size.
  ///
  /// In en, this message translates to:
  /// **'size'**
  String get model_size;

  /// No description provided for @model_specification.
  ///
  /// In en, this message translates to:
  /// **'specification'**
  String get model_specification;

  /// No description provided for @user_create.
  ///
  /// In en, this message translates to:
  /// **'User create'**
  String get user_create;

  /// No description provided for @user_edit.
  ///
  /// In en, this message translates to:
  /// **'User edit'**
  String get user_edit;

  /// No description provided for @tg_tao.
  ///
  /// In en, this message translates to:
  /// **'Time create'**
  String get tg_tao;

  /// No description provided for @tg_sua.
  ///
  /// In en, this message translates to:
  /// **'Time edit'**
  String get tg_sua;

  /// No description provided for @confirm_move.
  ///
  /// In en, this message translates to:
  /// **'Confirm move'**
  String get confirm_move;

  /// No description provided for @are_you_sure_you_want_to_move.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to move product'**
  String get are_you_sure_you_want_to_move;

  /// No description provided for @to_another_table.
  ///
  /// In en, this message translates to:
  /// **'to inventory'**
  String get to_another_table;

  /// No description provided for @are_you_sure_you_want_to_move_kho.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to move product'**
  String get are_you_sure_you_want_to_move_kho;

  /// No description provided for @to_another_table_kho.
  ///
  /// In en, this message translates to:
  /// **'to product'**
  String get to_another_table_kho;

  /// No description provided for @product_moved_to_inventory_successfully.
  ///
  /// In en, this message translates to:
  /// **'Product moved to inventory successfully'**
  String get product_moved_to_inventory_successfully;

  /// No description provided for @product_exists.
  ///
  /// In en, this message translates to:
  /// **'Product exists in inventory'**
  String get product_exists;

  /// No description provided for @already_exists_in_inventory.
  ///
  /// In en, this message translates to:
  /// **'already exists in inventory'**
  String get already_exists_in_inventory;

  /// No description provided for @do_you_want_to_move_back.
  ///
  /// In en, this message translates to:
  /// **'Do you want to move back'**
  String get do_you_want_to_move_back;

  /// No description provided for @warehouse.
  ///
  /// In en, this message translates to:
  /// **'Warehouse'**
  String get warehouse;

  /// No description provided for @product_moved_back_to_products_successfully.
  ///
  /// In en, this message translates to:
  /// **'Product moved back to products successfully'**
  String get product_moved_back_to_products_successfully;

  /// No description provided for @coi_created_successfully.
  ///
  /// In en, this message translates to:
  /// **'Coi created successfully'**
  String get coi_created_successfully;

  /// No description provided for @coi_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Coi updated successfully'**
  String get coi_updated_successfully;

  /// No description provided for @coi_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Coi deleted successfully'**
  String get coi_deleted_successfully;

  /// No description provided for @coi_creation_failed.
  ///
  /// In en, this message translates to:
  /// **'Coi creation failed'**
  String get coi_creation_failed;

  /// No description provided for @coi_deletion_failed.
  ///
  /// In en, this message translates to:
  /// **'Coi deletion failed'**
  String get coi_deletion_failed;

  /// No description provided for @coi_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Coi update failed'**
  String get coi_update_failed;

  /// No description provided for @coi_not_found.
  ///
  /// In en, this message translates to:
  /// **'Coi not found'**
  String get coi_not_found;

  /// No description provided for @coi_data.
  ///
  /// In en, this message translates to:
  /// **'CoiData'**
  String get coi_data;

  /// No description provided for @coi_data_statistics.
  ///
  /// In en, this message translates to:
  /// **'Coi data statistics'**
  String get coi_data_statistics;

  /// No description provided for @coi_imported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Coi imported successfully'**
  String get coi_imported_successfully;

  /// No description provided for @coi_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Coi import failed'**
  String get coi_import_failed;

  /// No description provided for @coi_exported_successfully.
  ///
  /// In en, this message translates to:
  /// **'Coi exported successfully'**
  String get coi_exported_successfully;

  /// No description provided for @coi_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Coi export failed'**
  String get coi_export_failed;

  /// No description provided for @fillet.
  ///
  /// In en, this message translates to:
  /// **'Fillet'**
  String get fillet;

  /// No description provided for @rework.
  ///
  /// In en, this message translates to:
  /// **'Rework'**
  String get rework;

  /// No description provided for @weight_injection.
  ///
  /// In en, this message translates to:
  /// **'Weight injection'**
  String get weight_injection;

  /// No description provided for @detail.
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get detail;

  /// No description provided for @to_product.
  ///
  /// In en, this message translates to:
  /// **'To product'**
  String get to_product;

  /// No description provided for @to_worker.
  ///
  /// In en, this message translates to:
  /// **'To worker'**
  String get to_worker;

  /// No description provided for @synthetic.
  ///
  /// In en, this message translates to:
  /// **'Synthetic'**
  String get synthetic;

  /// No description provided for @no_input.
  ///
  /// In en, this message translates to:
  /// **'No input'**
  String get no_input;

  /// No description provided for @no_output.
  ///
  /// In en, this message translates to:
  /// **'No output'**
  String get no_output;

  /// No description provided for @over_time.
  ///
  /// In en, this message translates to:
  /// **'Over time'**
  String get over_time;

  /// No description provided for @invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid'**
  String get invalid;

  /// No description provided for @over_standard.
  ///
  /// In en, this message translates to:
  /// **'Over standard'**
  String get over_standard;

  /// No description provided for @scweightout.
  ///
  /// In en, this message translates to:
  /// **'To weight after skinning'**
  String get scweightout;

  /// No description provided for @weighting.
  ///
  /// In en, this message translates to:
  /// **'Weighting'**
  String get weighting;

  /// No description provided for @replace.
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get replace;

  /// No description provided for @replace_warning.
  ///
  /// In en, this message translates to:
  /// **'If you check this box, all existing data will be replaced with new data from the Excel file.'**
  String get replace_warning;

  /// No description provided for @creating.
  ///
  /// In en, this message translates to:
  /// **'Creating...'**
  String get creating;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @validate_excel_file.
  ///
  /// In en, this message translates to:
  /// **'Please select an Excel file (.xlsx or .xls)'**
  String get validate_excel_file;

  /// No description provided for @file_selected.
  ///
  /// In en, this message translates to:
  /// **'File selected'**
  String get file_selected;

  /// No description provided for @file_cancelled.
  ///
  /// In en, this message translates to:
  /// **'File cancelled'**
  String get file_cancelled;

  /// No description provided for @downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading...'**
  String get downloading;

  /// No description provided for @download_success.
  ///
  /// In en, this message translates to:
  /// **'Download successful'**
  String get download_success;

  /// No description provided for @download_failed.
  ///
  /// In en, this message translates to:
  /// **'Download failed'**
  String get download_failed;

  /// No description provided for @import_file_failed.
  ///
  /// In en, this message translates to:
  /// **'Import file failed'**
  String get import_file_failed;

  /// No description provided for @confirm_update_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm update'**
  String get confirm_update_title;

  /// No description provided for @confirm_update.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to edit the information'**
  String get confirm_update;

  /// No description provided for @confirm_update_system.
  ///
  /// In en, this message translates to:
  /// **'This action will update the information to the system.'**
  String get confirm_update_system;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @error_authentication.
  ///
  /// In en, this message translates to:
  /// **'Authentication error'**
  String get error_authentication;

  /// No description provided for @error_login_failed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get error_login_failed;

  /// No description provided for @error_logout_failed.
  ///
  /// In en, this message translates to:
  /// **'Logout failed'**
  String get error_logout_failed;

  /// No description provided for @error_session_expired.
  ///
  /// In en, this message translates to:
  /// **'Session has expired'**
  String get error_session_expired;

  /// No description provided for @error_unauthorized.
  ///
  /// In en, this message translates to:
  /// **'You are not authorized'**
  String get error_unauthorized;

  /// No description provided for @error_network.
  ///
  /// In en, this message translates to:
  /// **'Network error'**
  String get error_network;

  /// No description provided for @error_server.
  ///
  /// In en, this message translates to:
  /// **'Server error'**
  String get error_server;

  /// No description provided for @error_timeout.
  ///
  /// In en, this message translates to:
  /// **'Request timeout'**
  String get error_timeout;

  /// No description provided for @error_no_internet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get error_no_internet;

  /// No description provided for @error_create_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create data'**
  String get error_create_failed;

  /// No description provided for @error_update_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update data'**
  String get error_update_failed;

  /// No description provided for @error_delete_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete data'**
  String get error_delete_failed;

  /// No description provided for @error_read_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to read data'**
  String get error_read_failed;

  /// No description provided for @error_import_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to import data'**
  String get error_import_failed;

  /// No description provided for @error_export_failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to export data'**
  String get error_export_failed;

  /// No description provided for @error_file_not_supported.
  ///
  /// In en, this message translates to:
  /// **'File format not supported'**
  String get error_file_not_supported;

  /// No description provided for @error_file_corrupted.
  ///
  /// In en, this message translates to:
  /// **'File is corrupted or damaged'**
  String get error_file_corrupted;

  /// No description provided for @error_file_size_exceeded.
  ///
  /// In en, this message translates to:
  /// **'File size exceeds maximum limit'**
  String get error_file_size_exceeded;

  /// No description provided for @error_validation_failed.
  ///
  /// In en, this message translates to:
  /// **'Invalid data'**
  String get error_validation_failed;

  /// No description provided for @error_required_field_missing.
  ///
  /// In en, this message translates to:
  /// **'Required field is missing'**
  String get error_required_field_missing;

  /// No description provided for @error_invalid_format.
  ///
  /// In en, this message translates to:
  /// **'Invalid format'**
  String get error_invalid_format;

  /// No description provided for @error_duplicate_entry.
  ///
  /// In en, this message translates to:
  /// **'Data already exists'**
  String get error_duplicate_entry;

  /// No description provided for @error_access_denied.
  ///
  /// In en, this message translates to:
  /// **'Access denied'**
  String get error_access_denied;

  /// No description provided for @error_insufficient_permissions.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to perform this action'**
  String get error_insufficient_permissions;

  /// No description provided for @error_business_rule_violation.
  ///
  /// In en, this message translates to:
  /// **'Business rule violation'**
  String get error_business_rule_violation;

  /// No description provided for @error_operation_not_allowed.
  ///
  /// In en, this message translates to:
  /// **'Operation not allowed'**
  String get error_operation_not_allowed;

  /// No description provided for @error_database.
  ///
  /// In en, this message translates to:
  /// **'Database error'**
  String get error_database;

  /// No description provided for @error_configuration.
  ///
  /// In en, this message translates to:
  /// **'System configuration error'**
  String get error_configuration;

  /// No description provided for @error_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get error_unknown;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
