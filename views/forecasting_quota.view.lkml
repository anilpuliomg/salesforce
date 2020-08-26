view: forecasting_quota {
  derived_table: {
    sql: SELECT * FROM `my-oauth-project-275301.salesforce.forecasting_quota`
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

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: forecasting_type_id {
    type: string
    sql: ${TABLE}.forecasting_type_id ;;
  }

  dimension: is_amount {
    type: string
    sql: ${TABLE}.is_amount ;;
  }

  dimension: is_quantity {
    type: string
    sql: ${TABLE}.is_quantity ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified_date {
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: period_id {
    type: string
    sql: ${TABLE}.period_id ;;
  }

  dimension: product_family {
    type: string
    sql: ${TABLE}.product_family ;;
  }

  dimension: quota_amount {
    type: number
    sql: ${TABLE}.quota_amount ;;
  }

  dimension: quota_owner_id {
    type: string
    sql: ${TABLE}.quota_owner_id ;;
  }

  dimension: quota_quantity {
    type: number
    sql: ${TABLE}.quota_quantity ;;
  }

  dimension: start_date {
    type: date
    sql: ${TABLE}.start_date ;;
  }

  dimension_group: start_date_detail {
    type: time
    sql: ${TABLE}.start_date ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  measure:  Total_Quota_Amount {
    type: max
    value_format_name: usd
    sql: ${quota_amount} ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_deleted,
      _fivetran_synced_time,
      created_by_id,
      created_date_time,
      forecasting_type_id,
      is_amount,
      is_quantity,
      last_modified_by_id,
      last_modified_date_time,
      period_id,
      product_family,
      quota_amount,
      quota_owner_id,
      quota_quantity,
      start_date,
      system_modstamp_time
    ]
  }
}
