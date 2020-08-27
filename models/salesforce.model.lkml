connection: "salesforce"

# include all the views
include: "/views/**/*.view"

datagroup: salesforce_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: salesforce_default_datagroup

explore: opportunity {
  label: "Performance by Seller"

  join: opportunity_derived_table {
    #type: left_outer
    sql_on: ${opportunity.id} =  ${opportunity_derived_table.id};;
    relationship: one_to_one
  }

  join: user {
    #type: left_outer
    sql_on: ${opportunity.owner_id} =  ${user.id};;
    relationship: many_to_one
  }

  join: account {
     #type: left_outer
     sql_on: ${opportunity.account_id} = ${account.id}
             --${account.connections_owner_c} = ${user.id}
    ;;
    relationship: one_to_many
   }


  join: forecasting_quota {
    #type: left_outer
    sql_on: ${user.id} = ${forecasting_quota.quota_owner_id}
            and ${opportunity.owner_id} = ${forecasting_quota.quota_owner_id}
            and ${opportunity.fiscal_year} = ${forecasting_quota.start_date_detail_year}
            and ${opportunity.fiscal_quarter1} = ${forecasting_quota.start_date_detail_quarter_of_year}
            ;;
    relationship: many_to_one
  }

  join: period {
     #type: left_outer
     sql_on: ${forecasting_quota.period_id} = ${period.id}
            ;;
     relationship: many_to_one
   }

}


explore: pipeline_snapshot_c {
  label: "Pipeline"

  join: user {
    #type: left_outer
    sql_on: ${pipeline_snapshot_c.opportunity_owner_c} =  ${user.name};;
    relationship: one_to_many
  }

  join: opportunity {
    #type: left_outer
    sql_on: ${opportunity.owner_id} =  ${user.id};;
    relationship: many_to_one
  }

  join: opportunity_derived_table {
    #type: left_outer
    sql_on: ${opportunity.id} =  ${opportunity_derived_table.id};;
    relationship: one_to_one
  }


}

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: accepted_event_relation {
#   join: account {
#     type: left_outer
#     sql_on: ${accepted_event_relation.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: event {
#     type: left_outer
#     sql_on: ${accepted_event_relation.event_id} = ${event.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: account_contact_relation {
#   join: contact {
#     type: left_outer
#     sql_on: ${account_contact_relation.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${account_contact_relation.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: account_contact_role {
#   join: account {
#     type: left_outer
#     sql_on: ${account_contact_role.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${account_contact_role.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: account_customer_survey_response_relatio_c {}

# explore: account_feed {}

# explore: account_history {
#   join: account {
#     type: left_outer
#     sql_on: ${account_history.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: account_partner {
#   join: opportunity {
#     type: left_outer
#     sql_on: ${account_partner.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: account_share {
#   join: account {
#     type: left_outer
#     sql_on: ${account_share.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: account_team_member {
#   join: account {
#     type: left_outer
#     sql_on: ${account_team_member.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${account_team_member.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: action_link_group_template {}

# explore: action_link_template {
#   join: action_link_group_template {
#     type: left_outer
#     sql_on: ${action_link_template.action_link_group_template_id} = ${action_link_group_template.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: active_camp_dashboard_log_c {}

# explore: active_camp_error_log_c {}

# explore: active_camp_setup_data_c {}

# explore: additional_number {
#   join: call_center {
#     type: left_outer
#     sql_on: ${additional_number.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: announcement {
#   join: feed_item {
#     type: left_outer
#     sql_on: ${announcement.feed_item_id} = ${feed_item.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: apex_class {}

# explore: apex_component {}

# explore: apex_email_notification {
#   join: user {
#     type: left_outer
#     sql_on: ${apex_email_notification.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: apex_log {}

# explore: apex_page {}

# explore: apex_test_queue_item {
#   join: apex_class {
#     type: left_outer
#     sql_on: ${apex_test_queue_item.apex_class_id} = ${apex_class.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: apex_test_result {
#   join: apex_log {
#     type: left_outer
#     sql_on: ${apex_test_result.apex_log_id} = ${apex_log.id} ;;
#     relationship: many_to_one
#   }

#   join: apex_test_run_result {
#     type: left_outer
#     sql_on: ${apex_test_result.apex_test_run_result_id} = ${apex_test_run_result.id} ;;
#     relationship: many_to_one
#   }

#   join: apex_class {
#     type: left_outer
#     sql_on: ${apex_test_result.apex_class_id} = ${apex_class.id} ;;
#     relationship: many_to_one
#   }

#   join: async_apex_job {
#     type: left_outer
#     sql_on: ${apex_test_result.async_apex_job_id} = ${async_apex_job.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${apex_test_run_result.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: apex_test_result_limits {
#   join: apex_test_result {
#     type: left_outer
#     sql_on: ${apex_test_result_limits.apex_test_result_id} = ${apex_test_result.id} ;;
#     relationship: many_to_one
#   }

#   join: apex_log {
#     type: left_outer
#     sql_on: ${apex_test_result.apex_log_id} = ${apex_log.id} ;;
#     relationship: many_to_one
#   }

#   join: apex_test_run_result {
#     type: left_outer
#     sql_on: ${apex_test_result.apex_test_run_result_id} = ${apex_test_run_result.id} ;;
#     relationship: many_to_one
#   }

#   join: apex_class {
#     type: left_outer
#     sql_on: ${apex_test_result.apex_class_id} = ${apex_class.id} ;;
#     relationship: many_to_one
#   }

#   join: async_apex_job {
#     type: left_outer
#     sql_on: ${apex_test_result.async_apex_job_id} = ${async_apex_job.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${apex_test_run_result.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: apex_test_run_result {
#   join: user {
#     type: left_outer
#     sql_on: ${apex_test_run_result.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: async_apex_job {
#     type: left_outer
#     sql_on: ${apex_test_run_result.async_apex_job_id} = ${async_apex_job.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: apex_class {
#     type: left_outer
#     sql_on: ${async_apex_job.apex_class_id} = ${apex_class.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: apex_test_suite {}

# explore: apex_trigger {}

# explore: app_analytics_query_request {}

# explore: app_menu_item {}

# explore: approval {}

# explore: arr_snapshot_c {}

# explore: arr_snapshot_history {}

# explore: asset {
#   join: product_2 {
#     type: left_outer
#     sql_on: ${asset.product_2_id} = ${product_2.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${asset.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${asset.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: asset_feed {}

# explore: asset_history {
#   join: asset {
#     type: left_outer
#     sql_on: ${asset_history.asset_id} = ${asset.root_asset_id} ;;
#     relationship: many_to_one
#   }

#   join: product_2 {
#     type: left_outer
#     sql_on: ${asset.product_2_id} = ${product_2.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${asset.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${asset.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: asset_relationship {
#   join: asset {
#     type: left_outer
#     sql_on: ${asset_relationship.asset_id} = ${asset.root_asset_id} ;;
#     relationship: many_to_one
#   }

#   join: product_2 {
#     type: left_outer
#     sql_on: ${asset.product_2_id} = ${product_2.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${asset.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${asset.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: asset_relationship_feed {}

# explore: asset_relationship_history {
#   join: asset_relationship {
#     type: left_outer
#     sql_on: ${asset_relationship_history.asset_relationship_id} = ${asset_relationship.id} ;;
#     relationship: many_to_one
#   }

#   join: asset {
#     type: left_outer
#     sql_on: ${asset_relationship.asset_id} = ${asset.root_asset_id} ;;
#     relationship: many_to_one
#   }

#   join: product_2 {
#     type: left_outer
#     sql_on: ${asset.product_2_id} = ${product_2.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${asset.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${asset.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: asset_share {
#   join: asset {
#     type: left_outer
#     sql_on: ${asset_share.asset_id} = ${asset.root_asset_id} ;;
#     relationship: many_to_one
#   }

#   join: product_2 {
#     type: left_outer
#     sql_on: ${asset.product_2_id} = ${product_2.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${asset.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${asset.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: assignment_rule {}

# explore: async_apex_job {
#   join: apex_class {
#     type: left_outer
#     sql_on: ${async_apex_job.apex_class_id} = ${apex_class.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: attachment {}

# explore: aura_definition {
#   join: aura_definition_bundle {
#     type: left_outer
#     sql_on: ${aura_definition.aura_definition_bundle_id} = ${aura_definition_bundle.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: aura_definition_bundle {}

# explore: aura_definition_info {
#   join: aura_definition {
#     type: left_outer
#     sql_on: ${aura_definition_info.aura_definition_id} = ${aura_definition.id} ;;
#     relationship: many_to_one
#   }

#   join: aura_definition_bundle {
#     type: left_outer
#     sql_on: ${aura_definition.aura_definition_bundle_id} = ${aura_definition_bundle.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: auth_config {}

# explore: auth_config_providers {
#   join: auth_config {
#     type: left_outer
#     sql_on: ${auth_config_providers.auth_config_id} = ${auth_config.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${auth_config_providers.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: auth_provider {}

# explore: auth_session {
#   join: login_geo {
#     type: left_outer
#     sql_on: ${auth_session.login_geo_id} = ${login_geo.id} ;;
#     relationship: many_to_one
#   }

#   join: login_history {
#     type: left_outer
#     sql_on: ${auth_session.login_history_id} = ${login_history.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${login_history.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: background_operation {}

# explore: brand_template {}

# explore: branding_set {}

# explore: branding_set_property {
#   join: branding_set {
#     type: left_outer
#     sql_on: ${branding_set_property.branding_set_id} = ${branding_set.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: business_hours {}

# explore: business_process {}

# explore: calendar {
#   join: user {
#     type: left_outer
#     sql_on: ${calendar.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: call_center {}

# explore: campaign {}

# explore: campaign_feed {}

# explore: campaign_history {
#   join: campaign {
#     type: left_outer
#     sql_on: ${campaign_history.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: campaign_influence_model {}

# explore: campaign_member {
#   join: contact {
#     type: left_outer
#     sql_on: ${campaign_member.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${campaign_member.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: lead {
#     type: left_outer
#     sql_on: ${campaign_member.lead_id} = ${lead.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${contact.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: campaign_member_status {
#   join: campaign {
#     type: left_outer
#     sql_on: ${campaign_member_status.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: campaign_share {
#   join: campaign {
#     type: left_outer
#     sql_on: ${campaign_share.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: case {
#   join: contact {
#     type: left_outer
#     sql_on: ${case.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${case.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: case_comment {}

# explore: case_contact_role {
#   join: contact {
#     type: left_outer
#     sql_on: ${case_contact_role.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${contact.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: case_feed {}

# explore: case_history {
#   join: case {
#     type: left_outer
#     sql_on: ${case_history.case_id} = ${case.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${case.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${case.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: case_share {
#   join: case {
#     type: left_outer
#     sql_on: ${case_share.case_id} = ${case.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${case.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${case.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: case_solution {
#   join: case {
#     type: left_outer
#     sql_on: ${case_solution.case_id} = ${case.id} ;;
#     relationship: many_to_one
#   }

#   join: solution {
#     type: left_outer
#     sql_on: ${case_solution.solution_id} = ${solution.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${case.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${case.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: case_status {}

# explore: case_team_member {}

# explore: case_team_role {}

# explore: case_team_template {}

# explore: case_team_template_member {}

# explore: case_team_template_record {}

# explore: category_data {
#   join: category_node {
#     type: left_outer
#     sql_on: ${category_data.category_node_id} = ${category_node.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: category_node {}

# explore: chatter_activity {}

# explore: chatter_extension {}

# explore: chatter_extension_config {
#   join: chatter_extension {
#     type: left_outer
#     sql_on: ${chatter_extension_config.chatter_extension_id} = ${chatter_extension.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: client_browser {}

# explore: collaboration_group {
#   join: announcement {
#     type: left_outer
#     sql_on: ${collaboration_group.announcement_id} = ${announcement.id} ;;
#     relationship: many_to_one
#   }

#   join: feed_item {
#     type: left_outer
#     sql_on: ${announcement.feed_item_id} = ${feed_item.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: collaboration_group_feed {}

# explore: collaboration_group_member {
#   join: collaboration_group {
#     type: left_outer
#     sql_on: ${collaboration_group_member.collaboration_group_id} = ${collaboration_group.id} ;;
#     relationship: many_to_one
#   }

#   join: announcement {
#     type: left_outer
#     sql_on: ${collaboration_group.announcement_id} = ${announcement.id} ;;
#     relationship: many_to_one
#   }

#   join: feed_item {
#     type: left_outer
#     sql_on: ${announcement.feed_item_id} = ${feed_item.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: collaboration_group_member_request {
#   join: collaboration_group {
#     type: left_outer
#     sql_on: ${collaboration_group_member_request.collaboration_group_id} = ${collaboration_group.id} ;;
#     relationship: many_to_one
#   }

#   join: announcement {
#     type: left_outer
#     sql_on: ${collaboration_group.announcement_id} = ${announcement.id} ;;
#     relationship: many_to_one
#   }

#   join: feed_item {
#     type: left_outer
#     sql_on: ${announcement.feed_item_id} = ${feed_item.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: collaboration_group_record {
#   join: collaboration_group {
#     type: left_outer
#     sql_on: ${collaboration_group_record.collaboration_group_id} = ${collaboration_group.id} ;;
#     relationship: many_to_one
#   }

#   join: announcement {
#     type: left_outer
#     sql_on: ${collaboration_group.announcement_id} = ${announcement.id} ;;
#     relationship: many_to_one
#   }

#   join: feed_item {
#     type: left_outer
#     sql_on: ${announcement.feed_item_id} = ${feed_item.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: collaboration_invitation {}

# explore: community {}

# explore: conference_number {
#   join: external_event {
#     type: left_outer
#     sql_on: ${conference_number.external_event_id} = ${external_event.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: connected_application {}

# explore: contact {
#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${contact.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: contact_feed {}

# explore: contact_history {
#   join: contact {
#     type: left_outer
#     sql_on: ${contact_history.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${contact.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: contact_point_consent {
#   join: data_use_purpose {
#     type: left_outer
#     sql_on: ${contact_point_consent.data_use_purpose_id} = ${data_use_purpose.id} ;;
#     relationship: many_to_one
#   }

#   join: contact_point_type_consent {
#     type: left_outer
#     sql_on: ${contact_point_consent.contact_point_type_consent_id} = ${contact_point_type_consent.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: contact_point_consent_history {
#   join: contact_point_consent {
#     type: left_outer
#     sql_on: ${contact_point_consent_history.contact_point_consent_id} = ${contact_point_consent.id} ;;
#     relationship: many_to_one
#   }

#   join: data_use_purpose {
#     type: left_outer
#     sql_on: ${contact_point_consent.data_use_purpose_id} = ${data_use_purpose.id} ;;
#     relationship: many_to_one
#   }

#   join: contact_point_type_consent {
#     type: left_outer
#     sql_on: ${contact_point_consent.contact_point_type_consent_id} = ${contact_point_type_consent.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: contact_point_consent_share {}

# explore: contact_point_email {}

# explore: contact_point_email_history {
#   join: contact_point_email {
#     type: left_outer
#     sql_on: ${contact_point_email_history.contact_point_email_id} = ${contact_point_email.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: contact_point_email_share {}

# explore: contact_point_phone {}

# explore: contact_point_phone_history {
#   join: contact_point_phone {
#     type: left_outer
#     sql_on: ${contact_point_phone_history.contact_point_phone_id} = ${contact_point_phone.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: contact_point_phone_share {}

# explore: contact_point_type_consent {
#   join: data_use_purpose {
#     type: left_outer
#     sql_on: ${contact_point_type_consent.data_use_purpose_id} = ${data_use_purpose.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: contact_point_type_consent_history {
#   join: contact_point_type_consent {
#     type: left_outer
#     sql_on: ${contact_point_type_consent_history.contact_point_type_consent_id} = ${contact_point_type_consent.id} ;;
#     relationship: many_to_one
#   }

#   join: data_use_purpose {
#     type: left_outer
#     sql_on: ${contact_point_type_consent.data_use_purpose_id} = ${data_use_purpose.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: contact_point_type_consent_share {}

# explore: contact_request {}

# explore: contact_request_share {}

# explore: contact_share {
#   join: contact {
#     type: left_outer
#     sql_on: ${contact_share.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${contact.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${contact.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_asset {
#   join: content_document {
#     type: left_outer
#     sql_on: ${content_asset.content_document_id} = ${content_document.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_distribution {
#   join: content_document {
#     type: left_outer
#     sql_on: ${content_distribution.content_document_id} = ${content_document.id} ;;
#     relationship: many_to_one
#   }

#   join: content_version {
#     type: left_outer
#     sql_on: ${content_distribution.content_version_id} = ${content_version.id} ;;
#     relationship: many_to_one
#   }

#   join: content_asset {
#     type: left_outer
#     sql_on: ${content_document.content_asset_id} = ${content_asset.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${content_version.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_distribution_view {}

# explore: content_document {
#   join: content_asset {
#     type: left_outer
#     sql_on: ${content_document.content_asset_id} = ${content_asset.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_document_feed {}

# explore: content_document_history {
#   join: content_document {
#     type: left_outer
#     sql_on: ${content_document_history.content_document_id} = ${content_document.id} ;;
#     relationship: many_to_one
#   }

#   join: content_asset {
#     type: left_outer
#     sql_on: ${content_document.content_asset_id} = ${content_asset.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_document_link {
#   join: content_document {
#     type: left_outer
#     sql_on: ${content_document_link.content_document_id} = ${content_document.id} ;;
#     relationship: many_to_one
#   }

#   join: content_asset {
#     type: left_outer
#     sql_on: ${content_document.content_asset_id} = ${content_asset.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_folder {}

# explore: content_folder_item {}

# explore: content_folder_member {}

# explore: content_note {}

# explore: content_notification {}

# explore: content_version {
#   join: external_data_source {
#     type: left_outer
#     sql_on: ${content_version.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: content_document {
#     type: left_outer
#     sql_on: ${content_version.content_document_id} = ${content_document.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: content_asset {
#     type: left_outer
#     sql_on: ${content_document.content_asset_id} = ${content_asset.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_version_comment {
#   join: content_version {
#     type: left_outer
#     sql_on: ${content_version_comment.content_version_id} = ${content_version.id} ;;
#     relationship: many_to_one
#   }

#   join: content_document {
#     type: left_outer
#     sql_on: ${content_version_comment.content_document_id} = ${content_document.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${content_version.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: content_asset {
#     type: left_outer
#     sql_on: ${content_document.content_asset_id} = ${content_asset.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_version_history {
#   join: content_version {
#     type: left_outer
#     sql_on: ${content_version_history.content_version_id} = ${content_version.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${content_version.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: content_document {
#     type: left_outer
#     sql_on: ${content_version.content_document_id} = ${content_document.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: content_asset {
#     type: left_outer
#     sql_on: ${content_document.content_asset_id} = ${content_asset.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_version_rating {
#   join: user {
#     type: left_outer
#     sql_on: ${content_version_rating.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: content_version {
#     type: left_outer
#     sql_on: ${content_version_rating.content_version_id} = ${content_version.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${content_version.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: content_document {
#     type: left_outer
#     sql_on: ${content_version.content_document_id} = ${content_document.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: content_asset {
#     type: left_outer
#     sql_on: ${content_document.content_asset_id} = ${content_asset.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_workspace {}

# explore: content_workspace_doc {
#   join: content_workspace {
#     type: left_outer
#     sql_on: ${content_workspace_doc.content_workspace_id} = ${content_workspace.id} ;;
#     relationship: many_to_one
#   }

#   join: content_document {
#     type: left_outer
#     sql_on: ${content_workspace_doc.content_document_id} = ${content_document.id} ;;
#     relationship: many_to_one
#   }

#   join: content_asset {
#     type: left_outer
#     sql_on: ${content_document.content_asset_id} = ${content_asset.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_workspace_member {
#   join: content_workspace_permission {
#     type: left_outer
#     sql_on: ${content_workspace_member.content_workspace_permission_id} = ${content_workspace_permission.id} ;;
#     relationship: many_to_one
#   }

#   join: content_workspace {
#     type: left_outer
#     sql_on: ${content_workspace_member.content_workspace_id} = ${content_workspace.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: content_workspace_permission {}

# explore: contract {
#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${contract.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${contract.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: contract_contact_role {
#   join: contract {
#     type: left_outer
#     sql_on: ${contract_contact_role.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${contract_contact_role.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${contract.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${contract.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: contract_feed {}

# explore: contract_history {
#   join: contract {
#     type: left_outer
#     sql_on: ${contract_history.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${contract.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${contract.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: contract_status {}

# explore: cors_whitelist_entry {}

# explore: cron_trigger {}

# explore: csatsurvey_contact_association_c {}

# explore: csatsurvey_contact_association_history {}

# explore: csp_trusted_site {}

# explore: custom_brand {}

# explore: custom_brand_asset {
#   join: custom_brand {
#     type: left_outer
#     sql_on: ${custom_brand_asset.custom_brand_id} = ${custom_brand.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: custom_help_menu_item {}

# explore: custom_help_menu_section {}

# explore: custom_http_header {}

# explore: custom_object_user_license_metrics {
#   join: user_license {
#     type: left_outer
#     sql_on: ${custom_object_user_license_metrics.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: custom_permission {}

# explore: custom_permission_dependency {
#   join: custom_permission {
#     type: left_outer
#     sql_on: ${custom_permission_dependency.custom_permission_id} = ${custom_permission.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: customer_survey_response_c {}

# explore: customer_survey_response_history {}

# explore: dashboard {
#   join: folder {
#     type: left_outer
#     sql_on: ${dashboard.folder_id} = ${folder.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: dashboard_component_feed {}

# explore: dashboard_feed {}

# explore: data_assessment_field_metric {
#   join: data_assessment_metric {
#     type: left_outer
#     sql_on: ${data_assessment_field_metric.data_assessment_metric_id} = ${data_assessment_metric.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: data_assessment_metric {}

# explore: data_assessment_value_metric {
#   join: data_assessment_field_metric {
#     type: left_outer
#     sql_on: ${data_assessment_value_metric.data_assessment_field_metric_id} = ${data_assessment_field_metric.id} ;;
#     relationship: many_to_one
#   }

#   join: data_assessment_metric {
#     type: left_outer
#     sql_on: ${data_assessment_field_metric.data_assessment_metric_id} = ${data_assessment_metric.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: data_integration_record_purchase_permission {
#   join: user {
#     type: left_outer
#     sql_on: ${data_integration_record_purchase_permission.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: data_use_legal_basis {}

# explore: data_use_legal_basis_history {
#   join: data_use_legal_basis {
#     type: left_outer
#     sql_on: ${data_use_legal_basis_history.data_use_legal_basis_id} = ${data_use_legal_basis.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: data_use_legal_basis_share {}

# explore: data_use_purpose {}

# explore: data_use_purpose_history {
#   join: data_use_purpose {
#     type: left_outer
#     sql_on: ${data_use_purpose_history.data_use_purpose_id} = ${data_use_purpose.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: data_use_purpose_share {}

# explore: declined_event_relation {
#   join: account {
#     type: left_outer
#     sql_on: ${declined_event_relation.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: event {
#     type: left_outer
#     sql_on: ${declined_event_relation.event_id} = ${event.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: document {
#   join: folder {
#     type: left_outer
#     sql_on: ${document.folder_id} = ${folder.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: document_attachment_map {
#   join: document {
#     type: left_outer
#     sql_on: ${document_attachment_map.document_id} = ${document.id} ;;
#     relationship: many_to_one
#   }

#   join: folder {
#     type: left_outer
#     sql_on: ${document.folder_id} = ${folder.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: domain {}

# explore: domain_site {
#   join: domain {
#     type: left_outer
#     sql_on: ${domain_site.domain_id} = ${domain.id} ;;
#     relationship: many_to_one
#   }

#   join: site {
#     type: left_outer
#     sql_on: ${domain_site.site_id} = ${site.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: duplicate_record_item {
#   join: duplicate_record_set {
#     type: left_outer
#     sql_on: ${duplicate_record_item.duplicate_record_set_id} = ${duplicate_record_set.id} ;;
#     relationship: many_to_one
#   }

#   join: duplicate_rule {
#     type: left_outer
#     sql_on: ${duplicate_record_set.duplicate_rule_id} = ${duplicate_rule.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: duplicate_record_set {
#   join: duplicate_rule {
#     type: left_outer
#     sql_on: ${duplicate_record_set.duplicate_rule_id} = ${duplicate_rule.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: duplicate_rule {}

# explore: email_capture {}

# explore: email_domain_filter {
#   join: email_relay {
#     type: left_outer
#     sql_on: ${email_domain_filter.email_relay_id} = ${email_relay.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: email_domain_key {}

# explore: email_message {
#   join: email_template {
#     type: left_outer
#     sql_on: ${email_message.email_template_id} = ${email_template.id} ;;
#     relationship: many_to_one
#   }

#   join: brand_template {
#     type: left_outer
#     sql_on: ${email_template.brand_template_id} = ${brand_template.id} ;;
#     relationship: many_to_one
#   }

#   join: folder {
#     type: left_outer
#     sql_on: ${email_template.folder_id} = ${folder.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: email_message_relation {
#   join: email_message {
#     type: left_outer
#     sql_on: ${email_message_relation.email_message_id} = ${email_message.reply_to_email_message_id} ;;
#     relationship: many_to_one
#   }

#   join: email_template {
#     type: left_outer
#     sql_on: ${email_message.email_template_id} = ${email_template.id} ;;
#     relationship: many_to_one
#   }

#   join: brand_template {
#     type: left_outer
#     sql_on: ${email_template.brand_template_id} = ${brand_template.id} ;;
#     relationship: many_to_one
#   }

#   join: folder {
#     type: left_outer
#     sql_on: ${email_template.folder_id} = ${folder.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: email_relay {}

# explore: email_services_address {}

# explore: email_services_function {
#   join: apex_class {
#     type: left_outer
#     sql_on: ${email_services_function.apex_class_id} = ${apex_class.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: email_template {
#   join: brand_template {
#     type: left_outer
#     sql_on: ${email_template.brand_template_id} = ${brand_template.id} ;;
#     relationship: many_to_one
#   }

#   join: folder {
#     type: left_outer
#     sql_on: ${email_template.folder_id} = ${folder.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: entity_subscription {}

# explore: event {
#   join: account {
#     type: left_outer
#     sql_on: ${event.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: event_feed {}

# explore: event_log_file {}

# explore: event_relation {
#   join: account {
#     type: left_outer
#     sql_on: ${event_relation.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: event {
#     type: left_outer
#     sql_on: ${event_relation.event_id} = ${event.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: event_who_relation {
#   join: account {
#     type: left_outer
#     sql_on: ${event_who_relation.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: event {
#     type: left_outer
#     sql_on: ${event_who_relation.event_id} = ${event.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: expression_filter {}

# explore: expression_filter_criteria {
#   join: expression_filter {
#     type: left_outer
#     sql_on: ${expression_filter_criteria.expression_filter_id} = ${expression_filter.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: external_data_source {
#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: external_data_user_auth {
#   join: external_data_source {
#     type: left_outer
#     sql_on: ${external_data_user_auth.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_user_auth.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${external_data_user_auth.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: external_event {}

# explore: external_event_mapping {
#   join: event {
#     type: left_outer
#     sql_on: ${external_event_mapping.event_id} = ${event.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${event.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: external_event_mapping_share {}

# explore: feed_comment {
#   join: feed_item {
#     type: left_outer
#     sql_on: ${feed_comment.feed_item_id} = ${feed_item.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: feed_item {}

# explore: feed_poll_choice {
#   join: feed_item {
#     type: left_outer
#     sql_on: ${feed_poll_choice.feed_item_id} = ${feed_item.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: feed_poll_vote {
#   join: feed_item {
#     type: left_outer
#     sql_on: ${feed_poll_vote.feed_item_id} = ${feed_item.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: feed_revision {}

# explore: field_permissions {}

# explore: file_search_activity {}

# explore: fiscal_year_settings {
#   join: period {
#     type: left_outer
#     sql_on: ${fiscal_year_settings.period_id} = ${period.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: fivetran_api_call {}

# explore: fivetran_audit {}

# explore: fivetran_formula {}

# explore: fivetran_formula_history {}

# explore: fivetran_query {}

# explore: flow_interview {}

# explore: flow_interview_share {}

# explore: flow_record_relation {}

# explore: flow_stage_relation {}

# explore: folder {}

# explore: forecast_share {
#   join: user_role {
#     type: left_outer
#     sql_on: ${forecast_share.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: forecasting_adjustment {
#   join: forecasting_item {
#     type: left_outer
#     sql_on: ${forecasting_adjustment.forecasting_item_id} = ${forecasting_item.id} ;;
#     relationship: many_to_one
#   }

#   join: forecasting_type {
#     type: left_outer
#     sql_on: ${forecasting_adjustment.forecasting_type_id} = ${forecasting_type.id} ;;
#     relationship: many_to_one
#   }

#   join: period {
#     type: left_outer
#     sql_on: ${forecasting_adjustment.period_id} = ${period.id} ;;
#     relationship: many_to_one
#   }

#   join: fiscal_year_settings {
#     type: left_outer
#     sql_on: ${period.fiscal_year_settings_id} = ${fiscal_year_settings.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: forecasting_category_mapping {}

# explore: forecasting_displayed_family {}

# explore: forecasting_fact {
#   join: opportunity {
#     type: left_outer
#     sql_on: ${forecasting_fact.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: forecasting_item {
#     type: left_outer
#     sql_on: ${forecasting_fact.forecasting_item_id} = ${forecasting_item.id} ;;
#     relationship: many_to_one
#   }

#   join: forecasting_type {
#     type: left_outer
#     sql_on: ${forecasting_fact.forecasting_type_id} = ${forecasting_type.id} ;;
#     relationship: many_to_one
#   }

#   join: period {
#     type: left_outer
#     sql_on: ${forecasting_fact.period_id} = ${period.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: fiscal_year_settings {
#     type: left_outer
#     sql_on: ${period.fiscal_year_settings_id} = ${fiscal_year_settings.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: forecasting_item {
#   join: period {
#     type: left_outer
#     sql_on: ${forecasting_item.period_id} = ${period.id} ;;
#     relationship: many_to_one
#   }

#   join: forecasting_type {
#     type: left_outer
#     sql_on: ${forecasting_item.forecasting_type_id} = ${forecasting_type.id} ;;
#     relationship: many_to_one
#   }

#   join: fiscal_year_settings {
#     type: left_outer
#     sql_on: ${period.fiscal_year_settings_id} = ${fiscal_year_settings.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: forecasting_owner_adjustment {
#   join: forecasting_item {
#     type: left_outer
#     sql_on: ${forecasting_owner_adjustment.forecasting_item_id} = ${forecasting_item.id} ;;
#     relationship: many_to_one
#   }

#   join: forecasting_type {
#     type: left_outer
#     sql_on: ${forecasting_owner_adjustment.forecasting_type_id} = ${forecasting_type.id} ;;
#     relationship: many_to_one
#   }

#   join: period {
#     type: left_outer
#     sql_on: ${forecasting_owner_adjustment.period_id} = ${period.id} ;;
#     relationship: many_to_one
#   }

#   join: fiscal_year_settings {
#     type: left_outer
#     sql_on: ${period.fiscal_year_settings_id} = ${fiscal_year_settings.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: forecasting_quota {
#   join: forecasting_type {
#     type: left_outer
#     sql_on: ${forecasting_quota.forecasting_type_id} = ${forecasting_type.id} ;;
#     relationship: many_to_one
#   }

#   join: period {
#     type: left_outer
#     sql_on: ${forecasting_quota.period_id} = ${period.id} ;;
#     relationship: many_to_one
#   }

#   join: fiscal_year_settings {
#     type: left_outer
#     sql_on: ${period.fiscal_year_settings_id} = ${fiscal_year_settings.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: forecasting_share {}

# explore: forecasting_type {}

# explore: forecasting_type_to_category {
#   join: forecasting_type {
#     type: left_outer
#     sql_on: ${forecasting_type_to_category.forecasting_type_id} = ${forecasting_type.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: google_doc {}

# explore: granted_by_license {
#   join: permission_set_license {
#     type: left_outer
#     sql_on: ${granted_by_license.permission_set_license_id} = ${permission_set_license.id} ;;
#     relationship: many_to_one
#   }

#   join: custom_permission {
#     type: left_outer
#     sql_on: ${granted_by_license.custom_permission_id} = ${custom_permission.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: group {}

# explore: group_member {
#   join: group {
#     type: left_outer
#     sql_on: ${group_member.group_id} = ${group.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: holiday {}

# explore: idea {
#   join: community {
#     type: left_outer
#     sql_on: ${idea.community_id} = ${community.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${idea.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: idea_comment {
#   join: idea {
#     type: left_outer
#     sql_on: ${idea_comment.idea_id} = ${idea.parent_idea_id} ;;
#     relationship: many_to_one
#   }

#   join: community {
#     type: left_outer
#     sql_on: ${idea_comment.community_id} = ${community.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${idea.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: iframe_white_list_url {}

# explore: image {
#   join: content_document {
#     type: left_outer
#     sql_on: ${image.content_document_id} = ${content_document.id} ;;
#     relationship: many_to_one
#   }

#   join: content_asset {
#     type: left_outer
#     sql_on: ${content_document.content_asset_id} = ${content_asset.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: image_share {}

# explore: individual {}

# explore: individual_history {
#   join: individual {
#     type: left_outer
#     sql_on: ${individual_history.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: individual_share {
#   join: individual {
#     type: left_outer
#     sql_on: ${individual_share.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: installed_mobile_app {
#   join: user {
#     type: left_outer
#     sql_on: ${installed_mobile_app.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: connected_application {
#     type: left_outer
#     sql_on: ${installed_mobile_app.connected_application_id} = ${connected_application.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: knowledgeable_user {
#   join: user {
#     type: left_outer
#     sql_on: ${knowledgeable_user.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: topic {
#     type: left_outer
#     sql_on: ${knowledgeable_user.topic_id} = ${topic.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: launch_c {}

# explore: launch_history {}

# explore: lead {
#   join: individual {
#     type: left_outer
#     sql_on: ${lead.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${lead.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: lead_feed {}

# explore: lead_history {
#   join: lead {
#     type: left_outer
#     sql_on: ${lead_history.lead_id} = ${lead.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${lead.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${lead.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: lead_share {
#   join: lead {
#     type: left_outer
#     sql_on: ${lead_share.lead_id} = ${lead.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${lead.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${lead.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: lead_status {}

# explore: lean_data_a_2_b_group_c {}

# explore: lean_data_access_level_assignment_c {}

# explore: lean_data_account_search_c {}

# explore: lean_data_api_metric_c {}

# explore: lean_data_attribution_configuration_c {}

# explore: lean_data_buyer_persona_c {}

# explore: lean_data_campaign_influence_summary_c {}

# explore: lean_data_campaign_opportunity_c {}

# explore: lean_data_campaign_opportunity_history {}

# explore: lean_data_cc_inserted_object_c {}

# explore: lean_data_continuous_persona_on_sobject_c {}

# explore: lean_data_daily_metrics_wrapper_c {}

# explore: lean_data_ld_json_search_c {}

# explore: lean_data_ld_json_search_history {}

# explore: lean_data_ld_long_log_c {}

# explore: lean_data_ld_member_c {}

# explore: lean_data_ld_partner_c {}

# explore: lean_data_ld_partner_callout_c {}

# explore: lean_data_ld_partner_callout_history {}

# explore: lean_data_ld_partner_history {}

# explore: lean_data_ld_partner_log_c {}

# explore: lean_data_ld_partner_log_history {}

# explore: lean_data_ld_partner_metadata_c {}

# explore: lean_data_ld_partner_metadata_history {}

# explore: lean_data_ld_search_c {}

# explore: lean_data_ld_territory_c {}

# explore: lean_data_ld_territory_geo_c {}

# explore: lean_data_lead_conversion_c {}

# explore: lean_data_lead_search_c {}

# explore: lean_data_log_c {}

# explore: lean_data_long_text_setting_c {}

# explore: lean_data_marketing_touch_c {}

# explore: lean_data_marketing_touch_history {}

# explore: lean_data_mass_convert_lead_c {}

# explore: lean_data_matched_view_setting_c {}

# explore: lean_data_matching_token_c {}

# explore: lean_data_one_time_buyer_persona_history_c {}

# explore: lean_data_opportunity_campaign_member_c {}

# explore: lean_data_persona_action_c {}

# explore: lean_data_persona_condition_c {}

# explore: lean_data_potential_match_c {}

# explore: lean_data_profile_permission_setting_c {}

# explore: lean_data_quarterly_metric_c {}

# explore: lean_data_reporting_log_c {}

# explore: lean_data_reporting_setting_c {}

# explore: lean_data_reporting_setting_history {}

# explore: lean_data_round_robin_grouping_c {}

# explore: lean_data_round_robin_pool_c {}

# explore: lean_data_round_robin_schedule_setting_c {}

# explore: lean_data_round_robin_setting_c {}

# explore: lean_data_round_robin_setting_lock_c {}

# explore: lean_data_routing_deployment_c {}

# explore: lean_data_routing_graph_c {}

# explore: lean_data_routing_metric_c {}

# explore: lean_data_temporary_marketing_touch_c {}

# explore: lean_data_temporary_marketing_touch_history {}

# explore: lean_data_territory_segment_c {}

# explore: lean_data_upload_lead_c {}

# explore: lightning_exit_by_page_metrics {
#   join: user {
#     type: left_outer
#     sql_on: ${lightning_exit_by_page_metrics.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: lightning_experience_theme {}

# explore: lightning_toggle_metrics {
#   join: user {
#     type: left_outer
#     sql_on: ${lightning_toggle_metrics.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: lightning_usage_by_app_type_metrics {
#   join: user {
#     type: left_outer
#     sql_on: ${lightning_usage_by_app_type_metrics.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: lightning_usage_by_browser_metrics {}

# explore: lightning_usage_by_flexi_page_metrics {}

# explore: lightning_usage_by_page_metrics {
#   join: user {
#     type: left_outer
#     sql_on: ${lightning_usage_by_page_metrics.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: list_email {
#   join: campaign {
#     type: left_outer
#     sql_on: ${list_email.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: list_email_individual_recipient {
#   join: list_email {
#     type: left_outer
#     sql_on: ${list_email_individual_recipient.list_email_id} = ${list_email.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${list_email.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: list_email_recipient_source {
#   join: list_email {
#     type: left_outer
#     sql_on: ${list_email_recipient_source.list_email_id} = ${list_email.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${list_email.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: list_email_share {}

# explore: list_view {}

# explore: list_view_chart {}

# explore: login_geo {}

# explore: login_history {
#   join: login_geo {
#     type: left_outer
#     sql_on: ${login_history.login_geo_id} = ${login_geo.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${login_history.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: login_ip {}

# explore: macro {}

# explore: macro_history {
#   join: macro {
#     type: left_outer
#     sql_on: ${macro_history.macro_id} = ${macro.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: macro_instruction {
#   join: macro {
#     type: left_outer
#     sql_on: ${macro_instruction.macro_id} = ${macro.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: macro_share {}

# explore: mailmerge_template {}

# explore: matching_information {
#   join: user {
#     type: left_outer
#     sql_on: ${matching_information.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: matching_rule {}

# explore: matching_rule_item {
#   join: matching_rule {
#     type: left_outer
#     sql_on: ${matching_rule_item.matching_rule_id} = ${matching_rule.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: mobile_application_detail {}

# explore: my_domain_discoverable_login {}

# explore: named_credential {
#   join: auth_provider {
#     type: left_outer
#     sql_on: ${named_credential.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: new_bookings {}

# explore: note {}

# explore: oauth_token {
#   join: app_menu_item {
#     type: left_outer
#     sql_on: ${oauth_token.app_menu_item_id} = ${app_menu_item.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${oauth_token.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: object_permissions {}

# explore: oh_my_green_setting_c {}

# explore: onboarding_metrics {
#   join: user {
#     type: left_outer
#     sql_on: ${onboarding_metrics.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: opportunity {
#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: opportunity_competitor {
#   join: opportunity {
#     type: left_outer
#     sql_on: ${opportunity_competitor.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: opportunity_contact_role {
#   join: opportunity {
#     type: left_outer
#     sql_on: ${opportunity_contact_role.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${opportunity_contact_role.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: opportunity_feed {}

# explore: opportunity_field_history {
#   join: opportunity {
#     type: left_outer
#     sql_on: ${opportunity_field_history.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: opportunity_history {
#   join: opportunity {
#     type: left_outer
#     sql_on: ${opportunity_history.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: opportunity_line_item {
#   join: product_2 {
#     type: left_outer
#     sql_on: ${opportunity_line_item.product_2_id} = ${product_2.id} ;;
#     relationship: many_to_one
#   }

#   join: opportunity {
#     type: left_outer
#     sql_on: ${opportunity_line_item.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_entry {
#     type: left_outer
#     sql_on: ${opportunity_line_item.pricebook_entry_id} = ${pricebook_entry.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: opportunity_partner {
#   join: opportunity {
#     type: left_outer
#     sql_on: ${opportunity_partner.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: opportunity_share {
#   join: opportunity {
#     type: left_outer
#     sql_on: ${opportunity_share.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: opportunity_stage {}

# explore: opportunity_team_member {
#   join: opportunity {
#     type: left_outer
#     sql_on: ${opportunity_team_member.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${opportunity_team_member.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order {
#   join: contract {
#     type: left_outer
#     sql_on: ${order.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${order.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${order.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_feed {}

# explore: order_history {
#   join: order {
#     type: left_outer
#     sql_on: ${order_history.order_id} = ${order.original_order_id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${order.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${order.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${order.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_item {
#   join: product_2 {
#     type: left_outer
#     sql_on: ${order_item.product_2_id} = ${product_2.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${order_item.order_id} = ${order.original_order_id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_entry {
#     type: left_outer
#     sql_on: ${order_item.pricebook_entry_id} = ${pricebook_entry.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${order.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${order.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${order.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_item_feed {}

# explore: order_item_history {
#   join: order_item {
#     type: left_outer
#     sql_on: ${order_item_history.order_item_id} = ${order_item.id} ;;
#     relationship: many_to_one
#   }

#   join: product_2 {
#     type: left_outer
#     sql_on: ${order_item.product_2_id} = ${product_2.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${order_item.order_id} = ${order.original_order_id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_entry {
#     type: left_outer
#     sql_on: ${order_item.pricebook_entry_id} = ${pricebook_entry.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${order.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${order.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${order.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_share {
#   join: order {
#     type: left_outer
#     sql_on: ${order_share.order_id} = ${order.original_order_id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${order.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${order.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${order.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_status {}

# explore: org_wide_email_address {}

# explore: organization {}

# explore: package_license {}

# explore: partner {
#   join: opportunity {
#     type: left_outer
#     sql_on: ${partner.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${opportunity.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${opportunity.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${opportunity.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: partner_role {}

# explore: period {
#   join: fiscal_year_settings {
#     type: left_outer
#     sql_on: ${period.fiscal_year_settings_id} = ${fiscal_year_settings.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: permission_set {
#   join: profile {
#     type: left_outer
#     sql_on: ${permission_set.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: permission_set_group {
#     type: left_outer
#     sql_on: ${permission_set.permission_set_group_id} = ${permission_set_group.id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: permission_set_assignment {
#   join: permission_set {
#     type: left_outer
#     sql_on: ${permission_set_assignment.permission_set_id} = ${permission_set.id} ;;
#     relationship: many_to_one
#   }

#   join: permission_set_group {
#     type: left_outer
#     sql_on: ${permission_set_assignment.permission_set_group_id} = ${permission_set_group.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${permission_set.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: permission_set_group {}

# explore: permission_set_group_component {
#   join: permission_set {
#     type: left_outer
#     sql_on: ${permission_set_group_component.permission_set_id} = ${permission_set.id} ;;
#     relationship: many_to_one
#   }

#   join: permission_set_group {
#     type: left_outer
#     sql_on: ${permission_set_group_component.permission_set_group_id} = ${permission_set_group.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${permission_set.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: permission_set_license {}

# explore: permission_set_license_assign {
#   join: permission_set_license {
#     type: left_outer
#     sql_on: ${permission_set_license_assign.permission_set_license_id} = ${permission_set_license.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: permission_set_tab_setting {}

# explore: phone_burner_phone_burner_account_c {}

# explore: pipeline_snapshot_c {}

# explore: platform_action {
#   join: group {
#     type: left_outer
#     sql_on: ${platform_action.group_id} = ${group.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: platform_cache_partition {}

# explore: platform_cache_partition_type {
#   join: platform_cache_partition {
#     type: left_outer
#     sql_on: ${platform_cache_partition_type.platform_cache_partition_id} = ${platform_cache_partition.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: pricebook_2 {}

# explore: pricebook_2_history {
#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${pricebook_2_history.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: pricebook_entry {
#   join: product_2 {
#     type: left_outer
#     sql_on: ${pricebook_entry.product_2_id} = ${product_2.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${pricebook_entry.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: process_definition {}

# explore: process_instance {
#   join: process_definition {
#     type: left_outer
#     sql_on: ${process_instance.process_definition_id} = ${process_definition.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: process_instance_node {
#   join: process_instance {
#     type: left_outer
#     sql_on: ${process_instance_node.process_instance_id} = ${process_instance.id} ;;
#     relationship: many_to_one
#   }

#   join: process_node {
#     type: left_outer
#     sql_on: ${process_instance_node.process_node_id} = ${process_node.id} ;;
#     relationship: many_to_one
#   }

#   join: process_definition {
#     type: left_outer
#     sql_on: ${process_instance.process_definition_id} = ${process_definition.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: process_instance_step {
#   join: process_instance {
#     type: left_outer
#     sql_on: ${process_instance_step.process_instance_id} = ${process_instance.id} ;;
#     relationship: many_to_one
#   }

#   join: process_definition {
#     type: left_outer
#     sql_on: ${process_instance.process_definition_id} = ${process_definition.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: process_instance_workitem {
#   join: process_instance {
#     type: left_outer
#     sql_on: ${process_instance_workitem.process_instance_id} = ${process_instance.id} ;;
#     relationship: many_to_one
#   }

#   join: process_definition {
#     type: left_outer
#     sql_on: ${process_instance.process_definition_id} = ${process_definition.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: process_node {
#   join: process_definition {
#     type: left_outer
#     sql_on: ${process_node.process_definition_id} = ${process_definition.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: product_2 {
#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: product_2_feed {}

# explore: product_2_history {
#   join: product_2 {
#     type: left_outer
#     sql_on: ${product_2_history.product_2_id} = ${product_2.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: profile {
#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: profile_skill {}

# explore: profile_skill_endorsement {
#   join: user {
#     type: left_outer
#     sql_on: ${profile_skill_endorsement.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: profile_skill_user {
#     type: left_outer
#     sql_on: ${profile_skill_endorsement.profile_skill_user_id} = ${profile_skill_user.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: profile_skill {
#     type: left_outer
#     sql_on: ${profile_skill_user.profile_skill_id} = ${profile_skill.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: profile_skill_endorsement_feed {}

# explore: profile_skill_endorsement_history {
#   join: profile_skill_endorsement {
#     type: left_outer
#     sql_on: ${profile_skill_endorsement_history.profile_skill_endorsement_id} = ${profile_skill_endorsement.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${profile_skill_endorsement.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: profile_skill_user {
#     type: left_outer
#     sql_on: ${profile_skill_endorsement.profile_skill_user_id} = ${profile_skill_user.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: profile_skill {
#     type: left_outer
#     sql_on: ${profile_skill_user.profile_skill_id} = ${profile_skill.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: profile_skill_feed {}

# explore: profile_skill_history {
#   join: profile_skill {
#     type: left_outer
#     sql_on: ${profile_skill_history.profile_skill_id} = ${profile_skill.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: profile_skill_share {}

# explore: profile_skill_user {
#   join: profile_skill {
#     type: left_outer
#     sql_on: ${profile_skill_user.profile_skill_id} = ${profile_skill.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${profile_skill_user.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: profile_skill_user_feed {}

# explore: profile_skill_user_history {
#   join: profile_skill_user {
#     type: left_outer
#     sql_on: ${profile_skill_user_history.profile_skill_user_id} = ${profile_skill_user.id} ;;
#     relationship: many_to_one
#   }

#   join: profile_skill {
#     type: left_outer
#     sql_on: ${profile_skill_user.profile_skill_id} = ${profile_skill.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${profile_skill_user.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: queue_sobject {}

# explore: quick_text {}

# explore: quick_text_history {
#   join: quick_text {
#     type: left_outer
#     sql_on: ${quick_text_history.quick_text_id} = ${quick_text.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: quick_text_share {}

# explore: quote {
#   join: contract {
#     type: left_outer
#     sql_on: ${quote.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${quote.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: opportunity {
#     type: left_outer
#     sql_on: ${quote.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${quote.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${quote.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: quote_document {
#   join: quote {
#     type: left_outer
#     sql_on: ${quote_document.quote_id} = ${quote.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${quote.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${quote.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: opportunity {
#     type: left_outer
#     sql_on: ${quote.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${quote.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${quote.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: quote_feed {}

# explore: quote_line_item {
#   join: product_2 {
#     type: left_outer
#     sql_on: ${quote_line_item.product_2_id} = ${product_2.id} ;;
#     relationship: many_to_one
#   }

#   join: quote {
#     type: left_outer
#     sql_on: ${quote_line_item.quote_id} = ${quote.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_entry {
#     type: left_outer
#     sql_on: ${quote_line_item.pricebook_entry_id} = ${pricebook_entry.id} ;;
#     relationship: many_to_one
#   }

#   join: opportunity_line_item {
#     type: left_outer
#     sql_on: ${quote_line_item.opportunity_line_item_id} = ${opportunity_line_item.id} ;;
#     relationship: many_to_one
#   }

#   join: external_data_source {
#     type: left_outer
#     sql_on: ${product_2.external_data_source_id} = ${external_data_source.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${external_data_source.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }

#   join: contract {
#     type: left_outer
#     sql_on: ${quote.contract_id} = ${contract.id} ;;
#     relationship: many_to_one
#   }

#   join: pricebook_2 {
#     type: left_outer
#     sql_on: ${quote.pricebook_2_id} = ${pricebook_2.id} ;;
#     relationship: many_to_one
#   }

#   join: opportunity {
#     type: left_outer
#     sql_on: ${quote.opportunity_id} = ${opportunity.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${quote.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${quote.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${opportunity.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: campaign {
#     type: left_outer
#     sql_on: ${opportunity.campaign_id} = ${campaign.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${contact.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: quote_share {}

# explore: recommendation {
#   join: image {
#     type: left_outer
#     sql_on: ${recommendation.image_id} = ${image.id} ;;
#     relationship: many_to_one
#   }

#   join: content_document {
#     type: left_outer
#     sql_on: ${image.content_document_id} = ${content_document.id} ;;
#     relationship: many_to_one
#   }

#   join: content_asset {
#     type: left_outer
#     sql_on: ${content_document.content_asset_id} = ${content_asset.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: record_action {
#   join: flow_interview {
#     type: left_outer
#     sql_on: ${record_action.flow_interview_id} = ${flow_interview.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: record_type {
#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: report {}

# explore: report_feed {}

# explore: saml_sso_config {}

# explore: scontrol {}

# explore: secure_agents_cluster {}

# explore: security_custom_baseline {}

# explore: session_perm_set_activation {
#   join: permission_set {
#     type: left_outer
#     sql_on: ${session_perm_set_activation.permission_set_id} = ${permission_set.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${session_perm_set_activation.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: auth_session {
#     type: left_outer
#     sql_on: ${session_perm_set_activation.auth_session_id} = ${auth_session.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${permission_set.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: permission_set_group {
#     type: left_outer
#     sql_on: ${permission_set.permission_set_group_id} = ${permission_set_group.id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }

#   join: login_geo {
#     type: left_outer
#     sql_on: ${auth_session.login_geo_id} = ${login_geo.id} ;;
#     relationship: many_to_one
#   }

#   join: login_history {
#     type: left_outer
#     sql_on: ${auth_session.login_history_id} = ${login_history.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: setup_audit_trail {}

# explore: setup_entity_access {}

# explore: site {}

# explore: site_feed {}

# explore: site_history {
#   join: site {
#     type: left_outer
#     sql_on: ${site_history.site_id} = ${site.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: site_iframe_white_list_url {
#   join: site {
#     type: left_outer
#     sql_on: ${site_iframe_white_list_url.site_id} = ${site.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: solution {}

# explore: solution_feed {}

# explore: solution_history {
#   join: solution {
#     type: left_outer
#     sql_on: ${solution_history.solution_id} = ${solution.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: solution_status {}

# explore: staffing_model {}

# explore: stamp {}

# explore: stamp_assignment {
#   join: stamp {
#     type: left_outer
#     sql_on: ${stamp_assignment.stamp_id} = ${stamp.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: static_resource {}

# explore: streaming_channel {}

# explore: streaming_channel_share {}

# explore: task {
#   join: account {
#     type: left_outer
#     sql_on: ${task.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: task_feed {}

# explore: task_priority {}

# explore: task_relation {
#   join: account {
#     type: left_outer
#     sql_on: ${task_relation.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: task {
#     type: left_outer
#     sql_on: ${task_relation.task_id} = ${task.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: task_status {}

# explore: task_who_relation {
#   join: account {
#     type: left_outer
#     sql_on: ${task_who_relation.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: task {
#     type: left_outer
#     sql_on: ${task_who_relation.task_id} = ${task.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: tenant_usage_entitlement {}

# explore: test_suite_membership {
#   join: apex_test_suite {
#     type: left_outer
#     sql_on: ${test_suite_membership.apex_test_suite_id} = ${apex_test_suite.id} ;;
#     relationship: many_to_one
#   }

#   join: apex_class {
#     type: left_outer
#     sql_on: ${test_suite_membership.apex_class_id} = ${apex_class.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: today_goal {
#   join: user {
#     type: left_outer
#     sql_on: ${today_goal.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: today_goal_share {}

# explore: topic {}

# explore: topic_assignment {
#   join: topic {
#     type: left_outer
#     sql_on: ${topic_assignment.topic_id} = ${topic.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: topic_feed {}

# explore: topic_user_event {
#   join: user {
#     type: left_outer
#     sql_on: ${topic_user_event.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: topic {
#     type: left_outer
#     sql_on: ${topic_user_event.topic_id} = ${topic.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: undecided_event_relation {
#   join: account {
#     type: left_outer
#     sql_on: ${undecided_event_relation.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: event {
#     type: left_outer
#     sql_on: ${undecided_event_relation.event_id} = ${event.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user {
#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_account_team_member {
#   join: user {
#     type: left_outer
#     sql_on: ${user_account_team_member.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_app_info {
#   join: user {
#     type: left_outer
#     sql_on: ${user_app_info.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_app_menu_customization {}

# explore: user_app_menu_customization_share {}

# explore: user_email_preferred_person {}

# explore: user_email_preferred_person_share {}

# explore: user_feed {}

# explore: user_license {}

# explore: user_list_view {
#   join: list_view {
#     type: left_outer
#     sql_on: ${user_list_view.list_view_id} = ${list_view.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${user_list_view.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_list_view_criterion {
#   join: user_list_view {
#     type: left_outer
#     sql_on: ${user_list_view_criterion.user_list_view_id} = ${user_list_view.id} ;;
#     relationship: many_to_one
#   }

#   join: list_view {
#     type: left_outer
#     sql_on: ${user_list_view.list_view_id} = ${list_view.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${user_list_view.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_login {
#   join: user {
#     type: left_outer
#     sql_on: ${user_login.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_package_license {
#   join: package_license {
#     type: left_outer
#     sql_on: ${user_package_license.package_license_id} = ${package_license.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${user_package_license.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_preference {
#   join: user {
#     type: left_outer
#     sql_on: ${user_preference.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_prov_account {}

# explore: user_prov_account_staging {}

# explore: user_prov_mock_target {}

# explore: user_provisioning_config {
#   join: named_credential {
#     type: left_outer
#     sql_on: ${user_provisioning_config.named_credential_id} = ${named_credential.id} ;;
#     relationship: many_to_one
#   }

#   join: auth_provider {
#     type: left_outer
#     sql_on: ${named_credential.auth_provider_id} = ${auth_provider.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_provisioning_log {
#   join: user_provisioning_request {
#     type: left_outer
#     sql_on: ${user_provisioning_log.user_provisioning_request_id} = ${user_provisioning_request.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${user_provisioning_log.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: user_prov_account {
#     type: left_outer
#     sql_on: ${user_provisioning_request.user_prov_account_id} = ${user_prov_account.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_provisioning_request {
#   join: user_prov_account {
#     type: left_outer
#     sql_on: ${user_provisioning_request.user_prov_account_id} = ${user_prov_account.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_provisioning_request_share {}

# explore: user_role {}

# explore: user_share {
#   join: user {
#     type: left_outer
#     sql_on: ${user_share.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_team_member {
#   join: user {
#     type: left_outer
#     sql_on: ${user_team_member.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: verification_history {
#   join: login_geo {
#     type: left_outer
#     sql_on: ${verification_history.login_geo_id} = ${login_geo.id} ;;
#     relationship: many_to_one
#   }

#   join: user {
#     type: left_outer
#     sql_on: ${verification_history.user_id} = ${user.phone_burner_phone_burner_userid_c} ;;
#     relationship: many_to_one
#   }

#   join: login_history {
#     type: left_outer
#     sql_on: ${verification_history.login_history_id} = ${login_history.id} ;;
#     relationship: many_to_one
#   }

#   join: individual {
#     type: left_outer
#     sql_on: ${user.individual_id} = ${individual.id} ;;
#     relationship: many_to_one
#   }

#   join: user_role {
#     type: left_outer
#     sql_on: ${user.user_role_id} = ${user_role.id} ;;
#     relationship: many_to_one
#   }

#   join: profile {
#     type: left_outer
#     sql_on: ${user.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: account {
#     type: left_outer
#     sql_on: ${user.account_id} = ${account.id} ;;
#     relationship: many_to_one
#   }

#   join: call_center {
#     type: left_outer
#     sql_on: ${user.call_center_id} = ${call_center.id} ;;
#     relationship: many_to_one
#   }

#   join: contact {
#     type: left_outer
#     sql_on: ${user.contact_id} = ${contact.jigsaw_contact_id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }

#   join: record_type {
#     type: left_outer
#     sql_on: ${account.record_type_id} = ${record_type.id} ;;
#     relationship: many_to_one
#   }

#   join: business_process {
#     type: left_outer
#     sql_on: ${record_type.business_process_id} = ${business_process.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: visualforce_access_metrics {
#   join: profile {
#     type: left_outer
#     sql_on: ${visualforce_access_metrics.profile_id} = ${profile.id} ;;
#     relationship: many_to_one
#   }

#   join: apex_page {
#     type: left_outer
#     sql_on: ${visualforce_access_metrics.apex_page_id} = ${apex_page.id} ;;
#     relationship: many_to_one
#   }

#   join: user_license {
#     type: left_outer
#     sql_on: ${profile.user_license_id} = ${user_license.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: vote {}

# explore: wave_auto_install_request {
#   join: folder {
#     type: left_outer
#     sql_on: ${wave_auto_install_request.folder_id} = ${folder.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: wave_compatibility_check_item {
#   join: wave_auto_install_request {
#     type: left_outer
#     sql_on: ${wave_compatibility_check_item.wave_auto_install_request_id} = ${wave_auto_install_request.id} ;;
#     relationship: many_to_one
#   }

#   join: folder {
#     type: left_outer
#     sql_on: ${wave_auto_install_request.folder_id} = ${folder.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: web_link {
#   join: scontrol {
#     type: left_outer
#     sql_on: ${web_link.scontrol_id} = ${scontrol.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: work_access {}

# explore: work_access_share {}

# explore: work_badge {}

# explore: work_badge_definition {}

# explore: work_badge_definition_feed {}

# explore: work_badge_definition_history {
#   join: work_badge_definition {
#     type: left_outer
#     sql_on: ${work_badge_definition_history.work_badge_definition_id} = ${work_badge_definition.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: work_badge_definition_share {}

# explore: work_thanks {
#   join: feed_item {
#     type: left_outer
#     sql_on: ${work_thanks.feed_item_id} = ${feed_item.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: work_thanks_share {}
