from sys import argv

movies = [
    {
        'name': 'pets',
        'parts': 1000,
        'url': 'https://s2.ashdi.vip/content/stream/films/sekreti_domashnx_tvarin_2_300/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'rwanda',
        'parts': 1463,
        'url': 'https://s2.ashdi.vip/content/stream/films/hotel_rwanda_2004_webdl_1080p_ukreng_hurtom_71450/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'great_wall',
        'parts': 1237,
        'url': 'https://s1.ashdi.vip/content/stream/new4/the_great_wall_2016_bdrip_1080p_ukr_eng_hurtom_6329/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'jurassic_park',
        'parts': 1419,
        'url': 'https://s2.ashdi.vip/content/stream/films/1_jurassic_park_1993_bdrip_1080p_3xukr_eng_sub_eng_417/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'sw5',
        'parts': 1529,
        'url': 'https://jordkym.cyou/films/zoryan_vjni_epzod_5_425/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'aste',
        'parts': 1322,
        'url': 'https://qeruya.cyou/content/stream/new3/4._asterix_et_obelix_au_service_de_sa_majeste_2012_bdrip_1080p_h.265_ukr_fre_hurtom_14588/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'jojo',
        'parts': 1301,
        'url': 'https://nerklq.cyou/content/stream/new/jojo_rabbit_2019_bdrip_1080p_3xukr_eng_video_hurtom_22729/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'hidden_figures',
        'parts': 1520,
        'url': 'https://qeruya.cyou/content/stream/new4/hidden_figures_2016_bdrip_1080p_ukr_eng_hurtom_8418/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'rogue one',
        'parts': 1608,
        'url': 'https://jordkym.cyou/films/buntar_odin._zoryan_vjni_storya_429/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'RRRRRRRR',
        'parts': 1181,
        'url': 'https://qeruya.cyou/content/stream/new3/rrrrrrr_2004_2xukrfra_webdlrip_hurtom_14782/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'nowa_nadzieja',
        'parts': 1497,
        'url': 'https://jordkym.cyou/films/zoryan_vjni_epzod_4_424/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'incepcja',
        'parts': 1778,
        'url': 'https://s2.ashdi.vip/content/stream/films/pochatok_1219/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'avatar',
        'parts': 2137,
        'url': 'https://s2.ashdi.vip/content/stream/new/avatar_extended_edition_2009_ukr_eng_bdremux_1080p_hurtom_75012/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'phantom',
        'parts': 1635,
        'url': 'https://jordkym.cyou/films/zoryan_vjni_epzod_1_420/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'clones',
        'parts': 1710,
        'url': 'https://jordkym.cyou/films/zoryan_vjni_epzod_2_422/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'revenge',
        'parts': 1681,
        'url': 'https://jordkym.cyou/films/zoryan_vjni_epzod_3_423/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'dawca',
        'parts': 1167,
        'filename': 'the_giver_2014_bdrip_1080p_ukr_eng_hurtom_6913',
        'url': 'https://nerklq.cyou/content/stream/new4/{name}/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'Igrzyska Smierci, w pierscieniu ognia',
        'parts': 1755,
        'filename': 'golodn_gri_u_vogn_1165',
    },
    {
        'name': 'Interstellar',
        'parts': 2029,
        'filename': 'interstellar_2014_bdrip_1080p_ukr_eng_hurtom_3205',
    },
    {
        'name': 'Igrzyska smierci',
        'parts': 1711,
        'filename': 'golodn_gri_1164',
    },
    {
        'name': 'Zemsta Sithow',
        'parts': 1681,
        'filename': 'zoryan_vjni_epzod_3_423',
        'url': 'https://jordkym.cyou/films/{name}/hls/{q}/segment{i}.ts'
    },
    {
        'name': 'Arrival',
        'parts': 1397,
        'filename': 'arrival_2016_bdrip_1080p_h.265_ukr_eng_hurtom_9427',
        'url': 'https://nerklq.cyou/content/stream/new4/{name}/hls/{q}/segment{i}.ts'
    }
]

movie = movies[int(argv[1])]
