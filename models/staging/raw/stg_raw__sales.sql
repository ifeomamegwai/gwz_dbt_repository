with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        CAST(orders_id AS STRING) AS orders_id,
        CAST(pdt_id AS STRING) AS product_id,
        revenue,
        quantity

    from source

)

select * from renamed
