view: landing_traffic{
  sql_table_name: "ANALYTICS"."GA_LANDING_TRAFFIC_BY_CAMPAIGN";;

  dimension: campaign {
    type: string
    sql: ${TABLE}."CAMPAIGN" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: country_city {
    type: string
    sql: concat(${country}, '/', ${city}) ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension_group: datetime_america_chicago {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATETIME_AMERICA_CHICAGO" ;;
  }

  dimension: landing_page_path {
    type: string
    sql: ${TABLE}."LANDING_PAGE_PATH" ;;
  }

  dimension: landing_page_path_base {
    type: string
    sql: ${TABLE}."LANDING_PAGE_PATH_BASE" ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}."PAGEVIEWS" ;;
  }

  dimension: source_medium {
    type: string
    sql: ${TABLE}."SOURCE_MEDIUM" ;;
  }

  dimension: traffic_medium {
    type: string
    sql: ${TABLE}."TRAFFIC_MEDIUM" ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}."TRAFFIC_SOURCE" ;;
  }

  set: traffic_details {
    fields: [datetime_america_chicago_raw, traffic_source, landing_page_path_base]
  }

  measure: count {
    type: count
    drill_fields: [traffic_details*]
  }

  measure: contact_us_form_submissions {
    type: sum
    sql: ${TABLE}."CONTACT_US_FORM_SUBMISSIONS" ;;
  }

  measure: contact_us_pageviews {
    type: sum
    sql: ${TABLE}."CONTACT_US_PAGEVIEWS" ;;
  }

  measure: new_users_count {
    type: sum
    sql: ${TABLE}."NEW_USERS_COUNT" ;;
  }

  measure: total_users_count {
    type: sum
    sql: ${TABLE}."TOTAL_USERS_COUNT" ;;
  }

  measure: total_pageviews {
    type: sum
    sql: ${TABLE}."PAGEVIEWS" ;;
  }

  measure: contact_us_pageviews_conversion_rate {
    type: number
    sql: 100 * ${contact_us_pageviews} / ${total_pageviews} ;;
  }
}
