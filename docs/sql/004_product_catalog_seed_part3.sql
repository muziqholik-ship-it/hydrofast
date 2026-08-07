-- 004_product_catalog_seed — part 3/5
-- Run parts in order (1 → 5) in the Supabase SQL Editor. Idempotent.

begin;

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-mgw-ap', 'MGW AP', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'MGW AP 플레이트 마운팅 잔압 연결형 커플링', 'MGW AP Plate-Mounting Couplings – Connection Under Pressure', '플레이트 장착형 잔압 연결 플랫 페이스 커플링, DN10~DN25', 'Plate-mounted flat face couplings connectable under pressure, DN10 to DN25', 'GEMELS 멀티 커플링/플레이트 전용의 잔압 연결형 플랫 페이스 커플링입니다. 농업·산업 기계의 멀티 라인 연결에 적합하며 DN10~DN25 사이즈에 최대 420 bar를 지원합니다. 탄소강 바디에 내부 부품은 스테인리스강이며 BSPP/NPT/SAE ORB 엔드를 제공합니다.', 'Flat face couplings for plate mounting that connect under residual pressure, dedicated to GEMELS multi couplings and plates. Suited to multi-line connections on agricultural and industrial machinery; sizes DN10 to DN25 rated up to 420 bar. Carbon steel bodies with stainless steel internal components and BSPP, NPT, SAE ORB ends.',
  '{"coupling_standard": "proprietary", "size_range": "DN10–DN25", "max_working_pressure": 420, "body_material": "carbon_steel", "valve_type": "flat_face", "connection_type": "plate_mounting", "connect_under_pressure": true, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT (ASME B1.20.1), SAE ORB (ISO 11926-1)", "surface_treatment": "Galvanized (body), stainless internal components", "application": "agriculture"}'::jsonb, true, 2040, 'mgw ap 플레이트 마운팅 잔압 연결형 커플링 mgw ap plate-mounting couplings – connection under pressure 플레이트 장착형 잔압 연결 플랫 페이스 커플링, dn10~dn25 plate-mounted flat face couplings connectable under pressure, dn10 to dn25 mgw ap gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn10–dn25 420 carbon_steel 탄소강 carbon steel flat_face 플랫 페이스 flat face plate_mounting 플레이트 마운팅 plate mounting true nbr (표준), fkm (옵션) bspp (iso 1179-1), npt (asme b1.20.1), sae orb (iso 11926-1) galvanized (body), stainless internal components agriculture 농업 기계 agriculture')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-multi-couplings', 'MULTI COUPLINGS', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '멀티 커플링 (플레이트 마운팅)', 'Multi Couplings (Plate Mounting)', '최대 25개 라인을 한 번에 연결·분리하는 플레이트형 멀티 커플링 시스템', 'Plate-type multi-coupling system connecting up to 25 hydraulic, electrical and pneumatic lines at once', '여러 개의 유압·전기·공압 라인을 한 번의 동작으로 연결하고 분리할 수 있는 멀티 커플링 시스템입니다. 작업 시간 단축, 공간 절약, 회로 오염 방지를 위해 설계되었으며 플랫 페이스 커플링을 기본으로 다양한 조합이 가능합니다. 아노다이징 알루미늄 플레이트에 DN10~DN25 커플링을 최대 25라인까지, 서로 다른 사이즈 혼합 및 잔압 상태 연결·분리 사양과 전기 커넥터 통합도 지원합니다.', 'Multi-coupling system that connects and disconnects multiple hydraulic, electrical and pneumatic lines in a single operation, designed to save operator time, reduce space and prevent circuit contamination. Anodized aluminum plates carry up to 25 lines from DN10 to DN25, with mixed sizes on one plate, connection/disconnection under residual pressure and optional electrical connectors.',
  '{"coupling_standard": "iso_16028", "size_range": "DN10–DN25, 플레이트당 최대 25라인 (up to 25 lines per plate)", "body_material": "carbon_or_stainless_steel", "valve_type": "flat_face", "connection_type": "multi_plate", "connect_under_pressure": true, "thread_types": "요청에 따라 무제한 (unlimited thread types on request)", "surface_treatment": "Zinc-Nickel plated (couplings), anodized aluminum (plates)", "application": "general_hydraulics"}'::jsonb, true, 2050, '멀티 커플링 (플레이트 마운팅) multi couplings (plate mounting) 최대 25개 라인을 한 번에 연결·분리하는 플레이트형 멀티 커플링 시스템 plate-type multi-coupling system connecting up to 25 hydraulic, electrical and pneumatic lines at once multi couplings gemels s.p.a. 퀵 커플링 quick couplings iso_16028 iso 16028 (플랫 페이스) iso 16028 (flat face) dn10–dn25, 플레이트당 최대 25라인 (up to 25 lines per plate) carbon_or_stainless_steel 탄소강 / 스테인리스강 carbon or stainless steel flat_face 플랫 페이스 flat face multi_plate 멀티 커플링 플레이트 multi-coupling plate true 요청에 따라 무제한 (unlimited thread types on request) zinc-nickel plated (couplings), anodized aluminum (plates) general_hydraulics 일반 유압 general hydraulics')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-n', 'N', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'N 시리즈 볼 밸브 커플링 (ISO 5675)', 'N Series Ball Valve Couplings (ISO 5675)', '농업용 ISO 5675 볼 밸브 퀵 커플링, DN6.3~DN25', 'Agricultural ISO 5675 ball valve quick couplings, DN6.3 to DN25', '농업 기계 표준인 ISO 5675 규격의 볼 밸브 방식 퀵 커플링입니다. DN6.3~DN25 사이즈에 최대 350 bar 사양이며, 아연 도금 탄소강 바디에 BSPP/NPT 엔드와 NBR/FKM 씰을 제공합니다. 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'Ball valve quick couplings to ISO 5675, the agricultural machinery standard. Sizes DN6.3 to DN25 rated up to 350 bar, galvanized carbon steel bodies with BSPP and NPT ends and NBR or FKM seals. Also available in the patented integrated ball-valve version.',
  '{"coupling_standard": "iso_5675", "size_range": "DN6.3–DN25 (1/4\"–1\")", "max_working_pressure": 350, "body_material": "carbon_steel", "valve_type": "ball", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT (ASME B1.20.1)", "surface_treatment": "Galvanized", "application": "agriculture"}'::jsonb, true, 2060, 'n 시리즈 볼 밸브 커플링 (iso 5675) n series ball valve couplings (iso 5675) 농업용 iso 5675 볼 밸브 퀵 커플링, dn6.3~dn25 agricultural iso 5675 ball valve quick couplings, dn6.3 to dn25 n gemels s.p.a. 퀵 커플링 quick couplings iso_5675 iso 5675 iso 5675 dn6.3–dn25 (1/4"–1") 350 carbon_steel 탄소강 carbon steel ball 볼 ball push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false nbr (표준), fkm (옵션) bspp (iso 1179-1), npt (asme b1.20.1) galvanized agriculture 농업 기계 agriculture')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-nordic', 'NORDIC', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '노르딕 타입 커플링 (감압 밸브 포핏)', 'Nordic Type Couplings (Poppet with DV)', '감압 밸브를 갖춘 노르딕 타입 포핏 커플링, DN6~DN25', 'Nordic type poppet couplings with decompression valve, DN6 to DN25', '북유럽 시장 표준인 노르딕 타입 포핏 커플링으로, 감압 밸브(DV)를 갖추어 잔압 상태에서도 연결이 가능합니다. 특수 핀은 수/암 어느 쪽에도 장착할 수 있으며 연결 시 작은 홀을 통해 잔압이 방출됩니다. DN6~DN25 사이즈에 최대 400 bar, 탄소강 바디에 BSPP/NPT 엔드를 제공합니다.', 'Nordic type poppet couplings, the Scandinavian market standard, equipped with a decompression valve (DV) for connection under residual pressure. The special pin mounts on either male or female side, releasing pressure through small holes during connection. Sizes DN6 to DN25 rated up to 400 bar, carbon steel bodies with BSPP and NPT ends.',
  '{"coupling_standard": "nordic", "size_range": "DN6–DN25", "max_working_pressure": 400, "body_material": "carbon_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": true, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT/GAS (ANSI B1.20.3)", "application": "agriculture"}'::jsonb, true, 2070, '노르딕 타입 커플링 (감압 밸브 포핏) nordic type couplings (poppet with dv) 감압 밸브를 갖춘 노르딕 타입 포핏 커플링, dn6~dn25 nordic type poppet couplings with decompression valve, dn6 to dn25 nordic gemels s.p.a. 퀵 커플링 quick couplings nordic 노르딕 타입 nordic type dn6–dn25 400 carbon_steel 탄소강 carbon steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve true nbr (표준), fkm (옵션) bspp (iso 1179-1), npt/gas (ansi b1.20.3) agriculture 농업 기계 agriculture')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-nv', 'NV', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'NV 시리즈 포핏 커플링 (ISO 5675)', 'NV Series Poppet Couplings (ISO 5675)', '농업용 ISO 5675 포핏 밸브 퀵 커플링, DN6~DN25', 'Agricultural ISO 5675 poppet valve quick couplings, DN6 to DN25', 'ISO 5675 규격의 포핏 밸브 방식 퀵 커플링으로 농기계 유압 라인에 사용됩니다. DN6~DN25 사이즈에 최대 350 bar 사양이며, 아연 도금 탄소강 바디를 채용했습니다. 1/2" 사이즈는 ISO 7241-A와 상호 호환되며, 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'Poppet valve quick couplings to ISO 5675 for agricultural hydraulic lines. Sizes DN6 to DN25 rated up to 350 bar with galvanized carbon steel bodies. The 1/2" size is interchangeable with ISO 7241-A; a patented integrated ball-valve version is also available.',
  '{"coupling_standard": "iso_5675", "size_range": "DN6–DN25", "max_working_pressure": 350, "body_material": "carbon_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT (ASME B1.20.1)", "surface_treatment": "Galvanized", "application": "agriculture"}'::jsonb, true, 2080, 'nv 시리즈 포핏 커플링 (iso 5675) nv series poppet couplings (iso 5675) 농업용 iso 5675 포핏 밸브 퀵 커플링, dn6~dn25 agricultural iso 5675 poppet valve quick couplings, dn6 to dn25 nv gemels s.p.a. 퀵 커플링 quick couplings iso_5675 iso 5675 iso 5675 dn6–dn25 350 carbon_steel 탄소강 carbon steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false nbr (표준), fkm (옵션) bspp (iso 1179-1), npt (asme b1.20.1) galvanized agriculture 농업 기계 agriculture')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-nvqd', 'NVQD', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'NVQD 냉각용 퀵 커플링', 'NVQD Quick Couplings for Cooling', '데이터센터 냉각용 소구경 DN3 스테인리스 퀵 커플링', 'Small-bore DN3 stainless quick couplings for data center cooling', '데이터센터 액체 냉각 시스템용 소구경 NVQD 퀵 커플링입니다. DN3 사이즈로 최대 PN16(16 bar)에 대응하며, 1.4404 스테인리스강 바디와 EPDM 씰, SAE J1926-2 및 BSPP(ISO 8434-6) 엔드 사양을 갖추고 있습니다.', 'Small-bore NVQD quick couplings for data center liquid cooling systems. DN3 size rated up to PN16 (16 bar), with 1.4404 stainless steel body, EPDM seals and SAE J1926-2 / BSPP (ISO 8434-6) ends.',
  '{"coupling_standard": "proprietary", "size_range": "DN3", "max_working_pressure": 16, "body_material": "stainless_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "EPDM", "thread_types": "SAE J1926-2 (UNF 7/16\"-20), BSPP ISO 8434-6 (G1/4)", "application": "data_center_cooling"}'::jsonb, true, 2090, 'nvqd 냉각용 퀵 커플링 nvqd quick couplings for cooling 데이터센터 냉각용 소구경 dn3 스테인리스 퀵 커플링 small-bore dn3 stainless quick couplings for data center cooling nvqd gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn3 16 stainless_steel 스테인리스강 stainless steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false epdm sae j1926-2 (unf 7/16"-20), bspp iso 8434-6 (g1/4) data_center_cooling 데이터센터 액체 냉각 data center liquid cooling')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-push-pull', 'PUSH-PULL', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '푸시풀 퀵 커플링 (ISO 7241-A)', 'Push-Pull Quick Couplings (ISO 7241-A)', '슬리브 조작만으로 연결·분리되는 ISO 7241-A 포핏 푸시풀 커플링', 'ISO 7241-A poppet push-pull couplings connected and disconnected by sleeve action alone', '슬리브를 밀고 당기는 동작만으로 연결과 분리가 이루어지는 ISO 7241-A 포핏 밸브 푸시풀 커플링입니다. DN10~DN25 사이즈에 최대 420 bar 사양이며, 아연 도금 탄소강 바디에 BSPP, NPT, DIN 2353(벌크헤드 포함) 엔드를 제공합니다. 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'ISO 7241-A poppet push-pull couplings that connect and disconnect with a simple push or pull of the sleeve. Sizes DN10 to DN25 rated up to 420 bar, galvanized carbon steel bodies with BSPP, NPT and DIN 2353 (including bulkhead) ends. Also available in the patented integrated ball-valve version.',
  '{"coupling_standard": "iso_7241_a", "size_range": "DN10–DN25", "max_working_pressure": 420, "body_material": "carbon_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT (ASME B1.20.1), DIN 2353 S/L + bulkhead", "surface_treatment": "Galvanized", "application": "general_hydraulics"}'::jsonb, true, 2100, '푸시풀 퀵 커플링 (iso 7241-a) push-pull quick couplings (iso 7241-a) 슬리브 조작만으로 연결·분리되는 iso 7241-a 포핏 푸시풀 커플링 iso 7241-a poppet push-pull couplings connected and disconnected by sleeve action alone push-pull gemels s.p.a. 퀵 커플링 quick couplings iso_7241_a iso 7241-a iso 7241-a dn10–dn25 420 carbon_steel 탄소강 carbon steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false nbr (표준), fkm (옵션) bspp (iso 1179-1), npt (asme b1.20.1), din 2353 s/l + bulkhead galvanized general_hydraulics 일반 유압 general hydraulics')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-push-pull-agri', 'PUSH-PULL AGRI', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '푸시풀 아그리 (ISO 7241-A 농업용)', 'Push-Pull Agri (ISO 7241-A Agriculture)', '잔압 상태의 수커플러 연결이 가능한 농업용 ISO 7241-A 푸시풀 커플링', 'Agricultural ISO 7241-A push-pull couplings allowing male coupler connection under residual pressure', '트랙터·농기계용 ISO 7241-A 푸시풀 커플링으로, 특수 핀 구조를 통해 잔압이 남은 수커플러를 그대로 연결할 수 있습니다. 핀은 수/암 어느 쪽에도 장착 가능하며 연결 과정에서 작은 홀을 통해 잔압이 방출됩니다. DN12.5 사이즈에 최대 250 bar, 아연 도금 탄소강과 스테인리스강 재질을 제공합니다.', 'ISO 7241-A push-pull couplings for tractors and agricultural machinery. A special pin allows joining male couplers with remaining pressure; the pin can be mounted on either the male or female side, and residual pressure is released through small holes during connection. DN12.5 size rated up to 250 bar, in galvanized carbon steel and stainless steel.',
  '{"coupling_standard": "iso_7241_a", "size_range": "DN12.5", "max_working_pressure": 250, "body_material": "carbon_or_stainless_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": true, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1 / ISO 8434-6 male), NPT, SAE ORB", "surface_treatment": "Galvanized (carbon steel)", "application": "agriculture"}'::jsonb, true, 2110, '푸시풀 아그리 (iso 7241-a 농업용) push-pull agri (iso 7241-a agriculture) 잔압 상태의 수커플러 연결이 가능한 농업용 iso 7241-a 푸시풀 커플링 agricultural iso 7241-a push-pull couplings allowing male coupler connection under residual pressure push-pull agri gemels s.p.a. 퀵 커플링 quick couplings iso_7241_a iso 7241-a iso 7241-a dn12.5 250 carbon_or_stainless_steel 탄소강 / 스테인리스강 carbon or stainless steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve true nbr (표준), fkm (옵션) bspp (iso 1179-1 / iso 8434-6 male), npt, sae orb galvanized (carbon steel) agriculture 농업 기계 agriculture')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-push-pull-agri-dv', 'PUSH-PULL AGRI DV', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '푸시풀 아그리 DV (감압 밸브 내장)', 'Push-Pull Agri DV (Decompression Valve)', '감압 밸브 내장으로 수·암 양측 잔압 연결이 가능한 농업용 푸시풀 커플링', 'Agricultural push-pull couplings with decompression valve allowing both male and female connection under pressure', '푸시풀 아그리 시리즈에 감압 밸브(DV)를 더한 모델로, 수커플러뿐 아니라 암커플러도 잔압 상태에서 연결이 가능합니다. ISO 7241-A 규격의 DN12.5 사이즈에 최대 250 bar이며, 아연 도금 탄소강과 스테인리스강 재질, NBR/FKM 씰을 제공합니다.', 'Push-Pull Agri series with an added decompression valve (DV), allowing connection under residual pressure on the female side as well as the male. ISO 7241-A profile, DN12.5 size rated up to 250 bar, in galvanized carbon steel and stainless steel with NBR or FKM seals.',
  '{"coupling_standard": "iso_7241_a", "size_range": "DN12.5", "max_working_pressure": 250, "body_material": "carbon_or_stainless_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": true, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1 / ISO 8434-6 male), NPT, SAE ORB", "surface_treatment": "Galvanized (carbon steel)", "application": "agriculture"}'::jsonb, true, 2120, '푸시풀 아그리 dv (감압 밸브 내장) push-pull agri dv (decompression valve) 감압 밸브 내장으로 수·암 양측 잔압 연결이 가능한 농업용 푸시풀 커플링 agricultural push-pull couplings with decompression valve allowing both male and female connection under pressure push-pull agri dv gemels s.p.a. 퀵 커플링 quick couplings iso_7241_a iso 7241-a iso 7241-a dn12.5 250 carbon_or_stainless_steel 탄소강 / 스테인리스강 carbon or stainless steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve true nbr (표준), fkm (옵션) bspp (iso 1179-1 / iso 8434-6 male), npt, sae orb galvanized (carbon steel) agriculture 농업 기계 agriculture')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-push-pull-dv', 'PUSH-PULL DV', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '푸시풀 DV (감압 밸브 내장 ISO 7241-A)', 'Push-Pull DV (ISO 7241-A with Decompression Valve)', '감압 밸브를 내장해 잔압 연결이 가능한 ISO 7241-A 포핏 커플링', 'ISO 7241-A poppet couplings with decompression valve for connection under residual pressure', 'ISO 7241-A 포핏 커플링에 감압 밸브(DV)를 내장한 모델로, 특수 핀을 통해 잔압이 남은 상태에서도 연결할 수 있습니다. 핀은 수/암 어느 쪽에도 장착 가능하며 연결 시 작은 홀로 잔압이 방출됩니다. DN12.5~DN20 사이즈에 최대 350 bar, 아연 도금 탄소강 바디에 BSPP, NPT, SAE ORB, DIN 2353 엔드를 제공합니다.', 'ISO 7241-A poppet couplings with a built-in decompression valve (DV); a special pin allows connection with residual pressure, mountable on either male or female side, releasing pressure through small holes during connection. Sizes DN12.5 to DN20 rated up to 350 bar, galvanized carbon steel bodies with BSPP, NPT, SAE ORB and DIN 2353 ends.',
  '{"coupling_standard": "iso_7241_a", "size_range": "DN12.5–DN20", "max_working_pressure": 350, "body_material": "carbon_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": true, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT, SAE ORB (ISO 11926-1), DIN 2353 S/L + bulkhead", "surface_treatment": "Galvanized", "application": "agriculture"}'::jsonb, true, 2130, '푸시풀 dv (감압 밸브 내장 iso 7241-a) push-pull dv (iso 7241-a with decompression valve) 감압 밸브를 내장해 잔압 연결이 가능한 iso 7241-a 포핏 커플링 iso 7241-a poppet couplings with decompression valve for connection under residual pressure push-pull dv gemels s.p.a. 퀵 커플링 quick couplings iso_7241_a iso 7241-a iso 7241-a dn12.5–dn20 350 carbon_steel 탄소강 carbon steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve true nbr (표준), fkm (옵션) bspp (iso 1179-1), npt, sae orb (iso 11926-1), din 2353 s/l + bulkhead galvanized agriculture 농업 기계 agriculture')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-push-pull-n', 'PUSH-PULL N', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '푸시풀 N (ISO 7241-A 푸시풀 볼 / ISO 5675 N)', 'Push-Pull N (ISO 7241-A Push-Pull Ball / ISO 5675 N)', 'ISO 7241-A 푸시풀 슬리브에 ISO 5675 N 볼 밸브를 결합한 커플링', 'Coupling combining ISO 7241-A push-pull sleeve with ISO 5675 N ball valving', 'ISO 7241-A 푸시풀 방식과 ISO 5675 N 볼 밸브 구조를 결합한 커플링으로, 트랙터 등 농기계 유압 라인에 사용됩니다. DN12.5 사이즈에 최대 350 bar이며, 아연 도금 탄소강 바디에 BSPP, NPT, SAE ORB, DIN 2353(벌크헤드 포함) 엔드를 제공합니다. 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'Coupling combining the ISO 7241-A push-pull action with ISO 5675 N ball valving, used on tractor and agricultural hydraulic lines. DN12.5 size rated up to 350 bar, galvanized carbon steel bodies with BSPP, NPT, SAE ORB and DIN 2353 (including bulkhead) ends. Also available in the patented integrated ball-valve version.',
  '{"coupling_standard": "iso_7241_a_iso_5675", "size_range": "DN12.5", "max_working_pressure": 350, "body_material": "carbon_steel", "valve_type": "ball", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT, SAE ORB (ISO 11926-1), DIN 2353 S/L + bulkhead", "surface_treatment": "Galvanized", "application": "agriculture"}'::jsonb, true, 2140, '푸시풀 n (iso 7241-a 푸시풀 볼 / iso 5675 n) push-pull n (iso 7241-a push-pull ball / iso 5675 n) iso 7241-a 푸시풀 슬리브에 iso 5675 n 볼 밸브를 결합한 커플링 coupling combining iso 7241-a push-pull sleeve with iso 5675 n ball valving push-pull n gemels s.p.a. 퀵 커플링 quick couplings iso_7241_a_iso_5675 iso 7241-a / iso 5675 iso 7241-a / iso 5675 dn12.5 350 carbon_steel 탄소강 carbon steel ball 볼 ball push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false nbr (표준), fkm (옵션) bspp (iso 1179-1), npt, sae orb (iso 11926-1), din 2353 s/l + bulkhead galvanized agriculture 농업 기계 agriculture')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-push-pull-nv', 'PUSH-PULL NV', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '푸시풀 NV (ISO 7241-A 푸시풀 포핏 / ISO 5675 NV)', 'Push-Pull NV (ISO 7241-A Push-Pull Poppet / ISO 5675 NV)', 'ISO 5675 NV 포핏 밸브를 채용한 푸시풀 커플링, DN10~DN13', 'Push-pull couplings with ISO 5675 NV poppet valving, DN10 to DN13', 'ISO 7241-A 푸시풀 방식에 ISO 5675 NV 포핏 밸브를 결합한 커플링입니다. DN10~DN13 사이즈에 최대 420 bar 사양이며, 아연 도금 탄소강 바디에 BSPP, NPT, DIN 2353(벌크헤드 포함) 엔드와 NBR/FKM 씰을 제공합니다. 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'Coupling combining the ISO 7241-A push-pull action with ISO 5675 NV poppet valving. Sizes DN10 to DN13 rated up to 420 bar, galvanized carbon steel bodies with BSPP, NPT and DIN 2353 (including bulkhead) ends and NBR or FKM seals. Also available in the patented integrated ball-valve version.',
  '{"coupling_standard": "iso_7241_a_iso_5675", "size_range": "DN10–DN13", "max_working_pressure": 420, "body_material": "carbon_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT (ASME B1.20.1), DIN 2353 S/L + bulkhead", "surface_treatment": "Galvanized", "application": "agriculture"}'::jsonb, true, 2150, '푸시풀 nv (iso 7241-a 푸시풀 포핏 / iso 5675 nv) push-pull nv (iso 7241-a push-pull poppet / iso 5675 nv) iso 5675 nv 포핏 밸브를 채용한 푸시풀 커플링, dn10~dn13 push-pull couplings with iso 5675 nv poppet valving, dn10 to dn13 push-pull nv gemels s.p.a. 퀵 커플링 quick couplings iso_7241_a_iso_5675 iso 7241-a / iso 5675 iso 7241-a / iso 5675 dn10–dn13 420 carbon_steel 탄소강 carbon steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false nbr (표준), fkm (옵션) bspp (iso 1179-1), npt (asme b1.20.1), din 2353 s/l + bulkhead galvanized agriculture 농업 기계 agriculture')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-quick-interlock-valve', 'QUICK INTERLOCK VALVE', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '퀵 인터록 밸브 (데이터센터 냉각용)', 'Quick Interlock Valve (Data Center Cooling)', '동일 형상 양측 결합부를 갖춘 데이터센터 냉각용 볼 밸브 인터록 커플링', 'Ball-valve interlock coupling for data center liquid cooling with identical twin coupling halves', '데이터센터 액체 냉각 시스템용 볼 밸브 인터록 커플링으로, 양측이 동일한 형상이라 하나의 부품 번호로 주문과 재고 관리가 간편합니다. 완전히 연결된 상태에서만 밸브가 열리고 양측이 닫힌 후에만 분리할 수 있어 누유와 사고 분리 위험을 차단하며, 스위블 엔드가 호스 꼬임을 방지합니다. 316 스테인리스강 재질이며 근접 센서를 통한 원격 모니터링 옵션을 제공합니다 (특허 출원 중).', 'Ball-valve interlock coupling for data center liquid cooling featuring identical coupling halves, so a single part number covers both sides. Valves open only when fully connected and can only be disconnected after both sides are securely closed, eliminating leakage and accidental disconnection; swivel closure ends prevent hose twisting. Built in 316 stainless steel with optional proximity-sensor remote monitoring (patent pending).',
  '{"coupling_standard": "proprietary", "size_range": "DN25–DN50 (G1–G2, N1–N2, SAE16–SAE32)", "max_working_pressure": 16, "body_material": "stainless_steel", "valve_type": "ball_shutoff", "connection_type": "quick_interlock", "connect_under_pressure": false, "thread_types": "BSP (DIN/ISO 228), NPT (ANSI/ASME B1.20.1), SAE J1926-1", "application": "data_center_cooling"}'::jsonb, true, 2160, '퀵 인터록 밸브 (데이터센터 냉각용) quick interlock valve (data center cooling) 동일 형상 양측 결합부를 갖춘 데이터센터 냉각용 볼 밸브 인터록 커플링 ball-valve interlock coupling for data center liquid cooling with identical twin coupling halves quick interlock valve gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn25–dn50 (g1–g2, n1–n2, sae16–sae32) 16 stainless_steel 스테인리스강 stainless steel ball_shutoff 볼 밸브 차단식 ball-valve shut-off quick_interlock 퀵 인터록 quick interlock false bsp (din/iso 228), npt (ansi/asme b1.20.1), sae j1926-1 data_center_cooling 데이터센터 액체 냉각 data center liquid cooling')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-rf', 'RF', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RF 시리즈 체크밸브 내장 유량 제어 밸브', 'RF Series Flow Control Valves with Check Valve', '체크밸브 내장 유량 제어 밸브, DN6~DN40, 최대 400bar', 'Check valve flow control valves, DN6-DN40, up to 400 bar', 'RF 시리즈는 역류 시 자유 흐름을 허용하는 체크밸브 내장형 유량 제어 밸브입니다. DN6~DN40 사이즈에 최대 40 MPa(PN400, 대구경 35 MPa), 최대 유량 300 l/min, 크래킹 압력 0.05 MPa이며 BSP/NPT 나사와 아연 도금 탄소강 본체로 제공됩니다.', 'The RF series are flow control valves with integrated check valve for free reverse flow. Sizes DN6-DN40 are rated up to 40 MPa (PN400, 35 MPa for larger sizes) with flows up to 300 l/min and a 0.05 MPa cracking pressure, supplied with BSP/NPT ends and galvanized carbon steel bodies.',
  '{"valve_type": "flow_control_valve", "size_range": "DN6 ~ DN40", "max_pressure_mpa": 40, "end_connections": "BSP(ISO 228), NPT(ANSI/ASME B1.20.1)", "body_material": "carbon_steel", "temp_range_c": "-20°C ~ +100°C", "max_flow_lpm": 300, "seal_material": "NBR", "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 2170, 'rf 시리즈 체크밸브 내장 유량 제어 밸브 rf series flow control valves with check valve 체크밸브 내장 유량 제어 밸브, dn6~dn40, 최대 400bar check valve flow control valves, dn6-dn40, up to 400 bar rf gemels s.p.a. 유압 밸브 hydraulic valves flow_control_valve 유량 제어 밸브 flow control valve dn6 ~ dn40 40 bsp(iso 228), npt(ansi/asme b1.20.1) carbon_steel 탄소강 carbon steel -20°c ~ +100°c 300 nbr 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-rfm-bdm', 'RFM/BDM', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RFM/BDM 시리즈 배럴형 유량 조절기', 'RFM/BDM Series Barrel Type Flow Regulators', '단방향(RFM)/양방향(BDM) 배럴형 유량 조절기, DN6~DN25', 'Uni-directional (RFM) and bi-directional (BDM) barrel type flow regulators, DN6-DN25', 'RFM(단방향)과 BDM(양방향)은 배럴형 유량 조절기입니다. DN6~DN25 사이즈에 최대 35 MPa(DN25는 25 MPa), 최대 유량 160 l/min이며 BSP 나사와 아연 도금 표면 처리로 제공됩니다.', 'The RFM (uni-directional) and BDM (bi-directional) are barrel type flow regulators. Sizes DN6-DN25 are rated up to 35 MPa (25 MPa at DN25) with flows up to 160 l/min, supplied with BSP ends and zinc plated surfaces.',
  '{"valve_type": "flow_regulator", "size_range": "DN6 ~ DN25", "max_pressure_mpa": 35, "end_connections": "BSP (GAS DIN/ISO 228)", "body_material": "carbon_steel", "temp_range_c": "유체 -20°C ~ +90°C, 주위 -20°C ~ +50°C", "max_flow_lpm": 160, "surface_treatment": "아연 도금 (Zinc plated)"}'::jsonb, true, 2180, 'rfm/bdm 시리즈 배럴형 유량 조절기 rfm/bdm series barrel type flow regulators 단방향(rfm)/양방향(bdm) 배럴형 유량 조절기, dn6~dn25 uni-directional (rfm) and bi-directional (bdm) barrel type flow regulators, dn6-dn25 rfm/bdm gemels s.p.a. 유압 밸브 hydraulic valves flow_regulator 유량 조절기 flow regulator dn6 ~ dn25 35 bsp (gas din/iso 228) carbon_steel 탄소강 carbon steel 유체 -20°c ~ +90°c, 주위 -20°c ~ +50°c 160 아연 도금 (zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-safety-valve-pg', 'PG (Safety Valve)', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PG 시리즈 어큐뮬레이터 안전 밸브 블록', 'PG Series Accumulator Safety Valve Block', '수동/솔레노이드 조작식 어큐뮬레이터 격리·방출 안전 밸브 블록 (CE PED 인증)', 'Manual and solenoid operated accumulator isolation/discharge safety blocks (CE PED certified)', 'PG 시리즈 안전 밸브는 유압 어큐뮬레이터용 격리·방출 블록으로, 볼 밸브(격리), 사전 설정된 자동 릴리프 밸브(안전), 니들 밸브(수동 방출)로 구성되며 솔레노이드 밸브(원격 방출) 옵션을 추가할 수 있습니다. DN10~DN32 사이즈에 정격 42 MPa, 릴리프 밸브 최대 420 bar 설정이 가능하고, 릴리프 밸브는 유럽 압력기기지침 PED 2014/68/EU에 따라 인증·교정 및 CE 마킹되어 있습니다.', 'The PG series safety valve is a hydraulic isolation and discharge block for accumulators, consisting of a ball valve (isolation), a pre-set automatic relief valve (safety) and a needle valve (manual discharge), with an optional solenoid valve for remote discharge. Available in DN10-DN32 rated at 42 MPa with relief settings up to 420 bar, the relief valve is certified, calibrated and CE-marked per the European Pressure Equipment Directive PED 2014/68/EU.',
  '{"valve_type": "safety_valve", "size_range": "DN10 ~ DN32", "max_pressure_mpa": 42, "end_connections": "BSP, NPT, SAE J1926 (어큐뮬레이터 포트 M33×2)", "body_material": "carbon_steel", "temp_range_c": "수동식 -20°C ~ +90°C, 솔레노이드 병용식 -20°C ~ +60°C", "seal_material": "NBR", "surface_treatment": "인산염 처리 (Phosphate)"}'::jsonb, true, 2190, 'pg 시리즈 어큐뮬레이터 안전 밸브 블록 pg series accumulator safety valve block 수동/솔레노이드 조작식 어큐뮬레이터 격리·방출 안전 밸브 블록 (ce ped 인증) manual and solenoid operated accumulator isolation/discharge safety blocks (ce ped certified) pg (safety valve) gemels s.p.a. 유압 밸브 hydraulic valves safety_valve 안전 밸브 safety valve dn10 ~ dn32 42 bsp, npt, sae j1926 (어큐뮬레이터 포트 m33×2) carbon_steel 탄소강 carbon steel 수동식 -20°c ~ +90°c, 솔레노이드 병용식 -20°c ~ +60°c nbr 인산염 처리 (phosphate)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-sbf', 'SBF', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-oil-gas-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SBF 시리즈 스플릿 바디 플로팅 볼 밸브', 'SBF Series Split Body Floating Ball Valves', '플랜지형 스플릿 바디 플로팅 볼 밸브, DN13~DN150, ANSI 150~2500', 'Flanged split body floating ball valves, DN13-DN150, ANSI 150-2500', 'SBF 시리즈는 볼트 체결 스플릿 바디 플로팅 볼 밸브로 DN13~DN150(1/2"~6") 사이즈, ANSI 150~2500 클래스로 제공됩니다. 단조 LF2/F316(듀플렉스·합금강 옵션) 본체, RPTFE 시트(PEEK/POM/DEVLON/메탈-투-메탈 옵션), RF/RTJ/BW/FF 플랜지를 지원하며 API 6D, API 598, ASME B16.34/B16.5/B16.10, NACE MR-01-75, BS 5351 등 국제 규격에 부합합니다. 풀보어/리듀스드 보어 선택이 가능합니다.', 'The SBF series are bolted split body floating ball valves in DN13-DN150 (1/2"-6"), ANSI class 150-2500. With forged LF2/F316 bodies (duplex and alloy options), RPTFE seats (PEEK/POM/DEVLON/metal-to-metal options) and RF/RTJ/BW/FF flanges, they comply with API 6D, API 598, ASME B16.34/B16.5/B16.10, NACE MR-01-75, BS 5351 and related standards. Full bore and reduced bore versions are available.',
  '{"valve_design": "split_body_floating", "size_range": "DN13 ~ DN150 (1/2\" ~ 6\"), FB/RB", "pressure_class": "ANSI 150 ~ 2500", "max_pressure_mpa": 42, "end_connections": "플랜지 RF (RTJ/BW/FF 주문 제작)", "body_material": "ASTM A350 LF2 / A182 F316 (A105, F51 듀플렉스 옵션)", "temp_range_c": "-50°C ~ +200°C (재질 선택에 따름)", "standards": "API 6D, API 598, ASME B16.34/B16.5/B16.10, BS 6755, NACE MR-01-75, BS 5351, ISO 5211", "iso5211_mount": true}'::jsonb, true, 2200, 'sbf 시리즈 스플릿 바디 플로팅 볼 밸브 sbf series split body floating ball valves 플랜지형 스플릿 바디 플로팅 볼 밸브, dn13~dn150, ansi 150~2500 flanged split body floating ball valves, dn13-dn150, ansi 150-2500 sbf gemels s.p.a. 오일&가스 볼 밸브 oil & gas ball valves split_body_floating 스플릿 바디 플로팅 split body floating dn13 ~ dn150 (1/2" ~ 6"), fb/rb ansi 150 ~ 2500 42 플랜지 rf (rtj/bw/ff 주문 제작) astm a350 lf2 / a182 f316 (a105, f51 듀플렉스 옵션) -50°c ~ +200°c (재질 선택에 따름) api 6d, api 598, asme b16.34/b16.5/b16.10, bs 6755, nace mr-01-75, bs 5351, iso 5211 true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-sbf-w', 'SBF-W', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-oil-gas-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SBF-W 시리즈 웨이퍼형 볼 밸브', 'SBF-W Series Wafer Type Ball Valves', '스플릿 바디 플로팅 웨이퍼형 볼 밸브, DN13~DN150, ANSI 150~600', 'Split body floating wafer type ball valves, DN13-DN150, ANSI 150-600', 'SBF-W 시리즈는 스플릿 바디 플로팅 구조의 웨이퍼형 볼 밸브입니다. DN13~DN150(1/2"~6") 사이즈에 ANSI 150/300/600 클래스로 제공되며, 단조 탄소강(LF2)·스테인리스강(F316)·듀플렉스·합금강 본체와 RPTFE 볼 시트(PEEK/POM/DEVLON 옵션)를 사용합니다. -50°C~+200°C 온도 범위와 ISO 5211 액추에이터 마운트를 지원합니다.', 'The SBF-W series are wafer type ball valves with split body floating construction. Sizes DN13-DN150 (1/2"-6") are offered in ANSI 150/300/600 classes with forged carbon steel (LF2), stainless steel (F316), duplex or alloy bodies and RPTFE ball seats (PEEK/POM/DEVLON options). They cover -50°C to +200°C and provide ISO 5211 actuator mounting.',
  '{"valve_design": "wafer_floating", "size_range": "DN13 ~ DN150 (1/2\" ~ 6\")", "pressure_class": "ANSI 150 / 300 / 600", "max_pressure_mpa": 10, "end_connections": "웨이퍼 (ASME B16.5 플랜지 사이 장착)", "body_material": "ASTM A350 LF2 / A479 Tp.316 (CS, SS, DSS, 합금강 단조)", "temp_range_c": "-50°C ~ +200°C (재질 선택에 따름)", "standards": "ASME B16.5, ISO 5211", "iso5211_mount": true}'::jsonb, true, 2210, 'sbf-w 시리즈 웨이퍼형 볼 밸브 sbf-w series wafer type ball valves 스플릿 바디 플로팅 웨이퍼형 볼 밸브, dn13~dn150, ansi 150~600 split body floating wafer type ball valves, dn13-dn150, ansi 150-600 sbf-w gemels s.p.a. 오일&가스 볼 밸브 oil & gas ball valves wafer_floating 웨이퍼 플로팅 wafer type floating dn13 ~ dn150 (1/2" ~ 6") ansi 150 / 300 / 600 10 웨이퍼 (asme b16.5 플랜지 사이 장착) astm a350 lf2 / a479 tp.316 (cs, ss, dss, 합금강 단조) -50°c ~ +200°c (재질 선택에 따름) asme b16.5, iso 5211 true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-sbt', 'SBT', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-oil-gas-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SBT 시리즈 스플릿 바디 트러니언 볼 밸브', 'SBT Series Split Body Trunnion Ball Valves', '트러니언 마운트 볼 밸브, DN20~DN900(3/4"~36"), ANSI 150~2500', 'Trunnion mounted ball valves, DN20-DN900 (3/4"-36"), ANSI 150-2500', 'SBT 시리즈는 볼트 체결 스플릿 바디 트러니언 마운트 볼 밸브로 DN20~DN900(3/4"~36") 사이즈, ANSI 150~2500 클래스로 제공됩니다. LF2/F316 단조 본체, 인코넬 X750 스프링, 스템 인젝션·드레인 플러그·벤트 블리더를 갖추고 있으며 레버/기어/공압·전동 액추에이터 조작이 가능합니다. API 6D 등 파이프라인 밸브 규격에 부합하며 완전 용접(Fully Welded) 버전도 제공됩니다.', 'The SBT series are bolted split body trunnion mounted ball valves in DN20-DN900 (3/4"-36"), ANSI class 150-2500. Built with forged LF2/F316 bodies, Inconel X750 springs, stem injection, drain plug and vent bleeder, they can be operated by lever, gear or pneumatic/electric actuators. They comply with API 6D and related pipeline valve standards, and a fully welded version is also available.',
  '{"valve_design": "split_body_trunnion", "size_range": "DN20 ~ DN900 (3/4\" ~ 36\"), FB/RB", "pressure_class": "ANSI 150 ~ 2500", "max_pressure_mpa": 42, "end_connections": "플랜지 RF (RTJ/BW/FF 주문 제작)", "body_material": "ASTM A350 LF2 / A182 F316 (F51 듀플렉스 옵션)", "temp_range_c": "-50°C ~ +200°C (재질 선택에 따름)", "standards": "API 6D, API 598, ASME B16.34/B16.5/B16.10, BS 6755, NACE MR-01-75, BS 5351, ISO 5211", "iso5211_mount": true}'::jsonb, true, 2220, 'sbt 시리즈 스플릿 바디 트러니언 볼 밸브 sbt series split body trunnion ball valves 트러니언 마운트 볼 밸브, dn20~dn900(3/4"~36"), ansi 150~2500 trunnion mounted ball valves, dn20-dn900 (3/4"-36"), ansi 150-2500 sbt gemels s.p.a. 오일&가스 볼 밸브 oil & gas ball valves split_body_trunnion 스플릿 바디 트러니언 split body trunnion dn20 ~ dn900 (3/4" ~ 36"), fb/rb ansi 150 ~ 2500 42 플랜지 rf (rtj/bw/ff 주문 제작) astm a350 lf2 / a182 f316 (f51 듀플렉스 옵션) -50°c ~ +200°c (재질 선택에 따름) api 6d, api 598, asme b16.34/b16.5/b16.10, bs 6755, nace mr-01-75, bs 5351, iso 5211 true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-sj', 'SJ', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-swivel-joints'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SJ 시리즈 스위벨 조인트 (인라인/90°)', 'SJ Series Swivel Joints (In-line / 90°)', '인라인 및 90° 타입 스위벨 조인트 (DN6~DN50, 최대 정압 400bar)', 'In-line and 90-degree swivel joints (DN6-DN50, max static 400 bar)', 'SJ 시리즈는 인라인(SJ10)과 90°(SJ90) 두 가지 형태로 제공되는 탄소강 스위벨 조인트입니다. G1/4~G2(DN6~DN50) 사이즈에서 최대 정압 40 MPa, 회전 시 압력은 사이즈에 따라 5~20 MPa를 지원하며 최대 유량은 700 l/min입니다. BSP 나사가 기본이고 NPT는 주문 제작 가능합니다.', 'The SJ series carbon steel swivel joints come in in-line (SJ10) and 90-degree (SJ90) configurations. Sizes G1/4 to G2 (DN6-DN50) support maximum static pressures of 40 MPa with rotating pressures of 5-20 MPa depending on size, and flow rates up to 700 l/min. BSP threads are standard with NPT available on request.',
  '{"joint_type": "in_line_or_90", "size_range": "DN6 ~ DN50 (G1/4 ~ G2)", "max_pressure_mpa": 40, "end_connections": "BSP (GAS DIN/ISO 228); NPT 주문 제작", "body_material": "탄소강 (Carbon Steel)", "temp_range_c": "-20°C ~ +80°C", "surface_treatment": "아연 도금 (Galvanized)", "max_flow_lpm": 700}'::jsonb, true, 2230, 'sj 시리즈 스위벨 조인트 (인라인/90°) sj series swivel joints (in-line / 90°) 인라인 및 90° 타입 스위벨 조인트 (dn6~dn50, 최대 정압 400bar) in-line and 90-degree swivel joints (dn6-dn50, max static 400 bar) sj gemels s.p.a. 스위벨 조인트 swivel joints in_line_or_90 인라인/90° in-line / 90° dn6 ~ dn50 (g1/4 ~ g2) 40 bsp (gas din/iso 228); npt 주문 제작 탄소강 (carbon steel) -20°c ~ +80°c 아연 도금 (galvanized) 700')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-sj-hd', 'SJ HD', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-swivel-joints'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SJ HD 시리즈 헤비듀티 스위벨 조인트', 'SJ HD Series Heavy Duty Swivel Joints', '회전 중에도 400bar를 견디는 헤비듀티 인라인 스위벨 조인트', 'Heavy-duty in-line swivel joints rated 400 bar while rotating', 'SJ HD 시리즈는 헤비듀티용 인라인 스위벨 조인트로, G1/2~G1(DN13~DN25) 사이즈에서 회전 중 최대 35~40 MPa, 피크 압력 45~50 MPa를 지원합니다. 최대 유량은 사이즈에 따라 95~215 l/min이며, BSP 나사가 기본이고 UNF/SAE 나사는 주문 제작 가능합니다.', 'The SJ HD series heavy-duty in-line swivel joints in sizes G1/2 to G1 (DN13-DN25) support rotating pressures of 35-40 MPa with peak pressures of 45-50 MPa. Maximum flow ranges from 95 to 215 l/min by size; BSP threads are standard with UNF/SAE available on request.',
  '{"joint_type": "in_line", "size_range": "DN13 ~ DN25 (G1/2 ~ G1)", "max_pressure_mpa": 50, "end_connections": "BSP (GAS DIN/ISO 228); UNF/SAE 주문 제작", "body_material": "탄소강 (Carbon Steel)", "temp_range_c": "-20°C ~ +80°C", "surface_treatment": "아연 도금 (Galvanized)", "max_flow_lpm": 215}'::jsonb, true, 2240, 'sj hd 시리즈 헤비듀티 스위벨 조인트 sj hd series heavy duty swivel joints 회전 중에도 400bar를 견디는 헤비듀티 인라인 스위벨 조인트 heavy-duty in-line swivel joints rated 400 bar while rotating sj hd gemels s.p.a. 스위벨 조인트 swivel joints in_line 인라인 in-line dn13 ~ dn25 (g1/2 ~ g1) 50 bsp (gas din/iso 228); unf/sae 주문 제작 탄소강 (carbon steel) -20°c ~ +80°c 아연 도금 (galvanized) 215')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-sr-rack-pinion', 'SR (Rack & Pinion)', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-actuators-kits'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SR 시리즈 랙&피니언 공압 액추에이터 (스프링 리턴)', 'SR Series Rack & Pinion Pneumatic Actuators (Spring Return)', '스프링 리턴 랙&피니언 공압 액추에이터, 토크 최대 533 Nm, ATEX', 'Spring return rack & pinion pneumatic actuators, up to 533 Nm, ATEX', 'SR 시리즈는 랙&피니언 구조의 스프링 리턴 공압 액추에이터입니다. SR35/(18)~SR530/(290) 모델이 0.6 MPa 공기압 기준 에어 스타트 토크 32.7~533 Nm, 스프링 엔드 토크 18~292 Nm를 제공합니다. 표준 공급 압력 6 bar(최대 7 bar), -40°C~+80°C(Buna-N 시일), ATEX 인증, ISO 5211 F05~F12 플랜지를 지원합니다.', 'The SR series are spring return rack & pinion pneumatic actuators. Models SR35/(18) to SR530/(290) deliver air-start torques of 32.7 to 533 Nm and spring-end torques of 18 to 292 Nm at 0.6 MPa. Standard 6 bar supply (7 bar max), -40°C to +80°C with Buna-N seals, ATEX certification and ISO 5211 F05-F12 flanges.',
  '{"product_type": "pneumatic_actuator", "operation": "spring_return", "models": "SR35/(18), SR60/(40), SR130/(72), SR240/(132), SR385/(210), SR530/(290)", "torque_range_nm": "에어 스타트 32.7 ~ 533 Nm, 스프링 엔드 18 ~ 292 Nm (0.6 MPa 기준)", "supply": "압축공기 6 bar (최대 7 bar)", "iso5211_flange": "F05 ~ F12", "temp_range_c": "-40°C ~ +80°C (Buna-N 시일)", "certification": "ATEX"}'::jsonb, true, 2250, 'sr 시리즈 랙&피니언 공압 액추에이터 (스프링 리턴) sr series rack & pinion pneumatic actuators (spring return) 스프링 리턴 랙&피니언 공압 액추에이터, 토크 최대 533 nm, atex spring return rack & pinion pneumatic actuators, up to 533 nm, atex sr (rack & pinion) gemels s.p.a. 액추에이터 및 키트 actuators & kits pneumatic_actuator 공압 액추에이터 pneumatic actuator spring_return 스프링 리턴 spring return sr35/(18), sr60/(40), sr130/(72), sr240/(132), sr385/(210), sr530/(290) 에어 스타트 32.7 ~ 533 nm, 스프링 엔드 18 ~ 292 nm (0.6 mpa 기준) 압축공기 6 bar (최대 7 bar) f05 ~ f12 -40°c ~ +80°c (buna-n 시일) atex')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-tandem', 'GE2/GE3 LEVER TANDEM', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '탠덤 콤비네이션 밸브', 'Tandem Combination Valve', '하나의 핸들로 2개의 독립 볼 밸브를 동시에 조작하는 탠덤 밸브. DN6~DN25, 최대 500bar', 'Two independently connected ball valves operated simultaneously with a single handle, DN6 to DN25, up to 500 bar', '독립적으로 배관되는 2개의 볼 밸브를 단일 핸들로 동시에 조작할 수 있는 특수 콤비네이션 밸브입니다. GE2(2웨이) 및 GE3(3웨이) 레버 탠덤 구성을 제공하며 사이즈 DN6~DN25, 최대 500bar입니다. BSP, NPT, SAE, DIN 2353(헤비/라이트) 접속을 지원하고 요청 시 마운팅 플레이트를 제공합니다.', 'Special combination valves where two independently connected ball valves are operated simultaneously using a single handle. Available as GE2 (2-way) and GE3 (3-way) lever tandem configurations, sizes DN6 to DN25, up to 500 bar, with BSP, NPT, SAE and DIN 2353 (heavy/light) ends. Mounting plates are available on request.',
  '{"valve_ways": "tandem", "size_range": "DN6 - DN25", "max_pressure_bar": 500, "body_material": "carbon_steel", "seat_material": "POM", "seal_material": "NBR", "port_types": "BSP(ISO 228), NPT, SAE J1926-1, DIN 2353 헤비/라이트", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "단일 핸들 동시 조작, GE2/GE3 탠덤 구성, 마운팅 플레이트 옵션"}'::jsonb, true, 2260, '탠덤 콤비네이션 밸브 tandem combination valve 하나의 핸들로 2개의 독립 볼 밸브를 동시에 조작하는 탠덤 밸브. dn6~dn25, 최대 500bar two independently connected ball valves operated simultaneously with a single handle, dn6 to dn25, up to 500 bar ge2/ge3 lever tandem gemels s.p.a. 볼 밸브 ball valves tandem 탠덤(복합) tandem (combination) dn6 - dn25 500 carbon_steel 탄소강 carbon steel pom nbr bsp(iso 228), npt, sae j1926-1, din 2353 헤비/라이트 -20°c ~ +100°c 아연 도금(galvanized) 단일 핸들 동시 조작, ge2/ge3 탠덤 구성, 마운팅 플레이트 옵션')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-uqd', 'UQD', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'UQD 냉각용 퀵 커플링', 'UQD Quick Couplings for Cooling', '데이터센터 액체 냉각 시스템용 스테인리스 UQD 퀵 커플링', 'Stainless steel UQD quick couplings for data center liquid cooling systems', '데이터센터 액체 냉각 시스템용 UQD(Universal Quick Disconnect) 퀵 커플링입니다. 1.4404(316L) 스테인리스강 바디에 EPDM 씰을 적용해 냉각수 환경에 최적화되어 있으며, DN3.2~DN12.5(1/8"~1/2") 사이즈를 바브 피팅 및 UNF(ISO 11926-3) 엔드로 제공합니다.', 'UQD (Universal Quick Disconnect) couplings for data center liquid cooling systems. Stainless steel 1.4404 (316L) bodies with EPDM seals are optimized for coolant service, offered in DN3.2 to DN12.5 (1/8" to 1/2") with barb fitting and UNF (ISO 11926-3) ends.',
  '{"coupling_standard": "proprietary", "size_range": "DN3.2–DN12.5 (1/8\"–1/2\")", "max_working_pressure": 7, "body_material": "stainless_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "EPDM", "thread_types": "Barb fitting, UNF (ISO 11926-3): 7/16\"-20, 9/16\"-18, 3/4\"-16, 7/8\"-14", "application": "data_center_cooling"}'::jsonb, true, 2270, 'uqd 냉각용 퀵 커플링 uqd quick couplings for cooling 데이터센터 액체 냉각 시스템용 스테인리스 uqd 퀵 커플링 stainless steel uqd quick couplings for data center liquid cooling systems uqd gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn3.2–dn12.5 (1/8"–1/2") 7 stainless_steel 스테인리스강 stainless steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false epdm barb fitting, unf (iso 11926-3): 7/16"-20, 9/16"-18, 3/4"-16, 7/8"-14 data_center_cooling 데이터센터 액체 냉각 data center liquid cooling')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-uqd-b', 'UQD-B', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'UQD-B 냉각용 퀵 커플링', 'UQD-B Quick Couplings for Cooling', '데이터센터 액체 냉각용 UQD-B 스테인리스 퀵 커플링', 'UQD-B stainless steel quick couplings for data center liquid cooling', '데이터센터 액체 냉각 시스템용 UQD-B 퀵 커플링입니다. 1.4404(316L) 스테인리스강 바디와 EPDM 씰 사양으로 DN3.2~DN12.5(1/8"~1/2") 사이즈를 UNF/UN(ISO 11926-3) 나사 엔드로 제공합니다.', 'UQD-B quick couplings for data center liquid cooling systems. Stainless steel 1.4404 (316L) bodies with EPDM seals, available in DN3.2 to DN12.5 (1/8" to 1/2") with UNF/UN (ISO 11926-3) threaded ends.',
  '{"coupling_standard": "proprietary", "size_range": "DN3.2–DN12.5 (1/8\"–1/2\")", "max_working_pressure": 7, "body_material": "stainless_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "EPDM", "thread_types": "UNF/UN (ISO 11926-3): 7/16\"-20, 9/16\"-18, 3/4\"-16, 7/8\"-14, 1 1/16\"-12", "application": "data_center_cooling"}'::jsonb, true, 2280, 'uqd-b 냉각용 퀵 커플링 uqd-b quick couplings for cooling 데이터센터 액체 냉각용 uqd-b 스테인리스 퀵 커플링 uqd-b stainless steel quick couplings for data center liquid cooling uqd-b gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn3.2–dn12.5 (1/8"–1/2") 7 stainless_steel 스테인리스강 stainless steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false epdm unf/un (iso 11926-3): 7/16"-20, 9/16"-18, 3/4"-16, 7/8"-14, 1 1/16"-12 data_center_cooling 데이터센터 액체 냉각 data center liquid cooling')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vap', 'VAP', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VAP 안전 밸브', 'VAP Safety Valve', 'CE 인증 유압 안전 밸브 (DN6~DN13)', 'CE-certified hydraulic safety valves (DN6-DN13)', 'VAP 시리즈는 CE 인증을 받은 유압 안전 밸브로 G1/4(DN6), G3/8(DN10), G1/2(DN13) 사이즈로 제공됩니다. 카탈로그에는 외형 치수만 수록되어 있으며 상세 압력 설정은 제조사 문의가 필요합니다.', 'The VAP series are CE-certified hydraulic safety valves available in G1/4 (DN6), G3/8 (DN10) and G1/2 (DN13). The catalog lists dimensional data only; pressure setting details require consultation with the manufacturer.',
  '{"valve_type": "safety_valve", "size_range": "DN6 ~ DN13 (G1/4 ~ G1/2)", "end_connections": "BSP (GAS DIN/ISO 228)", "body_material": "carbon_steel"}'::jsonb, true, 2290, 'vap 안전 밸브 vap safety valve ce 인증 유압 안전 밸브 (dn6~dn13) ce-certified hydraulic safety valves (dn6-dn13) vap gemels s.p.a. 유압 밸브 hydraulic valves safety_valve 안전 밸브 safety valve dn6 ~ dn13 (g1/4 ~ g1/2) bsp (gas din/iso 228) carbon_steel 탄소강 carbon steel')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vb-vuba', 'VB VUBA', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VB VUBA 시리즈 호스 파단 밸브', 'VB VUBA Series Hose Break Valves', '호스 파단 시 유로를 차단하는 안전 밸브, DN6~DN25', 'Hose break safety valves, DN6-DN25', 'VB VUBA 시리즈는 호스 파단 시 급격한 유량 증가를 감지해 유로를 차단하는 안전 밸브입니다. G1/4~G1 사이즈에 최대 35 MPa, 유량 범위 8~200 l/min이며 카트리지(VB), 암나사 하우징(VBF), 수나사 하우징(VBM) 및 조립품 형태로 제공됩니다. 반응 유량 설정(T)이 가능합니다.', 'The VB VUBA series are hose break safety valves that shut off flow when a sudden flow increase indicates hose failure. Sizes G1/4 to G1 are rated at 35 MPa with flow ranges of 8-200 l/min, offered as cartridges (VB), female housings (VBF), male housings (VBM) and assembled units, with adjustable reaction flow setting (T).',
  '{"valve_type": "hose_break_valve", "size_range": "DN6 ~ DN25 (G1/4 ~ G1)", "max_pressure_mpa": 35, "end_connections": "BSP (GAS DIN/ISO 228)", "body_material": "carbon_steel", "temp_range_c": "-20°C ~ +100°C", "max_flow_lpm": 200, "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 2300, 'vb vuba 시리즈 호스 파단 밸브 vb vuba series hose break valves 호스 파단 시 유로를 차단하는 안전 밸브, dn6~dn25 hose break safety valves, dn6-dn25 vb vuba gemels s.p.a. 유압 밸브 hydraulic valves hose_break_valve 호스 파단 밸브 hose break valve dn6 ~ dn25 (g1/4 ~ g1) 35 bsp (gas din/iso 228) carbon_steel 탄소강 carbon steel -20°c ~ +100°c 200 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vbp', 'VBP', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBP 시리즈 파일럿 체크 밸브', 'VBP Series Pilot Operated Check Valves', '단동(VBPSE)/복동(VBPDE) 파일럿 체크 밸브, DN6~DN20', 'Single (VBPSE) and double (VBPDE) pilot operated check valves, DN6-DN20', 'VBP 시리즈는 단동(VBPSE), 복동(VBPDE), 12mm 배관 장착형(VBPDE CEXC), 인라인형(VBPDE Type A) 파일럿 체크 밸브로 구성됩니다. DN6~DN20 사이즈에 최대 35 MPa(PN350), 파일럿비 3.8:1~6.25:1, 최대 유량 100 l/min이며 BSP 나사와 아연 도금 탄소강 본체로 제공됩니다.', 'The VBP series comprises single (VBPSE), double (VBPDE), 12mm-pipe-mount (VBPDE CEXC) and inline (VBPDE Type A) pilot operated check valves. Sizes DN6-DN20 are rated up to 35 MPa (PN350) with pilot ratios of 3.8:1 to 6.25:1 and flows up to 100 l/min, supplied with BSP ends and galvanized carbon steel bodies.',
  '{"valve_type": "pilot_check_valve", "size_range": "DN6 ~ DN20", "max_pressure_mpa": 35, "end_connections": "BSP (GAS DIN/ISO 228)", "body_material": "carbon_steel", "temp_range_c": "-20°C ~ +100°C", "max_flow_lpm": 100, "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 2310, 'vbp 시리즈 파일럿 체크 밸브 vbp series pilot operated check valves 단동(vbpse)/복동(vbpde) 파일럿 체크 밸브, dn6~dn20 single (vbpse) and double (vbpde) pilot operated check valves, dn6-dn20 vbp gemels s.p.a. 유압 밸브 hydraulic valves pilot_check_valve 파일럿 체크 밸브 pilot operated check valve dn6 ~ dn20 35 bsp (gas din/iso 228) carbon_steel 탄소강 carbon steel -20°c ~ +100°c 100 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vga', 'VGA', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VGA 스크류 커플링 (ISO 14541)', 'VGA Screw-to-Connect Couplings (ISO 14541)', 'ISO 14541 스크류 체결식 커플링, DN6.3~DN31.5, 최대 420 bar', 'ISO 14541 screw-to-connect couplings, DN6.3 to DN31.5, up to 420 bar', 'ISO 14541 규격의 스크류 체결식 커플링으로, 고압·진동 환경에서도 확실한 체결력을 제공합니다. 아연 도금 탄소강과 스테인리스강(1.4404) 재질로 DN6.3~DN31.5 사이즈, 최대 420 bar 사양입니다. BSPP 및 DIN 2353 S/L(벌크헤드 포함) 엔드와 NBR/FKM 씰을 제공하며, 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'Screw-to-connect couplings to ISO 14541 providing secure engagement under high pressure and vibration. Galvanized carbon steel and stainless steel (1.4404) versions, sizes DN6.3 to DN31.5, rated up to 420 bar. BSPP and DIN 2353 S/L (including bulkhead) ends with NBR or FKM seals; a patented integrated ball-valve version is also available.',
  '{"coupling_standard": "iso_14541", "size_range": "DN6.3–DN31.5", "max_working_pressure": 420, "body_material": "carbon_or_stainless_steel", "valve_type": "poppet", "connection_type": "screw_to_connect", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션/스테인리스 표준)", "thread_types": "BSPP (ISO 1179-1), DIN 2353 S/L + bulkhead", "surface_treatment": "Galvanized (carbon steel)", "application": "general_hydraulics"}'::jsonb, true, 2320, 'vga 스크류 커플링 (iso 14541) vga screw-to-connect couplings (iso 14541) iso 14541 스크류 체결식 커플링, dn6.3~dn31.5, 최대 420 bar iso 14541 screw-to-connect couplings, dn6.3 to dn31.5, up to 420 bar vga gemels s.p.a. 퀵 커플링 quick couplings iso_14541 iso 14541 iso 14541 dn6.3–dn31.5 420 carbon_or_stainless_steel 탄소강 / 스테인리스강 carbon or stainless steel poppet 포핏 poppet screw_to_connect 스크류 체결식 screw-to-connect false nbr (표준), fkm (옵션/스테인리스 표준) bspp (iso 1179-1), din 2353 s/l + bulkhead galvanized (carbon steel) general_hydraulics 일반 유압 general hydraulics')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vgb', 'VGB', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VGB 고압 커플링 (ISO 14540)', 'VGB High-Pressure Couplings (ISO 14540)', '최대 700 bar ISO 14540 스크류 커플링, DN6.3~DN10', 'ISO 14540 screw couplings up to 700 bar, DN6.3 to DN10', 'ISO 14540 규격의 초고압 스크류 커플링으로 최대 700 bar까지 사용 가능합니다. DN6.3~DN10 사이즈에 아연 도금 탄소강 바디, NPT(암/수) 엔드와 NBR/FKM 씰을 제공합니다. 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'Ultra-high-pressure screw couplings to ISO 14540 rated up to 700 bar. Sizes DN6.3 to DN10 with galvanized carbon steel bodies, NPT (female/male) ends and NBR or FKM seals. Also available in the patented integrated ball-valve version.',
  '{"coupling_standard": "iso_14540", "size_range": "DN6.3–DN10", "max_working_pressure": 700, "body_material": "carbon_steel", "valve_type": "poppet", "connection_type": "screw_to_connect", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "NPT female/male (ASME B1.20.1)", "surface_treatment": "Galvanized", "application": "high_pressure"}'::jsonb, true, 2330, 'vgb 고압 커플링 (iso 14540) vgb high-pressure couplings (iso 14540) 최대 700 bar iso 14540 스크류 커플링, dn6.3~dn10 iso 14540 screw couplings up to 700 bar, dn6.3 to dn10 vgb gemels s.p.a. 퀵 커플링 quick couplings iso_14540 iso 14540 iso 14540 dn6.3–dn10 700 carbon_steel 탄소강 carbon steel poppet 포핏 poppet screw_to_connect 스크류 체결식 screw-to-connect false nbr (표준), fkm (옵션) npt female/male (asme b1.20.1) galvanized high_pressure 초고압 high pressure')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vgf', 'VGF', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VGF 플랫 페이스 스크류 커플링', 'VGF Flat Face Screw Couplings', '고압·고진동 환경용 플랫 페이스 스크류 체결식 커플링, 최대 480 bar', 'Flat face screw-to-connect couplings for high pressure and vibration, up to 480 bar', '나사 체결 방식의 플랫 페이스 스크류 커플링으로, 고압·맥동·진동이 심한 환경에서도 안정적인 연결을 유지합니다. DN10~DN25 사이즈에 최대 480 bar 사양이며, 탄소강 바디에 BSPP/NPT/SAE ORB 엔드를 제공합니다. Stucchi VEP 시리즈 프로파일과 호환되며, 아노다이징 알루미늄 보호 캡(DN13~DN32)도 별도 제공됩니다.', 'Flat face screw-to-connect couplings that stay securely connected under high pressure, pulses and vibration. Sizes DN10 to DN25 rated up to 480 bar, carbon steel bodies with BSPP, NPT and SAE ORB ends. Interchangeable with the Stucchi VEP series profile; anodized aluminum protection caps (DN13 to DN32) available.',
  '{"coupling_standard": "proprietary", "size_range": "DN10–DN25", "max_working_pressure": 480, "body_material": "carbon_steel", "valve_type": "flat_face", "connection_type": "screw_to_connect", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT (ASME B1.20.1), SAE ORB (ISO 11926-1)", "surface_treatment": "Galvanized", "application": "general_hydraulics"}'::jsonb, true, 2340, 'vgf 플랫 페이스 스크류 커플링 vgf flat face screw couplings 고압·고진동 환경용 플랫 페이스 스크류 체결식 커플링, 최대 480 bar flat face screw-to-connect couplings for high pressure and vibration, up to 480 bar vgf gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn10–dn25 480 carbon_steel 탄소강 carbon steel flat_face 플랫 페이스 flat face screw_to_connect 스크류 체결식 screw-to-connect false nbr (표준), fkm (옵션) bspp (iso 1179-1), npt (asme b1.20.1), sae orb (iso 11926-1) galvanized general_hydraulics 일반 유압 general hydraulics')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vgn', 'VGN', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VGN 퀵 커플링 (ISO 5675 / ISO 7241-A)', 'VGN Quick Couplings (ISO 5675 / ISO 7241-A)', '듀얼 기능 슬리브를 갖춘 ISO 5675/ISO 7241-A 호환 커플링', 'ISO 5675 / ISO 7241-A compatible couplings with dual-function sleeve', 'ISO 5675와 ISO 7241-A 규격에 대응하는 VGN 커플링으로, 듀얼 기능 슬리브를 채용해 NV 시리즈(ISO 5675) 수커플러와도 결합이 가능합니다. DN12.5 사이즈에 최대 350 bar이며, 아연 도금 탄소강 바디에 BSPP/NPT/SAE ORB 엔드를 제공합니다.', 'VGN couplings covering ISO 5675 and ISO 7241-A, featuring a dual-function sleeve and matable with NV series (ISO 5675) male couplers. DN12.5 size rated up to 350 bar, galvanized carbon steel bodies with BSPP, NPT and SAE ORB ends.',
  '{"coupling_standard": "iso_7241_a_iso_5675", "size_range": "DN12.5", "max_working_pressure": 350, "body_material": "carbon_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT (ASME B1.20.1), SAE ORB (ISO 11926-1)", "surface_treatment": "Galvanized", "application": "agriculture"}'::jsonb, true, 2350, 'vgn 퀵 커플링 (iso 5675 / iso 7241-a) vgn quick couplings (iso 5675 / iso 7241-a) 듀얼 기능 슬리브를 갖춘 iso 5675/iso 7241-a 호환 커플링 iso 5675 / iso 7241-a compatible couplings with dual-function sleeve vgn gemels s.p.a. 퀵 커플링 quick couplings iso_7241_a_iso_5675 iso 7241-a / iso 5675 iso 7241-a / iso 5675 dn12.5 350 carbon_steel 탄소강 carbon steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false nbr (표준), fkm (옵션) bspp (iso 1179-1), npt (asme b1.20.1), sae orb (iso 11926-1) galvanized agriculture 농업 기계 agriculture')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vgr', 'VGR', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VGR 스크류 커플링', 'VGR Screw-to-Connect Couplings', 'DIN 2353 엔드 전용 스크류 체결식 커플링, DN10~DN25', 'Screw-to-connect couplings with DIN 2353 ends, DN10 to DN25', '스크류 체결식 VGR 커플링으로 고압·진동 환경의 배관 연결에 적합합니다. DN10~DN25 사이즈에 최대 420 bar 사양이며, 탄소강 바디에 DIN 2353 S/L 튜브 엔드를 제공합니다.', 'VGR screw-to-connect couplings suited to line connections in high-pressure, high-vibration environments. Sizes DN10 to DN25 rated up to 420 bar, carbon steel bodies with DIN 2353 S/L tube ends.',
  '{"coupling_standard": "proprietary", "size_range": "DN10–DN25", "max_working_pressure": 420, "body_material": "carbon_steel", "valve_type": "poppet", "connection_type": "screw_to_connect", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "DIN 2353 S/L (ISO 8434-1)", "application": "general_hydraulics"}'::jsonb, true, 2360, 'vgr 스크류 커플링 vgr screw-to-connect couplings din 2353 엔드 전용 스크류 체결식 커플링, dn10~dn25 screw-to-connect couplings with din 2353 ends, dn10 to dn25 vgr gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn10–dn25 420 carbon_steel 탄소강 carbon steel poppet 포핏 poppet screw_to_connect 스크류 체결식 screw-to-connect false nbr (표준), fkm (옵션) din 2353 s/l (iso 8434-1) general_hydraulics 일반 유압 general hydraulics')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vgs', 'VGS', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VGS 초고압 스크류 커플링', 'VGS High-Pressure Screw Couplings', '최대 700 bar 초고압 스크류 커플링, DN6.3~DN50, 탄소강/스테인리스강', 'High-pressure screw couplings up to 700 bar, DN6.3 to DN50, in carbon or stainless steel', '최대 700 bar에 대응하는 초고압 스크류 체결식 커플링입니다. 아연 도금 탄소강은 DN6.3~DN50(1/4"~2") 전 사이즈, 스테인리스강은 DN20 사이즈로 제공되며 사용 온도는 -30~100°C입니다. BSPP/NPT/SAE ORB 엔드와 NBR/FKM 씰을 선택할 수 있습니다.', 'Screw-to-connect couplings for high-pressure service up to 700 bar. Galvanized carbon steel covers DN6.3 to DN50 (1/4" to 2"), stainless steel is offered in DN20, with operating temperature -30 to 100 C. BSPP, NPT and SAE ORB ends with NBR or FKM seals.',
  '{"coupling_standard": "proprietary", "size_range": "DN6.3–DN50 (탄소강), DN20 (스테인리스강)", "max_working_pressure": 700, "body_material": "carbon_or_stainless_steel", "valve_type": "poppet", "connection_type": "screw_to_connect", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT (ASME B1.20.1), SAE ORB (ISO 11926-1)", "surface_treatment": "Galvanized (carbon steel)", "application": "high_pressure"}'::jsonb, true, 2370, 'vgs 초고압 스크류 커플링 vgs high-pressure screw couplings 최대 700 bar 초고압 스크류 커플링, dn6.3~dn50, 탄소강/스테인리스강 high-pressure screw couplings up to 700 bar, dn6.3 to dn50, in carbon or stainless steel vgs gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn6.3–dn50 (탄소강), dn20 (스테인리스강) 700 carbon_or_stainless_steel 탄소강 / 스테인리스강 carbon or stainless steel poppet 포핏 poppet screw_to_connect 스크류 체결식 screw-to-connect false nbr (표준), fkm (옵션) bspp (iso 1179-1), npt (asme b1.20.1), sae orb (iso 11926-1) galvanized (carbon steel) high_pressure 초고압 high pressure')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vode', 'VODE', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VODE 시리즈 복동 오버센터 밸브', 'VODE Series Double Effect Overcenter Valves', '복동 오버센터 밸브, DN6~DN20, 최대 350bar', 'Double effect overcenter valves, DN6-DN20, up to 350 bar', 'VODE 시리즈는 양방향 부하 제어용 복동 오버센터 밸브입니다. DN6~DN20 사이즈에 최대 35 MPa(PN350), 설정 범위 3~35 MPa이며 파일럿비는 4.25:1(대구경 6.25:1)입니다. BSP/NPT/SAE 나사, 아연 도금 탄소강 본체이며 8:1, 11:1 파일럿비, 대구경, 탬퍼 방지 캡은 주문 제작 가능합니다.', 'The VODE series are double effect overcenter valves for bidirectional load control. Sizes DN6-DN20 are rated up to 35 MPa (PN350) with 3-35 MPa setting ranges and pilot ratios of 4.25:1 (6.25:1 for the largest size). Supplied with BSP/NPT/SAE ends in galvanized carbon steel; 8:1 and 11:1 pilot ratios, bigger sizes and tamper-proof caps on request.',
  '{"valve_type": "overcenter_valve", "size_range": "DN6 ~ DN20", "max_pressure_mpa": 35, "end_connections": "BSP(ISO 228), NPT(ANSI/ASME B1.20.1), SAE J1926-1", "body_material": "carbon_steel", "temp_range_c": "유체 -20°C ~ +90°C, 주위 -20°C ~ +50°C", "max_flow_lpm": 90, "seal_material": "NBR", "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 2380, 'vode 시리즈 복동 오버센터 밸브 vode series double effect overcenter valves 복동 오버센터 밸브, dn6~dn20, 최대 350bar double effect overcenter valves, dn6-dn20, up to 350 bar vode gemels s.p.a. 유압 밸브 hydraulic valves overcenter_valve 오버센터 밸브 overcenter valve dn6 ~ dn20 35 bsp(iso 228), npt(ansi/asme b1.20.1), sae j1926-1 carbon_steel 탄소강 carbon steel 유체 -20°c ~ +90°c, 주위 -20°c ~ +50°c 90 nbr 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vose', 'VOSE', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VOSE 시리즈 단동 오버센터 밸브', 'VOSE Series Single Effect Overcenter Valves', '단동 오버센터 밸브, DN6~DN20, 최대 350bar', 'Single effect overcenter valves, DN6-DN20, up to 350 bar', 'VOSE 시리즈는 부하 유지 및 제어용 단동 오버센터 밸브입니다. DN6~DN20 사이즈에 최대 35 MPa(PN350), 설정 범위 6~35 MPa이며 파일럿비는 4.25:1(대구경 6.25:1)입니다. BSP/NPT/SAE 나사와 아연 도금 탄소강 본체로 제공되며 8:1, 11:1 파일럿비와 탬퍼 방지 캡은 주문 제작 가능합니다.', 'The VOSE series are single effect overcenter valves for load holding and control. Sizes DN6-DN20 are rated up to 35 MPa (PN350) with a 6-35 MPa setting range and pilot ratios of 4.25:1 (6.25:1 for the largest size). Available with BSP/NPT/SAE ends in galvanized carbon steel; 8:1 and 11:1 pilot ratios and tamper-proof caps on request.',
  '{"valve_type": "overcenter_valve", "size_range": "DN6 ~ DN20", "max_pressure_mpa": 35, "end_connections": "BSP(ISO 228), NPT(ANSI/ASME B1.20.1), SAE J1926-1", "body_material": "carbon_steel", "temp_range_c": "유체 -20°C ~ +90°C, 주위 -20°C ~ +50°C", "max_flow_lpm": 90, "seal_material": "NBR", "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 2390, 'vose 시리즈 단동 오버센터 밸브 vose series single effect overcenter valves 단동 오버센터 밸브, dn6~dn20, 최대 350bar single effect overcenter valves, dn6-dn20, up to 350 bar vose gemels s.p.a. 유압 밸브 hydraulic valves overcenter_valve 오버센터 밸브 overcenter valve dn6 ~ dn20 35 bsp(iso 228), npt(ansi/asme b1.20.1), sae j1926-1 carbon_steel 탄소강 carbon steel 유체 -20°c ~ +90°c, 주위 -20°c ~ +50°c 90 nbr 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vrc', 'VRC', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRC 시리즈 매니폴드형 직동 릴리프 밸브', 'VRC Series Direct Acting Relief Valves with Manifold', '매니폴드 일체형 직동 릴리프 밸브, DN6~DN10', 'Direct acting relief valves with manifold, DN6-DN10', 'VRC 시리즈는 매니폴드 일체형 직동 릴리프 밸브입니다. DN6~DN10 사이즈에 최대 35 MPa(PN350), 표준 설정 범위 10~180 bar(주문 시 10~50, 80~300 bar)이며 최대 유량은 40 l/min입니다. BSP/NPT/SAE 나사와 NBR(옵션 Viton) 시일, 아연 도금 탄소강 본체로 제공됩니다.', 'The VRC series are direct acting relief valves integrated in a manifold. Sizes DN6-DN10 are rated up to 35 MPa (PN350) with a standard setting range of 10-180 bar (10-50 and 80-300 bar on request) and flows up to 40 l/min. Supplied with BSP/NPT/SAE ends, NBR seals (Viton optional) and galvanized carbon steel bodies.',
  '{"valve_type": "relief_valve", "size_range": "DN6 ~ DN10", "max_pressure_mpa": 35, "end_connections": "BSP(ISO 228), NPT(ANSI/ASME B1.20.1), SAE J1926-1", "body_material": "carbon_steel", "temp_range_c": "유체 -20°C ~ +80°C, 주위 -20°C ~ +50°C", "max_flow_lpm": 40, "seal_material": "NBR 70 Shore A (옵션 Viton)", "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 2400, 'vrc 시리즈 매니폴드형 직동 릴리프 밸브 vrc series direct acting relief valves with manifold 매니폴드 일체형 직동 릴리프 밸브, dn6~dn10 direct acting relief valves with manifold, dn6-dn10 vrc gemels s.p.a. 유압 밸브 hydraulic valves relief_valve 릴리프 밸브 relief valve dn6 ~ dn10 35 bsp(iso 228), npt(ansi/asme b1.20.1), sae j1926-1 carbon_steel 탄소강 carbon steel 유체 -20°c ~ +80°c, 주위 -20°c ~ +50°c 40 nbr 70 shore a (옵션 viton) 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vrm', 'VRM', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRM 시리즈 압력계 포트형 릴리프 밸브', 'VRM Series Relief Valves in Manifold with Manometer Port', '압력계 포트를 갖춘 매니폴드형 릴리프 밸브, DN10~DN20', 'Manifold relief valves with manometer port, DN10-DN20', 'VRM 시리즈는 압력계 포트를 갖춘 매니폴드형 릴리프 밸브입니다. DN10~DN20 사이즈에 최대 35 MPa(PN350), 표준 설정 범위 10~180 bar(주문 시 10~50/20~100/50~250/80~300 bar)이며 최대 유량은 DN20 기준 90 l/min입니다. BSP/NPT/SAE 나사, NBR(옵션 Viton) 시일로 제공됩니다.', 'The VRM series are relief valves in a manifold with manometer port. Sizes DN10-DN20 are rated up to 35 MPa (PN350) with a standard 10-180 bar setting range (10-50/20-100/50-250/80-300 bar on request) and flows up to 90 l/min at DN20. Available with BSP/NPT/SAE ends and NBR seals (Viton optional).',
  '{"valve_type": "relief_valve", "size_range": "DN10 ~ DN20", "max_pressure_mpa": 35, "end_connections": "BSP(ISO 228), NPT(ANSI/ASME B1.20.1), SAE J1926-1", "body_material": "carbon_steel", "temp_range_c": "유체 -20°C ~ +80°C, 주위 -20°C ~ +50°C", "max_flow_lpm": 90, "seal_material": "NBR 70 Shore A (옵션 Viton)", "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 2410, 'vrm 시리즈 압력계 포트형 릴리프 밸브 vrm series relief valves in manifold with manometer port 압력계 포트를 갖춘 매니폴드형 릴리프 밸브, dn10~dn20 manifold relief valves with manometer port, dn10-dn20 vrm gemels s.p.a. 유압 밸브 hydraulic valves relief_valve 릴리프 밸브 relief valve dn10 ~ dn20 35 bsp(iso 228), npt(ansi/asme b1.20.1), sae j1926-1 carbon_steel 탄소강 carbon steel 유체 -20°c ~ +80°c, 주위 -20°c ~ +50°c 90 nbr 70 shore a (옵션 viton) 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vu', 'VU', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VU 시리즈 체크 밸브', 'VU Series Check Valves', '탄소강/스테인리스 체크 밸브, DN6~DN50, 최대 500bar', 'Carbon and stainless steel check valves, DN6-DN50, up to 500 bar', 'VU 시리즈는 포핏형 체크 밸브로 DN6~DN50 사이즈에 최대 50 MPa(PN500, 사이즈에 따라 35~50 MPa)를 지원합니다. 크래킹 압력은 표준 0.04/0.07 MPa(주문 시 1~8 bar 스프링), 최대 유량 430 l/min이며 BSP/NPT/SAE 나사, 탄소강 및 스테인리스강 본체로 제공됩니다.', 'The VU series poppet check valves cover DN6-DN50 with ratings up to 50 MPa (PN500; 35-50 MPa depending on size). Standard cracking pressures are 0.04/0.07 MPa (1-8 bar springs on request) with flows up to 430 l/min, supplied with BSP/NPT/SAE ends in carbon or stainless steel.',
  '{"valve_type": "check_valve", "size_range": "DN6 ~ DN50", "max_pressure_mpa": 50, "end_connections": "BSP(ISO 228), NPT(ANSI/ASME B1.20.1), SAE J1926-1", "body_material": "carbon_or_stainless_steel", "temp_range_c": "CS -20°C ~ +100°C, SS -30°C ~ +100°C", "max_flow_lpm": 430, "surface_treatment": "아연 도금 (CS, Galvanized)"}'::jsonb, true, 2420, 'vu 시리즈 체크 밸브 vu series check valves 탄소강/스테인리스 체크 밸브, dn6~dn50, 최대 500bar carbon and stainless steel check valves, dn6-dn50, up to 500 bar vu gemels s.p.a. 유압 밸브 hydraulic valves check_valve 체크 밸브 check valve dn6 ~ dn50 50 bsp(iso 228), npt(ansi/asme b1.20.1), sae j1926-1 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel cs -20°c ~ +100°c, ss -30°c ~ +100°c 430 아연 도금 (cs, galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-vuf-vus', 'VUF/VUS', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VUF/VUS 시리즈 플랜지형 체크 밸브', 'VUF/VUS Series Flanged Check Valves', 'SAE J518 플랜지형 체크 밸브, DN13~DN50, 최대 420bar', 'SAE J518 flanged check valves, DN13-DN50, up to 420 bar', 'VUF(플랜지 포함)와 VUS(샌드위치형) 시리즈는 SAE J518 플랜지 접속용 체크 밸브입니다. DN13~DN50 사이즈에 S6000-F62/S3000-C61/S6000-C62 규격으로 제공되며 최대 42 MPa를 지원합니다. 탄소강과 스테인리스강 본체 중 선택할 수 있습니다.', 'The VUF (with flanges) and VUS (sandwich type) series are check valves for SAE J518 flange connections. Sizes DN13-DN50 are available in S6000-F62, S3000-C61 and S6000-C62 patterns rated up to 42 MPa, in carbon or stainless steel bodies.',
  '{"valve_type": "check_valve", "size_range": "DN13 ~ DN50 (1/2\" ~ 2\")", "max_pressure_mpa": 42, "end_connections": "SAE J518 S3000-C61 / S6000-C62 / S6000-F62 플랜지", "body_material": "carbon_or_stainless_steel", "temp_range_c": "CS -20°C ~ +100°C, SS -30°C ~ +100°C"}'::jsonb, true, 2430, 'vuf/vus 시리즈 플랜지형 체크 밸브 vuf/vus series flanged check valves sae j518 플랜지형 체크 밸브, dn13~dn50, 최대 420bar sae j518 flanged check valves, dn13-dn50, up to 420 bar vuf/vus gemels s.p.a. 유압 밸브 hydraulic valves check_valve 체크 밸브 check valve dn13 ~ dn50 (1/2" ~ 2") 42 sae j518 s3000-c61 / s6000-c62 / s6000-f62 플랜지 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel cs -20°c ~ +100°c, ss -30°c ~ +100°c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-h-902', 'H.902', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 H.902', 'Valve Actuation Rotary Actuator H.902', '작동 토크 45 Nm의 ARL 시리즈 초소형 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'The smallest ARL series valve actuation helical rotary actuator with 45 Nm active torque.', 'ARL 시리즈의 최소형 모델로, 산업용 밸브의 90° 쿼터턴 구동을 위한 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 45 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'The smallest model in the ARL series, a helical rotary actuator for 90-degree quarter-turn actuation of industrial valves. It delivers 45 Nm active torque at 210 bar with a working pressure range of 30 to 160 bar.',
  '{"torque_active": 45, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 13, "weight": 3, "ports": "1/8"}'::jsonb, true, 2440, '밸브 구동용 로터리 액추에이터 h.902 valve actuation rotary actuator h.902 작동 토크 45 nm의 arl 시리즈 초소형 밸브 구동용 헬리컬 로터리 액추에이터입니다. the smallest arl series valve actuation helical rotary actuator with 45 nm active torque. h.902 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 45 30~160 bar 90 13 3 1/8')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rb-24', 'RB.24', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arb-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '어태치먼트 포지셔닝 액추에이터 RB.24', 'Attachment Positioning Actuator RB.24', '1.8톤 이하 굴착기용 ARB 시리즈 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다.', 'ARB series attachment positioning helical rotary actuator for excavators up to 1.8 tonnes.', '0~1,800 kg급 소형 굴착기의 어태치먼트 회전·포지셔닝을 위한 180° 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 920 Nm, 홀딩 토크 2,400 Nm을 제공하며 OCV 포트 구성을 지원합니다.', 'A 180-degree helical rotary actuator for rotating and positioning attachments on mini excavators up to 1,800 kg. It delivers 920 Nm active and 2,400 Nm holding torque at 210 bar with OCV port configuration.',
  '{"torque_active": 920, "torque_holding": 2400, "excavator_weight": "0~1,800 kg", "rotation_angle": 180, "displacement": 366, "weight": 31, "ports": "1/4 G"}'::jsonb, true, 2450, '어태치먼트 포지셔닝 액추에이터 rb.24 attachment positioning actuator rb.24 1.8톤 이하 굴착기용 arb 시리즈 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다. arb series attachment positioning helical rotary actuator for excavators up to 1.8 tonnes. rb.24 moveco srl arb 시리즈 로터리 액추에이터 (어태치먼트 포지셔닝) arb series rotary actuators (attachments positioning) 920 2400 0~1,800 kg 180 366 31 1/4 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rb-30', 'RB.30', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arb-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '어태치먼트 포지셔닝 액추에이터 RB.30', 'Attachment Positioning Actuator RB.30', '1.8~3.8톤급 굴착기용 ARB 시리즈 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다.', 'ARB series attachment positioning helical rotary actuator for 1.8 to 3.8 tonne excavators.', '1,800~3,800 kg급 굴착기의 어태치먼트 회전·포지셔닝을 위한 180° 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 1,600 Nm, 홀딩 토크 4,300 Nm을 제공합니다.', 'A 180-degree helical rotary actuator for rotating and positioning attachments on 1,800 to 3,800 kg excavators, delivering 1,600 Nm active and 4,300 Nm holding torque at 210 bar.',
  '{"torque_active": 1600, "torque_holding": 4300, "excavator_weight": "1,800~3,800 kg", "rotation_angle": 180, "displacement": 544, "weight": 43, "ports": "1/4 G"}'::jsonb, true, 2460, '어태치먼트 포지셔닝 액추에이터 rb.30 attachment positioning actuator rb.30 1.8~3.8톤급 굴착기용 arb 시리즈 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다. arb series attachment positioning helical rotary actuator for 1.8 to 3.8 tonne excavators. rb.30 moveco srl arb 시리즈 로터리 액추에이터 (어태치먼트 포지셔닝) arb series rotary actuators (attachments positioning) 1600 4300 1,800~3,800 kg 180 544 43 1/4 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rb-36', 'RB.36', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arb-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '어태치먼트 포지셔닝 액추에이터 RB.36', 'Attachment Positioning Actuator RB.36', '3~5.5톤급 굴착기용 ARB 시리즈 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다.', 'ARB series attachment positioning helical rotary actuator for 3 to 5.5 tonne excavators.', '3,000~5,500 kg급 굴착기의 어태치먼트 회전·포지셔닝을 위한 180° 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 2,850 Nm, 홀딩 토크 8,250 Nm을 제공합니다.', 'A 180-degree helical rotary actuator for rotating and positioning attachments on 3,000 to 5,500 kg excavators, delivering 2,850 Nm active and 8,250 Nm holding torque at 210 bar.',
  '{"torque_active": 2850, "torque_holding": 8250, "excavator_weight": "3,000~5,500 kg", "rotation_angle": 180, "displacement": 883, "weight": 65, "ports": "1/4 G"}'::jsonb, true, 2470, '어태치먼트 포지셔닝 액추에이터 rb.36 attachment positioning actuator rb.36 3~5.5톤급 굴착기용 arb 시리즈 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다. arb series attachment positioning helical rotary actuator for 3 to 5.5 tonne excavators. rb.36 moveco srl arb 시리즈 로터리 액추에이터 (어태치먼트 포지셔닝) arb series rotary actuators (attachments positioning) 2850 8250 3,000~5,500 kg 180 883 65 1/4 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rb-47', 'RB.47', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arb-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '어태치먼트 포지셔닝 액추에이터 RB.47', 'Attachment Positioning Actuator RB.47', '6~9톤급 굴착기용 ARB 시리즈 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다.', 'ARB series attachment positioning helical rotary actuator for 6 to 9 tonne excavators.', '6,000~9,000 kg급 굴착기의 어태치먼트 회전·포지셔닝을 위한 180° 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 7,200 Nm, 홀딩 토크 18,000 Nm을 제공합니다.', 'A 180-degree helical rotary actuator for rotating and positioning attachments on 6,000 to 9,000 kg excavators, delivering 7,200 Nm active and 18,000 Nm holding torque at 210 bar.',
  '{"torque_active": 7200, "torque_holding": 18000, "excavator_weight": "6,000~9,000 kg", "rotation_angle": 180, "displacement": 2023, "weight": 110, "ports": "1/4 G"}'::jsonb, true, 2480, '어태치먼트 포지셔닝 액추에이터 rb.47 attachment positioning actuator rb.47 6~9톤급 굴착기용 arb 시리즈 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다. arb series attachment positioning helical rotary actuator for 6 to 9 tonne excavators. rb.47 moveco srl arb 시리즈 로터리 액추에이터 (어태치먼트 포지셔닝) arb series rotary actuators (attachments positioning) 7200 18000 6,000~9,000 kg 180 2023 110 1/4 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rb-51', 'RB.51', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arb-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '어태치먼트 포지셔닝 액추에이터 RB.51', 'Attachment Positioning Actuator RB.51', '8.5~11톤급 굴착기용 ARB 시리즈 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다.', 'ARB series attachment positioning helical rotary actuator for 8.5 to 11 tonne excavators.', '8,500~11,000 kg급 굴착기의 어태치먼트 회전·포지셔닝을 위한 180° 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 7,400 Nm, 홀딩 토크 18,500 Nm을 제공합니다.', 'A 180-degree helical rotary actuator for rotating and positioning attachments on 8,500 to 11,000 kg excavators, delivering 7,400 Nm active and 18,500 Nm holding torque at 210 bar.',
  '{"torque_active": 7400, "torque_holding": 18500, "excavator_weight": "8,500~11,000 kg", "rotation_angle": 180, "displacement": 2614, "weight": 135, "ports": "1/4 G"}'::jsonb, true, 2490, '어태치먼트 포지셔닝 액추에이터 rb.51 attachment positioning actuator rb.51 8.5~11톤급 굴착기용 arb 시리즈 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다. arb series attachment positioning helical rotary actuator for 8.5 to 11 tonne excavators. rb.51 moveco srl arb 시리즈 로터리 액추에이터 (어태치먼트 포지셔닝) arb series rotary actuators (attachments positioning) 7400 18500 8,500~11,000 kg 180 2614 135 1/4 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rb-54', 'RB.54', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arb-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '어태치먼트 포지셔닝 액추에이터 RB.54', 'Attachment Positioning Actuator RB.54', '12~16톤급 굴착기용 ARB 시리즈 최대형 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다.', 'The largest ARB series attachment positioning helical rotary actuator, for 12 to 16 tonne excavators.', 'ARB 시리즈의 최대형 모델로, 12,000~16,000 kg급 굴착기의 어태치먼트 회전·포지셔닝에 사용됩니다. 210 bar 기준 작동 토크 10,100 Nm, 홀딩 토크 33,000 Nm을 제공합니다.', 'The largest model in the ARB series, used for rotating and positioning attachments on 12,000 to 16,000 kg excavators. It delivers 10,100 Nm active and 33,000 Nm holding torque at 210 bar.',
  '{"torque_active": 10100, "torque_holding": 33000, "excavator_weight": "12,000~16,000 kg", "rotation_angle": 180, "displacement": 3438, "weight": 202, "ports": "1/4 G"}'::jsonb, true, 2500, '어태치먼트 포지셔닝 액추에이터 rb.54 attachment positioning actuator rb.54 12~16톤급 굴착기용 arb 시리즈 최대형 어태치먼트 포지셔닝 헬리컬 로터리 액추에이터입니다. the largest arb series attachment positioning helical rotary actuator, for 12 to 16 tonne excavators. rb.54 moveco srl arb 시리즈 로터리 액추에이터 (어태치먼트 포지셔닝) arb series rotary actuators (attachments positioning) 10100 33000 12,000~16,000 kg 180 3438 202 1/4 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rc-10', 'RC.10', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arc-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '컴팩트 로터리 액추에이터 RC.10', 'Compact Rotary Actuator RC.10', '작동 토크 210 Nm의 ARC 시리즈 초소형 컴팩트 헬리컬 로터리 액추에이터입니다.', 'The smallest ARC series compact helical rotary actuator with 210 Nm active torque.', 'ARC 컴팩트 시리즈의 최소형 모델로, 210 bar 기준 작동 토크 210 Nm, 홀딩 토크 320 Nm을 제공합니다. 180° 또는 360° 회전 사양이 가능하며 지게차 어태치먼트 등 협소 공간 설치에 적합합니다.', 'The smallest model in the ARC compact series, delivering 210 Nm active and 320 Nm holding torque at 210 bar. Available in 180 or 360-degree versions, it fits space-constrained installations such as forklift attachments.',
  '{"torque_active": 210, "torque_holding": 320, "rotation_options": "180° / 360°", "displacement_180": 55, "displacement_360": 108, "capacity_axial": 10000, "capacity_radial": 10000, "moment_cantilever": 600, "weight": 7, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2510, '컴팩트 로터리 액추에이터 rc.10 compact rotary actuator rc.10 작동 토크 210 nm의 arc 시리즈 초소형 컴팩트 헬리컬 로터리 액추에이터입니다. the smallest arc series compact helical rotary actuator with 210 nm active torque. rc.10 moveco srl arc 시리즈 로터리 액추에이터 (컴팩트) arc series rotary actuators (compact applications) 210 320 180° / 360° 55 108 10000 10000 600 7 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rc-14', 'RC.14', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arc-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '컴팩트 로터리 액추에이터 RC.14', 'Compact Rotary Actuator RC.14', '작동 토크 400 Nm의 ARC 시리즈 컴팩트 헬리컬 로터리 액추에이터입니다.', 'ARC series compact helical rotary actuator with 400 Nm active torque.', '210 bar 기준 작동 토크 400 Nm, 홀딩 토크 620 Nm의 컴팩트 헬리컬 로터리 액추에이터입니다. 180° 또는 360° 회전 사양이 가능하며 축·반경방향 각 13,500 N의 하중용량을 갖습니다.', 'A compact helical rotary actuator rated at 400 Nm active and 620 Nm holding torque at 210 bar. Available in 180 or 360-degree versions with 13,500 N axial and radial load capacities.',
  '{"torque_active": 400, "torque_holding": 620, "rotation_options": "180° / 360°", "displacement_180": 116, "displacement_360": 232, "capacity_axial": 13500, "capacity_radial": 13500, "moment_cantilever": 1020, "weight": 11, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2520, '컴팩트 로터리 액추에이터 rc.14 compact rotary actuator rc.14 작동 토크 400 nm의 arc 시리즈 컴팩트 헬리컬 로터리 액추에이터입니다. arc series compact helical rotary actuator with 400 nm active torque. rc.14 moveco srl arc 시리즈 로터리 액추에이터 (컴팩트) arc series rotary actuators (compact applications) 400 620 180° / 360° 116 232 13500 13500 1020 11 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rc-23', 'RC.23', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arc-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '컴팩트 로터리 액추에이터 RC.23', 'Compact Rotary Actuator RC.23', '작동 토크 700 Nm의 ARC 시리즈 컴팩트 헬리컬 로터리 액추에이터입니다.', 'ARC series compact helical rotary actuator with 700 Nm active torque.', '210 bar 기준 작동 토크 700 Nm, 홀딩 토크 1,100 Nm의 컴팩트 헬리컬 로터리 액추에이터입니다. 180° 또는 360° 회전 사양이 가능하며 축·반경방향 각 20,000 N의 하중용량을 제공합니다.', 'A compact helical rotary actuator delivering 700 Nm active and 1,100 Nm holding torque at 210 bar. Available in 180 or 360-degree versions with 20,000 N axial and radial capacities.',
  '{"torque_active": 700, "torque_holding": 1100, "rotation_options": "180° / 360°", "displacement_180": 179, "displacement_360": 354, "capacity_axial": 20000, "capacity_radial": 20000, "moment_cantilever": 2300, "weight": 15, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2530, '컴팩트 로터리 액추에이터 rc.23 compact rotary actuator rc.23 작동 토크 700 nm의 arc 시리즈 컴팩트 헬리컬 로터리 액추에이터입니다. arc series compact helical rotary actuator with 700 nm active torque. rc.23 moveco srl arc 시리즈 로터리 액추에이터 (컴팩트) arc series rotary actuators (compact applications) 700 1100 180° / 360° 179 354 20000 20000 2300 15 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rc-27', 'RC.27', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arc-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '컴팩트 로터리 액추에이터 RC.27', 'Compact Rotary Actuator RC.27', '작동 토크 1,200 Nm의 ARC 시리즈 컴팩트 헬리컬 로터리 액추에이터입니다.', 'ARC series compact helical rotary actuator with 1,200 Nm active torque.', '210 bar 기준 작동 토크 1,200 Nm, 홀딩 토크 1,900 Nm의 컴팩트 헬리컬 로터리 액추에이터입니다. 축·반경방향 각 40,000 N의 하중용량과 캔틸레버 모멘트 6,900 Nm을 지원합니다.', 'A compact helical rotary actuator rated at 1,200 Nm active and 1,900 Nm holding torque at 210 bar. It supports 40,000 N axial and radial capacities and a 6,900 Nm cantilever moment.',
  '{"torque_active": 1200, "torque_holding": 1900, "rotation_options": "180° / 360°", "displacement_180": 319, "displacement_360": 637, "capacity_axial": 40000, "capacity_radial": 40000, "moment_cantilever": 6900, "weight": 27, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2540, '컴팩트 로터리 액추에이터 rc.27 compact rotary actuator rc.27 작동 토크 1,200 nm의 arc 시리즈 컴팩트 헬리컬 로터리 액추에이터입니다. arc series compact helical rotary actuator with 1,200 nm active torque. rc.27 moveco srl arc 시리즈 로터리 액추에이터 (컴팩트) arc series rotary actuators (compact applications) 1200 1900 180° / 360° 319 637 40000 40000 6900 27 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rc-32', 'RC.32', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arc-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '컴팩트 로터리 액추에이터 RC.32', 'Compact Rotary Actuator RC.32', '작동 토크 1,800 Nm의 ARC 시리즈 컴팩트 헬리컬 로터리 액추에이터입니다.', 'ARC series compact helical rotary actuator with 1,800 Nm active torque.', '210 bar 기준 작동 토크 1,800 Nm, 홀딩 토크 2,800 Nm의 컴팩트 헬리컬 로터리 액추에이터입니다. 축·반경방향 각 50,000 N의 하중용량과 캔틸레버 모멘트 9,100 Nm을 제공합니다.', 'A compact helical rotary actuator delivering 1,800 Nm active and 2,800 Nm holding torque at 210 bar. It provides 50,000 N axial and radial capacities and a 9,100 Nm cantilever moment.',
  '{"torque_active": 1800, "torque_holding": 2800, "rotation_options": "180° / 360°", "displacement_180": 465, "displacement_360": 925, "capacity_axial": 50000, "capacity_radial": 50000, "moment_cantilever": 9100, "weight": 45, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2550, '컴팩트 로터리 액추에이터 rc.32 compact rotary actuator rc.32 작동 토크 1,800 nm의 arc 시리즈 컴팩트 헬리컬 로터리 액추에이터입니다. arc series compact helical rotary actuator with 1,800 nm active torque. rc.32 moveco srl arc 시리즈 로터리 액추에이터 (컴팩트) arc series rotary actuators (compact applications) 1800 2800 180° / 360° 465 925 50000 50000 9100 45 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rc-40', 'RC.40', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arc-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '컴팩트 로터리 액추에이터 RC.40', 'Compact Rotary Actuator RC.40', '작동 토크 3,100 Nm의 ARC 시리즈 최대형 컴팩트 헬리컬 로터리 액추에이터입니다.', 'The largest ARC series compact helical rotary actuator, rated at 3,100 Nm active torque.', 'ARC 컴팩트 시리즈의 최대형 모델로, 210 bar 기준 작동 토크 3,100 Nm, 홀딩 토크 4,700 Nm을 제공합니다. 축·반경방향 각 70,000 N의 하중용량과 캔틸레버 모멘트 11,500 Nm을 지원합니다.', 'The largest model in the ARC compact series, delivering 3,100 Nm active and 4,700 Nm holding torque at 210 bar. It supports 70,000 N axial and radial capacities and an 11,500 Nm cantilever moment.',
  '{"torque_active": 3100, "torque_holding": 4700, "rotation_options": "180° / 360°", "displacement_180": 836, "displacement_360": 1671, "capacity_axial": 70000, "capacity_radial": 70000, "moment_cantilever": 11500, "weight": 57, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2560, '컴팩트 로터리 액추에이터 rc.40 compact rotary actuator rc.40 작동 토크 3,100 nm의 arc 시리즈 최대형 컴팩트 헬리컬 로터리 액추에이터입니다. the largest arc series compact helical rotary actuator, rated at 3,100 nm active torque. rc.40 moveco srl arc 시리즈 로터리 액추에이터 (컴팩트) arc series rotary actuators (compact applications) 3100 4700 180° / 360° 836 1671 70000 70000 11500 57 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rl-14', 'RL.14', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 RL.14', 'Valve Actuation Rotary Actuator RL.14', '작동 토크 107 Nm의 ARL 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'ARL series valve actuation helical rotary actuator with 107 Nm active torque.', '산업용 밸브의 90° 쿼터턴 구동을 위한 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 107 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'A helical rotary actuator for 90-degree quarter-turn actuation of industrial valves, delivering 107 Nm active torque at 210 bar with a 30 to 160 bar working pressure range.',
  '{"torque_active": 107, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 28, "weight": 6, "ports": "1/4 (7/16-20 UNF)"}'::jsonb, true, 2570, '밸브 구동용 로터리 액추에이터 rl.14 valve actuation rotary actuator rl.14 작동 토크 107 nm의 arl 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다. arl series valve actuation helical rotary actuator with 107 nm active torque. rl.14 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 107 30~160 bar 90 28 6 1/4 (7/16-20 unf)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rl-16', 'RL.16', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 RL.16', 'Valve Actuation Rotary Actuator RL.16', '작동 토크 200 Nm의 ARL 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'ARL series valve actuation helical rotary actuator with 200 Nm active torque.', '산업용 밸브의 90° 쿼터턴 구동을 위한 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 200 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'A helical rotary actuator for 90-degree quarter-turn actuation of industrial valves, delivering 200 Nm active torque at 210 bar with a 30 to 160 bar working pressure range.',
  '{"torque_active": 200, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 57, "weight": 9, "ports": "1/4 (7/16-20 UNF)"}'::jsonb, true, 2580, '밸브 구동용 로터리 액추에이터 rl.16 valve actuation rotary actuator rl.16 작동 토크 200 nm의 arl 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다. arl series valve actuation helical rotary actuator with 200 nm active torque. rl.16 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 200 30~160 bar 90 57 9 1/4 (7/16-20 unf)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rl-26', 'RL.26', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 RL.26', 'Valve Actuation Rotary Actuator RL.26', '작동 토크 465 Nm의 ARL 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'ARL series valve actuation helical rotary actuator with 465 Nm active torque.', '산업용 밸브의 90° 쿼터턴 구동을 위한 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 465 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'A helical rotary actuator for 90-degree quarter-turn actuation of industrial valves, delivering 465 Nm active torque at 210 bar with a 30 to 160 bar working pressure range.',
  '{"torque_active": 465, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 110, "weight": 11, "ports": "1/4 (7/16-20 UNF)"}'::jsonb, true, 2590, '밸브 구동용 로터리 액추에이터 rl.26 valve actuation rotary actuator rl.26 작동 토크 465 nm의 arl 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다. arl series valve actuation helical rotary actuator with 465 nm active torque. rl.26 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 465 30~160 bar 90 110 11 1/4 (7/16-20 unf)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rl-32', 'RL.32', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 RL.32', 'Valve Actuation Rotary Actuator RL.32', '작동 토크 790 Nm의 ARL 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'ARL series valve actuation helical rotary actuator with 790 Nm active torque.', '산업용 밸브의 90° 쿼터턴 구동을 위한 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 790 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'A helical rotary actuator for 90-degree quarter-turn actuation of industrial valves, delivering 790 Nm active torque at 210 bar with a 30 to 160 bar working pressure range.',
  '{"torque_active": 790, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 179, "weight": 19, "ports": "1/4 (7/16-20 UNF)"}'::jsonb, true, 2600, '밸브 구동용 로터리 액추에이터 rl.32 valve actuation rotary actuator rl.32 작동 토크 790 nm의 arl 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다. arl series valve actuation helical rotary actuator with 790 nm active torque. rl.32 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 790 30~160 bar 90 179 19 1/4 (7/16-20 unf)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rl-36', 'RL.36', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 RL.36', 'Valve Actuation Rotary Actuator RL.36', '작동 토크 1,160 Nm의 ARL 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'ARL series valve actuation helical rotary actuator with 1,160 Nm active torque.', '산업용 밸브의 90° 쿼터턴 구동을 위한 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 1,160 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'A helical rotary actuator for 90-degree quarter-turn actuation of industrial valves, delivering 1,160 Nm active torque at 210 bar with a 30 to 160 bar working pressure range.',
  '{"torque_active": 1160, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 262, "weight": 27, "ports": "1/4 (7/16-20 UNF)"}'::jsonb, true, 2610, '밸브 구동용 로터리 액추에이터 rl.36 valve actuation rotary actuator rl.36 작동 토크 1,160 nm의 arl 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다. arl series valve actuation helical rotary actuator with 1,160 nm active torque. rl.36 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 1160 30~160 bar 90 262 27 1/4 (7/16-20 unf)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rl-44', 'RL.44', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 RL.44', 'Valve Actuation Rotary Actuator RL.44', '작동 토크 2,220 Nm의 ARL 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'ARL series valve actuation helical rotary actuator with 2,220 Nm active torque.', '산업용 밸브의 90° 쿼터턴 구동을 위한 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 2,220 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'A helical rotary actuator for 90-degree quarter-turn actuation of industrial valves, delivering 2,220 Nm active torque at 210 bar with a 30 to 160 bar working pressure range.',
  '{"torque_active": 2220, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 499, "weight": 35, "ports": "1/4 (7/16-20 UNF)"}'::jsonb, true, 2620, '밸브 구동용 로터리 액추에이터 rl.44 valve actuation rotary actuator rl.44 작동 토크 2,220 nm의 arl 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다. arl series valve actuation helical rotary actuator with 2,220 nm active torque. rl.44 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 2220 30~160 bar 90 499 35 1/4 (7/16-20 unf)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rl-52', 'RL.52', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 RL.52', 'Valve Actuation Rotary Actuator RL.52', '작동 토크 3,258 Nm의 ARL 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'ARL series valve actuation helical rotary actuator with 3,258 Nm active torque.', '산업용 밸브의 90° 쿼터턴 구동을 위한 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 3,258 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'A helical rotary actuator for 90-degree quarter-turn actuation of industrial valves, delivering 3,258 Nm active torque at 210 bar with a 30 to 160 bar working pressure range.',
  '{"torque_active": 3258, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 776, "weight": 59, "ports": "1/4 (7/16-20 UNF)"}'::jsonb, true, 2630, '밸브 구동용 로터리 액추에이터 rl.52 valve actuation rotary actuator rl.52 작동 토크 3,258 nm의 arl 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다. arl series valve actuation helical rotary actuator with 3,258 nm active torque. rl.52 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 3258 30~160 bar 90 776 59 1/4 (7/16-20 unf)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rl-60', 'RL.60', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 RL.60', 'Valve Actuation Rotary Actuator RL.60', '작동 토크 5,840 Nm의 ARL 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'ARL series valve actuation helical rotary actuator with 5,840 Nm active torque.', '산업용 밸브의 90° 쿼터턴 구동을 위한 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 5,840 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'A helical rotary actuator for 90-degree quarter-turn actuation of industrial valves, delivering 5,840 Nm active torque at 210 bar with a 30 to 160 bar working pressure range.',
  '{"torque_active": 5840, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 1386, "weight": 95, "ports": "3/8 (9/16-18 UNF)"}'::jsonb, true, 2640, '밸브 구동용 로터리 액추에이터 rl.60 valve actuation rotary actuator rl.60 작동 토크 5,840 nm의 arl 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다. arl series valve actuation helical rotary actuator with 5,840 nm active torque. rl.60 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 5840 30~160 bar 90 1386 95 3/8 (9/16-18 unf)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rl-67', 'RL.67', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 RL.67', 'Valve Actuation Rotary Actuator RL.67', '작동 토크 11,500 Nm의 ARL 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'ARL series valve actuation helical rotary actuator with 11,500 Nm active torque.', '산업용 밸브의 90° 쿼터턴 구동을 위한 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 11,500 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'A helical rotary actuator for 90-degree quarter-turn actuation of industrial valves, delivering 11,500 Nm active torque at 210 bar with a 30 to 160 bar working pressure range.',
  '{"torque_active": 11500, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 2307, "weight": 145, "ports": "3/8 (9/16-18 UNF)"}'::jsonb, true, 2650, '밸브 구동용 로터리 액추에이터 rl.67 valve actuation rotary actuator rl.67 작동 토크 11,500 nm의 arl 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다. arl series valve actuation helical rotary actuator with 11,500 nm active torque. rl.67 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 11500 30~160 bar 90 2307 145 3/8 (9/16-18 unf)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rl-78', 'RL.78', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 RL.78', 'Valve Actuation Rotary Actuator RL.78', '작동 토크 22,770 Nm의 ARL 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'ARL series valve actuation helical rotary actuator with 22,770 Nm active torque.', '산업용 밸브의 90° 쿼터턴 구동을 위한 대형 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 22,770 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'A large helical rotary actuator for 90-degree quarter-turn actuation of industrial valves, delivering 22,770 Nm active torque at 210 bar with a 30 to 160 bar working pressure range.',
  '{"torque_active": 22770, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 4977, "weight": 258, "ports": "1/2 (3/4-16 UNF)"}'::jsonb, true, 2660, '밸브 구동용 로터리 액추에이터 rl.78 valve actuation rotary actuator rl.78 작동 토크 22,770 nm의 arl 시리즈 밸브 구동용 헬리컬 로터리 액추에이터입니다. arl series valve actuation helical rotary actuator with 22,770 nm active torque. rl.78 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 22770 30~160 bar 90 4977 258 1/2 (3/4-16 unf)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rl-86', 'RL.86', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arl-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '밸브 구동용 로터리 액추에이터 RL.86', 'Valve Actuation Rotary Actuator RL.86', '작동 토크 40,700 Nm의 ARL 시리즈 최대형 밸브 구동용 헬리컬 로터리 액추에이터입니다.', 'The largest ARL series valve actuation helical rotary actuator, rated at 40,700 Nm active torque.', 'ARL 시리즈의 최대형 모델로, 산업용 대구경 밸브의 90° 쿼터턴 구동을 위한 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 40,700 Nm이며 작동 압력 범위는 30~160 bar입니다.', 'The largest model in the ARL series, a helical rotary actuator for 90-degree quarter-turn actuation of large industrial valves. It delivers 40,700 Nm active torque at 210 bar with a 30 to 160 bar working pressure range.',
  '{"torque_active": 40700, "working_pressure": "30~160 bar", "rotation_angle": 90, "displacement": 9896, "weight": 465, "ports": "1/2 (3/4-16 UNF)"}'::jsonb, true, 2670, '밸브 구동용 로터리 액추에이터 rl.86 valve actuation rotary actuator rl.86 작동 토크 40,700 nm의 arl 시리즈 최대형 밸브 구동용 헬리컬 로터리 액추에이터입니다. the largest arl series valve actuation helical rotary actuator, rated at 40,700 nm active torque. rl.86 moveco srl arl 시리즈 로터리 액추에이터 (산업용 밸브 구동) arl series rotary actuators (industrial valve actuation) 40700 30~160 bar 90 9896 465 1/2 (3/4-16 unf)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rm-10', 'RM.10', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arm-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '드라이브 샤프트 로터리 액추에이터 RM.10', 'Drive Shaft Rotary Actuator RM.10', '작동 토크 210 Nm의 ARM 시리즈 초소형 드라이브 샤프트 헬리컬 로터리 액추에이터입니다.', 'The smallest ARM series drive shaft helical rotary actuator with 210 Nm active torque.', 'ARM 드라이브 샤프트 시리즈의 최소형 모델로, 210 bar 기준 작동 토크 210 Nm, 홀딩 토크 300 Nm을 제공합니다. 180° 또는 360° 회전 사양이 가능하며 옵션으로 쿠셔닝 시스템을 적용할 수 있습니다.', 'The smallest model in the ARM drive shaft series, delivering 210 Nm active and 300 Nm holding torque at 210 bar. Available in 180 or 360-degree versions with an optional cushioning system.',
  '{"torque_active": 210, "torque_holding": 300, "rotation_options": "180° / 360°", "displacement_180": 45, "displacement_360": 89, "capacity_axial": 8000, "capacity_radial": 1600, "weight": 5, "ports_direct": "1/8 G", "ports_cushioned": "1/4 G"}'::jsonb, true, 2680, '드라이브 샤프트 로터리 액추에이터 rm.10 drive shaft rotary actuator rm.10 작동 토크 210 nm의 arm 시리즈 초소형 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. the smallest arm series drive shaft helical rotary actuator with 210 nm active torque. rm.10 moveco srl arm 시리즈 로터리 액추에이터 (드라이브 샤프트) arm series rotary actuators (drive shaft connection) 210 300 180° / 360° 45 89 8000 1600 5 1/8 g 1/4 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rm-14', 'RM.14', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arm-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '드라이브 샤프트 로터리 액추에이터 RM.14', 'Drive Shaft Rotary Actuator RM.14', '작동 토크 340 Nm의 ARM 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다.', 'ARM series drive shaft helical rotary actuator with 340 Nm active torque.', '210 bar 기준 작동 토크 340 Nm, 홀딩 토크 520 Nm의 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. 180° 또는 360° 회전 사양이 가능하며 쿠셔닝 시스템 옵션을 지원합니다.', 'A drive shaft helical rotary actuator rated at 340 Nm active and 520 Nm holding torque at 210 bar. Available in 180 or 360-degree versions with an optional cushioning system.',
  '{"torque_active": 340, "torque_holding": 520, "rotation_options": "180° / 360°", "displacement_180": 75, "displacement_360": 149, "capacity_axial": 10000, "capacity_radial": 3000, "weight": 7, "ports_direct": "1/8 G", "ports_cushioned": "1/4 G"}'::jsonb, true, 2690, '드라이브 샤프트 로터리 액추에이터 rm.14 drive shaft rotary actuator rm.14 작동 토크 340 nm의 arm 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. arm series drive shaft helical rotary actuator with 340 nm active torque. rm.14 moveco srl arm 시리즈 로터리 액추에이터 (드라이브 샤프트) arm series rotary actuators (drive shaft connection) 340 520 180° / 360° 75 149 10000 3000 7 1/8 g 1/4 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rm-20', 'RM.20', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arm-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '드라이브 샤프트 로터리 액추에이터 RM.20', 'Drive Shaft Rotary Actuator RM.20', '작동 토크 657 Nm의 ARM 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다.', 'ARM series drive shaft helical rotary actuator with 657 Nm active torque.', '210 bar 기준 작동 토크 657 Nm, 홀딩 토크 1,000 Nm의 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. 180° 또는 360° 회전 사양이 가능하며 조향 장치 등 회전 구동에 적합합니다.', 'A drive shaft helical rotary actuator delivering 657 Nm active and 1,000 Nm holding torque at 210 bar. Available in 180 or 360-degree versions, suitable for steering and similar rotary drives.',
  '{"torque_active": 657, "torque_holding": 1000, "rotation_options": "180° / 360°", "displacement_180": 140, "displacement_360": 280, "capacity_axial": 14000, "capacity_radial": 4000, "weight": 12, "ports_direct": "1/4 G", "ports_cushioned": "1/4 G"}'::jsonb, true, 2700, '드라이브 샤프트 로터리 액추에이터 rm.20 drive shaft rotary actuator rm.20 작동 토크 657 nm의 arm 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. arm series drive shaft helical rotary actuator with 657 nm active torque. rm.20 moveco srl arm 시리즈 로터리 액추에이터 (드라이브 샤프트) arm series rotary actuators (drive shaft connection) 657 1000 180° / 360° 140 280 14000 4000 12 1/4 g 1/4 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rm-29', 'RM.29', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arm-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '드라이브 샤프트 로터리 액추에이터 RM.29', 'Drive Shaft Rotary Actuator RM.29', '작동 토크 1,280 Nm의 ARM 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다.', 'ARM series drive shaft helical rotary actuator with 1,280 Nm active torque.', '210 bar 기준 작동 토크 1,280 Nm, 홀딩 토크 2,100 Nm의 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. 180° 또는 360° 회전 사양이 가능하며 쿠셔닝 시스템 옵션을 지원합니다.', 'A drive shaft helical rotary actuator rated at 1,280 Nm active and 2,100 Nm holding torque at 210 bar. Available in 180 or 360-degree versions with an optional cushioning system.',
  '{"torque_active": 1280, "torque_holding": 2100, "rotation_options": "180° / 360°", "displacement_180": 289, "displacement_360": 579, "capacity_axial": 19000, "capacity_radial": 7500, "weight": 19, "ports_direct": "1/4 G", "ports_cushioned": "3/8 G"}'::jsonb, true, 2710, '드라이브 샤프트 로터리 액추에이터 rm.29 drive shaft rotary actuator rm.29 작동 토크 1,280 nm의 arm 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. arm series drive shaft helical rotary actuator with 1,280 nm active torque. rm.29 moveco srl arm 시리즈 로터리 액추에이터 (드라이브 샤프트) arm series rotary actuators (drive shaft connection) 1280 2100 180° / 360° 289 579 19000 7500 19 1/4 g 3/8 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rm-37', 'RM.37', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arm-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '드라이브 샤프트 로터리 액추에이터 RM.37', 'Drive Shaft Rotary Actuator RM.37', '작동 토크 2,555 Nm의 ARM 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다.', 'ARM series drive shaft helical rotary actuator with 2,555 Nm active torque.', '210 bar 기준 작동 토크 2,555 Nm, 홀딩 토크 3,900 Nm의 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. 축방향 25,000 N, 반경방향 12,000 N의 하중용량을 제공합니다.', 'A drive shaft helical rotary actuator delivering 2,555 Nm active and 3,900 Nm holding torque at 210 bar, with 25,000 N axial and 12,000 N radial load capacities.',
  '{"torque_active": 2555, "torque_holding": 3900, "rotation_options": "180° / 360°", "displacement_180": 554, "displacement_360": 1100, "capacity_axial": 25000, "capacity_radial": 12000, "weight": 30, "ports_direct": "1/2 G", "ports_cushioned": "1/2 G"}'::jsonb, true, 2720, '드라이브 샤프트 로터리 액추에이터 rm.37 drive shaft rotary actuator rm.37 작동 토크 2,555 nm의 arm 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. arm series drive shaft helical rotary actuator with 2,555 nm active torque. rm.37 moveco srl arm 시리즈 로터리 액추에이터 (드라이브 샤프트) arm series rotary actuators (drive shaft connection) 2555 3900 180° / 360° 554 1100 25000 12000 30 1/2 g 1/2 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rm-48', 'RM.48', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arm-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '드라이브 샤프트 로터리 액추에이터 RM.48', 'Drive Shaft Rotary Actuator RM.48', '작동 토크 5,700 Nm의 ARM 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다.', 'ARM series drive shaft helical rotary actuator with 5,700 Nm active torque.', '210 bar 기준 작동 토크 5,700 Nm, 홀딩 토크 8,700 Nm의 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. 축방향 35,000 N, 반경방향 18,000 N의 하중용량을 지원합니다.', 'A drive shaft helical rotary actuator rated at 5,700 Nm active and 8,700 Nm holding torque at 210 bar, supporting 35,000 N axial and 18,000 N radial capacities.',
  '{"torque_active": 5700, "torque_holding": 8700, "rotation_options": "180° / 360°", "displacement_180": 1217, "displacement_360": 2435, "capacity_axial": 35000, "capacity_radial": 18000, "weight": 59, "ports_direct": "1/2 G", "ports_cushioned": "1/2 G"}'::jsonb, true, 2730, '드라이브 샤프트 로터리 액추에이터 rm.48 drive shaft rotary actuator rm.48 작동 토크 5,700 nm의 arm 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. arm series drive shaft helical rotary actuator with 5,700 nm active torque. rm.48 moveco srl arm 시리즈 로터리 액추에이터 (드라이브 샤프트) arm series rotary actuators (drive shaft connection) 5700 8700 180° / 360° 1217 2435 35000 18000 59 1/2 g 1/2 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rm-53', 'RM.53', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arm-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '드라이브 샤프트 로터리 액추에이터 RM.53', 'Drive Shaft Rotary Actuator RM.53', '작동 토크 7,850 Nm의 ARM 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다.', 'ARM series drive shaft helical rotary actuator with 7,850 Nm active torque.', '210 bar 기준 작동 토크 7,850 Nm, 홀딩 토크 12,000 Nm의 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. 축방향 41,000 N, 반경방향 21,000 N의 하중용량을 제공합니다.', 'A drive shaft helical rotary actuator delivering 7,850 Nm active and 12,000 Nm holding torque at 210 bar, with 41,000 N axial and 21,000 N radial capacities.',
  '{"torque_active": 7850, "torque_holding": 12000, "rotation_options": "180° / 360°", "displacement_180": 1752, "displacement_360": 3500, "capacity_axial": 41000, "capacity_radial": 21000, "weight": 83, "ports_direct": "1/2 G", "ports_cushioned": "1/2 G"}'::jsonb, true, 2740, '드라이브 샤프트 로터리 액추에이터 rm.53 drive shaft rotary actuator rm.53 작동 토크 7,850 nm의 arm 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. arm series drive shaft helical rotary actuator with 7,850 nm active torque. rm.53 moveco srl arm 시리즈 로터리 액추에이터 (드라이브 샤프트) arm series rotary actuators (drive shaft connection) 7850 12000 180° / 360° 1752 3500 41000 21000 83 1/2 g 1/2 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rm-57', 'RM.57', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arm-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '드라이브 샤프트 로터리 액추에이터 RM.57', 'Drive Shaft Rotary Actuator RM.57', '작동 토크 12,000 Nm의 ARM 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다.', 'ARM series drive shaft helical rotary actuator with 12,000 Nm active torque.', '210 bar 기준 작동 토크 12,000 Nm, 홀딩 토크 20,000 Nm의 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. 축방향 47,000 N, 반경방향 37,000 N의 하중용량을 지원합니다.', 'A drive shaft helical rotary actuator rated at 12,000 Nm active and 20,000 Nm holding torque at 210 bar, supporting 47,000 N axial and 37,000 N radial capacities.',
  '{"torque_active": 12000, "torque_holding": 20000, "rotation_options": "180° / 360°", "displacement_180": 2673, "displacement_360": 5350, "capacity_axial": 47000, "capacity_radial": 37000, "weight": 140, "ports_direct": "3/4 G", "ports_cushioned": "1/2 G"}'::jsonb, true, 2750, '드라이브 샤프트 로터리 액추에이터 rm.57 drive shaft rotary actuator rm.57 작동 토크 12,000 nm의 arm 시리즈 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. arm series drive shaft helical rotary actuator with 12,000 nm active torque. rm.57 moveco srl arm 시리즈 로터리 액추에이터 (드라이브 샤프트) arm series rotary actuators (drive shaft connection) 12000 20000 180° / 360° 2673 5350 47000 37000 140 3/4 g 1/2 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rm-67', 'RM.67', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arm-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '드라이브 샤프트 로터리 액추에이터 RM.67', 'Drive Shaft Rotary Actuator RM.67', '작동 토크 22,200 Nm의 ARM 시리즈 최대형 드라이브 샤프트 헬리컬 로터리 액추에이터입니다.', 'The largest ARM series drive shaft helical rotary actuator, rated at 22,200 Nm active torque.', 'ARM 시리즈의 최대형 모델로, 210 bar 기준 작동 토크 22,200 Nm, 홀딩 토크 31,750 Nm을 제공합니다. 축방향 62,000 N, 반경방향 67,000 N의 하중용량으로 대형 회전 구동에 대응합니다.', 'The largest model in the ARM series, delivering 22,200 Nm active and 31,750 Nm holding torque at 210 bar. With 62,000 N axial and 67,000 N radial capacities, it addresses large rotary drive duties.',
  '{"torque_active": 22200, "torque_holding": 31750, "rotation_options": "180° / 360°", "displacement_180": 4760, "displacement_360": 9520, "capacity_axial": 62000, "capacity_radial": 67000, "weight": 215, "ports_direct": "3/4 G", "ports_cushioned": "1 G"}'::jsonb, true, 2760, '드라이브 샤프트 로터리 액추에이터 rm.67 drive shaft rotary actuator rm.67 작동 토크 22,200 nm의 arm 시리즈 최대형 드라이브 샤프트 헬리컬 로터리 액추에이터입니다. the largest arm series drive shaft helical rotary actuator, rated at 22,200 nm active torque. rm.67 moveco srl arm 시리즈 로터리 액추에이터 (드라이브 샤프트) arm series rotary actuators (drive shaft connection) 22200 31750 180° / 360° 4760 9520 62000 67000 215 3/4 g 1 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rp-24', 'RP.24', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arp-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헬리컬 로터리 액추에이터 RP.24', 'Helical Rotary Actuator RP.24', '작동 토크 960 Nm의 ARP 시리즈 고소작업대용 헬리컬 로터리 액추에이터입니다.', 'ARP series helical rotary actuator for aerial platforms with 960 Nm active torque.', '고소작업대 바스켓·지브 회전용 180° 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 960 Nm, 홀딩 토크 1,380 Nm이며, 반경방향 하중용량 20,000 N으로 중소형 플랫폼에 적합합니다.', 'A 180-degree helical rotary actuator for basket and jib rotation on aerial platforms. It provides 960 Nm active torque and 1,380 Nm holding torque at 210 bar, with a 20,000 N radial capacity suitable for small to mid-size platforms.',
  '{"torque_active": 960, "torque_holding": 1380, "rotation_angle": 180, "displacement": 222, "capacity_axial": 6000, "capacity_radial": 20000, "moment_straddle": 4800, "moment_cantilever": 2800, "weight": 18, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2770, '헬리컬 로터리 액추에이터 rp.24 helical rotary actuator rp.24 작동 토크 960 nm의 arp 시리즈 고소작업대용 헬리컬 로터리 액추에이터입니다. arp series helical rotary actuator for aerial platforms with 960 nm active torque. rp.24 moveco srl arp 시리즈 로터리 액추에이터 (고소작업대용) arp series rotary actuators (aerial working platforms) 960 1380 180 222 6000 20000 4800 2800 18 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rp-33', 'RP.33', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arp-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헬리컬 로터리 액추에이터 RP.33', 'Helical Rotary Actuator RP.33', '작동 토크 1,865 Nm의 ARP 시리즈 고소작업대용 헬리컬 로터리 액추에이터입니다.', 'ARP series helical rotary actuator for aerial platforms with 1,865 Nm active torque.', '고소작업대용 180° 헬리컬 로터리 액추에이터의 중형 모델입니다. 210 bar 기준 작동 토크 1,865 Nm, 홀딩 토크 2,670 Nm을 제공하며 스트래들 마운팅 시 모멘트 용량 12,000 Nm을 지원합니다.', 'A mid-size 180-degree helical rotary actuator for aerial platforms. It delivers 1,865 Nm active torque and 2,670 Nm holding torque at 210 bar, and supports a 12,000 Nm straddle-mount moment capacity.',
  '{"torque_active": 1865, "torque_holding": 2670, "rotation_angle": 180, "displacement": 421, "capacity_axial": 8000, "capacity_radial": 30000, "moment_straddle": 12000, "moment_cantilever": 5400, "weight": 31.5, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2780, '헬리컬 로터리 액추에이터 rp.33 helical rotary actuator rp.33 작동 토크 1,865 nm의 arp 시리즈 고소작업대용 헬리컬 로터리 액추에이터입니다. arp series helical rotary actuator for aerial platforms with 1,865 nm active torque. rp.33 moveco srl arp 시리즈 로터리 액추에이터 (고소작업대용) arp series rotary actuators (aerial working platforms) 1865 2670 180 421 8000 30000 12000 5400 31.5 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rp-40', 'RP.40', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arp-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헬리컬 로터리 액추에이터 RP.40', 'Helical Rotary Actuator RP.40', '작동 토크 3,100 Nm의 ARP 시리즈 고소작업대용 헬리컬 로터리 액추에이터입니다.', 'ARP series helical rotary actuator for aerial platforms with 3,100 Nm active torque.', '대형 고소작업대의 회전 구동을 위한 180° 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 3,100 Nm, 홀딩 토크 4,500 Nm이며, 반경방향 하중용량 60,000 N의 높은 지지력을 제공합니다.', 'A 180-degree helical rotary actuator for rotating large aerial platforms. It provides 3,100 Nm active torque and 4,500 Nm holding torque at 210 bar, with a high 60,000 N radial load capacity.',
  '{"torque_active": 3100, "torque_holding": 4500, "rotation_angle": 180, "displacement": 692, "capacity_axial": 15000, "capacity_radial": 60000, "moment_straddle": 18000, "moment_cantilever": 11500, "weight": 51, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2790, '헬리컬 로터리 액추에이터 rp.40 helical rotary actuator rp.40 작동 토크 3,100 nm의 arp 시리즈 고소작업대용 헬리컬 로터리 액추에이터입니다. arp series helical rotary actuator for aerial platforms with 3,100 nm active torque. rp.40 moveco srl arp 시리즈 로터리 액추에이터 (고소작업대용) arp series rotary actuators (aerial working platforms) 3100 4500 180 692 15000 60000 18000 11500 51 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rp-46', 'RP.46', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arp-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헬리컬 로터리 액추에이터 RP.46', 'Helical Rotary Actuator RP.46', '작동 토크 4,800 Nm의 ARP 시리즈 최대형 고소작업대용 헬리컬 로터리 액추에이터입니다.', 'The largest ARP series helical rotary actuator for aerial platforms, rated at 4,800 Nm active torque.', 'ARP 시리즈의 최대형 모델로, 210 bar 기준 작동 토크 4,800 Nm, 홀딩 토크 7,100 Nm을 제공하는 180° 헬리컬 로터리 액추에이터입니다. 반경방향 하중용량 100,000 N, 스트래들 모멘트 32,000 Nm으로 대형 장비의 회전 구동에 적합합니다.', 'The largest model in the ARP series, a 180-degree helical rotary actuator delivering 4,800 Nm active torque and 7,100 Nm holding torque at 210 bar. With 100,000 N radial capacity and 32,000 Nm straddle moment, it suits heavy platform rotation duties.',
  '{"torque_active": 4800, "torque_holding": 7100, "rotation_angle": 180, "displacement": 1101, "capacity_axial": 18000, "capacity_radial": 100000, "moment_straddle": 32000, "moment_cantilever": 16000, "weight": 87, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2800, '헬리컬 로터리 액추에이터 rp.46 helical rotary actuator rp.46 작동 토크 4,800 nm의 arp 시리즈 최대형 고소작업대용 헬리컬 로터리 액추에이터입니다. the largest arp series helical rotary actuator for aerial platforms, rated at 4,800 nm active torque. rp.46 moveco srl arp 시리즈 로터리 액추에이터 (고소작업대용) arp series rotary actuators (aerial working platforms) 4800 7100 180 1101 18000 100000 32000 16000 87 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rp17', 'RP17', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arp-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헬리컬 로터리 액추에이터 RP17', 'Helical Rotary Actuator RP17', '작동 토크 505 Nm의 ARP 시리즈 고소작업대용 소형 헬리컬 로터리 액추에이터입니다.', 'Compact ARP series helical rotary actuator for aerial platforms with 505 Nm active torque.', 'MOVECO ARP 시리즈의 최소형 모델로, 고소작업대의 바스켓·지브 회전에 적합한 180° 헬리컬 로터리 액추에이터입니다. 210 bar 기준 작동 토크 505 Nm, 홀딩 토크 730 Nm을 제공하며 OCV 또는 다이렉트 포트 구성이 가능합니다.', 'The smallest model in the MOVECO ARP series, a 180-degree helical rotary actuator suited to basket and jib rotation on aerial platforms. It delivers 505 Nm active torque and 730 Nm holding torque at 210 bar, with OCV or direct port configuration.',
  '{"torque_active": 505, "torque_holding": 730, "rotation_angle": 180, "displacement": 117, "capacity_axial": 5000, "capacity_radial": 14000, "moment_straddle": 2800, "moment_cantilever": 1400, "weight": 12, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2810, '헬리컬 로터리 액추에이터 rp17 helical rotary actuator rp17 작동 토크 505 nm의 arp 시리즈 고소작업대용 소형 헬리컬 로터리 액추에이터입니다. compact arp series helical rotary actuator for aerial platforms with 505 nm active torque. rp17 moveco srl arp 시리즈 로터리 액추에이터 (고소작업대용) arp series rotary actuators (aerial working platforms) 505 730 180 117 5000 14000 2800 1400 12 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rr-34', 'RR.34', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arr-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헤비듀티 로터리 액추에이터 RR.34', 'Heavy Duty Rotary Actuator RR.34', '작동 토크 2,020 Nm의 ARR 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다.', 'ARR series heavy-duty helical rotary actuator with 2,020 Nm active torque.', 'ARR 헤비듀티 시리즈의 엔트리 모델로, 210 bar 기준 작동 토크 2,020 Nm, 홀딩 토크 3,600 Nm을 제공합니다. 180°, 270°, 360° 회전 사양으로 제작 가능하며 광산·건설 장비의 고하중 회전 구동에 적합합니다.', 'The entry model of the ARR heavy-duty series, delivering 2,020 Nm active torque and 3,600 Nm holding torque at 210 bar. Available in 180, 270, and 360-degree rotation versions for demanding mining and construction drives.',
  '{"torque_active": 2020, "torque_holding": 3600, "rotation_options": "180° / 270° / 360°", "displacement_180": 461, "displacement_360": 920, "capacity_axial": 14000, "capacity_radial": 18000, "moment_straddle": 14000, "moment_cantilever": 5500, "weight": 38, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2820, '헤비듀티 로터리 액추에이터 rr.34 heavy duty rotary actuator rr.34 작동 토크 2,020 nm의 arr 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다. arr series heavy-duty helical rotary actuator with 2,020 nm active torque. rr.34 moveco srl arr 시리즈 로터리 액추에이터 (헤비듀티) arr series rotary actuators (heavy duty) 2020 3600 180° / 270° / 360° 461 920 14000 18000 14000 5500 38 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rr-40', 'RR.40', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arr-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헤비듀티 로터리 액추에이터 RR.40', 'Heavy Duty Rotary Actuator RR.40', '작동 토크 3,100 Nm의 ARR 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다.', 'ARR series heavy-duty helical rotary actuator with 3,100 Nm active torque.', '210 bar 기준 작동 토크 3,100 Nm, 홀딩 토크 4,430 Nm의 헤비듀티 헬리컬 로터리 액추에이터입니다. 180°, 270°, 360° 회전 사양을 지원하며 축방향 18,000 N, 반경방향 25,000 N의 하중용량을 갖습니다.', 'A heavy-duty helical rotary actuator rated at 3,100 Nm active and 4,430 Nm holding torque at 210 bar. Supports 180, 270, and 360-degree rotation with 18,000 N axial and 25,000 N radial load capacity.',
  '{"torque_active": 3100, "torque_holding": 4430, "rotation_options": "180° / 270° / 360°", "displacement_180": 716, "displacement_360": 1432, "capacity_axial": 18000, "capacity_radial": 25000, "moment_straddle": 17500, "moment_cantilever": 7500, "weight": 60, "ports": "1/4 G (OCV/Direct)"}'::jsonb, true, 2830, '헤비듀티 로터리 액추에이터 rr.40 heavy duty rotary actuator rr.40 작동 토크 3,100 nm의 arr 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다. arr series heavy-duty helical rotary actuator with 3,100 nm active torque. rr.40 moveco srl arr 시리즈 로터리 액추에이터 (헤비듀티) arr series rotary actuators (heavy duty) 3100 4430 180° / 270° / 360° 716 1432 18000 25000 17500 7500 60 1/4 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rr-46', 'RR.46', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arr-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헤비듀티 로터리 액추에이터 RR.46', 'Heavy Duty Rotary Actuator RR.46', '작동 토크 5,100 Nm의 ARR 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다.', 'ARR series heavy-duty helical rotary actuator with 5,100 Nm active torque.', '210 bar 기준 작동 토크 5,100 Nm, 홀딩 토크 8,000 Nm의 헤비듀티 헬리컬 로터리 액추에이터입니다. 180°, 270°, 360° 회전 사양과 스트래들 모멘트 31,000 Nm의 높은 구조 강성을 제공합니다.', 'A heavy-duty helical rotary actuator delivering 5,100 Nm active and 8,000 Nm holding torque at 210 bar. Offered in 180, 270, and 360-degree versions with a robust 31,000 Nm straddle moment capacity.',
  '{"torque_active": 5100, "torque_holding": 8000, "rotation_options": "180° / 270° / 360°", "displacement_180": 1161, "displacement_360": 2320, "capacity_axial": 30000, "capacity_radial": 36000, "moment_straddle": 31000, "moment_cantilever": 12000, "weight": 86, "ports": "3/8 G (OCV/Direct)"}'::jsonb, true, 2840, '헤비듀티 로터리 액추에이터 rr.46 heavy duty rotary actuator rr.46 작동 토크 5,100 nm의 arr 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다. arr series heavy-duty helical rotary actuator with 5,100 nm active torque. rr.46 moveco srl arr 시리즈 로터리 액추에이터 (헤비듀티) arr series rotary actuators (heavy duty) 5100 8000 180° / 270° / 360° 1161 2320 30000 36000 31000 12000 86 3/8 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rr-52', 'RR.52', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arr-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헤비듀티 로터리 액추에이터 RR.52', 'Heavy Duty Rotary Actuator RR.52', '작동 토크 8,050 Nm의 ARR 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다.', 'ARR series heavy-duty helical rotary actuator with 8,050 Nm active torque.', '210 bar 기준 작동 토크 8,050 Nm, 홀딩 토크 13,000 Nm의 헤비듀티 헬리컬 로터리 액추에이터입니다. 축·반경방향 각 65,000 N의 하중용량과 스트래들 모멘트 45,000 Nm으로 대형 장비에 대응합니다.', 'A heavy-duty helical rotary actuator rated at 8,050 Nm active and 13,000 Nm holding torque at 210 bar. With 65,000 N axial and radial capacities and a 45,000 Nm straddle moment, it handles large equipment duties.',
  '{"torque_active": 8050, "torque_holding": 13000, "rotation_options": "180° / 270° / 360°", "displacement_180": 1824, "displacement_360": 3648, "capacity_axial": 65000, "capacity_radial": 65000, "moment_straddle": 45000, "moment_cantilever": 20000, "weight": 124, "ports": "3/8 G (OCV/Direct)"}'::jsonb, true, 2850, '헤비듀티 로터리 액추에이터 rr.52 heavy duty rotary actuator rr.52 작동 토크 8,050 nm의 arr 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다. arr series heavy-duty helical rotary actuator with 8,050 nm active torque. rr.52 moveco srl arr 시리즈 로터리 액추에이터 (헤비듀티) arr series rotary actuators (heavy duty) 8050 13000 180° / 270° / 360° 1824 3648 65000 65000 45000 20000 124 3/8 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rr-58', 'RR.58', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arr-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헤비듀티 로터리 액추에이터 RR.58', 'Heavy Duty Rotary Actuator RR.58', '작동 토크 12,700 Nm의 ARR 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다.', 'ARR series heavy-duty helical rotary actuator with 12,700 Nm active torque.', '210 bar 기준 작동 토크 12,700 Nm, 홀딩 토크 20,400 Nm의 헤비듀티 헬리컬 로터리 액추에이터입니다. 180°, 270°, 360° 회전 사양과 스트래들 모멘트 75,000 Nm의 대용량 사양을 제공합니다.', 'A heavy-duty helical rotary actuator delivering 12,700 Nm active and 20,400 Nm holding torque at 210 bar. Available in 180, 270, and 360-degree versions with a 75,000 Nm straddle moment capacity.',
  '{"torque_active": 12700, "torque_holding": 20400, "rotation_options": "180° / 270° / 360°", "displacement_180": 3022, "displacement_360": 6044, "capacity_axial": 70000, "capacity_radial": 70000, "moment_straddle": 75000, "moment_cantilever": 30000, "weight": 185, "ports": "3/8 G (OCV/Direct)"}'::jsonb, true, 2860, '헤비듀티 로터리 액추에이터 rr.58 heavy duty rotary actuator rr.58 작동 토크 12,700 nm의 arr 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다. arr series heavy-duty helical rotary actuator with 12,700 nm active torque. rr.58 moveco srl arr 시리즈 로터리 액추에이터 (헤비듀티) arr series rotary actuators (heavy duty) 12700 20400 180° / 270° / 360° 3022 6044 70000 70000 75000 30000 185 3/8 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rr-61', 'RR.61', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arr-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헤비듀티 로터리 액추에이터 RR.61', 'Heavy Duty Rotary Actuator RR.61', '작동 토크 15,000 Nm의 ARR 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다.', 'ARR series heavy-duty helical rotary actuator with 15,000 Nm active torque.', '210 bar 기준 작동 토크 15,000 Nm, 홀딩 토크 24,000 Nm의 헤비듀티 헬리컬 로터리 액추에이터입니다. 축·반경방향 각 90,000 N의 하중용량과 스트래들 모멘트 100,000 Nm을 지원합니다.', 'A heavy-duty helical rotary actuator rated at 15,000 Nm active and 24,000 Nm holding torque at 210 bar. It supports 90,000 N axial and radial capacities and a 100,000 Nm straddle moment.',
  '{"torque_active": 15000, "torque_holding": 24000, "rotation_options": "180° / 270° / 360°", "displacement_180": 3605, "displacement_360": 7210, "capacity_axial": 90000, "capacity_radial": 90000, "moment_straddle": 100000, "moment_cantilever": 40000, "weight": 225, "ports": "3/8 G (OCV/Direct)"}'::jsonb, true, 2870, '헤비듀티 로터리 액추에이터 rr.61 heavy duty rotary actuator rr.61 작동 토크 15,000 nm의 arr 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다. arr series heavy-duty helical rotary actuator with 15,000 nm active torque. rr.61 moveco srl arr 시리즈 로터리 액추에이터 (헤비듀티) arr series rotary actuators (heavy duty) 15000 24000 180° / 270° / 360° 3605 7210 90000 90000 100000 40000 225 3/8 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rr-66', 'RR.66', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arr-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헤비듀티 로터리 액추에이터 RR.66', 'Heavy Duty Rotary Actuator RR.66', '작동 토크 20,000 Nm의 ARR 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다.', 'ARR series heavy-duty helical rotary actuator with 20,000 Nm active torque.', '210 bar 기준 작동 토크 20,000 Nm, 홀딩 토크 30,000 Nm의 헤비듀티 헬리컬 로터리 액추에이터입니다. 축·반경방향 각 100,000 N의 하중용량과 스트래들 모멘트 132,000 Nm으로 초대형 장비에 대응합니다.', 'A heavy-duty helical rotary actuator delivering 20,000 Nm active and 30,000 Nm holding torque at 210 bar. With 100,000 N axial and radial capacities and a 132,000 Nm straddle moment, it addresses very large machinery.',
  '{"torque_active": 20000, "torque_holding": 30000, "rotation_options": "180° / 270° / 360°", "displacement_180": 4513, "displacement_360": 8983, "capacity_axial": 100000, "capacity_radial": 100000, "moment_straddle": 132000, "moment_cantilever": 58000, "weight": 300, "ports": "3/8 G (OCV/Direct)"}'::jsonb, true, 2880, '헤비듀티 로터리 액추에이터 rr.66 heavy duty rotary actuator rr.66 작동 토크 20,000 nm의 arr 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다. arr series heavy-duty helical rotary actuator with 20,000 nm active torque. rr.66 moveco srl arr 시리즈 로터리 액추에이터 (헤비듀티) arr series rotary actuators (heavy duty) 20000 30000 180° / 270° / 360° 4513 8983 100000 100000 132000 58000 300 3/8 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rr-72', 'RR.72', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arr-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헤비듀티 로터리 액추에이터 RR.72', 'Heavy Duty Rotary Actuator RR.72', '작동 토크 27,000 Nm의 ARR 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다.', 'ARR series heavy-duty helical rotary actuator with 27,000 Nm active torque.', '210 bar 기준 작동 토크 27,000 Nm, 홀딩 토크 39,000 Nm의 헤비듀티 헬리컬 로터리 액추에이터입니다. 축·반경방향 각 120,000 N의 하중용량과 스트래들 모멘트 170,000 Nm을 제공합니다.', 'A heavy-duty helical rotary actuator rated at 27,000 Nm active and 39,000 Nm holding torque at 210 bar. It provides 120,000 N axial and radial capacities and a 170,000 Nm straddle moment.',
  '{"torque_active": 27000, "torque_holding": 39000, "rotation_options": "180° / 270° / 360°", "displacement_180": 5893, "displacement_360": 11737, "capacity_axial": 120000, "capacity_radial": 120000, "moment_straddle": 170000, "moment_cantilever": 75000, "weight": 390, "ports": "3/8 G (OCV/Direct)"}'::jsonb, true, 2890, '헤비듀티 로터리 액추에이터 rr.72 heavy duty rotary actuator rr.72 작동 토크 27,000 nm의 arr 시리즈 헤비듀티 헬리컬 로터리 액추에이터입니다. arr series heavy-duty helical rotary actuator with 27,000 nm active torque. rr.72 moveco srl arr 시리즈 로터리 액추에이터 (헤비듀티) arr series rotary actuators (heavy duty) 27000 39000 180° / 270° / 360° 5893 11737 120000 120000 170000 75000 390 3/8 g (ocv/direct)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('moveco-rr-78', 'RR.78', (select id from manufacturers where slug = 'moveco'), (select id from product_categories where slug = 'moveco-arr-series'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '헤비듀티 로터리 액추에이터 RR.78', 'Heavy Duty Rotary Actuator RR.78', '작동 토크 43,000 Nm의 ARR 시리즈 최대형 헤비듀티 헬리컬 로터리 액추에이터입니다.', 'The largest ARR series heavy-duty helical rotary actuator, rated at 43,000 Nm active torque.', 'ARR 시리즈의 최대형 모델로, 210 bar 기준 작동 토크 43,000 Nm, 홀딩 토크 62,000 Nm을 제공합니다. 180° 회전 사양으로 제공되며, 스트래들 모멘트 170,000 Nm의 초대형 회전 구동에 사용됩니다.', 'The largest model in the ARR series, delivering 43,000 Nm active and 62,000 Nm holding torque at 210 bar. Offered in a 180-degree version, it serves extreme-duty rotation with a 170,000 Nm straddle moment capacity.',
  '{"torque_active": 43000, "torque_holding": 62000, "rotation_options": "180°", "displacement_180": 9564, "capacity_axial": 120000, "capacity_radial": 120000, "moment_straddle": 170000, "moment_cantilever": 75000, "weight": 544, "ports": "OCV 3/8 G / Direct 3/4 G"}'::jsonb, true, 2900, '헤비듀티 로터리 액추에이터 rr.78 heavy duty rotary actuator rr.78 작동 토크 43,000 nm의 arr 시리즈 최대형 헤비듀티 헬리컬 로터리 액추에이터입니다. the largest arr series heavy-duty helical rotary actuator, rated at 43,000 nm active torque. rr.78 moveco srl arr 시리즈 로터리 액추에이터 (헤비듀티) arr series rotary actuators (heavy duty) 43000 62000 180° 9564 120000 120000 170000 75000 544 ocv 3/8 g / direct 3/4 g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-b03d', 'B03D', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'B03D 더블 카운터밸런스 밸브', 'B03D Double Counterbalance Valves', '인라인·코액시얼 플랜지 바디의 컴팩트 더블 카운터밸런스 밸브 (30 L/min, 350 bar)', 'Compact double counterbalance valve line with in-line and coaxial flanged bodies (30 L/min, 350 bar)', 'B03D 시리즈는 복동 실린더 양방향 하중 제어용 컴팩트 더블 카운터밸런스 밸브입니다. 오픈 센터용 비보상형(N)과 클로즈드 센터용 보상형(C) 버전, 인라인(L1)과 코액시얼 플랜지(F2) 바디를 제공합니다. BSPP 1/4 포트, 최대 유량 30 L/min, 최대 압력 350 bar이며 파일럿 비율 4:1/8:1/11.5:1, 강 또는 알루미늄 몸체를 선택할 수 있습니다.', 'The B03D series is a compact double counterbalance valve for bidirectional load control of double-acting cylinders. Non-compensated (N, open center) and compensated (C, closed center) versions are available with in-line (L1) or coaxial flanged (F2) bodies. BSPP 1/4 ports, 30 L/min max flow and 350 bar max pressure, with 4:1/8:1/11.5:1 pilot ratios and steel or aluminium bodies.',
  '{"valve_type": "double_counterbalance", "center_type": "open_and_closed", "mounting": "인라인 / 코액시얼 플랜지 (In-line / coaxial flanged)", "port_sizes": "BSPP 1/4", "max_flow_lpm": 30, "max_pressure_bar": 350, "pilot_ratio": "4:1 / 8:1 / 11.5:1", "setting_range": "60-210 bar / 100-350 bar", "body_material": "강(아연·아연-니켈 도금) 또는 알루미늄 (Steel zinc/zinc-nickel plated or aluminium)"}'::jsonb, true, 2910, 'b03d 더블 카운터밸런스 밸브 b03d double counterbalance valves 인라인·코액시얼 플랜지 바디의 컴팩트 더블 카운터밸런스 밸브 (30 l/min, 350 bar) compact double counterbalance valve line with in-line and coaxial flanged bodies (30 l/min, 350 bar) b03d oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves double_counterbalance 더블 카운터밸런스 double counterbalance open_and_closed 오픈/클로즈드 겸용(버전 선택) open and closed center versions 인라인 / 코액시얼 플랜지 (in-line / coaxial flanged) bspp 1/4 30 350 4:1 / 8:1 / 11.5:1 60-210 bar / 100-350 bar 강(아연·아연-니켈 도금) 또는 알루미늄 (steel zinc/zinc-nickel plated or aluminium)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-b03d-f', 'B03D...F', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'B03D...F 더블 오버센터 밸브', 'B03D...F Double Overcenter Valve', '플랜지형 설치 방식의 더블 오버센터 밸브로 최대 유량 30 L/min, 최대 압력 350 bar를 지원합니다.', 'Double Overcenter Valve with flanged installation, rated for flows up to 30 L/min and pressures up to 350 bar.', 'B03D...F은(는) 이탈리아 Oleoweb의 더블 오버센터 밸브 시리즈입니다. 바디 일체형 구조와 플랜지형 설치 방식을 채택하였으며, 최대 유량 30 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The B03D...F is a double overcenter valve series from Oleoweb, Italy. It features a parts in body execution with flanged installation, rated for flows up to 30 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"configuration": "double", "execution": "parts_in_body", "installation": "flanged", "max_flow_lpm": 30, "max_pressure_bar": 350}'::jsonb, true, 2920, 'b03d...f 더블 오버센터 밸브 b03d...f double overcenter valve 플랜지형 설치 방식의 더블 오버센터 밸브로 최대 유량 30 l/min, 최대 압력 350 bar를 지원합니다. double overcenter valve with flanged installation, rated for flows up to 30 l/min and pressures up to 350 bar. b03d...f oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves 30 350 double 더블 double parts_in_body 바디 일체형 parts in body flanged 플랜지형 flanged')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-b03d-l', 'B03D...L', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'B03D...L 더블 오버센터 밸브', 'B03D...L Double Overcenter Valve', '인라인 설치 방식의 더블 오버센터 밸브로 최대 유량 30 L/min, 최대 압력 350 bar를 지원합니다.', 'Double Overcenter Valve with in-line installation, rated for flows up to 30 L/min and pressures up to 350 bar.', 'B03D...L은(는) 이탈리아 Oleoweb의 더블 오버센터 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 30 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The B03D...L is a double overcenter valve series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 30 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"configuration": "double", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 30, "max_pressure_bar": 350}'::jsonb, true, 2930, 'b03d...l 더블 오버센터 밸브 b03d...l double overcenter valve 인라인 설치 방식의 더블 오버센터 밸브로 최대 유량 30 l/min, 최대 압력 350 bar를 지원합니다. double overcenter valve with in-line installation, rated for flows up to 30 l/min and pressures up to 350 bar. b03d...l oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves 30 350 double 더블 double parts_in_body 바디 일체형 parts in body in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-b03s', 'B03S', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'B03S 싱글 카운터밸런스 밸브', 'B03S Single Counterbalance Valves', '인라인·파일럿·릴리프·플랜지 바디의 컴팩트 싱글 카운터밸런스 밸브 (30 L/min, 350 bar)', 'Compact single counterbalance valve line with in-line, piloted, relief and flanged bodies (30 L/min, 350 bar)', 'B03S 시리즈는 BSPP 1/4 포트의 컴팩트 싱글 카운터밸런스(오버센터) 밸브 라인입니다. 오픈 센터용 비보상형(N)과 클로즈드 센터용 보상형(C) 버전이 있으며, 바디는 인라인(L1), 외부 파일럿(P1), 바이패스 릴리프 내장(PL), 논코액시얼 플랜지(F3) 중에서 선택합니다. 파일럿 비율 4:1, 8:1, 11.5:1과 설정 범위 60~210 bar 또는 100~350 bar, 강(아연/아연-니켈 도금) 또는 알루미늄 몸체, NBR/Viton 시일을 옵션으로 제공합니다.', 'The B03S series is a compact single counterbalance (overcenter) valve line with BSPP 1/4 ports. It is offered as a non-compensated version (N) for open-center systems and a compensated version (C) for closed-center systems, with in-line (L1), externally piloted (P1), by-pass relief (PL) and non-coaxial flanged (F3) bodies. Options include pilot ratios of 4:1, 8:1 and 11.5:1, setting ranges of 60-210 bar or 100-350 bar, steel (zinc or zinc-nickel plated) or aluminium bodies, and NBR or Viton seals.',
  '{"valve_type": "single_counterbalance", "center_type": "open_and_closed", "mounting": "인라인 / 파일럿 포트 / 릴리프 내장 / 플랜지 (In-line / piloted / with relief / flanged)", "port_sizes": "BSPP 1/4", "max_flow_lpm": 30, "max_pressure_bar": 350, "pilot_ratio": "4:1 / 8:1 / 11.5:1", "setting_range": "60-210 bar / 100-350 bar", "body_material": "강(아연·아연-니켈 도금) 또는 알루미늄 (Steel zinc/zinc-nickel plated or aluminium)"}'::jsonb, true, 2940, 'b03s 싱글 카운터밸런스 밸브 b03s single counterbalance valves 인라인·파일럿·릴리프·플랜지 바디의 컴팩트 싱글 카운터밸런스 밸브 (30 l/min, 350 bar) compact single counterbalance valve line with in-line, piloted, relief and flanged bodies (30 l/min, 350 bar) b03s oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance open_and_closed 오픈/클로즈드 겸용(버전 선택) open and closed center versions 인라인 / 파일럿 포트 / 릴리프 내장 / 플랜지 (in-line / piloted / with relief / flanged) bspp 1/4 30 350 4:1 / 8:1 / 11.5:1 60-210 bar / 100-350 bar 강(아연·아연-니켈 도금) 또는 알루미늄 (steel zinc/zinc-nickel plated or aluminium)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-b03s-f', 'B03S...F', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'B03S...F 싱글 오버센터 밸브', 'B03S...F Single Overcenter Valve', '플랜지형 설치 방식의 싱글 오버센터 밸브로 최대 유량 30 L/min, 최대 압력 350 bar를 지원합니다.', 'Single Overcenter Valve with flanged installation, rated for flows up to 30 L/min and pressures up to 350 bar.', 'B03S...F은(는) 이탈리아 Oleoweb의 싱글 오버센터 밸브 시리즈입니다. 바디 일체형 구조와 플랜지형 설치 방식을 채택하였으며, 최대 유량 30 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The B03S...F is a single overcenter valve series from Oleoweb, Italy. It features a parts in body execution with flanged installation, rated for flows up to 30 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"configuration": "single", "execution": "parts_in_body", "installation": "flanged", "max_flow_lpm": 30, "max_pressure_bar": 350}'::jsonb, true, 2950, 'b03s...f 싱글 오버센터 밸브 b03s...f single overcenter valve 플랜지형 설치 방식의 싱글 오버센터 밸브로 최대 유량 30 l/min, 최대 압력 350 bar를 지원합니다. single overcenter valve with flanged installation, rated for flows up to 30 l/min and pressures up to 350 bar. b03s...f oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves 30 350 single 싱글 single parts_in_body 바디 일체형 parts in body flanged 플랜지형 flanged')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-b03s-l', 'B03S...L', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'B03S...L 싱글 오버센터 밸브', 'B03S...L Single Overcenter Valve', '인라인 설치 방식의 싱글 오버센터 밸브로 최대 유량 30 L/min, 최대 압력 350 bar를 지원합니다.', 'Single Overcenter Valve with in-line installation, rated for flows up to 30 L/min and pressures up to 350 bar.', 'B03S...L은(는) 이탈리아 Oleoweb의 싱글 오버센터 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 30 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The B03S...L is a single overcenter valve series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 30 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"configuration": "single", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 30, "max_pressure_bar": 350}'::jsonb, true, 2960, 'b03s...l 싱글 오버센터 밸브 b03s...l single overcenter valve 인라인 설치 방식의 싱글 오버센터 밸브로 최대 유량 30 l/min, 최대 압력 350 bar를 지원합니다. single overcenter valve with in-line installation, rated for flows up to 30 l/min and pressures up to 350 bar. b03s...l oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves 30 350 single 싱글 single parts_in_body 바디 일체형 parts in body in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-bm', 'BM (BM2 ~ BM8)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-manifolds'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'BM 병렬 멀티 매니폴드 (릴리프 밸브 미포함)', 'BM Parallel Multiple Manifolds (without Relief Valve)', '2~8 스테이션 병렬 멀티 베이스, 40l/min, 210bar', '2-8 station parallel multiple bases, 40 l/min, 210 bar', '릴리프 밸브 없이 구성되는 측면 포트 병렬 회로 알루미늄 CETOP3 멀티 매니폴드입니다. 2~8 스테이션(BM2~BM8)을 선택할 수 있으며 최대 유량 40l/min, 최대 압력 210bar입니다. P/T 포트 BSPP 1/2, A/B 포트 BSPP 3/8입니다.', 'Aluminium CETOP3 multiple manifolds with lateral ports and parallel circuit, supplied without relief valve. Available from 2 to 8 stations (BM2 to BM8), rated 40 l/min and 210 bar. P/T ports BSPP 1/2, A/B ports BSPP 3/8.',
  '{"manifold_type": "multi_parallel", "max_flow_lpm": "40", "max_pressure_bar": 210, "material": "aluminium", "ports": "P/T BSPP 1/2, A/B BSPP 3/8, M BSPP 1/4", "stations": "2-8", "relief_valve": "None", "weight_kg": "1.5-5.2"}'::jsonb, true, 2970, 'bm 병렬 멀티 매니폴드 (릴리프 밸브 미포함) bm parallel multiple manifolds (without relief valve) 2~8 스테이션 병렬 멀티 베이스, 40l/min, 210bar 2-8 station parallel multiple bases, 40 l/min, 210 bar bm (bm2 ~ bm8) oleoweb s.r.l. 매니폴드 / 블록 manifolds / blocks multi_parallel 병렬 멀티 parallel multiple 40 210 aluminium 알루미늄 aluminium p/t bspp 1/2, a/b bspp 3/8, m bspp 1/4 2-8 none 1.5-5.2')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-bm-rv', 'BM-RV (BM2-RV ~ BM8-RV)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-manifolds'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'BM-RV 병렬 멀티 매니폴드 (릴리프 밸브 포함)', 'BM-RV Parallel Multiple Manifolds (with Relief Valve)', '2~8 스테이션 병렬 멀티 베이스, 40l/min, 210bar, 릴리프 밸브 포함', '2-8 station parallel multiple bases, 40 l/min, 210 bar, with relief valve', '측면 포트 병렬 회로 구성의 알루미늄 CETOP3 멀티 매니폴드로 VMD40S 릴리프 밸브가 포함됩니다. 2~8 스테이션(BM2-RV~BM8-RV)을 선택할 수 있으며 최대 유량 40l/min, 최대 압력 210bar입니다. P/T 포트 BSPP 1/2, A/B 포트 BSPP 3/8, 게이지 포트 BSPP 1/4입니다.', 'Aluminium CETOP3 multiple manifolds with lateral ports and parallel circuit, including the VMD40S relief valve. Available from 2 to 8 stations (BM2-RV to BM8-RV), rated 40 l/min and 210 bar. P/T ports BSPP 1/2, A/B ports BSPP 3/8, gauge port BSPP 1/4.',
  '{"manifold_type": "multi_parallel", "max_flow_lpm": "40", "max_pressure_bar": 210, "material": "aluminium", "ports": "P/T BSPP 1/2, A/B BSPP 3/8, M BSPP 1/4", "stations": "2-8", "relief_valve": "VMD40S included (springs 10-90 / 20-210 bar)", "weight_kg": "2.1-5.9"}'::jsonb, true, 2980, 'bm-rv 병렬 멀티 매니폴드 (릴리프 밸브 포함) bm-rv parallel multiple manifolds (with relief valve) 2~8 스테이션 병렬 멀티 베이스, 40l/min, 210bar, 릴리프 밸브 포함 2-8 station parallel multiple bases, 40 l/min, 210 bar, with relief valve bm-rv (bm2-rv ~ bm8-rv) oleoweb s.r.l. 매니폴드 / 블록 manifolds / blocks multi_parallel 병렬 멀티 parallel multiple 40 210 aluminium 알루미늄 aluminium p/t bspp 1/2, a/b bspp 3/8, m bspp 1/4 2-8 vmd40s included (springs 10-90 / 20-210 bar) 2.1-5.9')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-bp3', 'BP3', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-manifolds'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'BP3 CETOP3 알루미늄 싱글 매니폴드 (후면 포트)', 'BP3 Aluminium CETOP3 Single Manifold (Rear Ports)', '후면 포트 CETOP3 싱글 베이스, 40l/min, 210bar, 릴리프 밸브 내장', 'Rear-port CETOP3 single base, 40 l/min, 210 bar, with relief valve', '후면 포트 방식의 CETOP3 규격 알루미늄(흑색 아노다이징) 싱글 매니폴드입니다. 최대 유량 40l/min, 최대 압력 210bar이며 VMD40S 릴리프 밸브가 내장됩니다. P/T/A/B 포트는 BSPP 3/8, 게이지 포트 M은 BSPP 1/4입니다.', 'Black anodized aluminium CETOP3 single manifold with rear ports. Rated 40 l/min and 210 bar, fitted with the VMD40S relief valve. P/T/A/B ports are BSPP 3/8 and the gauge port M is BSPP 1/4.',
  '{"manifold_type": "cetop3_single", "max_flow_lpm": "40", "max_pressure_bar": 210, "material": "aluminium", "ports": "P/T/A/B BSPP 3/8, M BSPP 1/4", "relief_valve": "VMD40S (springs 10-90 / 20-210 bar)", "weight_kg": "0.72"}'::jsonb, true, 2990, 'bp3 cetop3 알루미늄 싱글 매니폴드 (후면 포트) bp3 aluminium cetop3 single manifold (rear ports) 후면 포트 cetop3 싱글 베이스, 40l/min, 210bar, 릴리프 밸브 내장 rear-port cetop3 single base, 40 l/min, 210 bar, with relief valve bp3 oleoweb s.r.l. 매니폴드 / 블록 manifolds / blocks cetop3_single cetop3 싱글 cetop3 single 40 210 aluminium 알루미늄 aluminium p/t/a/b bspp 3/8, m bspp 1/4 vmd40s (springs 10-90 / 20-210 bar) 0.72')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-bs3', 'BS3', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-manifolds'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'BS3 CETOP3 알루미늄 싱글 매니폴드 (측면 포트)', 'BS3 Aluminium CETOP3 Single Manifold (Lateral Ports)', '측면 포트 CETOP3 싱글 베이스, 40l/min, 210bar, 릴리프 밸브 내장', 'Lateral-port CETOP3 single base, 40 l/min, 210 bar, with relief valve', '측면 포트 방식의 CETOP3 규격 알루미늄(흑색 아노다이징) 싱글 매니폴드입니다. 최대 유량 40l/min, 최대 압력 210bar이며 VMD40S 릴리프 밸브가 내장됩니다. P/T/A/B 포트는 BSPP 3/8, 게이지 포트 M은 BSPP 1/4입니다.', 'Black anodized aluminium CETOP3 single manifold with lateral ports. Rated 40 l/min and 210 bar, fitted with the VMD40S relief valve. P/T/A/B ports are BSPP 3/8 and the gauge port M is BSPP 1/4.',
  '{"manifold_type": "cetop3_single", "max_flow_lpm": "40", "max_pressure_bar": 210, "material": "aluminium", "ports": "P/T/A/B BSPP 3/8, M BSPP 1/4", "relief_valve": "VMD40S (springs 10-90 / 20-210 bar)", "weight_kg": "0.8"}'::jsonb, true, 3000, 'bs3 cetop3 알루미늄 싱글 매니폴드 (측면 포트) bs3 aluminium cetop3 single manifold (lateral ports) 측면 포트 cetop3 싱글 베이스, 40l/min, 210bar, 릴리프 밸브 내장 lateral-port cetop3 single base, 40 l/min, 210 bar, with relief valve bs3 oleoweb s.r.l. 매니폴드 / 블록 manifolds / blocks cetop3_single cetop3 싱글 cetop3 single 40 210 aluminium 알루미늄 aluminium p/t/a/b bspp 3/8, m bspp 1/4 vmd40s (springs 10-90 / 20-210 bar) 0.8')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-bs3-bp3-bs5-bm-bmrv', 'BS3 - BP3 - BS5 - BM - BMRV', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-manifolds'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'BS3 시리즈 CETOP 베이스', 'BS3 Series Cetop Base', '인라인 설치 방식의 CETOP 베이스로 최대 유량 80 L/min, 최대 압력 210 bar를 지원합니다.', 'Cetop Base with in-line installation, rated for flows up to 80 L/min and pressures up to 210 bar.', 'BS3 - BP3 - BS5 - BM - BMRV은(는) 이탈리아 Oleoweb의 CETOP 베이스 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 80 L/min, 최대 압력 210 bar 사양을 갖추고 있습니다. 본 시리즈에는 BS3, BP3, BS5, BM, BMRV 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The BS3 - BP3 - BS5 - BM - BMRV is a cetop base series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 80 L/min and pressures up to 210 bar. The series includes the BS3, BP3, BS5, BM, BMRV models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"base_type": "cetop", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 80, "max_pressure_bar": 210, "variant_codes": "BS3, BP3, BS5, BM, BMRV"}'::jsonb, true, 3010, 'bs3 시리즈 cetop 베이스 bs3 series cetop base 인라인 설치 방식의 cetop 베이스로 최대 유량 80 l/min, 최대 압력 210 bar를 지원합니다. cetop base with in-line installation, rated for flows up to 80 l/min and pressures up to 210 bar. bs3 - bp3 - bs5 - bm - bmrv oleoweb s.r.l. 매니폴드 / 블록 manifolds / blocks 80 210 cetop cetop 베이스 cetop bases parts_in_body 바디 일체형 parts in body in_line 인라인 in-line bs3, bp3, bs5, bm, bmrv')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-bs5', 'BS5', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-manifolds'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'BS5 CETOP5 알루미늄 싱글 매니폴드', 'BS5 Aluminium CETOP5 Single Manifold', 'CETOP5 싱글 베이스, 80l/min, 210bar, VMD90 릴리프 내장', 'CETOP5 single base, 80 l/min, 210 bar, with VMD90 relief valve', 'CETOP5 규격 알루미늄(흑색 아노다이징) 싱글 매니폴드입니다. 최대 유량 80l/min, 최대 압력 210bar이며 VMD90 릴리프 밸브가 내장됩니다. P/T/A/B 포트는 BSPP 1/2, 게이지 포트 M은 BSPP 1/4입니다.', 'Black anodized aluminium CETOP5 single manifold. Rated 80 l/min and 210 bar, fitted with the VMD90 relief valve. P/T/A/B ports are BSPP 1/2 and the gauge port M is BSPP 1/4.',
  '{"manifold_type": "cetop5_single", "max_flow_lpm": "80", "max_pressure_bar": 210, "material": "aluminium", "ports": "P/T/A/B BSPP 1/2, M BSPP 1/4", "relief_valve": "VMD90 (springs 10-100 / 20-210 bar)", "weight_kg": "1.20"}'::jsonb, true, 3020, 'bs5 cetop5 알루미늄 싱글 매니폴드 bs5 aluminium cetop5 single manifold cetop5 싱글 베이스, 80l/min, 210bar, vmd90 릴리프 내장 cetop5 single base, 80 l/min, 210 bar, with vmd90 relief valve bs5 oleoweb s.r.l. 매니폴드 / 블록 manifolds / blocks cetop5_single cetop5 싱글 cetop5 single 80 210 aluminium 알루미늄 aluminium p/t/a/b bspp 1/2, m bspp 1/4 vmd90 (springs 10-100 / 20-210 bar) 1.20')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-cm6', 'CM6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CM6 수동 릴리즈 밸브', 'CM6 Manual Operated Release Valve', '레버 조작식 수동 릴리즈 밸브, 마이크로스위치 옵션 (25 L/min, 320 bar)', 'Lever-operated manual release valve with optional micro-switch (25 L/min, 320 bar)', 'CM6은 SAE 8/2 캐비티용 수동 릴리즈(비상 하강) 밸브로, 레버(길이 190 mm 기본 제공) 조작으로 유로를 개방합니다. 마이크로스위치 부착형(M)과 미부착형(0)이 있으며 최대 유량 25 L/min, 최대 압력 320 bar 사양입니다.', 'The CM6 is a manual release (emergency lowering) valve for SAE 8/2 cavities, opened by an operating lever (190 mm lever supplied). Versions with (M) or without (0) micro-switch are available; rated 25 L/min and 320 bar.',
  '{"valve_function": "manual_release", "cavity": "SAE8/2 (3/4-16 UNF)", "max_flow_lpm": 25, "max_pressure_bar": 320, "adjustment": "수동 레버 (L=190 mm)", "pilot_ratio": null, "cracking_pressure": null, "seal_material": null, "controlled_flow_range": "마이크로스위치 옵션 (With/without micro-switch)"}'::jsonb, true, 3030, 'cm6 수동 릴리즈 밸브 cm6 manual operated release valve 레버 조작식 수동 릴리즈 밸브, 마이크로스위치 옵션 (25 l/min, 320 bar) lever-operated manual release valve with optional micro-switch (25 l/min, 320 bar) cm6 oleoweb s.r.l. 카트리지 밸브 cartridge valves manual_release 수동 릴리즈 manual release sae8/2 (3/4-16 unf) 25 320 수동 레버 (l=190 mm) 마이크로스위치 옵션 (with/without micro-switch)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-coils', 'COILS', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '솔레노이드 코일', 'Solenoid Coils', 'Oleoweb 유압 밸브 시스템용 코일입니다.', 'Coils for Oleoweb hydraulic valve systems.', 'COILS은(는) 이탈리아 Oleoweb의 유압 시스템 액세서리 라인업 중 코일 제품군입니다. Oleoweb 솔레노이드 밸브 및 매니폴드 시스템과 함께 사용되며, 세부 사양은 개별 데이터시트를 참조해야 합니다.', 'COILS is the Coils range in Oleoweb''s hydraulic accessory line-up. They are used together with Oleoweb solenoid valves and manifold systems; refer to individual datasheets for detailed specifications.',
  '{"component_type": "Coils"}'::jsonb, true, 3040, '솔레노이드 코일 solenoid coils oleoweb 유압 밸브 시스템용 코일입니다. coils for oleoweb hydraulic valve systems. coils oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories coils coils coils')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-connectors', 'CONNECTORS', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '커넥터', 'Connectors', 'Oleoweb 유압 밸브 시스템용 커넥터입니다.', 'Connectors for Oleoweb hydraulic valve systems.', 'CONNECTORS은(는) 이탈리아 Oleoweb의 유압 시스템 액세서리 라인업 중 커넥터 제품군입니다. Oleoweb 솔레노이드 밸브 및 매니폴드 시스템과 함께 사용되며, 세부 사양은 개별 데이터시트를 참조해야 합니다.', 'CONNECTORS is the Connectors range in Oleoweb''s hydraulic accessory line-up. They are used together with Oleoweb solenoid valves and manifold systems; refer to individual datasheets for detailed specifications.',
  '{"component_type": "Connectors"}'::jsonb, true, 3050, '커넥터 connectors oleoweb 유압 밸브 시스템용 커넥터입니다. connectors for oleoweb hydraulic valve systems. connectors oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories connectors connectors connectors')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-cp10', 'CP10', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CP10 SAE10 3웨이 압력 보상 유량 조절 밸브', 'CP10 SAE10 3-Way Flow Regulator, Pressure Compensated', 'SAE10/3 캐비티용 3웨이 압력 보상형 유량 조절 밸브 (50 L/min, 350 bar)', '3-way pressure-compensated flow regulator for SAE10/3 cavity (50 L/min, 350 bar)', 'CP10은 SAE 10/3 캐비티용 3웨이 압력 보상형 유량 조절 밸브 카트리지입니다. 우선(3번 포트) 유량을 부하와 무관하게 일정하게 유지하며 잉여 유량을 바이패스합니다. 최대 유량 50 L/min(3번 포트 30 L/min 시), 최대 압력 350 bar 사양입니다.', 'The CP10 is a 3-way pressure-compensated flow regulator cartridge for SAE 10/3 cavities, holding priority flow (port 3) constant regardless of load while bypassing excess flow. Rated 50 L/min max (with 30 L/min at port 3) and 350 bar.',
  '{"valve_function": "flow_control", "cavity": "SAE10/3 (7/8-14 UNF)", "max_flow_lpm": 50, "max_pressure_bar": 350, "adjustment": "고정형 (3웨이 압력 보상)", "pilot_ratio": null, "cracking_pressure": null, "seal_material": null, "controlled_flow_range": "우선 유량 최대 30 L/min @ 포트 3"}'::jsonb, true, 3060, 'cp10 sae10 3웨이 압력 보상 유량 조절 밸브 cp10 sae10 3-way flow regulator, pressure compensated sae10/3 캐비티용 3웨이 압력 보상형 유량 조절 밸브 (50 l/min, 350 bar) 3-way pressure-compensated flow regulator for sae10/3 cavity (50 l/min, 350 bar) cp10 oleoweb s.r.l. 카트리지 밸브 cartridge valves flow_control 유량 제어 flow control sae10/3 (7/8-14 unf) 50 350 고정형 (3웨이 압력 보상) 우선 유량 최대 30 l/min @ 포트 3')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-cur', 'CUR', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CUR 체크 밸브 (카트리지)', 'CUR Check Valve (Cartridge)', '나사 삽입형 설치 방식의 체크 밸브로 최대 유량 60 L/min, 최대 압력 350 bar를 지원합니다.', 'Check Valve with screwed-in installation, rated for flows up to 60 L/min and pressures up to 350 bar.', 'CUR은(는) 이탈리아 Oleoweb의 체크 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 60 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The CUR is a check valve series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 60 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"valve_function": "check", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 60, "max_pressure_bar": 350}'::jsonb, true, 3070, 'cur 체크 밸브 (카트리지) cur check valve (cartridge) 나사 삽입형 설치 방식의 체크 밸브로 최대 유량 60 l/min, 최대 압력 350 bar를 지원합니다. check valve with screwed-in installation, rated for flows up to 60 l/min and pressures up to 350 bar. cur oleoweb s.r.l. 체크 밸브 check valves check 체크 check cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in 60 350')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-cur10n', 'CUR10N', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CUR10N SAE10/2 체크 밸브 카트리지', 'CUR10N SAE10/2 Check Valve Cartridge', 'SAE10/2 캐비티용 포핏 체크 밸브 (40 L/min, 350 bar)', 'Poppet check valve for SAE10/2 cavity (40 L/min, 350 bar)', 'CUR10N은 SAE 10/2 캐비티용 포핏 시트 방식의 체크 밸브 카트리지입니다. 스프링 크래킹 압력 1 bar, 최대 유량 40 L/min, 최대 압력 350 bar 사양입니다.', 'The CUR10N is a poppet-type check valve cartridge for SAE 10/2 cavities. 1 bar spring cracking pressure, 40 L/min max flow and 350 bar max pressure.',
  '{"valve_function": "check", "cavity": "SAE10/2 (7/8-14 UNF)", "max_flow_lpm": 40, "max_pressure_bar": 350, "adjustment": "고정식", "pilot_ratio": null, "cracking_pressure": "1 bar", "seal_material": "포핏 시트 (Poppet sealing)", "controlled_flow_range": null}'::jsonb, true, 3080, 'cur10n sae10/2 체크 밸브 카트리지 cur10n sae10/2 check valve cartridge sae10/2 캐비티용 포핏 체크 밸브 (40 l/min, 350 bar) poppet check valve for sae10/2 cavity (40 l/min, 350 bar) cur10n oleoweb s.r.l. 카트리지 밸브 cartridge valves check 체크(역지) check sae10/2 (7/8-14 unf) 40 350 고정식 1 bar 포핏 시트 (poppet sealing)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-cur2015', 'CUR2015', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CUR2015 M20x1.5 체크 밸브 카트리지', 'CUR2015 M20x1.5 Check Valve Cartridge', 'M20x1.5 캐비티용 체크 밸브 (25 L/min, 350 bar)', 'Check valve for M20x1.5 cavity (25 L/min, 350 bar)', 'CUR2015는 미터법 M20x1.5(C2015/2) 캐비티용 체크 밸브 카트리지입니다. 볼 또는 포핏 시트 방식, 스프링 1 bar, 최대 유량 25 L/min, 최대 압력 350 bar 사양입니다.', 'The CUR2015 is a check valve cartridge for the metric M20x1.5 (C2015/2) cavity. Ball or poppet sealing, 1 bar spring, 25 L/min max flow and 350 bar max pressure.',
  '{"valve_function": "check", "cavity": "C2015/2 (M20x1.5)", "max_flow_lpm": 25, "max_pressure_bar": 350, "adjustment": "고정식", "pilot_ratio": null, "cracking_pressure": "1 bar", "seal_material": "볼 시트 또는 포핏 시트 (Ball or poppet sealing)", "controlled_flow_range": null}'::jsonb, true, 3090, 'cur2015 m20x1.5 체크 밸브 카트리지 cur2015 m20x1.5 check valve cartridge m20x1.5 캐비티용 체크 밸브 (25 l/min, 350 bar) check valve for m20x1.5 cavity (25 l/min, 350 bar) cur2015 oleoweb s.r.l. 카트리지 밸브 cartridge valves check 체크(역지) check c2015/2 (m20x1.5) 25 350 고정식 1 bar 볼 시트 또는 포핏 시트 (ball or poppet sealing)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-cur2215', 'CUR2215', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CUR2215 M22x1.5 체크 밸브 카트리지', 'CUR2215 M22x1.5 Check Valve Cartridge', 'M22x1.5 캐비티용 체크 밸브 (40 L/min, 350 bar)', 'Check valve for M22x1.5 cavity (40 L/min, 350 bar)', 'CUR2215는 미터법 M22x1.5(C2215/2) 캐비티용 체크 밸브 카트리지입니다. 볼 또는 포핏 시트 방식, 스프링 1 bar(포핏은 4.5 bar도 선택 가능), 최대 유량 40 L/min, 최대 압력 350 bar 사양입니다.', 'The CUR2215 is a check valve cartridge for the metric M22x1.5 (C2215/2) cavity. Ball or poppet sealing with 1 bar spring (4.5 bar available for poppet version), 40 L/min max flow and 350 bar max pressure.',
  '{"valve_function": "check", "cavity": "C2215/2 (M22x1.5)", "max_flow_lpm": 40, "max_pressure_bar": 350, "adjustment": "고정식", "pilot_ratio": null, "cracking_pressure": "1 bar / 4.5 bar (포핏형)", "seal_material": "볼 시트 또는 포핏 시트 (Ball or poppet sealing)", "controlled_flow_range": null}'::jsonb, true, 3100, 'cur2215 m22x1.5 체크 밸브 카트리지 cur2215 m22x1.5 check valve cartridge m22x1.5 캐비티용 체크 밸브 (40 l/min, 350 bar) check valve for m22x1.5 cavity (40 l/min, 350 bar) cur2215 oleoweb s.r.l. 카트리지 밸브 cartridge valves check 체크(역지) check c2215/2 (m22x1.5) 40 350 고정식 1 bar / 4.5 bar (포핏형) 볼 시트 또는 포핏 시트 (ball or poppet sealing)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-cur2615', 'CUR2615', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CUR2615 M26x1.5 체크 밸브 카트리지', 'CUR2615 M26x1.5 Check Valve Cartridge', 'M26x1.5 캐비티용 포핏 체크 밸브 (60 L/min, 350 bar)', 'Poppet check valve for M26x1.5 cavity (60 L/min, 350 bar)', 'CUR2615는 미터법 M26x1.5(C2615/2) 캐비티용 포핏 시트 체크 밸브 카트리지입니다. 스프링 크래킹 압력 1 bar 또는 4.5 bar, 최대 유량 60 L/min, 최대 압력 350 bar 사양입니다.', 'The CUR2615 is a poppet-type check valve cartridge for the metric M26x1.5 (C2615/2) cavity. Spring cracking pressures of 1 or 4.5 bar, 60 L/min max flow and 350 bar max pressure.',
  '{"valve_function": "check", "cavity": "C2615/2 (M26x1.5)", "max_flow_lpm": 60, "max_pressure_bar": 350, "adjustment": "고정식", "pilot_ratio": null, "cracking_pressure": "1 / 4.5 bar", "seal_material": "포핏 시트 (Poppet sealing)", "controlled_flow_range": null}'::jsonb, true, 3110, 'cur2615 m26x1.5 체크 밸브 카트리지 cur2615 m26x1.5 check valve cartridge m26x1.5 캐비티용 포핏 체크 밸브 (60 l/min, 350 bar) poppet check valve for m26x1.5 cavity (60 l/min, 350 bar) cur2615 oleoweb s.r.l. 카트리지 밸브 cartridge valves check 체크(역지) check c2615/2 (m26x1.5) 60 350 고정식 1 / 4.5 bar 포핏 시트 (poppet sealing)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-cur6', 'CUR6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CUR6 SAE8 체크 밸브 카트리지', 'CUR6 SAE8 Check Valve Cartridge', 'SAE8/2 캐비티용 체크 밸브 (25 L/min, 350 bar)', 'Check valve for SAE8/2 cavity (25 L/min, 350 bar)', 'CUR6은 SAE 8/2 캐비티용 나사식 체크(역지) 밸브 카트리지입니다. 볼 시트(SF) 또는 포핏 시트(SP) 방식과 스프링 크래킹 압력 1·3·4.5 bar를 선택할 수 있으며 최대 유량 25 L/min, 최대 압력 350 bar 사양입니다.', 'The CUR6 is a screw-in check valve cartridge for SAE 8/2 cavities. Ball (SF) or poppet (SP) sealing with spring cracking pressures of 1, 3 or 4.5 bar; rated 25 L/min and 350 bar.',
  '{"valve_function": "check", "cavity": "SAE8/2 (3/4-16 UNF)", "max_flow_lpm": 25, "max_pressure_bar": 350, "adjustment": "고정식", "pilot_ratio": null, "cracking_pressure": "1 / 3 / 4.5 bar", "seal_material": "볼 시트 또는 포핏 시트 (Ball or poppet sealing)", "controlled_flow_range": null}'::jsonb, true, 3120, 'cur6 sae8 체크 밸브 카트리지 cur6 sae8 check valve cartridge sae8/2 캐비티용 체크 밸브 (25 l/min, 350 bar) check valve for sae8/2 cavity (25 l/min, 350 bar) cur6 oleoweb s.r.l. 카트리지 밸브 cartridge valves check 체크(역지) check sae8/2 (3/4-16 unf) 25 350 고정식 1 / 3 / 4.5 bar 볼 시트 또는 포핏 시트 (ball or poppet sealing)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-cur6m', 'CUR6M', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CUR6M 압력계 포트 부착 SAE8 체크 밸브', 'CUR6M SAE8 Check Valve with Pressure Connection', '압력계 연결 포트(BSPP 1/4)가 있는 SAE8 체크 밸브', 'SAE8 check valve with gauge connection port (BSPP 1/4)', 'CUR6M은 압력계 연결용 포트(BSPP 1/4)를 갖춘 SAE 8/2 캐비티용 체크 밸브 카트리지입니다. 볼 또는 포핏 시트 방식, 스프링 1 bar, 최대 유량 25 L/min, 최대 압력 350 bar 사양입니다.', 'The CUR6M is a check valve cartridge for SAE 8/2 cavities with a pressure gauge connection port (BSPP 1/4). Ball or poppet sealing, 1 bar spring, 25 L/min max flow and 350 bar max pressure.',
  '{"valve_function": "check", "cavity": "SAE8/2 (3/4-16 UNF), 게이지 포트 BSPP 1/4", "max_flow_lpm": 25, "max_pressure_bar": 350, "adjustment": "고정식", "pilot_ratio": null, "cracking_pressure": "1 bar", "seal_material": "볼 시트 또는 포핏 시트 (Ball or poppet sealing)", "controlled_flow_range": null}'::jsonb, true, 3130, 'cur6m 압력계 포트 부착 sae8 체크 밸브 cur6m sae8 check valve with pressure connection 압력계 연결 포트(bspp 1/4)가 있는 sae8 체크 밸브 sae8 check valve with gauge connection port (bspp 1/4) cur6m oleoweb s.r.l. 카트리지 밸브 cartridge valves check 체크(역지) check sae8/2 (3/4-16 unf), 게이지 포트 bspp 1/4 25 350 고정식 1 bar 볼 시트 또는 포핏 시트 (ball or poppet sealing)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-dcf', 'DCF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-shock-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DCF 안티쇼크 밸브 (OMP/OMR 모터용)', 'DCF Dual Cross-Line Anti-Shock Valve (for OMP/OMR Motors)', 'OMP/OMR 모터 플랜지 장착형 더블 크로스 릴리프 밸브, BSPP 1/2", 350 bar', 'Dual cross-line relief valve flange-mounted on OMP/OMR motors, BSPP 1/2", 350 bar', 'Danfoss OMP/OMR 계열 오비탈 모터의 포트면에 직접 장착하는 더블 크로스 직동 릴리프(안티쇼크) 밸브입니다. BSPP 1/2" 접속, 최대 40 L/min, 350 bar이며 VMD40S 릴리프 카트리지를 사용합니다. 스프링은 10~40, 20~210, 70~350 bar 3종입니다.', 'Dual cross-line direct acting relief (anti-shock) valve mounting directly onto the port face of OMP/OMR-type orbital motors. BSPP 1/2" connection, 40 L/min at up to 350 bar, using VMD40S relief cartridges. Three spring ranges: 10-40, 20-210 and 70-350 bar.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 40, "port_sizes": "BSPP 1/2\"", "setting_ranges": "10-40 / 20-210 / 70-350 bar (12 / 33 / 70 bar per turn)", "mounting_style": "motor_flange", "motor_compatibility": "OMP / OMR orbital motors", "relief_cartridge": "VMD40S"}'::jsonb, true, 3140, 'dcf 안티쇼크 밸브 (omp/omr 모터용) dcf dual cross-line anti-shock valve (for omp/omr motors) omp/omr 모터 플랜지 장착형 더블 크로스 릴리프 밸브, bspp 1/2", 350 bar dual cross-line relief valve flange-mounted on omp/omr motors, bspp 1/2", 350 bar dcf oleoweb s.r.l. 안티쇼크 밸브 (더블 크로스 릴리프) anti-shock valves (dual cross-line relief) 350 40 bspp 1/2" 10-40 / 20-210 / 70-350 bar (12 / 33 / 70 bar per turn) motor_flange 모터 플랜지 motor flange omp / omr orbital motors vmd40s')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-dcm', 'DCM', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-shock-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DCM 안티쇼크 밸브 (OMS 모터용)', 'DCM Dual Cross-Line Anti-Shock Valve (for OMS Motors)', 'OMS 모터 플랜지 장착형 더블 크로스 릴리프 밸브, BSPP 1/2", 350 bar', 'Dual cross-line relief valve flange-mounted on OMS motors, BSPP 1/2", 350 bar', 'OMS 계열 오비탈 모터의 포트면에 직접 장착하는 더블 크로스 직동 릴리프(안티쇼크) 밸브입니다. BSPP 1/2" 접속, 최대 40 L/min, 350 bar이며 VMD40S 릴리프 카트리지를 사용합니다. 스프링은 10~40, 20~210, 70~350 bar 3종입니다.', 'Dual cross-line direct acting relief (anti-shock) valve mounting directly onto the port face of OMS-type orbital motors. BSPP 1/2" connection, 40 L/min at up to 350 bar, using VMD40S relief cartridges. Three spring ranges: 10-40, 20-210 and 70-350 bar.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 40, "port_sizes": "BSPP 1/2\"", "setting_ranges": "10-40 / 20-210 / 70-350 bar (12 / 33 / 70 bar per turn)", "mounting_style": "motor_flange", "motor_compatibility": "OMS orbital motors", "relief_cartridge": "VMD40S"}'::jsonb, true, 3150, 'dcm 안티쇼크 밸브 (oms 모터용) dcm dual cross-line anti-shock valve (for oms motors) oms 모터 플랜지 장착형 더블 크로스 릴리프 밸브, bspp 1/2", 350 bar dual cross-line relief valve flange-mounted on oms motors, bspp 1/2", 350 bar dcm oleoweb s.r.l. 안티쇼크 밸브 (더블 크로스 릴리프) anti-shock valves (dual cross-line relief) 350 40 bspp 1/2" 10-40 / 20-210 / 70-350 bar (12 / 33 / 70 bar per turn) motor_flange 모터 플랜지 motor flange oms orbital motors vmd40s')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-dcv', 'DCV', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-shock-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DCV 안티쇼크 밸브 (플랜지형)', 'DCV Dual Cross-Line Anti-Shock Valve (Flanged)', '모터 플랜지 장착형 더블 크로스 릴리프 밸브, Ø21(BSPP 1/2"), 350 bar, 40 L/min', 'Motor flange-mounted dual cross-line relief valve, Ø21 (BSPP 1/2"), 350 bar, 40 L/min', '유압 모터 포트면에 직접 플랜지 장착하는 더블 크로스 직동 릴리프 밸브입니다. Ø21(BSPP 1/2") 접속, 최대 40 L/min, 350 bar이며 VMD40S 릴리프 카트리지를 사용합니다. 스프링은 10~90, 20~210, 70~350 bar 3종입니다.', 'Dual cross-line direct acting relief valve that flange-mounts directly onto the port face of a hydraulic motor. Ø21 (BSPP 1/2") connection, 40 L/min at up to 350 bar, using VMD40S relief cartridges. Three spring ranges: 10-90, 20-210 and 70-350 bar.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 40, "port_sizes": "Ø21 (BSPP 1/2\")", "setting_ranges": "10-90 / 20-210 / 70-350 bar (12 / 33 / 70 bar per turn)", "mounting_style": "motor_flange", "motor_compatibility": "Hydraulic motors with Ø21 port interface", "relief_cartridge": "VMD40S"}'::jsonb, true, 3160, 'dcv 안티쇼크 밸브 (플랜지형) dcv dual cross-line anti-shock valve (flanged) 모터 플랜지 장착형 더블 크로스 릴리프 밸브, ø21(bspp 1/2"), 350 bar, 40 l/min motor flange-mounted dual cross-line relief valve, ø21 (bspp 1/2"), 350 bar, 40 l/min dcv oleoweb s.r.l. 안티쇼크 밸브 (더블 크로스 릴리프) anti-shock valves (dual cross-line relief) 350 40 ø21 (bspp 1/2") 10-90 / 20-210 / 70-350 bar (12 / 33 / 70 bar per turn) motor_flange 모터 플랜지 motor flange hydraulic motors with ø21 port interface vmd40s')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-dcvb', 'DCVB', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DCVB 유압 모터용 더블 카운터밸런스 밸브 (OMP/OMR)', 'DCVB Double Counterbalance Valve for OMP-OMR Motors, Open Center', 'OMP·OMR 오비탈 모터 직결형 오픈 센터용 더블 카운터밸런스 밸브', 'Open-center double counterbalance valve for direct mounting on OMP/OMR orbital motors', 'DCVB는 OMP·OMR 계열 오비탈 유압 모터에 직접 장착하는 오픈 센터용 더블 카운터밸런스 밸브로, 모터의 양방향 하중 제어에 사용됩니다. BSPP 1/2 포트, 최대 유량 60 L/min, 최대 압력 350 bar이며 스프링 설정 범위 30~210 bar 또는 60~350 bar를 제공합니다.', 'The DCVB is a double counterbalance valve for open-center systems, mounted directly on OMP/OMR orbital hydraulic motors for bidirectional load control. BSPP 1/2 ports, 60 L/min max flow and 350 bar max pressure, with 30-210 bar or 60-350 bar spring setting ranges.',
  '{"valve_type": "double_counterbalance", "center_type": "open_center", "mounting": "모터 직결 플랜지 (OMP/OMR motor mounted)", "port_sizes": "BSPP 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 3170, 'dcvb 유압 모터용 더블 카운터밸런스 밸브 (omp/omr) dcvb double counterbalance valve for omp-omr motors, open center omp·omr 오비탈 모터 직결형 오픈 센터용 더블 카운터밸런스 밸브 open-center double counterbalance valve for direct mounting on omp/omr orbital motors dcvb oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves double_counterbalance 더블 카운터밸런스 double counterbalance open_center 오픈 센터 open center 모터 직결 플랜지 (omp/omr motor mounted) bspp 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ddf3', 'DDF3', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DDF3 3웨이 유량 전환 밸브 (BSPP)', 'DDF3 3-Way Flow Diverters (BSPP)', '수동 3웨이 디버터, BSPP 1/4~1, 60~200l/min, 최대 350bar', 'Manual 3-way diverters, BSPP 1/4-1, 60-200 l/min, up to 350 bar', '레버 조작식 수동 3웨이 유량 전환 밸브입니다. BSPP 1/4~1 사이즈에서 최대 유량 60~200l/min, 최대 압력 350bar(1인치 300bar)입니다. 오픈 센터(A)/클로즈드 센터(B) 회로를 선택할 수 있습니다.', 'Lever-operated manual 3-way flow diverters. Sizes BSPP 1/4 to 1 with maximum flows of 60 to 200 l/min and 350 bar maximum pressure (300 bar for the 1 inch size). Open centre (A) or closed centre (B) circuits.',
  '{"diverter_type": "manual", "ways": "3", "thread_standard": "bspp", "port_sizes": "BSPP 1/4, 3/8, 1/2, 3/4, 1", "max_flow_lpm": "60-200 by size", "max_pressure_bar": 350, "circuit_options": "Open centre (A) / Closed centre (B)", "weight_kg": "0.8-2.5"}'::jsonb, true, 3180, 'ddf3 3웨이 유량 전환 밸브 (bspp) ddf3 3-way flow diverters (bspp) 수동 3웨이 디버터, bspp 1/4~1, 60~200l/min, 최대 350bar manual 3-way diverters, bspp 1/4-1, 60-200 l/min, up to 350 bar ddf3 oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters manual 수동 레버식 manual lever 3 bspp bspp bspp bspp 1/4, 3/8, 1/2, 3/4, 1 60-200 by size 350 open centre (a) / closed centre (b) 0.8-2.5')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ddf3sae', 'DDF3SAE', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DDF3SAE 3웨이 유량 전환 밸브 (SAE)', 'DDF3SAE 3-Way Flow Diverters (SAE)', 'SAE 나사 수동 3웨이 디버터, 60~200l/min, 최대 350bar', 'SAE-threaded manual 3-way diverters, 60-200 l/min, up to 350 bar', 'SAE 나사(3/4-16UNF~1-5/16-12UN) 포트 사양의 수동 3웨이 유량 전환 밸브입니다. 최대 유량 60~200l/min, 최대 압력 350bar(SAE16 300bar)이며 오픈/클로즈드 센터 회로를 선택할 수 있습니다.', 'Manual 3-way flow diverters with SAE threaded ports (3/4-16UNF to 1-5/16-12UN). Maximum flows 60 to 200 l/min, maximum pressure 350 bar (300 bar for SAE16), with open or closed centre circuits.',
  '{"diverter_type": "manual", "ways": "3", "thread_standard": "sae_unf", "port_sizes": "3/4-16UNF, 7/8-14UNF, 1-1/16-12UN, 1-5/16-12UN", "max_flow_lpm": "60-200 by size", "max_pressure_bar": 350, "circuit_options": "Open centre (A) / Closed centre (B)", "weight_kg": "0.8-2.2"}'::jsonb, true, 3190, 'ddf3sae 3웨이 유량 전환 밸브 (sae) ddf3sae 3-way flow diverters (sae) sae 나사 수동 3웨이 디버터, 60~200l/min, 최대 350bar sae-threaded manual 3-way diverters, 60-200 l/min, up to 350 bar ddf3sae oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters manual 수동 레버식 manual lever 3 sae_unf sae (unf/un) sae (unf/un) 3/4-16unf, 7/8-14unf, 1-1/16-12un, 1-5/16-12un 60-200 by size 350 open centre (a) / closed centre (b) 0.8-2.2')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ddf6', 'DDF6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DDF6 6웨이 유량 전환 밸브 (BSPP)', 'DDF6 6-Way Flow Diverters (BSPP)', '수동 6웨이 디버터, BSPP 1/4~1, 최대 350bar', 'Manual 6-way diverters, BSPP 1/4-1, up to 350 bar', '복동 회로(2라인)를 동시에 전환하는 수동 6웨이 유량 전환 밸브입니다. BSPP 1/4~1 사이즈에서 라인당 최대 60~200l/min, 최대 압력 350bar(1인치 300bar)입니다. 오픈/클로즈드 센터 회로를 선택할 수 있습니다.', 'Manual 6-way flow diverters switching two lines simultaneously for double acting circuits. Sizes BSPP 1/4 to 1 with 60-200 l/min per line and 350 bar maximum pressure (300 bar for 1 inch). Open or closed centre circuits.',
  '{"diverter_type": "manual", "ways": "6", "thread_standard": "bspp", "port_sizes": "BSPP 1/4, 3/8, 1/2, 3/4, 1", "max_flow_lpm": "60+60 to 200+200 by size", "max_pressure_bar": 350, "circuit_options": "Open centre (A) / Closed centre (B)", "weight_kg": "1.6-5.3"}'::jsonb, true, 3200, 'ddf6 6웨이 유량 전환 밸브 (bspp) ddf6 6-way flow diverters (bspp) 수동 6웨이 디버터, bspp 1/4~1, 최대 350bar manual 6-way diverters, bspp 1/4-1, up to 350 bar ddf6 oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters manual 수동 레버식 manual lever 6 bspp bspp bspp bspp 1/4, 3/8, 1/2, 3/4, 1 60+60 to 200+200 by size 350 open centre (a) / closed centre (b) 1.6-5.3')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ddf6sae', 'DDF6SAE', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DDF6SAE 6웨이 유량 전환 밸브 (SAE)', 'DDF6SAE 6-Way Flow Diverters (SAE)', 'SAE 나사 수동 6웨이 디버터, 최대 350bar', 'SAE-threaded manual 6-way diverters, up to 350 bar', 'SAE 나사(3/4-16UNF~1-5/16-12UN) 포트 사양의 수동 6웨이 유량 전환 밸브입니다. 라인당 최대 60~200l/min, 최대 압력 350bar(SAE16 300bar)이며 오픈/클로즈드 센터 회로를 선택할 수 있습니다.', 'Manual 6-way flow diverters with SAE threaded ports (3/4-16UNF to 1-5/16-12UN). Per-line flows of 60 to 200 l/min and 350 bar maximum pressure (300 bar for SAE16), with open or closed centre circuits.',
  '{"diverter_type": "manual", "ways": "6", "thread_standard": "sae_unf", "port_sizes": "3/4-16UNF, 7/8-14UNF, 1-1/16-12UN, 1-5/16-12UN", "max_flow_lpm": "60+60 to 200+200 by size", "max_pressure_bar": 350, "circuit_options": "Open centre (A) / Closed centre (B)", "weight_kg": "1.5-5.3"}'::jsonb, true, 3210, 'ddf6sae 6웨이 유량 전환 밸브 (sae) ddf6sae 6-way flow diverters (sae) sae 나사 수동 6웨이 디버터, 최대 350bar sae-threaded manual 6-way diverters, up to 350 bar ddf6sae oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters manual 수동 레버식 manual lever 6 sae_unf sae (unf/un) sae (unf/un) 3/4-16unf, 7/8-14unf, 1-1/16-12un, 1-5/16-12un 60+60 to 200+200 by size 350 open centre (a) / closed centre (b) 1.5-5.3')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ddfa3', 'DDFA3', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DDFA3 고압 3웨이 유량 전환 밸브', 'DDFA3 High Pressure 3-Way Flow Diverters', '고압 수동 3웨이 디버터, BSPP 1/4~1, 최대 500bar', 'High pressure manual 3-way diverters, BSPP 1/4-1, up to 500 bar', '최대 500bar까지 사용 가능한 고압형 수동 3웨이 유량 전환 밸브입니다. BSPP 1/4~1 사이즈에서 최대 유량 40~180l/min을 지원하며 오픈 센터(A)/클로즈드 센터(B) 회로를 선택할 수 있습니다.', 'High pressure manual 3-way flow diverters rated up to 500 bar. Sizes from BSPP 1/4 to 1 with maximum flows of 40 to 180 l/min, available in open centre (A) or closed centre (B) circuits.',
  '{"diverter_type": "manual", "ways": "3", "thread_standard": "bspp", "port_sizes": "BSPP 1/4, 3/8, 1/2, 3/4, 1", "max_flow_lpm": "40-180 by size", "max_pressure_bar": 500, "circuit_options": "Open centre (A) / Closed centre (B)", "weight_kg": "0.9-2.33"}'::jsonb, true, 3220, 'ddfa3 고압 3웨이 유량 전환 밸브 ddfa3 high pressure 3-way flow diverters 고압 수동 3웨이 디버터, bspp 1/4~1, 최대 500bar high pressure manual 3-way diverters, bspp 1/4-1, up to 500 bar ddfa3 oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters manual 수동 레버식 manual lever 3 bspp bspp bspp bspp 1/4, 3/8, 1/2, 3/4, 1 40-180 by size 500 open centre (a) / closed centre (b) 0.9-2.33')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ddfa6', 'DDFA6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DDFA6 고압 6웨이 유량 전환 밸브', 'DDFA6 High Pressure 6-Way Flow Diverters', '고압 수동 6웨이 디버터, BSPP 1/4~1/2, 최대 500bar', 'High pressure manual 6-way diverters, BSPP 1/4-1/2, up to 500 bar', '2개 스테이지로 구성된 고압형 수동 6웨이 유량 전환 밸브입니다. BSPP 1/4~1/2 사이즈에서 스테이지당 최대 40~60l/min, 최대 압력 500bar입니다. 오픈 센터(A)/클로즈드 센터(B) 회로를 선택할 수 있습니다.', 'High pressure manual 6-way flow diverters with two stages. Sizes BSPP 1/4 to 1/2 with 40-60 l/min per stage and a 500 bar maximum pressure. Available in open centre (A) or closed centre (B) circuits.',
  '{"diverter_type": "manual", "ways": "6", "thread_standard": "bspp", "port_sizes": "BSPP 1/4, 3/8, 1/2", "max_flow_lpm": "40-60 per stage", "max_pressure_bar": 500, "circuit_options": "Open centre (A) / Closed centre (B)", "weight_kg": "1.94"}'::jsonb, true, 3230, 'ddfa6 고압 6웨이 유량 전환 밸브 ddfa6 high pressure 6-way flow diverters 고압 수동 6웨이 디버터, bspp 1/4~1/2, 최대 500bar high pressure manual 6-way diverters, bspp 1/4-1/2, up to 500 bar ddfa6 oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters manual 수동 레버식 manual lever 6 bspp bspp bspp bspp 1/4, 3/8, 1/2 40-60 per stage 500 open centre (a) / closed centre (b) 1.94')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-drf', 'DRF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DRF 유량 분배/합류 밸브', 'DRF Flow Divider/Combiner', '인라인 설치 방식의 유량 분배/합류 밸브로 최대 유량 40 L/min, 최대 압력 250 bar를 지원합니다.', 'Flow Divider/Combiner with in-line installation, rated for flows up to 40 L/min and pressures up to 250 bar.', 'DRF은(는) 이탈리아 Oleoweb의 유량 분배/합류 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 40 L/min, 최대 압력 250 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The DRF is a flow divider/combiner series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 40 L/min and pressures up to 250 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"regulator_type": "divider_combiner", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 40, "max_pressure_bar": 250}'::jsonb, true, 3240, 'drf 유량 분배/합류 밸브 drf flow divider/combiner 인라인 설치 방식의 유량 분배/합류 밸브로 최대 유량 40 l/min, 최대 압력 250 bar를 지원합니다. flow divider/combiner with in-line installation, rated for flows up to 40 l/min and pressures up to 250 bar. drf oleoweb s.r.l. 유량 제어 밸브 flow control valves 250 40 divider_combiner 유량 분배/합류 flow divider/combiner parts_in_body 바디 일체형 parts in body in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-drf10', 'DRF10', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DRF10 유량 분배/합류 밸브', 'DRF10 Flow Divider/Combiner Valve', '50:50 유량 분배·합류 밸브, 입력 2-40 L/min, 250 bar', '50:50 flow divider/combiner valve, inlet 2-40 L/min, 250 bar', '하나의 입력 유량을 두 액추에이터로 균등 분배하거나 역방향으로 합류시키는 스풀식 유량 분배/합류 밸브입니다. 입력 유량 범위 2~5, 3~10, 7~20, 15~40 L/min의 4개 등급이 있으며 최대 250 bar에서 사용합니다. P 포트와 U1/U2 포트는 BSPP 3/8" 또는 1/2"를 선택할 수 있습니다.', 'Spool-type flow divider/combiner splitting one inlet flow equally between two actuators, or recombining it in reverse. Four inlet flow ranges (2-5, 3-10, 7-20, 15-40 L/min) rated to 250 bar. Port P and ports U1/U2 can each be BSPP 3/8" or 1/2".',
  '{"max_pressure_bar": 250, "max_flow_lpm": 40, "port_sizes": "P, U1/U2: BSPP 3/8\" or 1/2\"", "thread_types": "BSPP", "control_type": "flow_divider_combiner", "pressure_compensated": true, "adjustment_type": "fixed", "controlled_flow_range": "Inlet ranges 2-5 / 3-10 / 7-20 / 15-40 L/min", "mounting_style": "in_line"}'::jsonb, true, 3250, 'drf10 유량 분배/합류 밸브 drf10 flow divider/combiner valve 50:50 유량 분배·합류 밸브, 입력 2-40 l/min, 250 bar 50:50 flow divider/combiner valve, inlet 2-40 l/min, 250 bar drf10 oleoweb s.r.l. 유량 제어 밸브 flow control valves 250 40 p, u1/u2: bspp 3/8" or 1/2" bspp flow_divider_combiner 유량 분배/합류 flow divider/combiner true fixed 고정(공장 설정) fixed inlet ranges 2-5 / 3-10 / 7-20 / 15-40 l/min in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ec-2', 'EC...2', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EC...2 2/2 솔레노이드 체크 밸브', 'EC...2 2/2 Solenoid Check Valve', '나사 삽입형 설치 방식의 2/2 솔레노이드 체크 밸브로 최대 유량 70 L/min, 최대 압력 350 bar를 지원합니다.', '2/2 Solenoid Check Valve with screwed-in installation, rated for flows up to 70 L/min and pressures up to 350 bar.', 'EC...2은(는) 이탈리아 Oleoweb의 2/2 솔레노이드 체크 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 70 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The EC...2 is a 2/2 solenoid check valve series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 70 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"valve_type": "check_2_2", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 70, "max_pressure_bar": 350}'::jsonb, true, 3260, 'ec...2 2/2 솔레노이드 체크 밸브 ec...2 2/2 solenoid check valve 나사 삽입형 설치 방식의 2/2 솔레노이드 체크 밸브로 최대 유량 70 l/min, 최대 압력 350 bar를 지원합니다. 2/2 solenoid check valve with screwed-in installation, rated for flows up to 70 l/min and pressures up to 350 bar. ec...2 oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 70 350 check_2_2 2/2 체크 2/2 check cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ec082', 'EC082', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EC082 SAE8 2웨이/2포지션 파일럿 작동식 솔레노이드 밸브', 'EC082 2-Way/2-Position SAE8 Solenoid Valve, Pilot Operated', 'SAE8 캐비티용 파일럿 작동식 2/2 솔레노이드 밸브 (40 L/min, 350 bar)', 'Pilot-operated 2/2 solenoid valve for SAE8 cavity (40 L/min, 350 bar)', 'EC082는 SAE 8/2 캐비티용 파일럿 작동식 2웨이/2포지션 솔레노이드 밸브입니다. 단방향(G)·양방향(F) 실행, 노멀 클로즈(C)·노멀 오픈(O) 회로를 조합할 수 있으며 최대 유량 40 L/min, 최대 압력 350 bar 사양입니다. 비상 조작은 없음(N)·나사식(V)·푸시식(K)·푸시&트위스트(T) 중 선택하고, 22 W 코일(12/24 VDC, 220 VAC)을 사용합니다.', 'The EC082 is a pilot-operated 2-way/2-position solenoid valve for SAE 8/2 cavities. Unidirectional (G) or bidirectional (F) executions combine with normally closed (C) or normally open (O) circuits; rated 40 L/min and 350 bar. Emergency override options are none (N), screw (V), push (K) or push-and-twist (T), with a 22 W coil in 12/24 VDC or 220 VAC.',
  '{"valve_function": "2_2", "actuation": "pilot_operated", "circuit_options": "NC / NO, 단방향(G) / 양방향(F)", "cavity": "SAE 8/2 (3/4-16 UNF)", "max_flow_lpm": 40, "max_pressure_bar": 350, "voltage_options": "12 VDC / 24 VDC / 220 VAC (50-60 Hz)", "coil_power": "22 W", "manual_override": "없음 / 나사식 / 푸시 / 푸시&트위스트", "seal_material": "NBR / Viton"}'::jsonb, true, 3270, 'ec082 sae8 2웨이/2포지션 파일럿 작동식 솔레노이드 밸브 ec082 2-way/2-position sae8 solenoid valve, pilot operated sae8 캐비티용 파일럿 작동식 2/2 솔레노이드 밸브 (40 l/min, 350 bar) pilot-operated 2/2 solenoid valve for sae8 cavity (40 l/min, 350 bar) ec082 oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 2_2 2웨이/2포지션 2-way/2-position pilot_operated 파일럿 작동식 pilot operated nc / no, 단방향(g) / 양방향(f) sae 8/2 (3/4-16 unf) 40 350 12 vdc / 24 vdc / 220 vac (50-60 hz) 22 w 없음 / 나사식 / 푸시 / 푸시&트위스트 nbr / viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ec082a', 'EC082A', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EC082A SAE8 2웨이/2포지션 직동식 솔레노이드 밸브', 'EC082A 2-Way/2-Position SAE8 Solenoid Valve, Direct Acting', 'SAE8 캐비티용 직동식 2/2 포핏 솔레노이드 밸브 (22 L/min, 210 bar)', 'Direct-acting 2/2 poppet solenoid valve for SAE8 cavity (22 L/min, 210 bar)', 'EC082A는 SAE 8/2 캐비티용 직동식 2웨이/2포지션 포핏 솔레노이드 밸브입니다. 노멀 클로즈(CNN), 노멀 오픈(ONN), 노멀 클로즈+나사식 비상 조작(CNV) 회로를 제공하며 최대 유량 22 L/min, 최대 압력 210 bar 사양입니다. NC/CNV형은 18 W, NO형은 22 W 코일을 사용하고 12/24 VDC 및 220 VAC 코일과 DIN 43650·Deutsch 커넥터를 선택할 수 있습니다.', 'The EC082A is a direct-acting 2-way/2-position poppet solenoid valve for SAE 8/2 cavities. Circuit options are normally closed (CNN), normally open (ONN) and normally closed with unscrew emergency (CNV). Rated 22 L/min and 210 bar; NC/CNV versions use an 18 W coil and NO versions a 22 W coil, available in 12/24 VDC and 220 VAC with DIN 43650 or Deutsch connectors.',
  '{"valve_function": "2_2", "actuation": "direct_acting", "circuit_options": "NC(CNN) / NO(ONN) / NC+비상(CNV)", "cavity": "SAE 8/2 (3/4-16 UNF)", "max_flow_lpm": 22, "max_pressure_bar": 210, "voltage_options": "12 VDC / 24 VDC / 220 VAC (50-60 Hz)", "coil_power": "18 W (CNN·CNV) / 22 W (ONN)", "manual_override": "나사식 비상 조작 (CNV, unscrew emergency)", "seal_material": "NBR / Viton"}'::jsonb, true, 3280, 'ec082a sae8 2웨이/2포지션 직동식 솔레노이드 밸브 ec082a 2-way/2-position sae8 solenoid valve, direct acting sae8 캐비티용 직동식 2/2 포핏 솔레노이드 밸브 (22 l/min, 210 bar) direct-acting 2/2 poppet solenoid valve for sae8 cavity (22 l/min, 210 bar) ec082a oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 2_2 2웨이/2포지션 2-way/2-position direct_acting 직동식 direct acting nc(cnn) / no(onn) / nc+비상(cnv) sae 8/2 (3/4-16 unf) 22 210 12 vdc / 24 vdc / 220 vac (50-60 hz) 18 w (cnn·cnv) / 22 w (onn) 나사식 비상 조작 (cnv, unscrew emergency) nbr / viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ec102', 'EC102', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EC102 SAE10 2웨이/2포지션 파일럿 작동식 솔레노이드 밸브', 'EC102 2-Way/2-Position SAE10 Solenoid Valve, Pilot Operated', 'SAE10 캐비티용 파일럿 작동식 2/2 솔레노이드 밸브 (70 L/min, 350 bar)', 'Pilot-operated 2/2 solenoid valve for SAE10 cavity (70 L/min, 350 bar)', 'EC102는 SAE 10/2 캐비티용 파일럿 작동식 2웨이/2포지션 솔레노이드 밸브입니다. 단방향(G)·양방향(F) 실행과 노멀 클로즈·노멀 오픈 회로를 제공하며 최대 유량 70 L/min, 최대 압력 350 bar 사양입니다. 비상 조작(나사식/푸시/푸시&트위스트) 옵션과 22 W 코일(12/24 VDC, 220 VAC)을 지원합니다.', 'The EC102 is a pilot-operated 2-way/2-position solenoid valve for SAE 10/2 cavities. Unidirectional (G) and bidirectional (F) executions with normally closed or normally open circuits; rated 70 L/min and 350 bar. Emergency override options (screw/push/push-and-twist) and 22 W coils in 12/24 VDC or 220 VAC.',
  '{"valve_function": "2_2", "actuation": "pilot_operated", "circuit_options": "NC / NO, 단방향(G) / 양방향(F)", "cavity": "SAE 10/2 (7/8-14 UNF)", "max_flow_lpm": 70, "max_pressure_bar": 350, "voltage_options": "12 VDC / 24 VDC / 220 VAC (50-60 Hz)", "coil_power": "22 W", "manual_override": "없음 / 나사식 / 푸시 / 푸시&트위스트", "seal_material": "NBR / Viton"}'::jsonb, true, 3290, 'ec102 sae10 2웨이/2포지션 파일럿 작동식 솔레노이드 밸브 ec102 2-way/2-position sae10 solenoid valve, pilot operated sae10 캐비티용 파일럿 작동식 2/2 솔레노이드 밸브 (70 l/min, 350 bar) pilot-operated 2/2 solenoid valve for sae10 cavity (70 l/min, 350 bar) ec102 oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 2_2 2웨이/2포지션 2-way/2-position pilot_operated 파일럿 작동식 pilot operated nc / no, 단방향(g) / 양방향(f) sae 10/2 (7/8-14 unf) 70 350 12 vdc / 24 vdc / 220 vac (50-60 hz) 22 w 없음 / 나사식 / 푸시 / 푸시&트위스트 nbr / viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ed-2', 'ED...2', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ED...2 2/2 더블 실링 솔레노이드 체크 밸브', 'ED...2 2/2 Double Sealing Solenoid Check Valve', '나사 삽입형 설치 방식의 2/2 더블 실링 솔레노이드 체크 밸브로 최대 유량 40 L/min, 최대 압력 350 bar를 지원합니다.', '2/2 Double Sealing Solenoid Check Valve with screwed-in installation, rated for flows up to 40 L/min and pressures up to 350 bar.', 'ED...2은(는) 이탈리아 Oleoweb의 2/2 더블 실링 솔레노이드 체크 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 40 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The ED...2 is a 2/2 double sealing solenoid check valve series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 40 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"valve_type": "check_2_2_double_sealing", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 40, "max_pressure_bar": 350}'::jsonb, true, 3300, 'ed...2 2/2 더블 실링 솔레노이드 체크 밸브 ed...2 2/2 double sealing solenoid check valve 나사 삽입형 설치 방식의 2/2 더블 실링 솔레노이드 체크 밸브로 최대 유량 40 l/min, 최대 압력 350 bar를 지원합니다. 2/2 double sealing solenoid check valve with screwed-in installation, rated for flows up to 40 l/min and pressures up to 350 bar. ed...2 oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 40 350 check_2_2_double_sealing 2/2 더블 실링 체크 2/2 check, double sealing cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ed082a', 'ED082A', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ED082A SAE8 더블 실링 직동식 솔레노이드 밸브', 'ED082A 2-Way/2-Position SAE8 Double Sealing Solenoid Valve, Direct Acting', '양방향 기밀(더블 실링) 구조의 SAE8 직동식 2/2 솔레노이드 밸브', 'Direct-acting 2/2 SAE8 solenoid valve with double (bidirectional) sealing', 'ED082A는 양방향 기밀이 가능한 더블 실링 구조의 SAE 8/2 캐비티용 직동식 2웨이/2포지션 솔레노이드 밸브입니다. 노멀 클로즈+비상 조작(CNP) 회로로 제공되며 최대 유량 22 L/min, 최대 압력 210 bar 사양입니다. 22 W 코일을 사용하고 12/24 VDC, 220 VAC 및 DIN·Deutsch 커넥터를 지원합니다.', 'The ED082A is a direct-acting 2-way/2-position solenoid valve for SAE 8/2 cavities with double sealing for bidirectional tightness. Supplied as normally closed with emergency override (CNP), rated 22 L/min and 210 bar. Uses a 22 W coil available in 12/24 VDC and 220 VAC with DIN or Deutsch connectors.',
  '{"valve_function": "2_2", "actuation": "direct_acting", "circuit_options": "NC+비상 (CNP)", "cavity": "SAE 8/2 (3/4-16 UNF)", "max_flow_lpm": 22, "max_pressure_bar": 210, "voltage_options": "12 VDC / 24 VDC / 220 VAC (50-60 Hz)", "coil_power": "22 W", "manual_override": "비상 조작 포함 (CNP)", "seal_material": "NBR / Viton"}'::jsonb, true, 3310, 'ed082a sae8 더블 실링 직동식 솔레노이드 밸브 ed082a 2-way/2-position sae8 double sealing solenoid valve, direct acting 양방향 기밀(더블 실링) 구조의 sae8 직동식 2/2 솔레노이드 밸브 direct-acting 2/2 sae8 solenoid valve with double (bidirectional) sealing ed082a oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 2_2 2웨이/2포지션 2-way/2-position direct_acting 직동식 direct acting nc+비상 (cnp) sae 8/2 (3/4-16 unf) 22 210 12 vdc / 24 vdc / 220 vac (50-60 hz) 22 w 비상 조작 포함 (cnp) nbr / viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ed082f', 'ED082F', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ED082F SAE8 더블 실링 파일럿 작동식 솔레노이드 밸브', 'ED082F 2-Way/2-Position SAE8 Double Sealing Solenoid Valve, Pilot Operated', '더블 실링 구조의 SAE8 파일럿 작동식 2/2 솔레노이드 밸브 (40 L/min, 350 bar)', 'Pilot-operated 2/2 SAE8 solenoid valve with double sealing (40 L/min, 350 bar)', 'ED082F는 양방향 기밀이 가능한 더블 실링 구조의 SAE 8/2 캐비티용 파일럿 작동식 2웨이/2포지션 솔레노이드 밸브입니다. 노멀 클로즈·노멀 오픈 회로, 최대 유량 40 L/min, 최대 압력 350 bar 사양이며 비상 조작(나사식/푸시/푸시&트위스트) 옵션과 22 W 코일(12/24 VDC, 220 VAC)을 지원합니다.', 'The ED082F is a pilot-operated 2-way/2-position solenoid valve for SAE 8/2 cavities with double sealing for bidirectional tightness. Normally closed or normally open circuits, rated 40 L/min and 350 bar, with emergency override options (screw/push/push-and-twist) and 22 W coils in 12/24 VDC or 220 VAC.',
  '{"valve_function": "2_2", "actuation": "pilot_operated", "circuit_options": "NC / NO (더블 실링)", "cavity": "SAE 8/2 (3/4-16 UNF)", "max_flow_lpm": 40, "max_pressure_bar": 350, "voltage_options": "12 VDC / 24 VDC / 220 VAC (50-60 Hz)", "coil_power": "22 W", "manual_override": "없음 / 나사식 / 푸시 / 푸시&트위스트", "seal_material": "NBR / Viton"}'::jsonb, true, 3320, 'ed082f sae8 더블 실링 파일럿 작동식 솔레노이드 밸브 ed082f 2-way/2-position sae8 double sealing solenoid valve, pilot operated 더블 실링 구조의 sae8 파일럿 작동식 2/2 솔레노이드 밸브 (40 l/min, 350 bar) pilot-operated 2/2 sae8 solenoid valve with double sealing (40 l/min, 350 bar) ed082f oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 2_2 2웨이/2포지션 2-way/2-position pilot_operated 파일럿 작동식 pilot operated nc / no (더블 실링) sae 8/2 (3/4-16 unf) 40 350 12 vdc / 24 vdc / 220 vac (50-60 hz) 22 w 없음 / 나사식 / 푸시 / 푸시&트위스트 nbr / viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ed102f', 'ED102F', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ED102F SAE10 더블 실링 파일럿 작동식 솔레노이드 밸브', 'ED102F 2-Way/2-Position SAE10 Double Sealing Solenoid Valve, Pilot Operated', '더블 실링 구조의 SAE10 파일럿 작동식 2/2 솔레노이드 밸브 (70 L/min, 350 bar)', 'Pilot-operated 2/2 SAE10 solenoid valve with double sealing (70 L/min, 350 bar)', 'ED102F는 더블 실링 구조의 SAE 10/2 캐비티용 파일럿 작동식 2웨이/2포지션 솔레노이드 밸브입니다. 노멀 클로즈·노멀 오픈 회로, 최대 유량 70 L/min, 최대 압력 350 bar 사양이며 비상 조작 옵션과 22 W 코일(12/24 VDC, 220 VAC)을 지원합니다.', 'The ED102F is a pilot-operated 2-way/2-position solenoid valve for SAE 10/2 cavities with double sealing. Normally closed or normally open circuits, rated 70 L/min and 350 bar, with emergency override options and 22 W coils in 12/24 VDC or 220 VAC.',
  '{"valve_function": "2_2", "actuation": "pilot_operated", "circuit_options": "NC / NO (더블 실링)", "cavity": "SAE 10/2 (7/8-14 UNF)", "max_flow_lpm": 70, "max_pressure_bar": 350, "voltage_options": "12 VDC / 24 VDC / 220 VAC (50-60 Hz)", "coil_power": "22 W", "manual_override": "없음 / 나사식 / 푸시 / 푸시&트위스트", "seal_material": "NBR / Viton"}'::jsonb, true, 3330, 'ed102f sae10 더블 실링 파일럿 작동식 솔레노이드 밸브 ed102f 2-way/2-position sae10 double sealing solenoid valve, pilot operated 더블 실링 구조의 sae10 파일럿 작동식 2/2 솔레노이드 밸브 (70 l/min, 350 bar) pilot-operated 2/2 sae10 solenoid valve with double sealing (70 l/min, 350 bar) ed102f oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 2_2 2웨이/2포지션 2-way/2-position pilot_operated 파일럿 작동식 pilot operated nc / no (더블 실링) sae 10/2 (7/8-14 unf) 70 350 12 vdc / 24 vdc / 220 vac (50-60 hz) 22 w 없음 / 나사식 / 푸시 / 푸시&트위스트 nbr / viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-efd25-10', 'EFD25/10', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EFD25/10 10-way/2-position 전자식 유량 전환 밸브', 'EFD25/10 10-Way/2-Position Solenoid Flow Diverter', '인라인 설치 방식의 10-way/2-position 전자식 유량 전환 밸브로 최대 유량 50 L/min, 최대 압력 310 bar를 지원합니다.', '10-Way/2-Position Solenoid Flow Diverter with in-line installation, rated for flows up to 50 L/min and pressures up to 310 bar.', 'EFD25/10은(는) 이탈리아 Oleoweb의 10-way/2-position 전자식 유량 전환 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 50 L/min, 최대 압력 310 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The EFD25/10 is a 10-way/2-position solenoid flow diverter series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 50 L/min and pressures up to 310 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"ways": 10, "positions": 2, "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 50, "max_pressure_bar": 310}'::jsonb, true, 3340, 'efd25/10 10-way/2-position 전자식 유량 전환 밸브 efd25/10 10-way/2-position solenoid flow diverter 인라인 설치 방식의 10-way/2-position 전자식 유량 전환 밸브로 최대 유량 50 l/min, 최대 압력 310 bar를 지원합니다. 10-way/2-position solenoid flow diverter with in-line installation, rated for flows up to 50 l/min and pressures up to 310 bar. efd25/10 oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters 10 50 310 2 parts_in_body 바디 일체형 parts in body in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-efd25-6', 'EFD25/6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EFD25/6 6-way/2-position 전자식 유량 전환 밸브', 'EFD25/6 6-Way/2-Position Solenoid Flow Diverter', '인라인 설치 방식의 6-way/2-position 전자식 유량 전환 밸브로 최대 유량 50 L/min, 최대 압력 310 bar를 지원합니다.', '6-Way/2-Position Solenoid Flow Diverter with in-line installation, rated for flows up to 50 L/min and pressures up to 310 bar.', 'EFD25/6은(는) 이탈리아 Oleoweb의 6-way/2-position 전자식 유량 전환 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 50 L/min, 최대 압력 310 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The EFD25/6 is a 6-way/2-position solenoid flow diverter series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 50 L/min and pressures up to 310 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"ways": 6, "positions": 2, "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 50, "max_pressure_bar": 310}'::jsonb, true, 3350, 'efd25/6 6-way/2-position 전자식 유량 전환 밸브 efd25/6 6-way/2-position solenoid flow diverter 인라인 설치 방식의 6-way/2-position 전자식 유량 전환 밸브로 최대 유량 50 l/min, 최대 압력 310 bar를 지원합니다. 6-way/2-position solenoid flow diverter with in-line installation, rated for flows up to 50 l/min and pressures up to 310 bar. efd25/6 oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters 6 50 310 2 parts_in_body 바디 일체형 parts in body in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-efd25-8', 'EFD25/8', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EFD25/8 8-way/2-position 전자식 유량 전환 밸브', 'EFD25/8 8-Way/2-Position Solenoid Flow Diverter', '인라인 설치 방식의 8-way/2-position 전자식 유량 전환 밸브로 최대 유량 50 L/min, 최대 압력 310 bar를 지원합니다.', '8-Way/2-Position Solenoid Flow Diverter with in-line installation, rated for flows up to 50 L/min and pressures up to 310 bar.', 'EFD25/8은(는) 이탈리아 Oleoweb의 8-way/2-position 전자식 유량 전환 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 50 L/min, 최대 압력 310 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The EFD25/8 is a 8-way/2-position solenoid flow diverter series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 50 L/min and pressures up to 310 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"ways": 8, "positions": 2, "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 50, "max_pressure_bar": 310}'::jsonb, true, 3360, 'efd25/8 8-way/2-position 전자식 유량 전환 밸브 efd25/8 8-way/2-position solenoid flow diverter 인라인 설치 방식의 8-way/2-position 전자식 유량 전환 밸브로 최대 유량 50 l/min, 최대 압력 310 bar를 지원합니다. 8-way/2-position solenoid flow diverter with in-line installation, rated for flows up to 50 l/min and pressures up to 310 bar. efd25/8 oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters 8 50 310 2 parts_in_body 바디 일체형 parts in body in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-efd25a', 'EFD25A', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EFD25A 고출력 전기식 모듈형 유량 전환 밸브', 'EFD25A High Power Electric Flow Diverter (Stackable)', '6/8/10웨이 스택형 전기 디버터, 총 50l/min, 최대 310bar', 'Stackable 6/8/10-way electric diverter, 50 l/min total, up to 310 bar', '6/8/10웨이로 스택 구성이 가능한 고출력 솔레노이드 유량 전환 밸브입니다. 총 유량 50l/min(라인당 25l/min), 최대 압력 310bar(드레인 사용 시)이며 포트는 BSPP 1/4입니다. 12/24VDC 40W 코일(DIN 46350 또는 DEUTSCH DT4 커넥터), 클로즈드/Y 트랜지션 스풀, 내부/외부 드레인, 수동 비상 핀 옵션을 지원합니다.', 'High-power stackable solenoid flow diverter configurable with 6, 8 or 10 ways. Total flow 50 l/min (25 l/min per line), maximum pressure 310 bar with drainage, BSPP 1/4 ports. 12/24 VDC 40 W coils (DIN 46350 or DEUTSCH DT4), closed or Y transition spools, internal/external drain and manual emergency pin options.',
  '{"diverter_type": "electric_modular", "ways": "6 / 8 / 10", "thread_standard": "bspp", "port_sizes": "BSPP 1/4", "max_flow_lpm": "50 total (25 per line)", "max_pressure_bar": 310, "circuit_options": "Closed or Y transition spool, internal/external drain", "supply_voltage": "12 / 24 VDC, 40 W (DIN 46350 / DEUTSCH DT4)", "weight_kg": "1.4 per section"}'::jsonb, true, 3370, 'efd25a 고출력 전기식 모듈형 유량 전환 밸브 efd25a high power electric flow diverter (stackable) 6/8/10웨이 스택형 전기 디버터, 총 50l/min, 최대 310bar stackable 6/8/10-way electric diverter, 50 l/min total, up to 310 bar efd25a oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters electric_modular 전기식 모듈형 electric stackable 6 / 8 / 10 bspp bspp bspp bspp 1/4 50 total (25 per line) 310 closed or y transition spool, internal/external drain 12 / 24 vdc, 40 w (din 46350 / deutsch dt4) 1.4 per section')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-efd25b', 'EFD25B', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EFD25B 저출력 전기식 모듈형 유량 전환 밸브', 'EFD25B Low Power Electric Flow Diverter (Stackable)', '6/8/10웨이 스택형 전기 디버터, 총 25l/min, 최대 310bar', 'Stackable 6/8/10-way electric diverter, 25 l/min total, up to 310 bar', '6/8/10웨이 스택 구성의 저출력(27W) 솔레노이드 유량 전환 밸브입니다. 총 유량 25l/min(라인당 12.5l/min), 최대 압력 310bar(드레인 사용 시)이며 포트는 BSPP 1/4입니다. 12/24VDC 코일(DIN 46350 또는 DEUTSCH DT4), 클로즈드/Y 트랜지션 스풀, 내부/외부 드레인, 수동 비상 핀 옵션을 지원합니다.', 'Low-power (27 W) stackable solenoid flow diverter configurable with 6, 8 or 10 ways. Total flow 25 l/min (12.5 l/min per line), maximum pressure 310 bar with drainage, BSPP 1/4 ports. 12/24 VDC coils (DIN 46350 or DEUTSCH DT4), closed or Y transition spools, internal/external drain and manual emergency pin options.',
  '{"diverter_type": "electric_modular", "ways": "6 / 8 / 10", "thread_standard": "bspp", "port_sizes": "BSPP 1/4", "max_flow_lpm": "25 total (12.5 per line)", "max_pressure_bar": 310, "circuit_options": "Closed or Y transition spool, internal/external drain", "supply_voltage": "12 / 24 VDC, 27 W (DIN 46350 / DEUTSCH DT4)", "weight_kg": "1.3 per section"}'::jsonb, true, 3380, 'efd25b 저출력 전기식 모듈형 유량 전환 밸브 efd25b low power electric flow diverter (stackable) 6/8/10웨이 스택형 전기 디버터, 총 25l/min, 최대 310bar stackable 6/8/10-way electric diverter, 25 l/min total, up to 310 bar efd25b oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters electric_modular 전기식 모듈형 electric stackable 6 / 8 / 10 bspp bspp bspp bspp 1/4 25 total (12.5 per line) 310 closed or y transition spool, internal/external drain 12 / 24 vdc, 27 w (din 46350 / deutsch dt4) 1.3 per section')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-es-3', 'ES...3', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ES...3 3/2 솔레노이드 스풀 밸브', 'ES...3 3/2 Solenoid Spool Valve', '나사 삽입형 설치 방식의 3/2 솔레노이드 스풀 밸브로 최대 유량 15 L/min, 최대 압력 250 bar를 지원합니다.', '3/2 Solenoid Spool Valve with screwed-in installation, rated for flows up to 15 L/min and pressures up to 250 bar.', 'ES...3은(는) 이탈리아 Oleoweb의 3/2 솔레노이드 스풀 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 15 L/min, 최대 압력 250 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The ES...3 is a 3/2 solenoid spool valve series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 15 L/min and pressures up to 250 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"valve_type": "spool_3_2", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 15, "max_pressure_bar": 250}'::jsonb, true, 3390, 'es...3 3/2 솔레노이드 스풀 밸브 es...3 3/2 solenoid spool valve 나사 삽입형 설치 방식의 3/2 솔레노이드 스풀 밸브로 최대 유량 15 l/min, 최대 압력 250 bar를 지원합니다. 3/2 solenoid spool valve with screwed-in installation, rated for flows up to 15 l/min and pressures up to 250 bar. es...3 oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 15 250 spool_3_2 3/2 스풀 3/2 spool cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-es-4', 'ES...4', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ES...4 4/3 솔레노이드 스풀 밸브', 'ES...4 4/3 Solenoid Spool Valve', '나사 삽입형 설치 방식의 4/3 솔레노이드 스풀 밸브로 최대 유량 25 L/min, 최대 압력 250 bar를 지원합니다.', '4/3 Solenoid Spool Valve with screwed-in installation, rated for flows up to 25 L/min and pressures up to 250 bar.', 'ES...4은(는) 이탈리아 Oleoweb의 4/3 솔레노이드 스풀 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 25 L/min, 최대 압력 250 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The ES...4 is a 4/3 solenoid spool valve series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 25 L/min and pressures up to 250 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"valve_type": "spool_4_3", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 25, "max_pressure_bar": 250}'::jsonb, true, 3400, 'es...4 4/3 솔레노이드 스풀 밸브 es...4 4/3 solenoid spool valve 나사 삽입형 설치 방식의 4/3 솔레노이드 스풀 밸브로 최대 유량 25 l/min, 최대 압력 250 bar를 지원합니다. 4/3 solenoid spool valve with screwed-in installation, rated for flows up to 25 l/min and pressures up to 250 bar. es...4 oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 25 250 spool_4_3 4/3 스풀 4/3 spool cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-es083f', 'ES083F', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ES083F SAE8 3웨이/2포지션 스풀형 솔레노이드 밸브', 'ES083F 3-Way/2-Position SAE8 Electric Spool Valve, Direct Acting', '4가지 스풀 옵션의 SAE8 직동식 3/2 스풀 솔레노이드 밸브 (15 L/min, 250 bar)', 'Direct-acting 3/2 spool solenoid valve for SAE8 cavity with 4 spool options (15 L/min, 250 bar)', 'ES083F는 SAE 8/3 캐비티용 직동식 3웨이/2포지션 스풀 솔레노이드 밸브입니다. 4가지 스풀 구성(Spool 1~4)을 선택할 수 있으며 최대 유량 15 L/min, 최대 압력 250 bar 사양입니다. 푸시&트위스트 비상 조작 옵션, NBR/Viton 시일, 22 W 코일(12/24 VDC, 220 VAC)을 지원합니다.', 'The ES083F is a direct-acting 3-way/2-position spool solenoid valve for SAE 8/3 cavities. Four spool configurations (Spool 1-4) are available, rated 15 L/min and 250 bar. Options include push-and-twist emergency override, NBR/Viton seals and 22 W coils in 12/24 VDC or 220 VAC.',
  '{"valve_function": "3_2", "actuation": "direct_acting", "circuit_options": "스풀 1 / 2 / 3 / 4", "cavity": "SAE 8/3 (3/4-16 UNF)", "max_flow_lpm": 15, "max_pressure_bar": 250, "voltage_options": "12 VDC / 24 VDC / 220 VAC (50-60 Hz)", "coil_power": "22 W", "manual_override": "없음 / 푸시&트위스트", "seal_material": "NBR / Viton"}'::jsonb, true, 3410, 'es083f sae8 3웨이/2포지션 스풀형 솔레노이드 밸브 es083f 3-way/2-position sae8 electric spool valve, direct acting 4가지 스풀 옵션의 sae8 직동식 3/2 스풀 솔레노이드 밸브 (15 l/min, 250 bar) direct-acting 3/2 spool solenoid valve for sae8 cavity with 4 spool options (15 l/min, 250 bar) es083f oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 3_2 3웨이/2포지션 3-way/2-position direct_acting 직동식 direct acting 스풀 1 / 2 / 3 / 4 sae 8/3 (3/4-16 unf) 15 250 12 vdc / 24 vdc / 220 vac (50-60 hz) 22 w 없음 / 푸시&트위스트 nbr / viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-es104f', 'ES104F', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ES104F SAE10 4웨이/3포지션 ON-OFF 솔레노이드 밸브', 'ES104F Push/Pull On-Off Electric Valve SAE10, 4-Way 3-Position', '푸시/풀 더블 솔레노이드 SAE10/4 4웨이 3포지션 ON-OFF 밸브 (30 L/min, 250 bar)', 'Push/pull double-solenoid SAE10/4 4-way 3-position on-off valve (30 L/min, 250 bar)', 'ES104F는 SAE 10/4 캐비티용 푸시/풀 방식 4웨이 3포지션 ON-OFF 솔레노이드 밸브입니다. 중립에서 A·B 포트가 탱크로 개방되는 회로(1)와 A·B 포트가 차단되는 회로(2), 유량 사이즈 25 L/min(D)·30 L/min(E)을 선택할 수 있습니다. 최대 압력 250 bar(1번 포트 최대 20 bar), 24 W 코일(12/24 VDC, DIN 46350 또는 Deutsch DT4, IP65/IP69K)을 사용합니다.', 'The ES104F is a push/pull 4-way 3-position on-off solenoid valve for SAE 10/4 cavities. Circuit options are A-B to tank in neutral (1) or A-B closed in neutral (2), with flow sizes of 25 L/min (D) and 30 L/min (E). Rated 250 bar (20 bar max at port 1), it uses 24 W coils in 12 or 24 VDC with DIN 46350 or Deutsch DT4 connections (IP65/IP69K).',
  '{"valve_function": "4_3", "actuation": "direct_acting", "circuit_options": "중립 시 A-B 탱크 개방(1) / A-B 차단(2), 사이즈 D(25 L/min)·E(30 L/min)", "cavity": "SAE 10/4 (7/8-14 UNF)", "max_flow_lpm": 30, "max_pressure_bar": 250, "voltage_options": "12 VDC / 24 VDC (DIN 46350, Deutsch DT4)", "coil_power": "24 W", "manual_override": "없음", "seal_material": "PTFE + NBR / PTFE + Viton"}'::jsonb, true, 3420, 'es104f sae10 4웨이/3포지션 on-off 솔레노이드 밸브 es104f push/pull on-off electric valve sae10, 4-way 3-position 푸시/풀 더블 솔레노이드 sae10/4 4웨이 3포지션 on-off 밸브 (30 l/min, 250 bar) push/pull double-solenoid sae10/4 4-way 3-position on-off valve (30 l/min, 250 bar) es104f oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 4_3 4웨이/3포지션 4-way/3-position direct_acting 직동식 direct acting 중립 시 a-b 탱크 개방(1) / a-b 차단(2), 사이즈 d(25 l/min)·e(30 l/min) sae 10/4 (7/8-14 unf) 30 250 12 vdc / 24 vdc (din 46350, deutsch dt4) 24 w 없음 ptfe + nbr / ptfe + viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-es104p', 'ES104P', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-solenoid-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ES104P SAE10 4웨이 전자비례 유량 방향 제어 밸브', 'ES104P SAE10 4-Way Electro-Proportional Flow Directional Control Valve', 'SAE10/4 캐비티용 전자비례 유량·방향 제어 밸브 (5~30 L/min 사이즈, 250 bar)', 'Electro-proportional flow directional control valve for SAE10/4 cavity (5-30 L/min sizes, 250 bar)', 'ES104P는 SAE 10/4 캐비티용 4웨이 전자비례 유량·방향 제어 밸브입니다. 제어 유량 사이즈 5·10·15·25·30 L/min(A~E)과 중립 회로 2종을 선택할 수 있으며 최대 압력 250 bar(1번 포트 최대 20 bar) 사양입니다. PWM 120 Hz 구동, 최대 전류 12 V에서 1800 mA·24 V에서 900 mA, 히스테리시스 5%이며 비례 코일(36/39.7 W, DIN 46350 또는 Deutsch DT4, IP65/IP69K)을 사용합니다.', 'The ES104P is a 4-way electro-proportional flow directional control valve for SAE 10/4 cavities. Regulated flow sizes of 5, 10, 15, 25 and 30 L/min (A-E) with two neutral circuit options; rated 250 bar (20 bar max at port 1). Driven by 120 Hz PWM with 1800 mA max current at 12 V or 900 mA at 24 V and 5% hysteresis, using proportional coils (36/39.7 W, DIN 46350 or Deutsch DT4, IP65/IP69K).',
  '{"valve_function": "4_3", "actuation": "proportional", "circuit_options": "중립 시 A-B 탱크 개방(1) / A-B 차단(2), 사이즈 A~E (5/10/15/25/30 L/min)", "cavity": "SAE 10/4 (7/8-14 UNF)", "max_flow_lpm": 30, "max_pressure_bar": 250, "voltage_options": "12 VDC (1.8 A) / 24 VDC (0.9 A), PWM 120 Hz", "coil_power": "36 W (12 V) / 39.7 W (24 V)", "manual_override": "없음", "seal_material": "PTFE + NBR / PTFE + Viton"}'::jsonb, true, 3430, 'es104p sae10 4웨이 전자비례 유량 방향 제어 밸브 es104p sae10 4-way electro-proportional flow directional control valve sae10/4 캐비티용 전자비례 유량·방향 제어 밸브 (5~30 l/min 사이즈, 250 bar) electro-proportional flow directional control valve for sae10/4 cavity (5-30 l/min sizes, 250 bar) es104p oleoweb s.r.l. 솔레노이드 밸브 solenoid valves 4_3 4웨이/3포지션 4-way/3-position proportional 전자비례식 electro-proportional 중립 시 a-b 탱크 개방(1) / a-b 차단(2), 사이즈 a~e (5/10/15/25/30 l/min) sae 10/4 (7/8-14 unf) 30 250 12 vdc (1.8 a) / 24 vdc (0.9 a), pwm 120 hz 36 w (12 v) / 39.7 w (24 v) 없음 ptfe + nbr / ptfe + viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-fcm', 'FCM', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'FCM 엔드 스트로크 밸브 (푸시버튼식)', 'FCM Pushbutton End-Stroke Valve', '노멀 클로즈 푸시버튼 엔드 스트로크 밸브, BSPP 1/4"-1/2", 최대 350 bar', 'Normally-closed pushbutton end-stroke valve, BSPP 1/4"-1/2", up to 350 bar', '실린더나 기계 요소가 스트로크 끝에서 푸시버튼을 눌러 유로를 개방하는 노멀 클로즈(NC) 엔드 스트로크 밸브입니다. BSPP 1/4"·3/8"(40 L/min, 350 bar), 1/2"(60 L/min, 300 bar) 사이즈가 있으며, 기계식 리미트·언로딩 회로에 사용됩니다.', 'Normally-closed end-stroke valve whose pushbutton is depressed by the cylinder or machine element at end of stroke to open the flow path. Sizes BSPP 1/4" and 3/8" (40 L/min, 350 bar) and 1/2" (60 L/min, 300 bar), used for mechanical limit and unloading circuits.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 60, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\"", "thread_types": "BSPP", "control_type": "end_stroke", "pressure_compensated": false, "adjustment_type": "pushbutton", "controlled_flow_range": "40-60 L/min by size", "mounting_style": "in_line"}'::jsonb, true, 3440, 'fcm 엔드 스트로크 밸브 (푸시버튼식) fcm pushbutton end-stroke valve 노멀 클로즈 푸시버튼 엔드 스트로크 밸브, bspp 1/4"-1/2", 최대 350 bar normally-closed pushbutton end-stroke valve, bspp 1/4"-1/2", up to 350 bar fcm oleoweb s.r.l. 유량 제어 밸브 flow control valves 350 60 bspp 1/4", 3/8", 1/2" bspp end_stroke 엔드 스트로크(리미트) end-stroke false pushbutton 푸시버튼 pushbutton 40-60 l/min by size in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-fct', 'FCT', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'FCT 견인식 스트로크 엔드 밸브', 'FCT Tug End-Stroke Valves', '케이블 견인식 스트로크 엔드 밸브, BSPP 3/8~1, 최대 250bar', 'Tug-operated end-stroke valves, BSPP 3/8-1, up to 250 bar', '케이블 견인으로 작동하는 스트로크 엔드(리미트) 밸브로, 실린더가 행정 끝에 도달하면 유로를 전환합니다. BSPP 3/8~1 사이즈에서 최대 유량 60~140l/min, 최대 압력 250bar(1인치 200bar)입니다. 클로즈드 센터(A)/오픈 센터(B) 회로를 선택할 수 있습니다.', 'Tug (pull) operated end-stroke valves that switch the flow path when the cylinder reaches end of stroke. Sizes BSPP 3/8 to 1 with maximum flows of 60 to 140 l/min and 250 bar maximum pressure (200 bar for 1 inch). Closed centre (A) or open centre (B) circuits.',
  '{"diverter_type": "end_stroke", "ways": "2", "thread_standard": "bspp", "port_sizes": "BSPP 3/8, 1/2, 3/4, 1", "max_flow_lpm": "60-140 by size", "max_pressure_bar": 250, "circuit_options": "Closed centre (A) / Open centre (B)", "weight_kg": "1.7-2.5"}'::jsonb, true, 3450, 'fct 견인식 스트로크 엔드 밸브 fct tug end-stroke valves 케이블 견인식 스트로크 엔드 밸브, bspp 3/8~1, 최대 250bar tug-operated end-stroke valves, bspp 3/8-1, up to 250 bar fct oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters end_stroke 견인식 스트로크 엔드 tug end-stroke 2 bspp bspp bspp bspp 3/8, 1/2, 3/4, 1 60-140 by size 250 closed centre (a) / open centre (b) 1.7-2.5')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-gg90', 'GG90', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GG90 90° 스위벨 조인트', 'GG90 90-Degree Rotating Couplings', '90° 회전 조인트, BSPP 1/4~1, 최대 400bar', '90-degree rotating couplings, BSPP 1/4-1, up to 400 bar', '직각 배관 구성이 가능한 90° 회전(스위벨) 조인트입니다. BSPP 1/4~1 사이즈에서 최대 유량 25~180l/min, 최대 압력 300~400bar(회전 중 100~200bar)입니다. 최대 회전 속도는 사이즈에 따라 100~212rpm입니다.', '90-degree rotating (swivel) couplings for right-angle hose routing. Sizes BSPP 1/4 to 1 with flows of 25 to 180 l/min and maximum pressures of 300-400 bar (100-200 bar while rotating). Maximum rotation speeds range from 100 to 212 rpm by size.',
  '{"component_type": "rotating_coupling", "thread_type": "BSPP", "size_range": "BSPP 1/4 - 1", "max_flow_lpm": "25-180 by size", "max_pressure_bar": 400, "weight_kg": "0.31-1.25"}'::jsonb, true, 3460, 'gg90 90° 스위벨 조인트 gg90 90-degree rotating couplings 90° 회전 조인트, bspp 1/4~1, 최대 400bar 90-degree rotating couplings, bspp 1/4-1, up to 400 bar gg90 oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories rotating_coupling 스위벨 조인트 rotating coupling bspp bspp 1/4 - 1 25-180 by size 400 0.31-1.25')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ggil', 'GGIL', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GGIL 인라인 스위벨 조인트', 'GGIL In-Line Rotating Couplings', '인라인 회전 조인트, BSPP 1/4~1, 최대 400bar', 'In-line rotating couplings, BSPP 1/4-1, up to 400 bar', '호스 꼬임을 방지하는 인라인형 회전(스위벨) 조인트입니다. BSPP 1/4~1 사이즈에서 최대 유량 25~180l/min, 최대 압력 300~400bar(회전 중 100~200bar)입니다. 최대 회전 속도는 사이즈에 따라 100~212rpm입니다.', 'In-line rotating (swivel) couplings that prevent hose twisting. Sizes BSPP 1/4 to 1 with flows of 25 to 180 l/min and maximum pressures of 300-400 bar (100-200 bar while rotating). Maximum rotation speeds range from 100 to 212 rpm by size.',
  '{"component_type": "rotating_coupling", "thread_type": "BSPP", "size_range": "BSPP 1/4 - 1", "max_flow_lpm": "25-180 by size", "max_pressure_bar": 400, "weight_kg": "0.21-0.90"}'::jsonb, true, 3470, 'ggil 인라인 스위벨 조인트 ggil in-line rotating couplings 인라인 회전 조인트, bspp 1/4~1, 최대 400bar in-line rotating couplings, bspp 1/4-1, up to 400 bar ggil oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories rotating_coupling 스위벨 조인트 rotating coupling bspp bspp 1/4 - 1 25-180 by size 400 0.21-0.90')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-idf4', 'IDF4', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IDF4 4웨이 유량 전환 밸브 (BSPP)', 'IDF4 4-Way Flow Diverters (BSPP)', '수동 4웨이 디버터, BSPP 1/4~1, 최대 350bar', 'Manual 4-way diverters, BSPP 1/4-1, up to 350 bar', '인렛(E)과 아웃렛(S) 포트를 갖춘 수동 4웨이 유량 전환 밸브입니다. BSPP 1/4~1 사이즈에서 최대 유량 60~200l/min, 최대 압력 350bar(1인치 300bar)입니다. 클로즈드 센터(A)/오픈 센터(B) 회로를 선택할 수 있습니다.', 'Manual 4-way flow diverters with inlet (E) and outlet (S) porting. Sizes BSPP 1/4 to 1 with maximum flows of 60 to 200 l/min and 350 bar maximum pressure (300 bar for 1 inch). Closed centre (A) or open centre (B) circuits.',
  '{"diverter_type": "manual", "ways": "4", "thread_standard": "bspp", "port_sizes": "BSPP 1/4, 3/8, 1/2, 3/4, 1", "max_flow_lpm": "60-200 by size", "max_pressure_bar": 350, "circuit_options": "Closed centre (A) / Open centre (B)", "weight_kg": "1.3-2.8"}'::jsonb, true, 3480, 'idf4 4웨이 유량 전환 밸브 (bspp) idf4 4-way flow diverters (bspp) 수동 4웨이 디버터, bspp 1/4~1, 최대 350bar manual 4-way diverters, bspp 1/4-1, up to 350 bar idf4 oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters manual 수동 레버식 manual lever 4 bspp bspp bspp bspp 1/4, 3/8, 1/2, 3/4, 1 60-200 by size 350 closed centre (a) / open centre (b) 1.3-2.8')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-idf4sae', 'IDF4SAE', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IDF4SAE 4웨이 유량 전환 밸브 (SAE)', 'IDF4SAE 4-Way Flow Diverters (SAE)', 'SAE 나사 수동 4웨이 디버터, 최대 350bar', 'SAE-threaded manual 4-way diverters, up to 350 bar', 'SAE 나사(3/4-16UNF~1-5/16-12UN) 포트 사양의 수동 4웨이 유량 전환 밸브입니다. 최대 유량 60~200l/min, 최대 압력 350bar(SAE16 300bar)이며 클로즈드/오픈 센터 회로를 선택할 수 있습니다.', 'Manual 4-way flow diverters with SAE threaded ports (3/4-16UNF to 1-5/16-12UN). Maximum flows 60 to 200 l/min, maximum pressure 350 bar (300 bar for SAE16), with closed or open centre circuits.',
  '{"diverter_type": "manual", "ways": "4", "thread_standard": "sae_unf", "port_sizes": "3/4-16UNF, 7/8-14UNF, 1-1/16-12UN, 1-5/16-12UN", "max_flow_lpm": "60-200 by size", "max_pressure_bar": 350, "circuit_options": "Closed centre (A) / Open centre (B)", "weight_kg": "1.3-2.8"}'::jsonb, true, 3490, 'idf4sae 4웨이 유량 전환 밸브 (sae) idf4sae 4-way flow diverters (sae) sae 나사 수동 4웨이 디버터, 최대 350bar sae-threaded manual 4-way diverters, up to 350 bar idf4sae oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters manual 수동 레버식 manual lever 4 sae_unf sae (unf/un) sae (unf/un) 3/4-16unf, 7/8-14unf, 1-1/16-12un, 1-5/16-12un 60-200 by size 350 closed centre (a) / open centre (b) 1.3-2.8')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-idf8', 'IDF8', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IDF8 8웨이 유량 전환 밸브 (BSPP)', 'IDF8 8-Way Flow Diverters (BSPP)', '수동 8웨이 디버터, BSPP 1/4~1, 최대 350bar', 'Manual 8-way diverters, BSPP 1/4-1, up to 350 bar', '복동 2회로를 동시에 전환하는 수동 8웨이 유량 전환 밸브입니다. BSPP 1/4~1 사이즈에서 라인당 최대 60~200l/min, 최대 압력 350bar(1인치 300bar)입니다. 클로즈드/오픈 센터 회로를 선택할 수 있습니다.', 'Manual 8-way flow diverters switching two double acting circuits simultaneously. Sizes BSPP 1/4 to 1 with 60-200 l/min per line and 350 bar maximum pressure (300 bar for 1 inch). Closed or open centre circuits.',
  '{"diverter_type": "manual", "ways": "8", "thread_standard": "bspp", "port_sizes": "BSPP 1/4, 3/8, 1/2, 3/4, 1", "max_flow_lpm": "60+60 to 200+200 by size", "max_pressure_bar": 350, "circuit_options": "Closed centre (A) / Open centre (B)", "weight_kg": "2.5-5.1"}'::jsonb, true, 3500, 'idf8 8웨이 유량 전환 밸브 (bspp) idf8 8-way flow diverters (bspp) 수동 8웨이 디버터, bspp 1/4~1, 최대 350bar manual 8-way diverters, bspp 1/4-1, up to 350 bar idf8 oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters manual 수동 레버식 manual lever 8 bspp bspp bspp bspp 1/4, 3/8, 1/2, 3/4, 1 60+60 to 200+200 by size 350 closed centre (a) / open centre (b) 2.5-5.1')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-idf8sae', 'IDF8SAE', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-diverters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IDF8SAE 8웨이 유량 전환 밸브 (SAE)', 'IDF8SAE 8-Way Flow Diverters (SAE)', 'SAE 나사 수동 8웨이 디버터, 최대 350bar', 'SAE-threaded manual 8-way diverters, up to 350 bar', 'SAE 나사(3/4-16UNF~1-5/16-12UN) 포트 사양의 수동 8웨이 유량 전환 밸브입니다. 라인당 최대 60~200l/min, 최대 압력 350bar(SAE16 300bar)이며 클로즈드/오픈 센터 회로를 선택할 수 있습니다.', 'Manual 8-way flow diverters with SAE threaded ports (3/4-16UNF to 1-5/16-12UN). Per-line flows of 60 to 200 l/min and 350 bar maximum pressure (300 bar for SAE16), with closed or open centre circuits.',
  '{"diverter_type": "manual", "ways": "8", "thread_standard": "sae_unf", "port_sizes": "3/4-16UNF, 7/8-14UNF, 1-1/16-12UN, 1-5/16-12UN", "max_flow_lpm": "60+60 to 200+200 by size", "max_pressure_bar": 350, "circuit_options": "Closed centre (A) / Open centre (B)", "weight_kg": "2.1-4.3"}'::jsonb, true, 3510, 'idf8sae 8웨이 유량 전환 밸브 (sae) idf8sae 8-way flow diverters (sae) sae 나사 수동 8웨이 디버터, 최대 350bar sae-threaded manual 8-way diverters, up to 350 bar idf8sae oleoweb s.r.l. 유량 전환 밸브 (디버터) flow diverters manual 수동 레버식 manual lever 8 sae_unf sae (unf/un) sae (unf/un) 3/4-16unf, 7/8-14unf, 1-1/16-12un, 1-5/16-12un 60+60 to 200+200 by size 350 closed centre (a) / open centre (b) 2.1-4.3')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-le103a', 'LE103A', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-compensators'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'LE103A 카트리지 로직 엘리먼트 (압력 보상기, SAE10/3 SHORT)', 'LE103A Cartridge Logic Element (Pressure Compensator, SAE10/3 SHORT)', 'SAE10/3 SHORT 캐비티용 카트리지 압력 보상기, 최대 70l/min, 350bar', 'Cartridge pressure compensator for SAE10/3 SHORT cavity, up to 70 l/min and 350 bar', 'SAE10/3 SHORT 캐비티(7/8"-14 UNF-2A)에 삽입하는 3포트 카트리지형 로직 엘리먼트 겸 압력 보상기입니다. 크래킹 압력 8bar(A) 또는 12bar(B) 스프링을 선택할 수 있으며, 최대 유량 70l/min, 최대 압력 350bar 사양입니다. 가스켓은 PTFE(P) 기본에 NBR(N)/바이톤(V) 옵션이 있으며, 체결 토크 50Nm, 중량 약 0.16kg입니다. 권장 여과도는 15μm(ISO 4406:1999 Class 19/17/14)입니다.', 'Three-port cartridge logic element / pressure compensator for the SAE10/3 SHORT cavity (7/8"-14 UNF-2A). Available with 8 bar (A) or 12 bar (B) cracking-pressure springs, rated for flows up to 70 l/min and pressures up to 350 bar. Gasket options are PTFE (P) with NBR (N) or Viton (V) alternatives; tightening torque 50 Nm, weight approx. 0.16 kg. Advised filtration 15 um (ISO 4406:1999 class 19/17/14).',
  '{"compensator_type": "normally_closed", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 70, "max_pressure_bar": 350, "variant_codes": "LE103A-A (8 bar) / LE103A-B (12 bar); gaskets P (PTFE) / N (NBR) / V (Viton); cavity SAE10/3 SHORT"}'::jsonb, true, 3520, 'le103a 카트리지 로직 엘리먼트 (압력 보상기, sae10/3 short) le103a cartridge logic element (pressure compensator, sae10/3 short) sae10/3 short 캐비티용 카트리지 압력 보상기, 최대 70l/min, 350bar cartridge pressure compensator for sae10/3 short cavity, up to 70 l/min and 350 bar le103a oleoweb s.r.l. 압력 보상기 (컴펜세이터) compensators normally_closed 노멀 클로즈드 normally closed cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in 70 350 le103a-a (8 bar) / le103a-b (12 bar); gaskets p (ptfe) / n (nbr) / v (viton); cavity sae10/3 short')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-mnp', 'MNP (BSPP / NPTF)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'MNP 압력 테스트 포인트 (미니프레스)', 'MNP Test Couplings for Pressure Checking', 'M16x2 압력 테스트 커플링, 1/8~1/2, 최대 630bar', 'M16x2 pressure test couplings, 1/8 to 1/2, up to 630 bar', '운전 중 회로 압력을 측정하기 위한 M16x2 규격 압력 테스트 포인트(미니프레스)입니다. BSPP 및 NPTF 나사로 1/8~1/2 사이즈가 제공되며 최대 압력 630bar입니다. 조임 토크는 사이즈에 따라 20~80Nm입니다.', 'M16x2 test couplings (minipress points) for checking circuit pressure during operation. Available in BSPP and NPTF threads from 1/8 to 1/2, rated 630 bar. Tightening torques range from 20 to 80 Nm by size.',
  '{"component_type": "test_coupling", "thread_type": "BSPP / NPTF", "size_range": "1/8 - 1/2", "max_pressure_bar": 630, "weight_kg": "0.07-0.13"}'::jsonb, true, 3530, 'mnp 압력 테스트 포인트 (미니프레스) mnp test couplings for pressure checking m16x2 압력 테스트 커플링, 1/8~1/2, 최대 630bar m16x2 pressure test couplings, 1/8 to 1/2, up to 630 bar mnp (bspp / nptf) oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories test_coupling 압력 테스트 포인트 test coupling bspp / nptf 1/8 - 1/2 630 0.07-0.13')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ow', 'OW', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'OW 싱글 오버센터 밸브', 'OW Single Overcenter Valve', '나사 삽입형 설치 방식의 싱글 오버센터 밸브로 최대 유량 60 L/min, 최대 압력 350 bar를 지원합니다.', 'Single Overcenter Valve with screwed-in installation, rated for flows up to 60 L/min and pressures up to 350 bar.', 'OW은(는) 이탈리아 Oleoweb의 싱글 오버센터 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 60 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The OW is a single overcenter valve series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 60 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"configuration": "single", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 60, "max_pressure_bar": 350}'::jsonb, true, 3540, 'ow 싱글 오버센터 밸브 ow single overcenter valve 나사 삽입형 설치 방식의 싱글 오버센터 밸브로 최대 유량 60 l/min, 최대 압력 350 bar를 지원합니다. single overcenter valve with screwed-in installation, rated for flows up to 60 l/min and pressures up to 350 bar. ow oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves 60 350 single 싱글 single cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ow103s', 'OW103S', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'OW103S SAE10/3 쇼트 카운터밸런스 카트리지 밸브', 'OW103S SAE10/3 Short Counterbalance Cartridge Valve', 'SAE10/3 쇼트 캐비티용 카운터밸런스 카트리지 (60 L/min, 350 bar)', 'Counterbalance cartridge for SAE10/3 short cavity (60 L/min, 350 bar)', 'OW103S는 SAE10/3 쇼트 캐비티용 나사식 카운터밸런스 카트리지 밸브입니다. 오픈 센터 시스템용으로 파일럿 비율 3:1(70~280 bar) 또는 4:1(100~350 bar)을 선택할 수 있으며 최대 유량 60 L/min, 최대 압력 350 bar 사양입니다. PTFE+NBR 또는 PTFE+Viton 시일, 아연 CRIII 또는 아연-니켈 표면 처리를 제공합니다.', 'The OW103S is a screw-in counterbalance cartridge valve for the SAE10/3 short cavity. For open-center systems, with 3:1 (70-280 bar) or 4:1 (100-350 bar) pilot ratios, 60 L/min max flow and 350 bar max pressure. PTFE+NBR or PTFE+Viton seals and zinc CRIII or zinc-nickel surface treatments.',
  '{"valve_function": "counterbalance", "cavity": "SAE10/3 SHORT (7/8-14 UNF)", "max_flow_lpm": 60, "max_pressure_bar": 350, "adjustment": "조정 스크류 (59 bar/회전)", "pilot_ratio": "3:1 / 4:1", "cracking_pressure": "설정 범위 70-280 bar (3:1) / 100-350 bar (4:1)", "seal_material": "PTFE+NBR / PTFE+Viton", "controlled_flow_range": null}'::jsonb, true, 3550, 'ow103s sae10/3 쇼트 카운터밸런스 카트리지 밸브 ow103s sae10/3 short counterbalance cartridge valve sae10/3 쇼트 캐비티용 카운터밸런스 카트리지 (60 l/min, 350 bar) counterbalance cartridge for sae10/3 short cavity (60 l/min, 350 bar) ow103s oleoweb s.r.l. 카트리지 밸브 cartridge valves counterbalance 카운터밸런스 counterbalance sae10/3 short (7/8-14 unf) 60 350 조정 스크류 (59 bar/회전) 3:1 / 4:1 설정 범위 70-280 bar (3:1) / 100-350 bar (4:1) ptfe+nbr / ptfe+viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

commit;
