with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
        CAST(products_id AS STRING) AS products_id,
        CAST(purchse_price AS FLOAT64) AS purchase_price

    from source

)

select * from renamed
