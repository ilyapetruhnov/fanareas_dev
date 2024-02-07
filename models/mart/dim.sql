select
    {{ dbt_utils.generate_surrogate_key(['seasons.id']) }} as seasons_key,
    seasons.id,
    seasons.name as season_name,
    seasons.finished, 
    squads.player_id as player_id,
    squads.team_id as team_id
from {{ ref('squads') }}
left join {{ ref('seasons') }} on squads.season_id = seasons.id
