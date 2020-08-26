view: user {
  derived_table: {
    sql: SELECT * FROM `my-oauth-project-275301.salesforce.user`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: _fivetran_deleted {
    type: string
    sql: ${TABLE}._fivetran_deleted ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: about_me {
    type: string
    sql: ${TABLE}.about_me ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: avg_deal_size_c {
    type: number
    sql: ${TABLE}.avg_deal_size_c ;;
  }

  dimension: badge_text {
    type: string
    sql: ${TABLE}.badge_text ;;
  }

  dimension: banner_photo_url {
    type: string
    sql: ${TABLE}.banner_photo_url ;;
  }

  dimension: bdr_active_c {
    type: string
    sql: ${TABLE}.bdr_active_c ;;
  }

  dimension: call_center_id {
    type: string
    sql: ${TABLE}.call_center_id ;;
  }

  dimension: catering_target_this_quarter_c {
    type: number
    sql: ${TABLE}.catering_target_this_quarter_c ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: community_nickname {
    type: string
    sql: ${TABLE}.community_nickname ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  dimension: conversion_rate_from_qualified_to_closed_c {
    type: number
    sql: ${TABLE}.conversion_rate_from_qualified_to_closed_c ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: default_group_notification_frequency {
    type: string
    sql: ${TABLE}.default_group_notification_frequency ;;
  }

  dimension: delegated_approver_id {
    type: string
    sql: ${TABLE}.delegated_approver_id ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: digest_frequency {
    type: string
    sql: ${TABLE}.digest_frequency ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.division ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_encoding_key {
    type: string
    sql: ${TABLE}.email_encoding_key ;;
  }

  dimension: email_preferences_auto_bcc {
    type: string
    sql: ${TABLE}.email_preferences_auto_bcc ;;
  }

  dimension: email_preferences_auto_bcc_stay_in_touch {
    type: string
    sql: ${TABLE}.email_preferences_auto_bcc_stay_in_touch ;;
  }

  dimension: email_preferences_stay_in_touch_reminder {
    type: string
    sql: ${TABLE}.email_preferences_stay_in_touch_reminder ;;
  }

  dimension: employee_number {
    type: string
    sql: ${TABLE}.employee_number ;;
  }

  dimension: enterprise_bdr_c {
    type: string
    sql: ${TABLE}.enterprise_bdr_c ;;
  }

  dimension_group: enterprise_last_assigned_date_c {
    type: time
    sql: ${TABLE}.enterprise_last_assigned_date_c ;;
  }

  dimension: extension {
    type: string
    sql: ${TABLE}.extension ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: federation_identifier {
    type: string
    sql: ${TABLE}.federation_identifier ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: forecast_enabled {
    type: string
    sql: ${TABLE}.forecast_enabled ;;
  }

  dimension: full_photo_url {
    type: string
    sql: ${TABLE}.full_photo_url ;;
  }

  dimension: geocode_accuracy {
    type: string
    sql: ${TABLE}.geocode_accuracy ;;
  }

  dimension: happiness_region_c {
    type: string
    sql: ${TABLE}.happiness_region_c ;;
  }

  dimension: individual_id {
    type: string
    sql: ${TABLE}.individual_id ;;
  }

  dimension: is_active {
    type: string
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_ext_indicator_visible {
    type: string
    sql: ${TABLE}.is_ext_indicator_visible ;;
  }

  dimension: is_profile_photo_active {
    type: string
    sql: ${TABLE}.is_profile_photo_active ;;
  }

  dimension: language_locale_key {
    type: string
    sql: ${TABLE}.language_locale_key ;;
  }

  dimension_group: last_assigned_date_c {
    type: time
    sql: ${TABLE}.last_assigned_date_c ;;
  }

  dimension_group: last_login_date {
    type: time
    sql: ${TABLE}.last_login_date ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified_date {
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: last_password_change_date {
    type: time
    sql: ${TABLE}.last_password_change_date ;;
  }

  dimension_group: last_referenced_date {
    type: time
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed_date {
    type: time
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: lead_conversion_rate_c {
    type: number
    sql: ${TABLE}.lead_conversion_rate_c ;;
  }

  dimension: locale_sid_key {
    type: string
    sql: ${TABLE}.locale_sid_key ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: manager_id {
    type: string
    sql: ${TABLE}.manager_id ;;
  }

  dimension: medium_banner_photo_url {
    type: string
    sql: ${TABLE}.medium_banner_photo_url ;;
  }

  dimension: medium_photo_url {
    type: string
    sql: ${TABLE}.medium_photo_url ;;
  }

  dimension: microkitchen_target_this_quarter_c {
    type: number
    sql: ${TABLE}.microkitchen_target_this_quarter_c ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: new_opportunities_per_week_target_c {
    type: number
    sql: ${TABLE}.new_opportunities_per_week_target_c ;;
  }

  dimension_group: offline_pda_trial_expiration_date {
    type: time
    sql: ${TABLE}.offline_pda_trial_expiration_date ;;
  }

  dimension_group: offline_trial_expiration_date {
    type: time
    sql: ${TABLE}.offline_trial_expiration_date ;;
  }

  dimension: out_of_office_message {
    type: string
    sql: ${TABLE}.out_of_office_message ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: phone_burner_api_id_c {
    type: string
    sql: ${TABLE}.phone_burner_api_id_c ;;
  }

  dimension: phone_burner_phone_burner_api_key_c {
    type: string
    sql: ${TABLE}.phone_burner_phone_burner_api_key_c ;;
  }

  dimension: phone_burner_phone_burner_userid_c {
    type: number
    sql: ${TABLE}.phone_burner_phone_burner_userid_c ;;
  }

  dimension: phone_burner_user_id_c {
    type: string
    sql: ${TABLE}.phone_burner_user_id_c ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: profile_id {
    type: string
    sql: ${TABLE}.profile_id ;;
  }

  dimension: receives_admin_info_emails {
    type: string
    sql: ${TABLE}.receives_admin_info_emails ;;
  }

  dimension: receives_info_emails {
    type: string
    sql: ${TABLE}.receives_info_emails ;;
  }

  dimension: regional_head_of_happiness_c {
    type: string
    sql: ${TABLE}.regional_head_of_happiness_c ;;
  }

  dimension: scout_user_c {
    type: string
    sql: ${TABLE}.scout_user_c ;;
  }

  dimension: sender_email {
    type: string
    sql: ${TABLE}.sender_email ;;
  }

  dimension: sender_name {
    type: string
    sql: ${TABLE}.sender_name ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: small_banner_photo_url {
    type: string
    sql: ${TABLE}.small_banner_photo_url ;;
  }

  dimension: small_photo_url {
    type: string
    sql: ${TABLE}.small_photo_url ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: stay_in_touch_note {
    type: string
    sql: ${TABLE}.stay_in_touch_note ;;
  }

  dimension: stay_in_touch_signature {
    type: string
    sql: ${TABLE}.stay_in_touch_signature ;;
  }

  dimension: stay_in_touch_subject {
    type: string
    sql: ${TABLE}.stay_in_touch_subject ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: time_zone_sid_key {
    type: string
    sql: ${TABLE}.time_zone_sid_key ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: user_permissions_avantgo_user {
    type: string
    sql: ${TABLE}.user_permissions_avantgo_user ;;
  }

  dimension: user_permissions_call_center_auto_login {
    type: string
    sql: ${TABLE}.user_permissions_call_center_auto_login ;;
  }

  dimension: user_permissions_interaction_user {
    type: string
    sql: ${TABLE}.user_permissions_interaction_user ;;
  }

  dimension: user_permissions_marketing_user {
    type: string
    sql: ${TABLE}.user_permissions_marketing_user ;;
  }

  dimension: user_permissions_mobile_user {
    type: string
    sql: ${TABLE}.user_permissions_mobile_user ;;
  }

  dimension: user_permissions_offline_user {
    type: string
    sql: ${TABLE}.user_permissions_offline_user ;;
  }

  dimension: user_permissions_sfcontent_user {
    type: string
    sql: ${TABLE}.user_permissions_sfcontent_user ;;
  }

  dimension: user_permissions_support_user {
    type: string
    sql: ${TABLE}.user_permissions_support_user ;;
  }

  dimension: user_preferences_activity_reminders_popup {
    type: string
    sql: ${TABLE}.user_preferences_activity_reminders_popup ;;
  }

  dimension: user_preferences_apex_pages_developer_mode {
    type: string
    sql: ${TABLE}.user_preferences_apex_pages_developer_mode ;;
  }

  dimension: user_preferences_cache_diagnostics {
    type: string
    sql: ${TABLE}.user_preferences_cache_diagnostics ;;
  }

  dimension: user_preferences_create_lexapps_wtshown {
    type: string
    sql: ${TABLE}.user_preferences_create_lexapps_wtshown ;;
  }

  dimension: user_preferences_dis_comment_after_like_email {
    type: string
    sql: ${TABLE}.user_preferences_dis_comment_after_like_email ;;
  }

  dimension: user_preferences_dis_mentions_comment_email {
    type: string
    sql: ${TABLE}.user_preferences_dis_mentions_comment_email ;;
  }

  dimension: user_preferences_dis_prof_post_comment_email {
    type: string
    sql: ${TABLE}.user_preferences_dis_prof_post_comment_email ;;
  }

  dimension: user_preferences_disable_all_feeds_email {
    type: string
    sql: ${TABLE}.user_preferences_disable_all_feeds_email ;;
  }

  dimension: user_preferences_disable_bookmark_email {
    type: string
    sql: ${TABLE}.user_preferences_disable_bookmark_email ;;
  }

  dimension: user_preferences_disable_change_comment_email {
    type: string
    sql: ${TABLE}.user_preferences_disable_change_comment_email ;;
  }

  dimension: user_preferences_disable_endorsement_email {
    type: string
    sql: ${TABLE}.user_preferences_disable_endorsement_email ;;
  }

  dimension: user_preferences_disable_file_share_notifications_for_api {
    type: string
    sql: ${TABLE}.user_preferences_disable_file_share_notifications_for_api ;;
  }

  dimension: user_preferences_disable_followers_email {
    type: string
    sql: ${TABLE}.user_preferences_disable_followers_email ;;
  }

  dimension: user_preferences_disable_later_comment_email {
    type: string
    sql: ${TABLE}.user_preferences_disable_later_comment_email ;;
  }

  dimension: user_preferences_disable_like_email {
    type: string
    sql: ${TABLE}.user_preferences_disable_like_email ;;
  }

  dimension: user_preferences_disable_mentions_post_email {
    type: string
    sql: ${TABLE}.user_preferences_disable_mentions_post_email ;;
  }

  dimension: user_preferences_disable_message_email {
    type: string
    sql: ${TABLE}.user_preferences_disable_message_email ;;
  }

  dimension: user_preferences_disable_profile_post_email {
    type: string
    sql: ${TABLE}.user_preferences_disable_profile_post_email ;;
  }

  dimension: user_preferences_disable_share_post_email {
    type: string
    sql: ${TABLE}.user_preferences_disable_share_post_email ;;
  }

  dimension: user_preferences_enable_auto_sub_for_feeds {
    type: string
    sql: ${TABLE}.user_preferences_enable_auto_sub_for_feeds ;;
  }

  dimension: user_preferences_event_reminders_checkbox_default {
    type: string
    sql: ${TABLE}.user_preferences_event_reminders_checkbox_default ;;
  }

  dimension: user_preferences_exclude_mail_app_attachments {
    type: string
    sql: ${TABLE}.user_preferences_exclude_mail_app_attachments ;;
  }

  dimension: user_preferences_favorites_show_top_favorites {
    type: string
    sql: ${TABLE}.user_preferences_favorites_show_top_favorites ;;
  }

  dimension: user_preferences_favorites_wtshown {
    type: string
    sql: ${TABLE}.user_preferences_favorites_wtshown ;;
  }

  dimension: user_preferences_global_nav_bar_wtshown {
    type: string
    sql: ${TABLE}.user_preferences_global_nav_bar_wtshown ;;
  }

  dimension: user_preferences_global_nav_grid_menu_wtshown {
    type: string
    sql: ${TABLE}.user_preferences_global_nav_grid_menu_wtshown ;;
  }

  dimension: user_preferences_has_celebration_badge {
    type: string
    sql: ${TABLE}.user_preferences_has_celebration_badge ;;
  }

  dimension: user_preferences_hide_bigger_photo_callout {
    type: string
    sql: ${TABLE}.user_preferences_hide_bigger_photo_callout ;;
  }

  dimension: user_preferences_hide_chatter_onboarding_splash {
    type: string
    sql: ${TABLE}.user_preferences_hide_chatter_onboarding_splash ;;
  }

  dimension: user_preferences_hide_csndesktop_task {
    type: string
    sql: ${TABLE}.user_preferences_hide_csndesktop_task ;;
  }

  dimension: user_preferences_hide_csnget_chatter_mobile_task {
    type: string
    sql: ${TABLE}.user_preferences_hide_csnget_chatter_mobile_task ;;
  }

  dimension: user_preferences_hide_end_user_onboarding_assistant_modal {
    type: string
    sql: ${TABLE}.user_preferences_hide_end_user_onboarding_assistant_modal ;;
  }

  dimension: user_preferences_hide_lightning_migration_modal {
    type: string
    sql: ${TABLE}.user_preferences_hide_lightning_migration_modal ;;
  }

  dimension: user_preferences_hide_s_1_browser_ui {
    type: string
    sql: ${TABLE}.user_preferences_hide_s_1_browser_ui ;;
  }

  dimension: user_preferences_hide_second_chatter_onboarding_splash {
    type: string
    sql: ${TABLE}.user_preferences_hide_second_chatter_onboarding_splash ;;
  }

  dimension: user_preferences_hide_sfx_welcome_mat {
    type: string
    sql: ${TABLE}.user_preferences_hide_sfx_welcome_mat ;;
  }

  dimension: user_preferences_lightning_experience_preferred {
    type: string
    sql: ${TABLE}.user_preferences_lightning_experience_preferred ;;
  }

  dimension: user_preferences_new_lightning_report_run_page_enabled {
    type: string
    sql: ${TABLE}.user_preferences_new_lightning_report_run_page_enabled ;;
  }

  dimension: user_preferences_path_assistant_collapsed {
    type: string
    sql: ${TABLE}.user_preferences_path_assistant_collapsed ;;
  }

  dimension: user_preferences_pipeline_view_hide_help_popover {
    type: string
    sql: ${TABLE}.user_preferences_pipeline_view_hide_help_popover ;;
  }

  dimension: user_preferences_preview_custom_theme {
    type: string
    sql: ${TABLE}.user_preferences_preview_custom_theme ;;
  }

  dimension: user_preferences_preview_lightning {
    type: string
    sql: ${TABLE}.user_preferences_preview_lightning ;;
  }

  dimension: user_preferences_record_home_reserved_wtshown {
    type: string
    sql: ${TABLE}.user_preferences_record_home_reserved_wtshown ;;
  }

  dimension: user_preferences_record_home_section_collapse_wtshown {
    type: string
    sql: ${TABLE}.user_preferences_record_home_section_collapse_wtshown ;;
  }

  dimension: user_preferences_reminder_sound_off {
    type: string
    sql: ${TABLE}.user_preferences_reminder_sound_off ;;
  }

  dimension: user_preferences_show_city_to_external_users {
    type: string
    sql: ${TABLE}.user_preferences_show_city_to_external_users ;;
  }

  dimension: user_preferences_show_city_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_city_to_guest_users ;;
  }

  dimension: user_preferences_show_country_to_external_users {
    type: string
    sql: ${TABLE}.user_preferences_show_country_to_external_users ;;
  }

  dimension: user_preferences_show_country_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_country_to_guest_users ;;
  }

  dimension: user_preferences_show_email_to_external_users {
    type: string
    sql: ${TABLE}.user_preferences_show_email_to_external_users ;;
  }

  dimension: user_preferences_show_email_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_email_to_guest_users ;;
  }

  dimension: user_preferences_show_fax_to_external_users {
    type: string
    sql: ${TABLE}.user_preferences_show_fax_to_external_users ;;
  }

  dimension: user_preferences_show_fax_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_fax_to_guest_users ;;
  }

  dimension: user_preferences_show_manager_to_external_users {
    type: string
    sql: ${TABLE}.user_preferences_show_manager_to_external_users ;;
  }

  dimension: user_preferences_show_manager_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_manager_to_guest_users ;;
  }

  dimension: user_preferences_show_mobile_phone_to_external_users {
    type: string
    sql: ${TABLE}.user_preferences_show_mobile_phone_to_external_users ;;
  }

  dimension: user_preferences_show_mobile_phone_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_mobile_phone_to_guest_users ;;
  }

  dimension: user_preferences_show_postal_code_to_external_users {
    type: string
    sql: ${TABLE}.user_preferences_show_postal_code_to_external_users ;;
  }

  dimension: user_preferences_show_postal_code_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_postal_code_to_guest_users ;;
  }

  dimension: user_preferences_show_profile_pic_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_profile_pic_to_guest_users ;;
  }

  dimension: user_preferences_show_state_to_external_users {
    type: string
    sql: ${TABLE}.user_preferences_show_state_to_external_users ;;
  }

  dimension: user_preferences_show_state_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_state_to_guest_users ;;
  }

  dimension: user_preferences_show_street_address_to_external_users {
    type: string
    sql: ${TABLE}.user_preferences_show_street_address_to_external_users ;;
  }

  dimension: user_preferences_show_street_address_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_street_address_to_guest_users ;;
  }

  dimension: user_preferences_show_title_to_external_users {
    type: string
    sql: ${TABLE}.user_preferences_show_title_to_external_users ;;
  }

  dimension: user_preferences_show_title_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_title_to_guest_users ;;
  }

  dimension: user_preferences_show_work_phone_to_external_users {
    type: string
    sql: ${TABLE}.user_preferences_show_work_phone_to_external_users ;;
  }

  dimension: user_preferences_show_work_phone_to_guest_users {
    type: string
    sql: ${TABLE}.user_preferences_show_work_phone_to_guest_users ;;
  }

  dimension: user_preferences_sort_feed_by_comment {
    type: string
    sql: ${TABLE}.user_preferences_sort_feed_by_comment ;;
  }

  dimension: user_preferences_suppress_event_sfxreminders {
    type: string
    sql: ${TABLE}.user_preferences_suppress_event_sfxreminders ;;
  }

  dimension: user_preferences_suppress_task_sfxreminders {
    type: string
    sql: ${TABLE}.user_preferences_suppress_task_sfxreminders ;;
  }

  dimension: user_preferences_task_reminders_checkbox_default {
    type: string
    sql: ${TABLE}.user_preferences_task_reminders_checkbox_default ;;
  }

  dimension: user_preferences_user_debug_mode_pref {
    type: string
    sql: ${TABLE}.user_preferences_user_debug_mode_pref ;;
  }

  dimension: user_role_id {
    type: string
    sql: ${TABLE}.user_role_id ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.user_type ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_deleted,
      _fivetran_synced_time,
      about_me,
      account_id,
      alias,
      avg_deal_size_c,
      badge_text,
      banner_photo_url,
      bdr_active_c,
      call_center_id,
      catering_target_this_quarter_c,
      city,
      community_nickname,
      company_name,
      contact_id,
      conversion_rate_from_qualified_to_closed_c,
      country,
      created_by_id,
      created_date_time,
      default_group_notification_frequency,
      delegated_approver_id,
      department,
      digest_frequency,
      division,
      email,
      email_encoding_key,
      email_preferences_auto_bcc,
      email_preferences_auto_bcc_stay_in_touch,
      email_preferences_stay_in_touch_reminder,
      employee_number,
      enterprise_bdr_c,
      enterprise_last_assigned_date_c_time,
      extension,
      fax,
      federation_identifier,
      first_name,
      forecast_enabled,
      full_photo_url,
      geocode_accuracy,
      happiness_region_c,
      individual_id,
      is_active,
      is_ext_indicator_visible,
      is_profile_photo_active,
      language_locale_key,
      last_assigned_date_c_time,
      last_login_date_time,
      last_modified_by_id,
      last_modified_date_time,
      last_name,
      last_password_change_date_time,
      last_referenced_date_time,
      last_viewed_date_time,
      latitude,
      lead_conversion_rate_c,
      locale_sid_key,
      longitude,
      manager_id,
      medium_banner_photo_url,
      medium_photo_url,
      microkitchen_target_this_quarter_c,
      middle_name,
      mobile_phone,
      name,
      new_opportunities_per_week_target_c,
      offline_pda_trial_expiration_date_time,
      offline_trial_expiration_date_time,
      out_of_office_message,
      phone,
      phone_burner_api_id_c,
      phone_burner_phone_burner_api_key_c,
      phone_burner_phone_burner_userid_c,
      phone_burner_user_id_c,
      postal_code,
      profile_id,
      receives_admin_info_emails,
      receives_info_emails,
      regional_head_of_happiness_c,
      scout_user_c,
      sender_email,
      sender_name,
      signature,
      small_banner_photo_url,
      small_photo_url,
      state,
      stay_in_touch_note,
      stay_in_touch_signature,
      stay_in_touch_subject,
      street,
      suffix,
      system_modstamp_time,
      time_zone_sid_key,
      title,
      user_permissions_avantgo_user,
      user_permissions_call_center_auto_login,
      user_permissions_interaction_user,
      user_permissions_marketing_user,
      user_permissions_mobile_user,
      user_permissions_offline_user,
      user_permissions_sfcontent_user,
      user_permissions_support_user,
      user_preferences_activity_reminders_popup,
      user_preferences_apex_pages_developer_mode,
      user_preferences_cache_diagnostics,
      user_preferences_create_lexapps_wtshown,
      user_preferences_dis_comment_after_like_email,
      user_preferences_dis_mentions_comment_email,
      user_preferences_dis_prof_post_comment_email,
      user_preferences_disable_all_feeds_email,
      user_preferences_disable_bookmark_email,
      user_preferences_disable_change_comment_email,
      user_preferences_disable_endorsement_email,
      user_preferences_disable_file_share_notifications_for_api,
      user_preferences_disable_followers_email,
      user_preferences_disable_later_comment_email,
      user_preferences_disable_like_email,
      user_preferences_disable_mentions_post_email,
      user_preferences_disable_message_email,
      user_preferences_disable_profile_post_email,
      user_preferences_disable_share_post_email,
      user_preferences_enable_auto_sub_for_feeds,
      user_preferences_event_reminders_checkbox_default,
      user_preferences_exclude_mail_app_attachments,
      user_preferences_favorites_show_top_favorites,
      user_preferences_favorites_wtshown,
      user_preferences_global_nav_bar_wtshown,
      user_preferences_global_nav_grid_menu_wtshown,
      user_preferences_has_celebration_badge,
      user_preferences_hide_bigger_photo_callout,
      user_preferences_hide_chatter_onboarding_splash,
      user_preferences_hide_csndesktop_task,
      user_preferences_hide_csnget_chatter_mobile_task,
      user_preferences_hide_end_user_onboarding_assistant_modal,
      user_preferences_hide_lightning_migration_modal,
      user_preferences_hide_s_1_browser_ui,
      user_preferences_hide_second_chatter_onboarding_splash,
      user_preferences_hide_sfx_welcome_mat,
      user_preferences_lightning_experience_preferred,
      user_preferences_new_lightning_report_run_page_enabled,
      user_preferences_path_assistant_collapsed,
      user_preferences_pipeline_view_hide_help_popover,
      user_preferences_preview_custom_theme,
      user_preferences_preview_lightning,
      user_preferences_record_home_reserved_wtshown,
      user_preferences_record_home_section_collapse_wtshown,
      user_preferences_reminder_sound_off,
      user_preferences_show_city_to_external_users,
      user_preferences_show_city_to_guest_users,
      user_preferences_show_country_to_external_users,
      user_preferences_show_country_to_guest_users,
      user_preferences_show_email_to_external_users,
      user_preferences_show_email_to_guest_users,
      user_preferences_show_fax_to_external_users,
      user_preferences_show_fax_to_guest_users,
      user_preferences_show_manager_to_external_users,
      user_preferences_show_manager_to_guest_users,
      user_preferences_show_mobile_phone_to_external_users,
      user_preferences_show_mobile_phone_to_guest_users,
      user_preferences_show_postal_code_to_external_users,
      user_preferences_show_postal_code_to_guest_users,
      user_preferences_show_profile_pic_to_guest_users,
      user_preferences_show_state_to_external_users,
      user_preferences_show_state_to_guest_users,
      user_preferences_show_street_address_to_external_users,
      user_preferences_show_street_address_to_guest_users,
      user_preferences_show_title_to_external_users,
      user_preferences_show_title_to_guest_users,
      user_preferences_show_work_phone_to_external_users,
      user_preferences_show_work_phone_to_guest_users,
      user_preferences_sort_feed_by_comment,
      user_preferences_suppress_event_sfxreminders,
      user_preferences_suppress_task_sfxreminders,
      user_preferences_task_reminders_checkbox_default,
      user_preferences_user_debug_mode_pref,
      user_role_id,
      user_type,
      username,
      location
    ]
  }
}
