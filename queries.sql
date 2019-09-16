SELECT
    *
FROM
(
    SELECT
        typ.t_id,
        typ.t_ili_tid,
        typ.typ_kt,
        typ.code_kommunal,
        typ.t_datasetname,
        typ_dokument.t_id AS dok_t_id
    FROM
        arp_npl.nutzungsplanung_typ_grundnutzung AS typ
        LEFT JOIN arp_npl.nutzungsplanung_typ_grundnutzung_dokument AS typ_dokument
        ON typ_dokument.typ_grundnutzung = typ.t_id
    WHERE
        typ_kt NOT IN 
        (
            'N180_Verkehrszone_Strasse',
            'N181_Verkehrszone_Bahnareal',
            'N182_Verkehrszone_Flugplatzareal',
            'N189_weitere_Verkehrszonen',
            'N210_Landwirtschaftszone',
            'N320_Gewaesser',
            'N329_weitere_Zonen_fuer_Gewaesser_und_ihre_Ufer',
            'N420_Verkehrsflaeche_Strasse', 
            'N421_Verkehrsflaeche_Bahnareal', 
            'N422_Verkehrsflaeche_Flugplatzareal', 
            'N429_weitere_Verkehrsflaechen', 
            'N430_Reservezone_Wohnzone_Mischzone_Kernzone_Zentrumszone',
            'N431_Reservezone_Arbeiten',
            'N432_Reservezone_OeBA',
            'N439_Reservezone',
            'N440_Wald'
        )
       
    UNION ALL
      
    SELECT
        typ.t_id,
        typ.t_ili_tid,
        typ.typ_kt,
        typ.code_kommunal,
        typ.t_datasetname,
        typ_dokument.t_id AS dok_t_id
    FROM
        arp_npl.nutzungsplanung_typ_ueberlagernd_flaeche AS typ
        LEFT JOIN arp_npl.nutzungsplanung_typ_ueberlagernd_flaeche_dokument AS typ_dokument
        ON typ_dokument.typ_ueberlagernd_flaeche = typ.t_id
    WHERE
        (
            typ_kt IN 
            (
                'N510_ueberlagernde_Ortsbildschutzzone',
                'N523_Landschaftsschutzzone',
                'N526_kantonale_Landwirtschafts_und_Schutzzone_Witi',
                'N527_kantonale_Uferschutzzone',
                'N528_kommunale_Uferschutzzone_ausserhalb_Bauzonen',
                'N529_weitere_Schutzzonen_fuer_Lebensraeume_und_Landschaften',
                'N590_Hofstattzone_Freihaltezone',
                'N591_Bauliche_Einschraenkungen',
                'N690_kantonales_Vorranggebiet_Natur_und_Landschaft',
                'N691_kommunales_Vorranggebiet_Natur_und_Landschaft',
                'N692_Planungszone',
                'N699_weitere_flaechenbezogene_Festlegungen_NP',
                'N812_geologisches_Objekt',
                'N813_Naturobjekt',
                'N822_schuetzenswertes_Kulturobjekt',
                'N823_erhaltenswertes_Kulturobjekt',
                
                'N610_Perimeter_kantonaler_Nutzungsplan',
                'N611_Perimeter_kommunaler_Gestaltungsplan',
                'N620_Perimeter_Gestaltungsplanpflicht',
                
                'N680_Empfindlichkeitsstufe_I',
                'N681_Empfindlichkeitsstufe_II',
                'N682_Empfindlichkeitsstufe_II_aufgestuft',
                'N683_Empfindlichkeitsstufe_III',
                'N684_Empfindlichkeitsstufe_III_aufgestuft',
                'N685_Empfindlichkeitsstufe_IV',
                'N686_keine_Empfindlichkeitsstufe'
            )
            OR
            (
                typ_kt = 'N599_weitere_ueberlagernde_Nutzungszonen' AND verbindlichkeit = 'Nutzungsplanfestlegung'
    
            ) 
       )          
    
    UNION ALL
      
    SELECT
        typ.t_id,
        typ.t_ili_tid,
        typ.typ_kt,
        typ.code_kommunal,
        typ.t_datasetname,
        typ_dokument.t_id AS dok_t_id
    FROM
        arp_npl.nutzungsplanung_typ_ueberlagernd_linie AS typ
        LEFT JOIN arp_npl.nutzungsplanung_typ_ueberlagernd_linie_dokument AS typ_dokument
        ON typ_dokument.typ_ueberlagernd_linie = typ.t_id
        WHERE
        (
            typ_kt = 'N799_weitere_linienbezogene_Festlegungen_NP' AND verbindlichkeit = 'Nutzungsplanfestlegung'
        )        
        
    UNION ALL
      
    SELECT
        typ.t_id,
        typ.t_ili_tid,
        typ.typ_kt,
        typ.code_kommunal,
        typ.t_datasetname,
        typ_dokument.t_id AS dok_t_id
    FROM
        arp_npl.nutzungsplanung_typ_ueberlagernd_punkt AS typ
        LEFT JOIN arp_npl.nutzungsplanung_typ_ueberlagernd_punkt_dokument AS typ_dokument
        ON typ_dokument.typ_ueberlagernd_punkt = typ.t_id
    WHERE
        (
            typ_kt IN 
            (
                'N811_erhaltenswerter_Einzelbaum',
                'N820_kantonal_geschuetztes_Kulturobjekt',
                'N822_schuetzenswertes_Kulturobjekt',
                'N823_erhaltenswertes_Kulturobjekt'
            )
            OR
            (
                typ_kt = 'N899_weitere_punktbezogene_Festlegungen_NP' AND verbindlichkeit = 'Nutzungsplanfestlegung'
    
            )   
        )

    UNION ALL
      
    SELECT
        typ.t_id,
        typ.t_ili_tid,
        typ.typ_kt,
        typ.code_kommunal,
        typ.t_datasetname,
        typ_dokument.t_id AS dok_t_id
    FROM
        arp_npl.erschlssngsplnung_typ_erschliessung_linienobjekt AS typ
        LEFT JOIN arp_npl.erschlssngsplnung_typ_erschliessung_linienobjekt_dokument AS typ_dokument
        ON typ_dokument.typ_erschliessung_linienobjekt = typ.t_id
    WHERE
        typ_kt IN 
        (
            'E711_Baulinie_Strasse_kantonal',
            'E712_Vorbaulinie_kantonal',
            'E713_Gestaltungsbaulinie_kantonal',
            'E714_Rueckwaertige_Baulinie_kantonal',
            'E715_Baulinie_Infrastruktur_kantonal',
            'E719_weitere_nationale_und_kantonale_Baulinien',
            'E720_Baulinie_Strasse',
            'E721_Vorbaulinie',
            'E722_Gestaltungsbaulinie',
            'E723_Rueckwaertige_Baulinie',
            'E724_Baulinie_Infrastruktur',
            'E725_Waldabstandslinie',
            'E726_Baulinie_Hecke',
            'E727_Baulinie_Gewaesser',
            'E728_Immissionsstreifen',
            'E729_weitere_kommunale_Baulinien'
        )
) AS foo
WHERE
    dok_t_id IS NULL        
    
 
