WITH
l AS (
    SELECT * FROM {{ ref('dim_listings_cleansed') }}
),

h AS (
    SELECT * FROM {{ ref('dim_hosts_cleansed') }}
)

SELECT
    l.listing_id,                -- Ensure this column exists in dim_listings_cleansed
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id AS listing_host_id, -- Aliasing the host_id from dim_listings_cleansed
    h.host_id AS host_id,         -- Aliasing the host_id from dim_hosts_cleansed
    h.host_name,
    h.is_superhost AS host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) AS updated_at
FROM
    l 
LEFT JOIN
    h ON h.host_id = l.host_id   -- Ensure this is the correct join condition


