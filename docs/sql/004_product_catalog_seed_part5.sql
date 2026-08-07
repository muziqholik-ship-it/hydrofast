-- 004_product_catalog_seed — part 5/5
-- Run parts in order (1 → 5) in the Supabase SQL Editor. Idempotent.

begin;

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-210cxsw', '210CXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-check-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '체크 밸브 (DN9)', 'Check Valve (DN9)', '316 스테인리스 DN9 체크 밸브, 최대 50 L/min', '316 stainless DN9 check valve, up to 50 L/min', '9.5mm 유로의 DN9 체크 밸브로 최대 50 L/min에 대응합니다. 장기간 미사용 후에도 일관된 성능을 유지하며 표준 크래킹 압력은 0.6bar입니다.', 'DN9 check valve with 9.5 mm gallery handling up to 50 L/min. Consistent performance even after long inactivity; standard cracking pressure 0.6 bar.',
  '{"valve_type": "check", "nominal_size": "dn9", "pressure_range": "0.1-200 bar", "cv_value": 0.65, "max_flow_lpm": 50, "porting": "3/8\" BSPP", "cracking_pressure": "표준 0.6 bar (0.1-3 bar 지정 가능)", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5060, '체크 밸브 (dn9) check valve (dn9) 316 스테인리스 dn9 체크 밸브, 최대 50 l/min 316 stainless dn9 check valve, up to 50 l/min 210cxsw the water hydraulics co. ltd 체크·안전 밸브 check & safety valves check 체크 밸브 check valve dn9 dn9 dn9 0.1-200 bar 0.65 50 3/8" bspp 표준 0.6 bar (0.1-3 bar 지정 가능) aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-210dxsw', '210DXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-check-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '체크 밸브 (DN12)', 'Check Valve (DN12)', '316 스테인리스 DN12 체크 밸브, 최대 60 L/min', '316 stainless DN12 check valve, up to 60 L/min', '12.7mm 유로의 DN12 체크 밸브로 Cv 1.92, 최대 60 L/min에 대응합니다. 0.1-200bar 압력 범위에서 사용 가능합니다.', 'DN12 check valve with 12.7 mm gallery, Cv 1.92, handling up to 60 L/min across a 0.1-200 bar pressure range.',
  '{"valve_type": "check", "nominal_size": "dn12", "pressure_range": "0.1-200 bar", "cv_value": 1.92, "max_flow_lpm": 60, "porting": "1/2\" BSPP", "cracking_pressure": "표준 0.6 bar (0.1-3 bar 지정 가능)", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5070, '체크 밸브 (dn12) check valve (dn12) 316 스테인리스 dn12 체크 밸브, 최대 60 l/min 316 stainless dn12 check valve, up to 60 l/min 210dxsw the water hydraulics co. ltd 체크·안전 밸브 check & safety valves check 체크 밸브 check valve dn12 dn12 dn12 0.1-200 bar 1.92 60 1/2" bspp 표준 0.6 bar (0.1-3 bar 지정 가능) aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-210exsw', '210EXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-check-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '체크 밸브 (DN16)', 'Check Valve (DN16)', '316 스테인리스 DN16 체크 밸브, 최대 100 L/min', '316 stainless DN16 check valve, up to 100 L/min', '16mm 유로의 DN16 체크 밸브로 Cv 4.5, 최대 100 L/min에 대응합니다. 3/4" BSPP 나사 연결로 0.1-200bar 범위에서 사용합니다.', 'DN16 check valve with 16 mm gallery, Cv 4.5, handling up to 100 L/min. 3/4" BSPP connection, 0.1-200 bar pressure range.',
  '{"valve_type": "check", "nominal_size": "dn16", "pressure_range": "0.1-200 bar", "cv_value": 4.5, "max_flow_lpm": 100, "porting": "3/4\" BSPP", "cracking_pressure": "표준 0.6 bar (0.1-3 bar 지정 가능)", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5080, '체크 밸브 (dn16) check valve (dn16) 316 스테인리스 dn16 체크 밸브, 최대 100 l/min 316 stainless dn16 check valve, up to 100 l/min 210exsw the water hydraulics co. ltd 체크·안전 밸브 check & safety valves check 체크 밸브 check valve dn16 dn16 dn16 0.1-200 bar 4.5 100 3/4" bspp 표준 0.6 bar (0.1-3 bar 지정 가능) aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-210fxsw', '210FXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-check-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '체크 밸브 (DN25)', 'Check Valve (DN25)', '316 스테인리스 DN25 체크 밸브, 최대 200 L/min', '316 stainless DN25 check valve, up to 200 L/min', '25mm 유로의 DN25 대유량 체크 밸브로 Cv 6.6, 최대 200 L/min에 대응합니다. 1" BSPP 나사 연결로 0.1-200bar 범위에서 사용합니다.', 'High-flow DN25 check valve with 25 mm gallery, Cv 6.6, handling up to 200 L/min. 1" BSPP connection, 0.1-200 bar pressure range.',
  '{"valve_type": "check", "nominal_size": "dn25", "pressure_range": "0.1-200 bar", "cv_value": 6.6, "max_flow_lpm": 200, "porting": "1\" BSPP", "cracking_pressure": "표준 0.6 bar (0.1-3 bar 지정 가능)", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5090, '체크 밸브 (dn25) check valve (dn25) 316 스테인리스 dn25 체크 밸브, 최대 200 l/min 316 stainless dn25 check valve, up to 200 l/min 210fxsw the water hydraulics co. ltd 체크·안전 밸브 check & safety valves check 체크 밸브 check valve dn25 dn25 dn25 0.1-200 bar 6.6 200 1" bspp 표준 0.6 bar (0.1-3 bar 지정 가능) aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-212bbsw', '212BBSW / 2M12BBSW / 2C12BBSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '4/3 솔레노이드 방향 제어 밸브 (오픈 센터)', '4/3 Solenoid Directional Valve (Open Centre)', '센터 위치에서 전 포트 연결형 DN6 4/3 솔레노이드 밸브', 'DN6 4/3 solenoid valve with all ports connected at centre', '수돗물용 4/3 방향 제어 밸브로, 센터 위치에서 모든 포트가 연결되는 오픈 센터 사양입니다. 24V DC 솔레노이드 구동(수동 오버라이드 기본), 20bar 이상 구동 시 구동 카드가 필요합니다. 완전한 부하 유지가 필요한 경우 A·B 포트에 PO 체크 밸브 사용이 권장됩니다.', '4/3 directional control valve for tap water with an open centre connecting all ports. 24V DC solenoid actuation with manual override; an actuation card is required above 20 bar. For load holding, a PO check valve on the A & B port face is advised.',
  '{"valve_function": "4_3", "actuation": "solenoid", "nominal_size": "dn6", "max_inlet_pressure_bar": 200, "operating_pressure_range": "0-160 bar", "max_flow_lpm": 30, "cv_value": 0.62, "porting": "1/4\" BSPP / 매니폴드 / Cetop 3", "voltage": "24V DC", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5100, '4/3 솔레노이드 방향 제어 밸브 (오픈 센터) 4/3 solenoid directional valve (open centre) 센터 위치에서 전 포트 연결형 dn6 4/3 솔레노이드 밸브 dn6 4/3 solenoid valve with all ports connected at centre 212bbsw / 2m12bbsw / 2c12bbsw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 4_3 4/3 밸브 4/3 valve solenoid 솔레노이드 solenoid dn6 dn6 dn6 200 0-160 bar 30 0.62 1/4" bspp / 매니폴드 / cetop 3 24v dc aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-212bgsw', '212BGSW / 2M12BGSW / 2C12BGSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '4/3 수동 방향 제어 밸브 (오픈 센터)', '4/3 Manual Directional Valve (Open Centre)', '레버 조작식 DN6 4/3 방향 제어 밸브, 전 포트 연결 센터', 'Lever-operated DN6 4/3 directional valve, all ports connected at centre', '수동(레버) 조작식 4/3 방향 제어 밸브로 센터 위치에서 모든 포트가 연결됩니다. 스프링 리턴 또는 디텐트 사양이 가능하며 매니폴드, Cetop 3 마운트로도 공급됩니다.', 'Manually (lever) operated 4/3 directional control valve with all ports connected at centre. Spring return or detent versions; manifold and Cetop 3 mounts available.',
  '{"valve_function": "4_3", "actuation": "manual", "nominal_size": "dn6", "max_inlet_pressure_bar": 200, "operating_pressure_range": "0-160 bar", "max_flow_lpm": 30, "cv_value": 0.62, "porting": "1/4\" BSPP / 매니폴드 / Cetop 3", "voltage": "-", "body_material": "AISI 316 / 폴리머 (듀플렉스 2205 옵션)"}'::jsonb, true, 5110, '4/3 수동 방향 제어 밸브 (오픈 센터) 4/3 manual directional valve (open centre) 레버 조작식 dn6 4/3 방향 제어 밸브, 전 포트 연결 센터 lever-operated dn6 4/3 directional valve, all ports connected at centre 212bgsw / 2m12bgsw / 2c12bgsw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 4_3 4/3 밸브 4/3 valve manual 수동 manual dn6 dn6 dn6 200 0-160 bar 30 0.62 1/4" bspp / 매니폴드 / cetop 3 - aisi 316 / 폴리머 (듀플렉스 2205 옵션)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-216axsw', '216AXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-flow-control-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '압력 보상형 유량 제어 밸브 (DN3)', 'Pressure Compensated Flow Control Valve (DN3)', '출구 압력과 무관하게 0.5-5 L/min 정유량 유지', 'Maintains constant 0.5-5 L/min regardless of outlet pressure', '출력 작동 압력과 무관하게 설정 유량을 일정하게 유지하는 압력 보상형 유량 제어 밸브입니다. 육각렌치로 조절 후 고정하여 임의 변경을 방지하며, 역방향 유동은 약간의 오리피스 저항만으로 자유롭게 통과합니다.', 'Pressure compensated flow control valve maintaining the set flow irrespective of outlet working pressure. Adjusted by Allen key and lockable to prevent unwanted alteration; reverse flow passes with only a slight orifice restriction.',
  '{"control_type": "pressure_compensated", "nominal_size": "dn3", "operating_pressure_range": "5-160 bar", "flow_range": "0.5-5 L/min", "cv_value": 0.2, "adjustment_turns": 5, "porting": "1/4\" BSPP", "body_material": "316 스테인리스강 / 폴리머", "media": "수돗물"}'::jsonb, true, 5120, '압력 보상형 유량 제어 밸브 (dn3) pressure compensated flow control valve (dn3) 출구 압력과 무관하게 0.5-5 l/min 정유량 유지 maintains constant 0.5-5 l/min regardless of outlet pressure 216axsw the water hydraulics co. ltd 유량 제어 밸브 flow control valves pressure_compensated 압력 보상형 pressure compensated dn3 dn3 dn3 5-160 bar 0.5-5 l/min 0.2 5 1/4" bspp 316 스테인리스강 / 폴리머 수돗물')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-216bxsw', '216BXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-flow-control-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '압력 보상형 유량 제어 밸브 (DN6)', 'Pressure Compensated Flow Control Valve (DN6)', '출구 압력과 무관하게 3-30 L/min 정유량 유지', 'Maintains constant 3-30 L/min regardless of outlet pressure', '출력 작동 압력과 무관하게 3-30 L/min 범위의 설정 유량을 일정하게 유지하는 DN6 압력 보상형 유량 제어 밸브입니다. 최소 작동 압력은 5bar이며 육각렌치 조절 후 고정할 수 있습니다.', 'DN6 pressure compensated flow control valve holding a constant set flow in the 3-30 L/min range irrespective of outlet pressure. Minimum operating pressure 5 bar; Allen-key adjusted and lockable.',
  '{"control_type": "pressure_compensated", "nominal_size": "dn6", "operating_pressure_range": "5-160 bar", "flow_range": "3-30 L/min", "cv_value": 0.7, "adjustment_turns": 6, "porting": "1/4\" BSPP", "body_material": "316 스테인리스강 / 폴리머", "media": "수돗물"}'::jsonb, true, 5130, '압력 보상형 유량 제어 밸브 (dn6) pressure compensated flow control valve (dn6) 출구 압력과 무관하게 3-30 l/min 정유량 유지 maintains constant 3-30 l/min regardless of outlet pressure 216bxsw the water hydraulics co. ltd 유량 제어 밸브 flow control valves pressure_compensated 압력 보상형 pressure compensated dn6 dn6 dn6 5-160 bar 3-30 l/min 0.7 6 1/4" bspp 316 스테인리스강 / 폴리머 수돗물')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-221a-2-2-no', '221AASW / 221AOSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '2/2 직동식 솔레노이드 밸브 (N/O, DN3)', '2/2 Direct-Acting Solenoid Valve (N/O, DN3)', '카트리지형 DN3 2/2 노멀 오픈 직동 솔레노이드 밸브', 'Cartridge-type DN3 2/2 normally open direct-acting solenoid valve', '카트리지 설계의 2/2 노멀 오픈 직동식 솔레노이드 밸브입니다. 웨트 핀 솔레노이드로 2.5mm 오리피스를 최대 160bar까지 직접 구동하며, 25µm 여과 수돗물에서 사용합니다. 12V DC(221AASW) 또는 24V DC(221AOSW) 코일로 공급됩니다.', 'Cartridge-design 2/2 normally open direct-acting solenoid valve. The wet-pin solenoid directly actuates a 2.5 mm orifice up to 160 bar on water filtered to 25 µm. Supplied with 12V DC (221AASW) or 24V DC (221AOSW) coil.',
  '{"valve_function": "2_2", "actuation": "solenoid", "nominal_size": "dn3", "max_inlet_pressure_bar": 200, "operating_pressure_range": "8-160 bar", "max_flow_lpm": 10, "cv_value": 0.15, "porting": "1/4\" BSPP", "voltage": "12 / 24V DC", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5140, '2/2 직동식 솔레노이드 밸브 (n/o, dn3) 2/2 direct-acting solenoid valve (n/o, dn3) 카트리지형 dn3 2/2 노멀 오픈 직동 솔레노이드 밸브 cartridge-type dn3 2/2 normally open direct-acting solenoid valve 221aasw / 221aosw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 2_2 2/2 밸브 2/2 valve solenoid 솔레노이드 solenoid dn3 dn3 dn3 200 8-160 bar 10 0.15 1/4" bspp 12 / 24v dc aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-221c-2-2-pilot-no', '221CASW / 221COSW / 2M21CASW / 2M21COSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '2/2 파일럿 솔레노이드 밸브 (N/O, DN9)', '2/2 Pilot-Operated Solenoid Valve (N/O, DN9)', 'DN9 2/2 노멀 오픈 파일럿 작동 솔레노이드 밸브, 0-60 L/min', 'DN9 2/2 normally open pilot-operated solenoid valve, 0-60 L/min', '매니폴드 설계의 2/2 노멀 오픈 파일럿 작동 솔레노이드 밸브입니다. 최대 160bar, 0-60 L/min 유량을 제어하며 25µm 여과 수돗물에서 사용합니다. 12/24V DC 코일, 단품 및 매니폴드 마운트로 공급됩니다.', 'Manifold-design 2/2 normally open pilot-operated solenoid valve controlling 0-60 L/min at up to 160 bar on water filtered to 25 µm. 12/24V DC coils; stand-alone or manifold mount.',
  '{"valve_function": "2_2", "actuation": "pilot", "nominal_size": "dn9", "max_inlet_pressure_bar": 200, "operating_pressure_range": "8-160 bar", "max_flow_lpm": 60, "cv_value": 0.15, "porting": "3/8\" BSPP", "voltage": "12 / 24V DC", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5150, '2/2 파일럿 솔레노이드 밸브 (n/o, dn9) 2/2 pilot-operated solenoid valve (n/o, dn9) dn9 2/2 노멀 오픈 파일럿 작동 솔레노이드 밸브, 0-60 l/min dn9 2/2 normally open pilot-operated solenoid valve, 0-60 l/min 221casw / 221cosw / 2m21casw / 2m21cosw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 2_2 2/2 밸브 2/2 valve pilot 파일럿 pilot dn9 dn9 dn9 200 8-160 bar 60 0.15 3/8" bspp 12 / 24v dc aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-221f-2-2-pilot-no', '221FASW / 221FOSW / 2M21FASW / 2M21FOSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '2/2 파일럿 솔레노이드 밸브 (N/O, DN25)', '2/2 Pilot-Operated Solenoid Valve (N/O, DN25)', 'DN25 2/2 노멀 오픈 파일럿 작동 솔레노이드 밸브, 0-120 L/min', 'DN25 2/2 normally open pilot-operated solenoid valve, 0-120 L/min', '대유량용 DN25 2/2 노멀 오픈 파일럿 작동 솔레노이드 밸브입니다. 0-120 L/min을 최대 160bar에서 제어하며 25µm 여과 수돗물에서 사용합니다. 12/24V DC 코일, 단품 및 매니폴드 마운트로 공급됩니다.', 'High-flow DN25 2/2 normally open pilot-operated solenoid valve controlling 0-120 L/min at up to 160 bar on water filtered to 25 µm. 12/24V DC coils; stand-alone or manifold mount.',
  '{"valve_function": "2_2", "actuation": "pilot", "nominal_size": "dn25", "max_inlet_pressure_bar": 200, "operating_pressure_range": "8-160 bar", "max_flow_lpm": 120, "cv_value": 2.5, "porting": "1\" BSPP", "voltage": "12 / 24V DC", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5160, '2/2 파일럿 솔레노이드 밸브 (n/o, dn25) 2/2 pilot-operated solenoid valve (n/o, dn25) dn25 2/2 노멀 오픈 파일럿 작동 솔레노이드 밸브, 0-120 l/min dn25 2/2 normally open pilot-operated solenoid valve, 0-120 l/min 221fasw / 221fosw / 2m21fasw / 2m21fosw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 2_2 2/2 밸브 2/2 valve pilot 파일럿 pilot dn25 dn25 dn25 200 8-160 bar 120 2.5 1" bspp 12 / 24v dc aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-223arrw', '223ARRW / 2M23ARRW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '전자식 비례 유량제어 방향 밸브 (DN3, 1-10 L/min)', 'Electronic Proportional Directional Flow Control Valve (DN3, 1-10 L/min)', '스테퍼 모터 구동 DN3 4/3 비례 유량제어 밸브', 'Stepper-motor driven DN3 4/3 proportional flow control valve', '고정밀 스테퍼 모터로 구동되는 비례 방향 유량제어 밸브(4/3, 센터 클로즈드 P)입니다. 수동/조이스틱 입력 또는 속도·위치 제어 구성이 가능하며 ST5 마이크로스텝 컨트롤러와 트랜스듀서를 이용한 폐루프 제어를 지원합니다. 0.5-10L 포트 구성으로 저유량 정밀 제어에 적합합니다.', 'Proportional directional flow control valve (4/3, closed P centre) driven by a high-accuracy stepper motor. Configurable for manual/joystick input or speed/positional control, with closed-loop feedback via the ST5 microstep controller. The 0.5-10 L port configuration suits precise low-flow control.',
  '{"valve_function": "4_3", "actuation": "stepper_motor", "nominal_size": "dn3", "max_inlet_pressure_bar": 200, "operating_pressure_range": "0-160 bar", "max_flow_lpm": 10, "cv_value": null, "porting": "BSPP / 매니폴드", "voltage": "48V DC (125 mA)", "body_material": "316 스테인리스강 / 세라믹 / 폴리머"}'::jsonb, true, 5170, '전자식 비례 유량제어 방향 밸브 (dn3, 1-10 l/min) electronic proportional directional flow control valve (dn3, 1-10 l/min) 스테퍼 모터 구동 dn3 4/3 비례 유량제어 밸브 stepper-motor driven dn3 4/3 proportional flow control valve 223arrw / 2m23arrw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 4_3 4/3 밸브 4/3 valve stepper_motor 스테퍼 모터 stepper motor dn3 dn3 dn3 200 0-160 bar 10 bspp / 매니폴드 48v dc (125 ma) 316 스테인리스강 / 세라믹 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-223brrw', '223BRRW / 2M23BRRW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '전자식 비례 유량제어 방향 밸브 (DN6, 3-30 L/min)', 'Electronic Proportional Directional Flow Control Valve (DN6, 3-30 L/min)', '스테퍼 모터 구동 DN6 4/3 비례 유량제어 밸브', 'Stepper-motor driven DN6 4/3 proportional flow control valve', '고정밀 스테퍼 모터로 구동되는 DN6 비례 방향 유량제어 밸브(4/3, 센터 클로즈드 P)입니다. 3-30 L/min 포트 구성으로 전 유량 범위에서 높은 정밀도를 제공하며, 페일세이프가 필요한 경우 P라인에 N/C 2/2 밸브를 추가합니다.', 'DN6 proportional directional flow control valve (4/3, closed P centre) driven by a high-accuracy stepper motor. The 3-30 L/min port configuration maintains accuracy across the flow range; an N/C 2/2 valve in the P line provides fail-safe function if required.',
  '{"valve_function": "4_3", "actuation": "stepper_motor", "nominal_size": "dn6", "max_inlet_pressure_bar": 200, "operating_pressure_range": "0-160 bar", "max_flow_lpm": 30, "cv_value": null, "porting": "BSPP / 매니폴드", "voltage": "48V DC (125 mA)", "body_material": "316 스테인리스강 / 세라믹 / 폴리머"}'::jsonb, true, 5180, '전자식 비례 유량제어 방향 밸브 (dn6, 3-30 l/min) electronic proportional directional flow control valve (dn6, 3-30 l/min) 스테퍼 모터 구동 dn6 4/3 비례 유량제어 밸브 stepper-motor driven dn6 4/3 proportional flow control valve 223brrw / 2m23brrw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 4_3 4/3 밸브 4/3 valve stepper_motor 스테퍼 모터 stepper motor dn6 dn6 dn6 200 0-160 bar 30 bspp / 매니폴드 48v dc (125 ma) 316 스테인리스강 / 세라믹 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-225brrw', '225BRRW / 2M25BRRW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pressure-control-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '전자식 비례 압력 제어 밸브 (DN6)', 'Electronic Proportional Pressure Control Valve (DN6)', '스테퍼 모터 구동 DN6 압력 제어 밸브, 개루프/폐루프', 'Stepper-motor driven DN6 pressure control valve, open/closed loop', '고정밀 스테퍼 모터 구동의 비례 압력 제어 밸브로 개루프 또는 0.5V 압력 트랜스듀서 입력과 연동한 폐루프 제어가 가능합니다. 온보드 PLC를 갖춘 ST5 프로그래머와 조합해 사이클 압력 시험(최대 1Hz)이나 1-160bar 램핑 압력 제어 등 스탠드얼론 운용이 가능합니다.', 'Proportional pressure control valve driven by a high-accuracy stepper motor, operating open loop or closed loop with a 0.5 V pressure transducer input. Combined with the ST5 programmer (on-board PLC) it delivers stand-alone cyclic pressure testing (up to 1 Hz) or controlled ramping between 1 and 160 bar.',
  '{"valve_type": "electronic", "nominal_size": "dn6", "max_inlet_pressure_bar": 200, "setting_range": "0-160 bar", "max_flow_lpm": 30, "actuation": "stepper_motor", "porting": "BSPP / 매니폴드", "body_material": "316 스테인리스강 / 폴리머"}'::jsonb, true, 5190, '전자식 비례 압력 제어 밸브 (dn6) electronic proportional pressure control valve (dn6) 스테퍼 모터 구동 dn6 압력 제어 밸브, 개루프/폐루프 stepper-motor driven dn6 pressure control valve, open/closed loop 225brrw / 2m25brrw the water hydraulics co. ltd 압력 제어 밸브 pressure control valves electronic 전자식 압력 제어 electronic pressure control dn6 dn6 dn6 200 0-160 bar 30 stepper_motor 스테퍼 모터 stepper motor bspp / 매니폴드 316 스테인리스강 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-225drrw', '225DRRW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pressure-control-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '전자식 비례 압력 제어 밸브 (DN12)', 'Electronic Proportional Pressure Control Valve (DN12)', '스테퍼 모터 구동 DN12 압력 제어 밸브, 5-100 L/min', 'Stepper-motor driven DN12 pressure control valve, 5-100 L/min', '5-100 L/min 유량에 대응하는 DN12 전자식 비례 압력 제어 밸브입니다. 48V DC 스테퍼 모터 구동으로 ST5 컨트롤러와 연동해 정밀한 개루프/폐루프 압력 제어를 제공합니다.', 'DN12 electronic proportional pressure control valve for flows of 5-100 L/min. Driven by a 48V DC stepper motor and paired with the ST5 controller for precise open or closed loop pressure control.',
  '{"valve_type": "electronic", "nominal_size": "dn12", "max_inlet_pressure_bar": 200, "setting_range": "0-160 bar", "max_flow_lpm": 100, "actuation": "stepper_motor", "porting": "BSPP / 매니폴드", "body_material": "316 스테인리스강 / 폴리머"}'::jsonb, true, 5200, '전자식 비례 압력 제어 밸브 (dn12) electronic proportional pressure control valve (dn12) 스테퍼 모터 구동 dn12 압력 제어 밸브, 5-100 l/min stepper-motor driven dn12 pressure control valve, 5-100 l/min 225drrw the water hydraulics co. ltd 압력 제어 밸브 pressure control valves electronic 전자식 압력 제어 electronic pressure control dn12 dn12 dn12 200 0-160 bar 100 stepper_motor 스테퍼 모터 stepper motor bspp / 매니폴드 316 스테인리스강 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-226a-2-2-nc', '226AASW / 226AOSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '2/2 직동식 솔레노이드 밸브 (N/C, DN3)', '2/2 Direct-Acting Solenoid Valve (N/C, DN3)', '카트리지형 DN3 2/2 노멀 클로즈드 직동 솔레노이드 밸브', 'Cartridge-type DN3 2/2 normally closed direct-acting solenoid valve', '카트리지 설계의 2/2 노멀 클로즈드 직동식 솔레노이드 밸브로, 단일 블록에서 다기능 구성이 가능해 배관 비용을 절감합니다. 웨트 핀 솔레노이드 구조로 동적 씰이 없으며 2.5mm 오리피스로 최대 160bar까지 직접 구동합니다. 12V DC(226AASW) 또는 24V DC(226AOSW) 코일로 공급됩니다.', 'Cartridge-design 2/2 normally closed direct-acting solenoid valve, allowing multiple functions from a single block. The wet-pin solenoid has no dynamic sealing and directly actuates a 2.5 mm orifice up to 160 bar. Supplied with 12V DC (226AASW) or 24V DC (226AOSW) coil.',
  '{"valve_function": "2_2", "actuation": "solenoid", "nominal_size": "dn3", "max_inlet_pressure_bar": 200, "operating_pressure_range": "8-160 bar", "max_flow_lpm": 10, "cv_value": 0.15, "porting": "1/4\" BSPP", "voltage": "12 / 24V DC", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5210, '2/2 직동식 솔레노이드 밸브 (n/c, dn3) 2/2 direct-acting solenoid valve (n/c, dn3) 카트리지형 dn3 2/2 노멀 클로즈드 직동 솔레노이드 밸브 cartridge-type dn3 2/2 normally closed direct-acting solenoid valve 226aasw / 226aosw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 2_2 2/2 밸브 2/2 valve solenoid 솔레노이드 solenoid dn3 dn3 dn3 200 8-160 bar 10 0.15 1/4" bspp 12 / 24v dc aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-226c-2-2-pilot-nc', '226CASW / 226COSW / 2M26CASW / 2M26COSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '2/2 파일럿 솔레노이드 밸브 (N/C, DN9)', '2/2 Pilot-Operated Solenoid Valve (N/C, DN9)', 'DN9 2/2 노멀 클로즈드 파일럿 작동 솔레노이드 밸브, 0-60 L/min', 'DN9 2/2 normally closed pilot-operated solenoid valve, 0-60 L/min', '매니폴드 설계의 2/2 노멀 클로즈드 파일럿 작동 솔레노이드 밸브입니다. 웨트 핀 파일럿 솔레노이드가 2.5mm 오리피스를 구동해 최대 160bar에서 대유량을 제어합니다. 12/24V DC 코일, 단품 및 매니폴드 마운트(2M26C)로 공급됩니다.', 'Manifold-design 2/2 normally closed pilot-operated solenoid valve. A wet-pin pilot solenoid actuates a 2.5 mm orifice to control higher flows up to 160 bar. 12/24V DC coils; stand-alone or manifold mount (2M26C).',
  '{"valve_function": "2_2", "actuation": "pilot", "nominal_size": "dn9", "max_inlet_pressure_bar": 200, "operating_pressure_range": "8-160 bar", "max_flow_lpm": 60, "cv_value": 0.15, "porting": "3/8\" BSPP", "voltage": "12 / 24V DC", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5220, '2/2 파일럿 솔레노이드 밸브 (n/c, dn9) 2/2 pilot-operated solenoid valve (n/c, dn9) dn9 2/2 노멀 클로즈드 파일럿 작동 솔레노이드 밸브, 0-60 l/min dn9 2/2 normally closed pilot-operated solenoid valve, 0-60 l/min 226casw / 226cosw / 2m26casw / 2m26cosw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 2_2 2/2 밸브 2/2 valve pilot 파일럿 pilot dn9 dn9 dn9 200 8-160 bar 60 0.15 3/8" bspp 12 / 24v dc aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-226f-2-2-pilot-nc', '226FASW / 226FOSW / 2M26FASW / 2M26FOSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '2/2 파일럿 솔레노이드 밸브 (N/C, DN25)', '2/2 Pilot-Operated Solenoid Valve (N/C, DN25)', 'DN25 2/2 노멀 클로즈드 파일럿 작동 솔레노이드 밸브, 0-120 L/min', 'DN25 2/2 normally closed pilot-operated solenoid valve, 0-120 L/min', '대유량용 DN25 2/2 노멀 클로즈드 파일럿 작동 솔레노이드 밸브입니다. 20mm 유로에 Cv 2.5로 0-120 L/min을 최대 160bar에서 제어합니다. 12/24V DC 코일, 단품 및 매니폴드 마운트로 공급됩니다.', 'High-flow DN25 2/2 normally closed pilot-operated solenoid valve. A 20 mm gallery with Cv 2.5 controls 0-120 L/min at up to 160 bar. 12/24V DC coils; stand-alone or manifold mount.',
  '{"valve_function": "2_2", "actuation": "pilot", "nominal_size": "dn25", "max_inlet_pressure_bar": 200, "operating_pressure_range": "8-160 bar", "max_flow_lpm": 120, "cv_value": 2.5, "porting": "1\" BSPP", "voltage": "12 / 24V DC", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5230, '2/2 파일럿 솔레노이드 밸브 (n/c, dn25) 2/2 pilot-operated solenoid valve (n/c, dn25) dn25 2/2 노멀 클로즈드 파일럿 작동 솔레노이드 밸브, 0-120 l/min dn25 2/2 normally closed pilot-operated solenoid valve, 0-120 l/min 226fasw / 226fosw / 2m26fasw / 2m26fosw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 2_2 2/2 밸브 2/2 valve pilot 파일럿 pilot dn25 dn25 dn25 200 8-160 bar 120 2.5 1" bspp 12 / 24v dc aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-500-dn25-manifold', '500-023 / 500-024 / 500-025 / 500-026 / 500-027', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-accessories'), (select id from business_areas where slug = 'fluid-gas'),
  'DN25 2/2 밸브 매니폴드 (1-5 스테이션)', 'DN25 2/2 Valve Manifold (1-5 Stations)', 'DN25 2/2 밸브용 316 스테인리스 매니폴드, 1-5 스테이션', '316 stainless manifold for DN25 2/2 valves, 1-5 stations', 'DN25 2/2 노멀 오픈/클로즈드 밸브용 316 스테인리스강 매니폴드로 1-5 스테이션으로 제공됩니다. 예시 구성: 4 스테이션 매니폴드(500-026)에 N/C 밸브 3개와 N/O 밸브 1개 장착.', '316 stainless steel manifolds for DN25 2/2 normally open and closed valves, in 1 to 5 stations. Example assembly: a 4-station manifold (500-026) with three N/C and one N/O valve.',
  '{"product_type": "manifold", "compatible_valve_size": "DN25 (2M26F / 2M21F)", "stations": "1 / 2 / 3 / 4 / 5", "supply_voltage": "-", "material": "316 스테인리스강", "mounting": "매니폴드 블록 (A 100-320 mm)"}'::jsonb, true, 5240, 'dn25 2/2 밸브 매니폴드 (1-5 스테이션) dn25 2/2 valve manifold (1-5 stations) dn25 2/2 밸브용 316 스테인리스 매니폴드, 1-5 스테이션 316 stainless manifold for dn25 2/2 valves, 1-5 stations 500-023 / 500-024 / 500-025 / 500-026 / 500-027 the water hydraulics co. ltd 제어기기·액세서리 controls & accessories manifold 매니폴드 manifold dn25 (2m26f / 2m21f) 1 / 2 / 3 / 4 / 5 - 316 스테인리스강 매니폴드 블록 (a 100-320 mm)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-500-dn9-manifold', '500-009 / 500-010 / 500-011 / 500-012 / 500-005', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-accessories'), (select id from business_areas where slug = 'fluid-gas'),
  'DN9 2/2 밸브 매니폴드 (1-5 스테이션)', 'DN9 2/2 Valve Manifold (1-5 Stations)', 'DN9 2/2 밸브용 316 스테인리스 매니폴드, 1-5 스테이션', '316 stainless manifold for DN9 2/2 valves, 1-5 stations', 'DN9 2/2 노멀 오픈/클로즈드 밸브용 316 스테인리스강 매니폴드로 1-5 스테이션으로 제공됩니다. 솔레노이드·파일럿 등 모든 구동 방식의 밸브를 장착할 수 있습니다.', '316 stainless steel manifolds for DN9 2/2 normally open and closed valves, in 1 to 5 stations. Accept all actuation formats such as solenoid or pilot.',
  '{"product_type": "manifold", "compatible_valve_size": "DN9 (2M26C / 2M21C)", "stations": "1 / 2 / 3 / 4 / 5", "supply_voltage": "-", "material": "316 스테인리스강", "mounting": "매니폴드 블록 (A 95-295 mm)"}'::jsonb, true, 5250, 'dn9 2/2 밸브 매니폴드 (1-5 스테이션) dn9 2/2 valve manifold (1-5 stations) dn9 2/2 밸브용 316 스테인리스 매니폴드, 1-5 스테이션 316 stainless manifold for dn9 2/2 valves, 1-5 stations 500-009 / 500-010 / 500-011 / 500-012 / 500-005 the water hydraulics co. ltd 제어기기·액세서리 controls & accessories manifold 매니폴드 manifold dn9 (2m26c / 2m21c) 1 / 2 / 3 / 4 / 5 - 316 스테인리스강 매니폴드 블록 (a 95-295 mm)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-591-001', '591-001', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-check-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '호스 파열 방지 밸브 (DN3)', 'Hose Burst Valve (DN3)', '호스 파열 시 유동을 즉시 차단하는 DN3 안전 밸브', 'DN3 safety valve that instantly stops flow on hose burst', '평상시 양방향 자유 유동을 허용하다가 호스 파열로 B→A 방향 유량이 급증하면 즉시 차단하여 B측 압력을 유지하는 안전 밸브입니다. 호스 교체 후 역방향 유동으로 리셋되며, 내부 스프링은 TWHC에서 요구 유량에 맞게 설정합니다. 역류 차단 설정 범위는 1-5 L/min입니다.', 'Allows free flow in both directions until a hose burst causes a surge from B to A, then instantly stops flow and locks pressure in B. Reset by reversing flow after hose replacement; the internal spring is factory-set by TWHC. Reverse flow adjustment 1-5 L/min.',
  '{"valve_type": "hose_burst", "nominal_size": "dn3", "pressure_range": "0.1-200 bar", "cv_value": 0.02, "max_flow_lpm": 30, "porting": "1/4\" BSPP", "cracking_pressure": "역류 차단 설정 1-5 L/min", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5260, '호스 파열 방지 밸브 (dn3) hose burst valve (dn3) 호스 파열 시 유동을 즉시 차단하는 dn3 안전 밸브 dn3 safety valve that instantly stops flow on hose burst 591-001 the water hydraulics co. ltd 체크·안전 밸브 check & safety valves hose_burst 호스 파열 방지 밸브 hose burst valve dn3 dn3 dn3 0.1-200 bar 0.02 30 1/4" bspp 역류 차단 설정 1-5 l/min aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-591-007', '591-007', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-check-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '호스 파열 방지 밸브 (DN6)', 'Hose Burst Valve (DN6)', '호스 파열 시 유동을 즉시 차단하는 DN6 안전 밸브', 'DN6 safety valve that instantly stops flow on hose burst', '호스 파열 시 B→A 방향 유량 급증을 감지해 즉시 차단하는 DN6 안전 밸브입니다. 최대 유량 50 L/min, 역류 차단 설정 범위는 5-10 L/min이며 호스 교체 후 역방향 유동으로 리셋됩니다.', 'DN6 safety valve that detects the flow surge from B to A on hose burst and immediately stops flow. Max flow 50 L/min, reverse flow adjustment 5-10 L/min; reset by reversing flow after hose replacement.',
  '{"valve_type": "hose_burst", "nominal_size": "dn6", "pressure_range": "0.1-200 bar", "cv_value": 0.62, "max_flow_lpm": 50, "porting": "1/4\" BSPP", "cracking_pressure": "역류 차단 설정 5-10 L/min", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5270, '호스 파열 방지 밸브 (dn6) hose burst valve (dn6) 호스 파열 시 유동을 즉시 차단하는 dn6 안전 밸브 dn6 safety valve that instantly stops flow on hose burst 591-007 the water hydraulics co. ltd 체크·안전 밸브 check & safety valves hose_burst 호스 파열 방지 밸브 hose burst valve dn6 dn6 dn6 0.1-200 bar 0.62 50 1/4" bspp 역류 차단 설정 5-10 l/min aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-6mani-manifold', '6MANI1-4 / 6MANIR1-4', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-accessories'), (select id from business_areas where slug = 'fluid-gas'),
  'DN6 밸브 매니폴드 (1-4 스테이션)', 'DN6 Valve Manifold (1-4 Stations)', '3/2·4/2·4/3 밸브용 316 스테인리스 매니폴드, 릴리프 포트 옵션', '316 stainless manifold for 3/2, 4/2 and 4/3 valves, optional relief ports', 'DN6 Janus 밸브(3/2, 4/2, 4/3)용 316 스테인리스강 매니폴드로 1-4 스테이션으로 제공됩니다. 릴리프 밸브 포트 포함(6MANIR) 또는 미포함(6MANI) 사양이 있으며, 최대 유량은 릴리프 미장착 시 30 L/min, 2M07BXSW 장착 시 22 L/min입니다.', '316 stainless steel manifolds for DN6 Janus valves (3/2, 4/2, 4/3) in 1-4 stations, with (6MANIR) or without (6MANI) relief valve porting. Max flow 30 L/min without integral relief, 22 L/min with a 2M07BXSW fitted.',
  '{"product_type": "manifold", "compatible_valve_size": "DN6 (2M06/2M12/2M01/2M03/2M08, 2M07 릴리프)", "stations": "1 / 2 / 3 / 4", "supply_voltage": "-", "material": "316 스테인리스강", "mounting": "인렛 1/4\" BSPP, 보조 고압 포트 1/4\" BSPP"}'::jsonb, true, 5280, 'dn6 밸브 매니폴드 (1-4 스테이션) dn6 valve manifold (1-4 stations) 3/2·4/2·4/3 밸브용 316 스테인리스 매니폴드, 릴리프 포트 옵션 316 stainless manifold for 3/2, 4/2 and 4/3 valves, optional relief ports 6mani1-4 / 6manir1-4 the water hydraulics co. ltd 제어기기·액세서리 controls & accessories manifold 매니폴드 manifold dn6 (2m06/2m12/2m01/2m03/2m08, 2m07 릴리프) 1 / 2 / 3 / 4 - 316 스테인리스강 인렛 1/4" bspp, 보조 고압 포트 1/4" bspp')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-actuation-card-004', '004-010 / 004-013 (마운팅: 004-101 ~ 004-116)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-accessories'), (select id from business_areas where slug = 'fluid-gas'),
  '솔레노이드 구동 카드 (PWM)', 'Solenoid Actuation Card (PWM)', '20bar 이상 솔레노이드 구동 시 필수인 PWM 구동 카드', 'PWM actuation card required for solenoid operation above 20 bar', 'Janus 방향 제어 밸브의 솔레노이드를 PWM 방식으로 구동하는 카드로, 20bar 이상 구동 시 필수입니다. 초기 24V 100ms → 15V 2초 → 10V 유지의 시퀀스로 소비 전력과 코일 발열을 최소화합니다. 24V(004-010) 및 48V(004-013) 버전이 있으며 1-3매 카드용 DIN 레일 마운팅 키트로도 공급됩니다. 정격 24V DC 5A 전원이 필요합니다.', 'PWM card driving Janus valve solenoids, mandatory for actuation above 20 bar. Sequences 24 V for 100 ms, 15 V for 2 s, then a 10 V hold to minimise power consumption and coil heating. 24 V (004-010) and 48 V (004-013) versions, with DIN-rail mounting kits for 1-3 cards. Requires a regulated 24 VDC 5 A supply.',
  '{"product_type": "actuation_card", "compatible_valve_size": "Janus 솔레노이드 밸브 (12V 코일)", "stations": "1-3 카드 (DIN 레일 키트)", "supply_voltage": "24V DC 5A (48V 버전: 24V+48V 2.5A)", "material": "-", "mounting": "DIN 레일 옵션 (카드 단품 H38 x L78 x W42 mm)"}'::jsonb, true, 5290, '솔레노이드 구동 카드 (pwm) solenoid actuation card (pwm) 20bar 이상 솔레노이드 구동 시 필수인 pwm 구동 카드 pwm actuation card required for solenoid operation above 20 bar 004-010 / 004-013 (마운팅: 004-101 ~ 004-116) the water hydraulics co. ltd 제어기기·액세서리 controls & accessories actuation_card 구동 카드 actuation card janus 솔레노이드 밸브 (12v 코일) 1-3 카드 (din 레일 키트) 24v dc 5a (48v 버전: 24v+48v 2.5a) - din 레일 옵션 (카드 단품 h38 x l78 x w42 mm)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-dn12-po-check-valve', '211DJSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-check-valves'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus DN12 파일럿 조작 체크밸브', 'Janus DN12 Pilot Operated Check Valve', 'DN12 PO 체크밸브, 0~60L/min, 2.3:1 파일럿비', 'DN12 PO check valve, 0-60 L/min, 2.3:1 pilot ratio', '전체 316 스테인리스 구조의 DN12 파일럿 조작 체크밸브입니다. 이중 씰 구조로 여러 종류의 파일럿 유체를 사용해도 교차 오염이 발생하지 않으며, 부하·압력 유지 용도에 100% 기밀 성능을 제공합니다. 표준 2.3:1 파일럿비로 낮은 작동 압력으로도 개방이 가능하고(요청 시 비율 변경), 단독형(211DJSW)과 매니폴드 마운트형(2M11DJSW)으로 공급됩니다.', 'DN12 pilot operated check valve in all-316 stainless construction. Double sealed so it can be actuated by multiple fluids without cross-contamination, giving bubble-tight sealing for load or pressure holding. The standard 2.3:1 pilot ratio allows actuation with low pilot pressure (modifiable on request); supplied stand-alone (211DJSW) or manifold mounted (2M11DJSW).',
  '{"valve_type": "pilot_operated_check", "nominal_size": "DN12 (피드 갤러리 12mm)", "max_inlet_pressure": 160, "operating_pressure_range": "0~160 bar", "max_flow": 60, "pilot_ratio": "2.3:1 (표준, 요청 시 변경 가능)", "porting": "1/2\" BSP (평행나사)", "cv_rate": 3.9, "material": "A.I.S.I 316 / 폴리머", "cracking_pressure": "-"}'::jsonb, true, 5300, 'janus dn12 파일럿 조작 체크밸브 janus dn12 pilot operated check valve dn12 po 체크밸브, 0~60l/min, 2.3:1 파일럿비 dn12 po check valve, 0-60 l/min, 2.3:1 pilot ratio 211djsw the water hydraulics co. ltd 체크·안전 밸브 check & safety valves pilot_operated_check pilot_operated_check pilot_operated_check dn12 (피드 갤러리 12mm) dn12 (피드 갤러리 12mm) dn12 (피드 갤러리 12mm) 1/2" bsp (평행나사) - 160 0~160 bar 60 2.3:1 (표준, 요청 시 변경 가능) 3.9 a.i.s.i 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-fire-fogging-power-pack', 'P6~P180 Fire Pump Fogging System', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-power-packs'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 소방용 워터 미스트 파워팩', 'Janus Fire Pump Fogging System Power Packs', '워터 미스트 소화용 펌프-모터-탱크 일체형 파워팩', 'Complete pump-motor-tank power packs for water mist fire suppression', '고압 워터 미스트 소화 시스템용 Janus 파워팩 시리즈입니다. P6(8.3L/min)부터 P180(320L/min)까지의 펌프와 400V 4극 전동기(1.5~90kW), 25~9200L 스테인리스 탱크를 조합해 80~140bar 운전 압력에서 1~72개의 분사 헤드를 지원합니다. 9피스톤 설계로 맥동 억제 장치 없이 매끄러운 유량을 제공하며 전체 316L 스테인리스 구조에 ATEX·FM 승인 시스템에 사용됩니다.', 'Janus power pack range for high-pressure water mist fire suppression. Combining P6 (8.3 L/min) to P180 (320 L/min) pumps with 400V 4-pole motors (1.5-90 kW) and 25-9200 L stainless tanks, the packs support 1 to 72 spray heads at 80-140 bar working pressure. The 9-piston design gives smooth flow without pulsation damping, in all-316L construction used in ATEX and FM approved systems.',
  '{"max_pressure": 160, "flow_range": "7.4~320.2 L/min (80~140 bar 운전 기준)", "motor_power_range": "1.5~90 kW (400V 4극 50Hz, 단상 옵션)", "tank_capacity": "25~9,200 L (소화 30분 기준)", "pump_options": "P6, P15, P30, P60, P180 (6.0~225 cc/rev)", "application": "fire_suppression", "material": "316L 스테인리스 (all 316L stainless steel)", "control_options": "전기 제어 시스템 포함 완제품 또는 모터-펌프 조립체, 예비 펌프·조키 펌프 구성 가능"}'::jsonb, true, 5310, 'janus 소방용 워터 미스트 파워팩 janus fire pump fogging system power packs 워터 미스트 소화용 펌프-모터-탱크 일체형 파워팩 complete pump-motor-tank power packs for water mist fire suppression p6~p180 fire pump fogging system the water hydraulics co. ltd 워터 유압 파워팩 water hydraulic power packs 160 7.4~320.2 l/min (80~140 bar 운전 기준) 1.5~90 kw (400v 4극 50hz, 단상 옵션) 25~9,200 l (소화 30분 기준) p6, p15, p30, p60, p180 (6.0~225 cc/rev) fire_suppression 소방(워터 미스트) fire suppression / water mist 316l 스테인리스 (all 316l stainless steel) 전기 제어 시스템 포함 완제품 또는 모터-펌프 조립체, 예비 펌프·조키 펌프 구성 가능')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-janus-cylinder', 'Janus Cylinder (주문 코드 예: 050WD25MF300)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-cylinders'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 타이로드 실린더 시리즈', 'Janus Tie-Rod Cylinder Series', '보어 Ø32-125, 스트로크 50-1500mm 전 스테인리스 워터 실린더', 'All-stainless water cylinders, Ø32-125 bore, 50-1500 mm stroke', '타이로드(타이바) 구조의 전 스테인리스(316) 워터 하이드로릭 실린더로 단동/복동형이 제공됩니다. 최대 압력 160bar, 최대 속도 0.3m/s이며 해수용 듀플렉스 및 세라믹 코팅 옵션이 있습니다. 수나사/암나사/플레인 베어링/구면 베어링 로드 엔드와 전·후 플랜지 마운팅, 근접 센서·리니어 트랜스듀서 등 특수 사양도 주문 가능합니다.', 'All-stainless (316) tie-rod water hydraulic cylinders, single or double acting, rated 160 bar and 0.3 m/s. Duplex stainless for seawater and ceramic coating options are available. Male/female thread, plain or spherical bearing rod ends, front/rear flange mounting, plus specials such as proximity sensors and linear transducers.',
  '{"bore_range": "Ø32 / 40 / 50 / 64 / 80 / 100 / 125 mm", "rod_diameter_range": "Ø16-80 mm", "stroke_range": "50-1500 mm", "max_pressure_bar": 160, "max_speed": "0.3 m/s", "action": "단동 / 복동", "mounting_options": "전면/후면 플랜지, 플레인 베어링, 구면 베어링", "port_size": "1/4\" - 1/2\" BSPP (보어별)", "body_material": "316 스테인리스강 (해수용 듀플렉스 옵션)"}'::jsonb, true, 5320, 'janus 타이로드 실린더 시리즈 janus tie-rod cylinder series 보어 ø32-125, 스트로크 50-1500mm 전 스테인리스 워터 실린더 all-stainless water cylinders, ø32-125 bore, 50-1500 mm stroke janus cylinder (주문 코드 예: 050wd25mf300) the water hydraulics co. ltd 스테인리스 실린더 stainless steel cylinders ø32 / 40 / 50 / 64 / 80 / 100 / 125 mm ø16-80 mm 50-1500 mm 160 0.3 m/s 단동 / 복동 전면/후면 플랜지, 플레인 베어링, 구면 베어링 1/4" - 1/2" bspp (보어별) 316 스테인리스강 (해수용 듀플렉스 옵션)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-m15', 'M15 (예: MB160-15W)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-motors'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 모터 M15', 'Janus Axial Piston Motor M15', '15.0-18.6 cc/rev, 최대 4000rpm, 17.5kW 무급유 워터 모터', '15.0-18.6 cc/rev, up to 4000 rpm, 17.5 kW oil-free water motor', '15.0-18.6cc/rev 배기량의 무급유 액시얼 피스톤 모터로 연속 17.5kW를 제공합니다. 다중 피스톤 설계로 맥동이 최소화되며 12bar 이상에서 기동합니다. 저속 운전용 유성 기어박스와 조합할 수 있습니다.', 'Oil-free axial piston motor of 15.0-18.6 cc/rev delivering 17.5 kW continuous. Multi-piston design minimises pulsation; starts above 12 bar. Can be paired with epicyclic gearboxes for low-speed operation.',
  '{"displacement_max_cc": 18.6, "displacement_min_cc": 15.0, "max_speed_rpm": 4000, "min_speed_rpm": 500, "max_power_kw": 17.5, "max_input_flow_lpm": 72, "max_pressure_bar": 160, "weight_kg": 6, "rotation_options": "CW / CCW / 양방향", "temperature_range": "2-50°C"}'::jsonb, true, 5330, 'janus 액시얼 피스톤 모터 m15 janus axial piston motor m15 15.0-18.6 cc/rev, 최대 4000rpm, 17.5kw 무급유 워터 모터 15.0-18.6 cc/rev, up to 4000 rpm, 17.5 kw oil-free water motor m15 (예: mb160-15w) the water hydraulics co. ltd 액시얼 피스톤 모터 axial piston motors 18.6 15.0 4000 500 17.5 72 160 6 cw / ccw / 양방향 2-50°c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-m180', 'M180 (예: MB160-180W)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-motors'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 모터 M180', 'Janus Axial Piston Motor M180', '135-225 cc/rev, 최대 2000rpm, 120kW 무급유 워터 모터', '135-225 cc/rev, up to 2000 rpm, 120 kW oil-free water motor', '시리즈 최대 크기인 135-225cc/rev 배기량의 무급유 액시얼 피스톤 모터로 연속 120kW, 최대 입력 유량 450 L/min에 대응합니다. 가변 용량형(MV)으로도 주문 가능합니다.', 'The largest of the range at 135-225 cc/rev, delivering 120 kW continuous with up to 450 L/min input. Also available as a variable displacement (MV) unit.',
  '{"displacement_max_cc": 225, "displacement_min_cc": 135.0, "max_speed_rpm": 2000, "min_speed_rpm": 300, "max_power_kw": 120, "max_input_flow_lpm": 450, "max_pressure_bar": 160, "weight_kg": 82, "rotation_options": "CW / CCW / 양방향 / 가변 용량(MV)", "temperature_range": "2-50°C"}'::jsonb, true, 5340, 'janus 액시얼 피스톤 모터 m180 janus axial piston motor m180 135-225 cc/rev, 최대 2000rpm, 120kw 무급유 워터 모터 135-225 cc/rev, up to 2000 rpm, 120 kw oil-free water motor m180 (예: mb160-180w) the water hydraulics co. ltd 액시얼 피스톤 모터 axial piston motors 225 135.0 2000 300 120 450 160 82 cw / ccw / 양방향 / 가변 용량(mv) 2-50°c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-m3', 'M3 (예: MC160-3.0W)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-motors'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 모터 M3', 'Janus Axial Piston Motor M3', '3.0 cc/rev, 최대 4000rpm, 2.7kW 무급유 워터 모터', '3.0 cc/rev, up to 4000 rpm, 2.7 kW oil-free water motor', '물만을 냉각·윤활제로 사용하는 초소형 무급유 액시얼 피스톤 모터입니다. 3.0cc/rev 고정 용량으로 최대 4000rpm, 연속 2.7kW를 제공하며 316 스테인리스강 표준 구조입니다. 시계/반시계/양방향 회전 사양으로 주문 가능하며 무부하 기동에 최소 25bar가 필요합니다.', 'Compact oil-free axial piston motor using water as the only coolant/lubricant. Fixed 3.0 cc/rev displacement delivering up to 4000 rpm and 2.7 kW continuous, in standard 316 stainless steel. Orderable clockwise, anti-clockwise or bi-directional; requires 25 bar minimum to rotate an unloaded shaft.',
  '{"displacement_max_cc": 3.0, "displacement_min_cc": null, "max_speed_rpm": 4000, "min_speed_rpm": 500, "max_power_kw": 2.7, "max_input_flow_lpm": 12, "max_pressure_bar": 160, "weight_kg": 1.5, "rotation_options": "CW / CCW / 양방향", "temperature_range": "2-50°C"}'::jsonb, true, 5350, 'janus 액시얼 피스톤 모터 m3 janus axial piston motor m3 3.0 cc/rev, 최대 4000rpm, 2.7kw 무급유 워터 모터 3.0 cc/rev, up to 4000 rpm, 2.7 kw oil-free water motor m3 (예: mc160-3.0w) the water hydraulics co. ltd 액시얼 피스톤 모터 axial piston motors 3.0 4000 500 2.7 12 160 1.5 cw / ccw / 양방향 2-50°c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-m30', 'M30 (예: MB160-30W)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-motors'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 모터 M30', 'Janus Axial Piston Motor M30', '30.0-34.6 cc/rev, 최대 4000rpm, 31kW 무급유 워터 모터', '30.0-34.6 cc/rev, up to 4000 rpm, 31 kW oil-free water motor', '30.0-34.6cc/rev 배기량의 무급유 액시얼 피스톤 모터로 연속 31kW, 최대 입력 유량 132 L/min에 대응합니다. 2포트(단방향) 또는 케이스 드레인 포트가 추가된 3포트(양방향) 구성으로 공급됩니다.', 'Oil-free axial piston motor of 30.0-34.6 cc/rev delivering 31 kW continuous with up to 132 L/min input. Supplied in 2-port (unidirectional) or 3-port (bi-directional with case drain) configurations.',
  '{"displacement_max_cc": 34.6, "displacement_min_cc": 30.0, "max_speed_rpm": 4000, "min_speed_rpm": 500, "max_power_kw": 31, "max_input_flow_lpm": 132, "max_pressure_bar": 160, "weight_kg": 10, "rotation_options": "CW / CCW / 양방향", "temperature_range": "2-50°C"}'::jsonb, true, 5360, 'janus 액시얼 피스톤 모터 m30 janus axial piston motor m30 30.0-34.6 cc/rev, 최대 4000rpm, 31kw 무급유 워터 모터 30.0-34.6 cc/rev, up to 4000 rpm, 31 kw oil-free water motor m30 (예: mb160-30w) the water hydraulics co. ltd 액시얼 피스톤 모터 axial piston motors 34.6 30.0 4000 500 31 132 160 10 cw / ccw / 양방향 2-50°c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-m6', 'M6 (예: MC160-6.0W)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-motors'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 모터 M6', 'Janus Axial Piston Motor M6', '4.6-6.0 cc/rev, 최대 4000rpm, 5.4kW 무급유 워터 모터', '4.6-6.0 cc/rev, up to 4000 rpm, 5.4 kW oil-free water motor', '4.6 또는 6.0cc/rev 배기량으로 제공되는 무급유 액시얼 피스톤 모터입니다. 최대 4000rpm, 연속 5.4kW를 제공하며 수돗물, 해수, 테크니컬 워터에서 사용 가능합니다. ATEX 인증(II 2GD ck T6)을 획득했습니다.', 'Oil-free axial piston motor available in 4.6 or 6.0 cc/rev, delivering up to 4000 rpm and 5.4 kW continuous. Operates on tap water, sea water and technical fluids; ATEX approved (II 2GD ck T6).',
  '{"displacement_max_cc": 6.0, "displacement_min_cc": 4.6, "max_speed_rpm": 4000, "min_speed_rpm": 500, "max_power_kw": 5.4, "max_input_flow_lpm": 24, "max_pressure_bar": 160, "weight_kg": 2.2, "rotation_options": "CW / CCW / 양방향", "temperature_range": "2-50°C"}'::jsonb, true, 5370, 'janus 액시얼 피스톤 모터 m6 janus axial piston motor m6 4.6-6.0 cc/rev, 최대 4000rpm, 5.4kw 무급유 워터 모터 4.6-6.0 cc/rev, up to 4000 rpm, 5.4 kw oil-free water motor m6 (예: mc160-6.0w) the water hydraulics co. ltd 액시얼 피스톤 모터 axial piston motors 6.0 4.6 4000 500 5.4 24 160 2.2 cw / ccw / 양방향 2-50°c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-m60', 'M60 (예: MB160-63W)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-motors'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 모터 M60', 'Janus Axial Piston Motor M60', '63.0-70.3 cc/rev, 최대 4000rpm, 67kW 무급유 워터 모터', '63.0-70.3 cc/rev, up to 4000 rpm, 67 kW oil-free water motor', '63.0-70.3cc/rev 배기량의 무급유 액시얼 피스톤 모터로 연속 67kW를 제공합니다. 가변 용량형(MV)으로도 주문 가능하며 최대 입력 유량은 292 L/min입니다.', 'Oil-free axial piston motor of 63.0-70.3 cc/rev delivering 67 kW continuous with up to 292 L/min input. Also orderable as a variable displacement (MV) unit.',
  '{"displacement_max_cc": 70.3, "displacement_min_cc": 63.0, "max_speed_rpm": 4000, "min_speed_rpm": 500, "max_power_kw": 67, "max_input_flow_lpm": 292, "max_pressure_bar": 160, "weight_kg": 19, "rotation_options": "CW / CCW / 양방향 / 가변 용량(MV)", "temperature_range": "2-50°C"}'::jsonb, true, 5380, 'janus 액시얼 피스톤 모터 m60 janus axial piston motor m60 63.0-70.3 cc/rev, 최대 4000rpm, 67kw 무급유 워터 모터 63.0-70.3 cc/rev, up to 4000 rpm, 67 kw oil-free water motor m60 (예: mb160-63w) the water hydraulics co. ltd 액시얼 피스톤 모터 axial piston motors 70.3 63.0 4000 500 67 292 160 19 cw / ccw / 양방향 / 가변 용량(mv) 2-50°c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p1', 'P1', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 펌프 P1', 'Janus Axial Piston Pump P1', '0.8~1.2cc/rev 초소형 워터 유압 펌프', 'Ultra-compact water hydraulic pump, 0.8-1.2 cc/rev', 'Janus 시리즈 최소형 액시얼 피스톤 펌프로 물을 유일한 윤활·냉각 매체로 사용하는 완전 무급유 구조입니다. 316 스테인리스 표준 재질로 수돗물·해수·공업용수에 대응하며, 다피스톤 설계로 맥동이 매우 적습니다. 2포트 비가압형으로 공급되며 ATEX(II 2GD ck T6) 승인 제품입니다.', 'The smallest Janus axial piston pump, totally oil-free with water as its only coolant/lubricant. Standard 316 stainless construction suits tap, sea and technical water, and the multi-piston design gives minimal pulsation. Supplied in 2-port unboosted form and ATEX approved (II 2GD ck T6).',
  '{"displacement_max": 1.2, "displacement_min": 0.8, "max_pressure": 120, "max_flow": 2.4, "max_rpm": 2000, "max_input_power": 0.55, "weight": 1.5, "pump_type": "fixed_displacement", "inlet_type": "unboosted_2port", "material": "stainless_316", "temp_range": "2~90°C", "atex": true}'::jsonb, true, 5390, 'janus 액시얼 피스톤 펌프 p1 janus axial piston pump p1 0.8~1.2cc/rev 초소형 워터 유압 펌프 ultra-compact water hydraulic pump, 0.8-1.2 cc/rev p1 the water hydraulics co. ltd 워터 유압 펌프 water hydraulic pumps 1.2 0.8 120 2.4 2000 0.55 1.5 fixed_displacement 정용량형 fixed displacement unboosted_2port 2포트 비가압(언부스티드) 2-port unboosted stainless_316 스테인리스 316 316 stainless steel 2~90°c true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p10-fire', 'P10', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 소방용 펌프 P10', 'Janus Fire Pump P10', '고압 워터 미스트용 10.5cc/rev 소방 펌프', '10.5 cc/rev fire pump for high-pressure water mist', '고압 워터 미스트 소화 시스템용으로 개발된 Janus 소방 펌프입니다. 10.5cc/rev 배제용적, 최대 3000rpm에서 31.5L/min, 100bar를 제공하며 기계 효율 90% 이상, 중량 2kg의 초경량·초소형 설계입니다. 5년 서비스 주기의 장수명 설계로 조키(jockey) 펌프로도 사용 가능하며 흡입 체크밸브가 필요 없습니다.', 'Janus fire pump developed for high-pressure water mist suppression systems. With 10.5 cc/rev displacement it delivers 31.5 L/min at up to 100 bar and 3000 rpm, with mechanical efficiency over 90% at only 2 kg. Designed for five-year service intervals, usable as a jockey pump, with no inlet check valves required.',
  '{"displacement_max": 10.5, "displacement_min": 10.5, "max_pressure": 100, "max_flow": 31.5, "max_rpm": 3000, "max_input_power": 5.5, "weight": 2, "pump_type": "fire_pump", "inlet_type": "unboosted_2port", "material": "stainless_316", "temp_range": "2~50°C", "atex": true}'::jsonb, true, 5400, 'janus 소방용 펌프 p10 janus fire pump p10 고압 워터 미스트용 10.5cc/rev 소방 펌프 10.5 cc/rev fire pump for high-pressure water mist p10 the water hydraulics co. ltd 워터 유압 펌프 water hydraulic pumps 10.5 10.5 100 31.5 3000 5.5 2 fire_pump 소방(미스트)용 fire / water-mist pump unboosted_2port 2포트 비가압(언부스티드) 2-port unboosted stainless_316 스테인리스 316 316 stainless steel 2~50°c true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p15', 'P15', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 펌프 P15', 'Janus Axial Piston Pump P15', '12~19cc/rev, 160bar 워터 유압 펌프', 'Water hydraulic pump, 12-19 cc/rev, 160 bar', '12, 15, 19cc/rev 배제용적으로 제공되는 중형 Janus 액시얼 피스톤 펌프입니다. 최대 160bar 연속 압력에서 37.2L/min까지 토출하며, 다피스톤 설계로 축압기 없이도 맥동이 매우 작습니다. 316 스테인리스 재질로 수돗물·해수·공업용수에 대응합니다.', 'Mid-size Janus axial piston pump available in 12, 15 and 19 cc/rev displacements, delivering up to 37.2 L/min at 160 bar continuous. The multi-piston design keeps pressure ripple minimal without accumulators. 316 stainless construction handles tap, sea and technical water.',
  '{"displacement_max": 19.0, "displacement_min": 12.0, "max_pressure": 160, "max_flow": 37.2, "max_rpm": 2000, "max_input_power": 11, "weight": 6, "pump_type": "fixed_displacement", "inlet_type": "both", "material": "stainless_316", "temp_range": "2~50°C", "atex": true}'::jsonb, true, 5410, 'janus 액시얼 피스톤 펌프 p15 janus axial piston pump p15 12~19cc/rev, 160bar 워터 유압 펌프 water hydraulic pump, 12-19 cc/rev, 160 bar p15 the water hydraulics co. ltd 워터 유압 펌프 water hydraulic pumps 19.0 12.0 160 37.2 2000 11 6 fixed_displacement 정용량형 fixed displacement both 2포트/3포트 선택 unboosted or boosted stainless_316 스테인리스 316 316 stainless steel 2~50°c true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p15-desal', 'PB80-19 (P15 Desalination)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-desalination-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 담수화 펌프 P15', 'Janus Desalination Pump P15', 'RO 담수화용 12~19cc/rev 해수 펌프', 'Seawater RO pump, 12-19 cc/rev', '12, 15, 19cc/rev 배제용적의 RO 담수화용 Janus 해수 펌프입니다. 80bar에서 최대 2.23m³/hr를 공급하며, 극한 염분 환경을 위한 듀플렉스 2205 풀빌드와 경제적인 하이브리드 빌드 중 선택할 수 있습니다. 9피스톤 설계로 맥동이 작아 축압기가 필요 없습니다.', 'Janus seawater desalination pump in 12, 15 and 19 cc/rev displacements delivering up to 2.23 m³/hr at 80 bar. Choose full Duplex 2205 build for extreme salt concentrations or the cost-effective Hybrid build. The multi-piston design gives minimal pulsation without accumulators.',
  '{"displacement_max": 19.0, "displacement_min": 12.0, "max_pressure": 80, "max_flow_m3h": 2.23, "max_rpm": 2000, "max_input_power": 11, "weight": 6, "build_material": "duplex_or_hybrid", "min_feed_pressure": 2.5, "energy_recovery": false}'::jsonb, true, 5420, 'janus 담수화 펌프 p15 janus desalination pump p15 ro 담수화용 12~19cc/rev 해수 펌프 seawater ro pump, 12-19 cc/rev pb80-19 (p15 desalination) the water hydraulics co. ltd 담수화(해수) 펌프 desalination pumps 19.0 12.0 80 2.23 2000 11 6 duplex_or_hybrid 듀플렉스/하이브리드 선택 duplex or hybrid option 2.5 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p180', 'P180', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 펌프 P180', 'Janus Axial Piston Pump P180', '135~225cc/rev, 160bar 대용량 워터 유압 펌프', 'Large water hydraulic pump, 135-225 cc/rev, 160 bar', '135, 180, 225cc/rev 배제용적의 Janus 시리즈 최대 용량 정용량 펌프로 최대 160bar에서 430L/min까지 토출합니다. 3포트 가압형(부스티드)·기계식 씰 사양으로만 공급되며, 316 스테인리스 재질과 무급유 구조로 대형 워터 유압 시스템의 주 동력원으로 사용됩니다.', 'The largest fixed-displacement Janus pump with 135, 180 and 225 cc/rev options, delivering up to 430 L/min at 160 bar. Supplied only in 3-port boosted configuration with mechanical seal. 316 stainless, oil-free construction for large water hydraulic systems.',
  '{"displacement_max": 225.0, "displacement_min": 135.0, "max_pressure": 160, "max_flow": 430, "max_rpm": 2000, "max_input_power": 114, "weight": 82, "pump_type": "fixed_displacement", "inlet_type": "boosted_3port", "material": "stainless_316", "temp_range": "2~50°C", "atex": true}'::jsonb, true, 5430, 'janus 액시얼 피스톤 펌프 p180 janus axial piston pump p180 135~225cc/rev, 160bar 대용량 워터 유압 펌프 large water hydraulic pump, 135-225 cc/rev, 160 bar p180 the water hydraulics co. ltd 워터 유압 펌프 water hydraulic pumps 225.0 135.0 160 430 2000 114 82 fixed_displacement 정용량형 fixed displacement boosted_3port 3포트 가압(부스티드) 3-port boosted stainless_316 스테인리스 316 316 stainless steel 2~50°c true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p180-desal', 'PB80-225 (P180 Desalination)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-desalination-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 담수화 펌프 P180', 'Janus Desalination Pump P180', 'RO 담수화용 135~225cc/rev 해수 펌프', 'Seawater RO pump, 135-225 cc/rev', '135, 180, 225cc/rev 배제용적의 대용량 RO 담수화용 Janus 해수 펌프입니다. 80bar에서 최대 25.8m³/hr를 공급하며, 듀플렉스 2205 풀빌드 또는 하이브리드 빌드로 제작됩니다. 대규모 담수화 플랜트 및 해양 설비에 적합합니다.', 'Large Janus seawater desalination pump in 135, 180 and 225 cc/rev displacements delivering up to 25.8 m³/hr at 80 bar. Manufactured in full Duplex 2205 or Hybrid build, suited to larger desalination plants and offshore installations.',
  '{"displacement_max": 225, "displacement_min": 135, "max_pressure": 80, "max_flow_m3h": 25.8, "max_rpm": 2000, "max_input_power": 114, "weight": 82, "build_material": "duplex_or_hybrid", "min_feed_pressure": 2.5, "energy_recovery": false}'::jsonb, true, 5440, 'janus 담수화 펌프 p180 janus desalination pump p180 ro 담수화용 135~225cc/rev 해수 펌프 seawater ro pump, 135-225 cc/rev pb80-225 (p180 desalination) the water hydraulics co. ltd 담수화(해수) 펌프 desalination pumps 225 135 80 25.8 2000 114 82 duplex_or_hybrid 듀플렉스/하이브리드 선택 duplex or hybrid option 2.5 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p3', 'P3', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 펌프 P3', 'Janus Axial Piston Pump P3', '3.0cc/rev, 160bar 소형 워터 유압 펌프', 'Compact water hydraulic pump, 3.0 cc/rev, 160 bar', '3.0cc/rev 배제용적의 소형 Janus 액시얼 피스톤 펌프입니다. 물 윤활 무급유 구조와 316 스테인리스 재질로 부식성 유체에 강하며, 최대 160bar 연속 압력에서 6L/min의 유량을 제공합니다. 2포트 비가압형과 3포트 가압형(부스티드) 모두 선택 가능합니다.', 'Small Janus axial piston pump with 3.0 cc/rev displacement. Water-lubricated, oil-free and built in 316 stainless steel, it delivers up to 6 L/min at 160 bar continuous pressure. Available in both 2-port unboosted and 3-port boosted configurations.',
  '{"displacement_max": 3.0, "displacement_min": 3.0, "max_pressure": 160, "max_flow": 6.0, "max_rpm": 2000, "max_input_power": 1.75, "weight": 1.9, "pump_type": "fixed_displacement", "inlet_type": "both", "material": "stainless_316", "temp_range": "2~50°C", "atex": true}'::jsonb, true, 5450, 'janus 액시얼 피스톤 펌프 p3 janus axial piston pump p3 3.0cc/rev, 160bar 소형 워터 유압 펌프 compact water hydraulic pump, 3.0 cc/rev, 160 bar p3 the water hydraulics co. ltd 워터 유압 펌프 water hydraulic pumps 3.0 3.0 160 6.0 2000 1.75 1.9 fixed_displacement 정용량형 fixed displacement both 2포트/3포트 선택 unboosted or boosted stainless_316 스테인리스 316 316 stainless steel 2~50°c true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p30', 'P30', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 펌프 P30', 'Janus Axial Piston Pump P30', '23~35cc/rev, 160bar 워터 유압 펌프', 'Water hydraulic pump, 23-35 cc/rev, 160 bar', '23, 30, 35cc/rev 배제용적의 Janus 액시얼 피스톤 펌프로 최대 160bar에서 66L/min까지 토출합니다. 물 윤활 무급유 구조와 316 스테인리스 재질로 청정성이 요구되는 산업에 적합하며, 파워팩용(PPC) 구성도 지원합니다. ATEX(II 2GD ck T6) 승인 제품입니다.', 'Janus axial piston pump in 23, 30 and 35 cc/rev displacements, delivering up to 66 L/min at 160 bar. Water-lubricated oil-free design in 316 stainless steel suits hygiene-critical industries, with power-pack (PPC) build options. ATEX approved (II 2GD ck T6).',
  '{"displacement_max": 35.0, "displacement_min": 23.0, "max_pressure": 160, "max_flow": 66, "max_rpm": 2000, "max_input_power": 19.5, "weight": 10, "pump_type": "fixed_displacement", "inlet_type": "both", "material": "stainless_316", "temp_range": "2~50°C", "atex": true}'::jsonb, true, 5460, 'janus 액시얼 피스톤 펌프 p30 janus axial piston pump p30 23~35cc/rev, 160bar 워터 유압 펌프 water hydraulic pump, 23-35 cc/rev, 160 bar p30 the water hydraulics co. ltd 워터 유압 펌프 water hydraulic pumps 35.0 23.0 160 66 2000 19.5 10 fixed_displacement 정용량형 fixed displacement both 2포트/3포트 선택 unboosted or boosted stainless_316 스테인리스 316 316 stainless steel 2~50°c true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p30-desal', 'PB80-35 (P30 Desalination)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-desalination-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 담수화 펌프 P30', 'Janus Desalination Pump P30', 'RO 담수화용 23~35cc/rev 해수 펌프', 'Seawater RO pump, 23-35 cc/rev', '23, 30, 35cc/rev 배제용적의 RO 담수화용 Janus 해수 펌프로 80bar에서 최대 3.96m³/hr를 공급합니다. 듀플렉스 2205 또는 하이브리드 빌드로 제작되어 해수 부식에 강하며, 축 속도 제어만으로 정밀한 유량 계량이 가능합니다.', 'Janus seawater desalination pump in 23, 30 and 35 cc/rev displacements delivering up to 3.96 m³/hr at 80 bar. Duplex 2205 or Hybrid build resists seawater corrosion, and accurate flow metering is achieved simply by shaft speed control.',
  '{"displacement_max": 35.0, "displacement_min": 23.0, "max_pressure": 80, "max_flow_m3h": 3.96, "max_rpm": 2000, "max_input_power": 19.5, "weight": 10, "build_material": "duplex_or_hybrid", "min_feed_pressure": 2.5, "energy_recovery": false}'::jsonb, true, 5470, 'janus 담수화 펌프 p30 janus desalination pump p30 ro 담수화용 23~35cc/rev 해수 펌프 seawater ro pump, 23-35 cc/rev pb80-35 (p30 desalination) the water hydraulics co. ltd 담수화(해수) 펌프 desalination pumps 35.0 23.0 80 3.96 2000 19.5 10 duplex_or_hybrid 듀플렉스/하이브리드 선택 duplex or hybrid option 2.5 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p6', 'P6', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 펌프 P6', 'Janus Axial Piston Pump P6', '4.6~6.0cc/rev, 160bar 워터 유압 펌프', 'Water hydraulic pump, 4.6-6.0 cc/rev, 160 bar', '4.6 및 6.0cc/rev 두 가지 배제용적으로 제공되는 Janus 액시얼 피스톤 펌프입니다. 최대 160bar에서 12L/min까지 토출하며, 물 윤활 무급유 구조로 시스템 유체의 오일 오염 가능성이 없습니다. 2포트/3포트 구성 및 기계식 씰 옵션이 가능하며 ATEX 승인 제품입니다.', 'Janus axial piston pump offered in 4.6 and 6.0 cc/rev displacements, delivering up to 12 L/min at 160 bar. The water-lubricated oil-free design eliminates any oil contamination of the system fluid. Available in 2-port or 3-port form with mechanical seal option; ATEX approved.',
  '{"displacement_max": 6.0, "displacement_min": 4.6, "max_pressure": 160, "max_flow": 12, "max_rpm": 2000, "max_input_power": 3.8, "weight": 2.2, "pump_type": "fixed_displacement", "inlet_type": "both", "material": "stainless_316", "temp_range": "2~50°C", "atex": true}'::jsonb, true, 5480, 'janus 액시얼 피스톤 펌프 p6 janus axial piston pump p6 4.6~6.0cc/rev, 160bar 워터 유압 펌프 water hydraulic pump, 4.6-6.0 cc/rev, 160 bar p6 the water hydraulics co. ltd 워터 유압 펌프 water hydraulic pumps 6.0 4.6 160 12 2000 3.8 2.2 fixed_displacement 정용량형 fixed displacement both 2포트/3포트 선택 unboosted or boosted stainless_316 스테인리스 316 316 stainless steel 2~50°c true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p6-desal', 'PB80-6.0 (P6 Desalination)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-desalination-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 담수화 펌프 P6', 'Janus Desalination Pump P6', 'RO 담수화용 4.6~6.0cc/rev 해수 펌프', 'Seawater RO pump, 4.6-6.0 cc/rev', '해수를 유일한 윤활·냉각 매체로 사용하는 역삼투(RO) 담수화용 Janus 액시얼 피스톤 펌프입니다. 접수부 전체 듀플렉스 2205 빌드 또는 316L+듀플렉스 하이브리드 빌드를 선택할 수 있으며, 80bar에서 최대 0.72m³/hr를 공급합니다. 3포트 가압형으로 최소 2.5bar 급수 압력이 필요합니다.', 'Janus axial piston pump for reverse-osmosis desalination running on seawater as its only lubricant/coolant. Available in full Duplex 2205 or Hybrid 316L+Duplex builds, delivering up to 0.72 m³/hr at 80 bar. 3-port boosted design requiring minimum 2.5 bar feed pressure.',
  '{"displacement_max": 6.0, "displacement_min": 4.6, "max_pressure": 80, "max_flow_m3h": 0.72, "max_rpm": 2000, "max_input_power": 3.8, "weight": 2.2, "build_material": "duplex_or_hybrid", "min_feed_pressure": 2.5, "energy_recovery": false}'::jsonb, true, 5490, 'janus 담수화 펌프 p6 janus desalination pump p6 ro 담수화용 4.6~6.0cc/rev 해수 펌프 seawater ro pump, 4.6-6.0 cc/rev pb80-6.0 (p6 desalination) the water hydraulics co. ltd 담수화(해수) 펌프 desalination pumps 6.0 4.6 80 0.72 2000 3.8 2.2 duplex_or_hybrid 듀플렉스/하이브리드 선택 duplex or hybrid option 2.5 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p60', 'P60', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 펌프 P60', 'Janus Axial Piston Pump P60', '51~70.3cc/rev, 160bar 워터 유압 펌프', 'Water hydraulic pump, 51-70.3 cc/rev, 160 bar', '51, 63, 70cc/rev 배제용적의 대유량 Janus 액시얼 피스톤 펌프입니다. 최대 160bar 연속 압력에서 146L/min까지 토출하며, 물 윤활 무급유 구조로 오일 오염이 원천 차단됩니다. 2포트/3포트 및 파워팩용(PPC) 구성이 가능하고 가변용량형(PV)도 별도 제공됩니다.', 'High-flow Janus axial piston pump in 51, 63 and 70 cc/rev displacements, delivering up to 146 L/min at 160 bar continuous. Water-lubricated and oil-free, available in 2-port/3-port and power-pack (PPC) builds; a variable displacement (PV) version is also offered.',
  '{"displacement_max": 70.3, "displacement_min": 51.0, "max_pressure": 160, "max_flow": 146, "max_rpm": 2000, "max_input_power": 42, "weight": 19, "pump_type": "fixed_displacement", "inlet_type": "both", "material": "stainless_316", "temp_range": "2~50°C", "atex": true}'::jsonb, true, 5500, 'janus 액시얼 피스톤 펌프 p60 janus axial piston pump p60 51~70.3cc/rev, 160bar 워터 유압 펌프 water hydraulic pump, 51-70.3 cc/rev, 160 bar p60 the water hydraulics co. ltd 워터 유압 펌프 water hydraulic pumps 70.3 51.0 160 146 2000 42 19 fixed_displacement 정용량형 fixed displacement both 2포트/3포트 선택 unboosted or boosted stainless_316 스테인리스 316 316 stainless steel 2~50°c true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p60-desal', 'PB80-70 (P60 Desalination)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-desalination-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 담수화 펌프 P60', 'Janus Desalination Pump P60', 'RO 담수화용 35~70cc/rev 해수 펌프', 'Seawater RO pump, 35-70 cc/rev', '51, 63, 70cc/rev 배제용적의 RO 담수화용 Janus 해수 펌프로 80bar에서 최대 8.76m³/hr를 공급합니다. 3포트 가압형 설계로 급수 압력과 내부 누설수를 분리해 기계식 씰 수명을 연장하며, 시스템은 차압만큼의 구동력만 필요해 에너지 효율이 높습니다.', 'Janus seawater desalination pump in 51, 63 and 70 cc/rev displacements delivering up to 8.76 m³/hr at 80 bar. The 3-port boosted design separates feed water from internal leakage, extending mechanical seal life, and the drive only needs to produce the differential pressure for high energy efficiency.',
  '{"displacement_max": 70.0, "displacement_min": 35.0, "max_pressure": 80, "max_flow_m3h": 8.76, "max_rpm": 2000, "max_input_power": 42, "weight": 19, "build_material": "duplex_or_hybrid", "min_feed_pressure": 2.5, "energy_recovery": false}'::jsonb, true, 5510, 'janus 담수화 펌프 p60 janus desalination pump p60 ro 담수화용 35~70cc/rev 해수 펌프 seawater ro pump, 35-70 cc/rev pb80-70 (p60 desalination) the water hydraulics co. ltd 담수화(해수) 펌프 desalination pumps 70.0 35.0 80 8.76 2000 42 19 duplex_or_hybrid 듀플렉스/하이브리드 선택 duplex or hybrid option 2.5 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p600', 'P600 (PB160-625WMS)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 액시얼 피스톤 펌프 P600', 'Janus Axial Piston Pump P600', '625cc/rev, 937L/min 초대용량 워터 유압 펌프', 'Very large water hydraulic pump, 625 cc/rev, 937 L/min', '625cc/rev 배제용적의 초대용량 Janus 액시얼 피스톤 펌프입니다. 1500rpm(부스티드)에서 최대 937L/min, 100bar 연속 압력을 제공하며 입력 동력은 최대 174kW입니다. 3포트 가압형·기계식 씰 사양(PB160-625WMS)으로만 공급되며 반시계 방향으로 회전합니다.', 'Very large Janus axial piston pump with 625 cc/rev displacement, delivering up to 937 L/min at 100 bar continuous with 174 kW max input power at 1500 rpm boosted. Supplied only as the 3-port boosted, mechanical-seal build PB160-625WMS, anti-clockwise rotation.',
  '{"displacement_max": 625, "displacement_min": 625, "max_pressure": 100, "max_flow": 937, "max_rpm": 1500, "max_input_power": 174, "weight": 120, "pump_type": "fixed_displacement", "inlet_type": "boosted_3port", "material": "stainless_316", "temp_range": "2~50°C", "atex": true}'::jsonb, true, 5520, 'janus 액시얼 피스톤 펌프 p600 janus axial piston pump p600 625cc/rev, 937l/min 초대용량 워터 유압 펌프 very large water hydraulic pump, 625 cc/rev, 937 l/min p600 (pb160-625wms) the water hydraulics co. ltd 워터 유압 펌프 water hydraulic pumps 625 625 100 937 1500 174 120 fixed_displacement 정용량형 fixed displacement boosted_3port 3포트 가압(부스티드) 3-port boosted stainless_316 스테인리스 316 316 stainless steel 2~50°c true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-p600-desal', 'PB80-625 (P600 Desalination)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-desalination-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 담수화 펌프 P600', 'Janus Desalination Pump P600', 'RO 담수화용 625cc/rev 초대용량 해수 펌프', 'Very large seawater RO pump, 625 cc/rev', '625cc/rev 배제용적의 초대용량 RO 담수화용 Janus 해수 펌프입니다. 1250rpm에서 80bar, 최대 55.8m³/hr를 공급하며 입력 동력은 최대 136kW입니다. 듀플렉스 2205 풀빌드(PB80-625DMS) 또는 하이브리드 빌드(PB80-625HMS)로 제공됩니다.', 'Very large Janus seawater desalination pump with 625 cc/rev displacement, delivering up to 55.8 m³/hr at 80 bar and 1250 rpm with 136 kW max input power. Supplied as full Duplex build (PB80-625DMS) or Hybrid build (PB80-625HMS).',
  '{"displacement_max": 625, "displacement_min": 625, "max_pressure": 80, "max_flow_m3h": 55.8, "max_rpm": 1250, "max_input_power": 136, "weight": 120, "build_material": "duplex_or_hybrid", "min_feed_pressure": 2.5, "energy_recovery": false}'::jsonb, true, 5530, 'janus 담수화 펌프 p600 janus desalination pump p600 ro 담수화용 625cc/rev 초대용량 해수 펌프 very large seawater ro pump, 625 cc/rev pb80-625 (p600 desalination) the water hydraulics co. ltd 담수화(해수) 펌프 desalination pumps 625 625 80 55.8 1250 136 120 duplex_or_hybrid 듀플렉스/하이브리드 선택 duplex or hybrid option 2.5 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-pd-gauges', 'PD1 / PD2', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-accessories'), (select id from business_areas where slug = 'fluid-gas'),
  '압력 게이지 (2색/3색)', 'Pressure Gauges (2/3 Colour)', '워터 하이드로릭 시스템용 2색(PD1)·3색(PD2) 압력 게이지', '2-colour (PD1) and 3-colour (PD2) pressure gauges for water hydraulic systems', '워터 하이드로릭 시스템 상태 표시용 압력 게이지 액세서리입니다. 2색 표시의 PD1과 3색 표시의 PD2 두 가지로 제공됩니다.', 'Pressure gauge accessories for water hydraulic systems, available as the 2-colour PD1 and 3-colour PD2.',
  '{"product_type": "gauge", "compatible_valve_size": "-", "stations": "-", "supply_voltage": "-", "material": "-", "mounting": "-"}'::jsonb, true, 5540, '압력 게이지 (2색/3색) pressure gauges (2/3 colour) 워터 하이드로릭 시스템용 2색(pd1)·3색(pd2) 압력 게이지 2-colour (pd1) and 3-colour (pd2) pressure gauges for water hydraulic systems pd1 / pd2 the water hydraulics co. ltd 제어기기·액세서리 controls & accessories gauge 압력 게이지 pressure gauge - - - - -')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-pick-a-pack', 'Pick-A-Pack (P1~P180 Power Units)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-power-packs'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus Pick-A-Pack 모듈형 파워 유닛', 'Janus Pick-A-Pack Modular Power Units', '펌프·모터·탱크·필터·밸브를 조합하는 주문형 워터 유압 파워 유닛', 'Configurable water hydraulic power units built from standard modules', '표준 모듈(펌프-모터, 탱크, 필터, 밸브, 액세서리)을 조합해 주문형 워터 유압 파워 유닛을 구성하는 Janus Pick-A-Pack 시스템입니다. P1~P180 펌프와 IE3 전동기(0.12~110kW), WRAS 적합 316 스테인리스 탱크(표준 5/25/55/90L), 리턴 필터와 자동 급수 밸브, 최대 4스테이션 매니폴드 밸브 어셈블리, 핸드펌프·쿨러 등 액세서리를 코드 체계로 선택합니다. 최대 160bar, 압력 시험 등 다양한 산업 용도에 짧은 납기로 공급됩니다.', 'The Janus Pick-A-Pack system builds bespoke water hydraulic power units from standard modules: P1-P180 pump/IE3 motor assemblies (0.12-110 kW), WRAS-compliant 316 stainless reservoirs (standard 5/25/55/90 L), return filtration with auto-fill valves, manifold valve assemblies up to 4 stations, and accessories such as hand pumps and coolers, all selected through an ordering code. Rated up to 160 bar with short lead times.',
  '{"max_pressure": 160, "flow_range": "0.6~336 L/min (펌프·압력 조합에 따름)", "motor_power_range": "0.12~110 kW (3상 400V ''M'', 단상 240V ''E'' ≤2.2kW, IE3)", "tank_capacity": "표준 5 / 25 / 55 / 90 L (S05~S90), 대용량 별도", "pump_options": "P1, P3, P6, P15, P30, P60, P180 (0.8~225 cc/rev)", "application": "general_power", "material": "316 스테인리스 탱크(WRAS 1999 적합), 스테인리스 배관", "control_options": "릴리프/체크/언로드 밸브(C01~C07), 최대 4스테이션 매니폴드, DN3(10L/min)·DN6(22L/min) 밸브, 온도·수위 보호 스위치"}'::jsonb, true, 5550, 'janus pick-a-pack 모듈형 파워 유닛 janus pick-a-pack modular power units 펌프·모터·탱크·필터·밸브를 조합하는 주문형 워터 유압 파워 유닛 configurable water hydraulic power units built from standard modules pick-a-pack (p1~p180 power units) the water hydraulics co. ltd 워터 유압 파워팩 water hydraulic power packs 160 0.6~336 l/min (펌프·압력 조합에 따름) 0.12~110 kw (3상 400v ''m'', 단상 240v ''e'' ≤2.2kw, ie3) 표준 5 / 25 / 55 / 90 l (s05~s90), 대용량 별도 p1, p3, p6, p15, p30, p60, p180 (0.8~225 cc/rev) general_power 범용 동력원 general power supply 316 스테인리스 탱크(wras 1999 적합), 스테인리스 배관 릴리프/체크/언로드 밸브(c01~c07), 최대 4스테이션 매니폴드, dn3(10l/min)·dn6(22l/min) 밸브, 온도·수위 보호 스위치')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-po-check-valve', '211/213/219/222BJSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-check-valves'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 파일럿 조작 체크밸브 (1/4" BSP)', 'Janus Pilot Operated Check Valve (1/4" BSP)', '부하 유지용 PO 체크밸브, 0~30L/min, 3:1/9:1 파일럿비', 'PO check valve for load holding, 0-30 L/min, 3:1 / 9:1 pilot ratios', '단독 또는 4/3·4/2 방향제어밸브에 볼트온 옵션으로 장착되는 워터 유압용 파일럿 조작 체크밸브입니다. 100% 기밀(버블 타이트) 시트 구조로 실린더 정지 위치 고정 등 부하·압력 유지 용도에 사용되며, 파일럿 대 시트 면적비 3:1과 9:1, 싱글/더블 포트 체크 사양으로 제공됩니다. 316 스테인리스/폴리머 구조이며 매니폴드 마운트(2M 시리즈)도 선택 가능합니다.', 'Pilot operated check valve for water hydraulics, available stand-alone or as a bolt-on option to 4/3 and 4/2 directional valves. Bubble-tight 100% seal for load or pressure holding, e.g. locking a water cylinder in position. Offered in 3:1 and 9:1 pilot-to-seat area ratios, single or double port checked, in 316 stainless/polymer construction with manifold mount (2M series) options.',
  '{"valve_type": "pilot_operated_check", "nominal_size": "1/4\" BSP (피드 갤러리 6mm/4mm)", "max_inlet_pressure": 200, "operating_pressure_range": "0~160 bar", "max_flow": 30, "pilot_ratio": "3:1 (211/213BJSW), 9:1 (219/222BJSW)", "porting": "1/4\" BSP (평행나사)", "cv_rate": 0.62, "material": "A.I.S.I 316 / 폴리머", "cracking_pressure": "표준 6 bar (요청 시 1 bar)"}'::jsonb, true, 5560, 'janus 파일럿 조작 체크밸브 (1/4" bsp) janus pilot operated check valve (1/4" bsp) 부하 유지용 po 체크밸브, 0~30l/min, 3:1/9:1 파일럿비 po check valve for load holding, 0-30 l/min, 3:1 / 9:1 pilot ratios 211/213/219/222bjsw the water hydraulics co. ltd 체크·안전 밸브 check & safety valves pilot_operated_check pilot_operated_check pilot_operated_check 1/4" bsp (피드 갤러리 6mm/4mm) 1/4" bsp (피드 갤러리 6mm/4mm) 1/4" bsp (피드 갤러리 6mm/4mm) 1/4" bsp (평행나사) 표준 6 bar (요청 시 1 bar) 200 0~160 bar 30 3:1 (211/213bjsw), 9:1 (219/222bjsw) 0.62 a.i.s.i 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-power-centre', 'PC3–PC500 (Janus Power Centre)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-desalination-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 파워센터 (에너지 회수 일체형 펌프)', 'Janus Power Centre (Pump with Integrated Energy Recovery)', '에너지 회수 장치 일체형 담수화 액시얼 피스톤 펌프, 3~1000m³/day', 'Desalination axial piston pump with integrated energy recovery, 3-1000 m³/day', '고압 펌프와 에너지 회수 장치(ERD)를 하나의 유닛으로 통합한 담수화용 Janus 파워센터입니다. PC3부터 PC500까지 8개 프레임 크기로 단일 모터-펌프 조립체에서 3~1000m³/day의 생산능력을 제공하며, 압력교환기·부스터 펌프·고압 배관 등을 제거해 permeate 1m³당 2kW 수준의 최저 에너지 소비를 실현합니다. 접수부는 전량 듀플렉스 2205 단조봉재로 가공되며 유량은 축 속도에 비례해 별도 유량계 없이 제어됩니다.', 'The Janus Power Centre integrates the high-pressure pump and energy recovery device (ERD) in a single unit for RO desalination. Eight frame sizes from PC3 to PC500 cover 3 to 1000 m³/day from one motor/pump assembly, eliminating pressure exchangers, booster pumps and high-pressure pipework for best-in-class energy consumption as low as 2 kW per m³ of permeate. All wetted parts are machined from Duplex 2205 wrought bar, and flow is proportional to shaft speed so no flow instrumentation is needed.',
  '{"displacement_max": null, "displacement_min": null, "max_pressure": 80, "max_flow_m3h": null, "max_rpm": null, "max_input_power": null, "weight": null, "build_material": "duplex_2205", "min_feed_pressure": 2.5, "capacity_per_day": "3~1000 m³/day (PC3, PC5, PC30, PC60, PC100, PC250, PC300, PC500)", "energy_recovery": true}'::jsonb, true, 5570, 'janus 파워센터 (에너지 회수 일체형 펌프) janus power centre (pump with integrated energy recovery) 에너지 회수 장치 일체형 담수화 액시얼 피스톤 펌프, 3~1000m³/day desalination axial piston pump with integrated energy recovery, 3-1000 m³/day pc3–pc500 (janus power centre) the water hydraulics co. ltd 담수화(해수) 펌프 desalination pumps 80 duplex_2205 듀플렉스 2205 풀빌드 full duplex 2205 2.5 3~1000 m³/day (pc3, pc5, pc30, pc60, pc100, pc250, pc300, pc500) true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-pressure-test-pack', 'Janus Pressure Test Pack', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-power-packs'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 압력 시험 파워팩', 'Janus Pressure Test Pack', '프로그래머블 이동식 수압 시험 유닛, 최대 800bar(증압 시)', 'Programmable mobile water pressure test unit, up to 800 bar with intensification', '호스·실린더·밸브·주물 등 압력 부품 시험용으로 개발된 모듈형 이동식 수압 시험 유닛입니다. 수돗물을 시험 매체로 사용하여 직접 펌프 압력 160bar·최대 유량 100L/min, 증압기 사용 시 최대 800bar까지 시험할 수 있습니다. 완전 프로그래머블 제어와 PC 데이터 수집·기록, 최대 1Hz의 가변 압력 사이클, 개방/폐쇄 수회로 시험을 지원하며 전체 스테인리스 구조입니다.', 'A modular, mobile water pressure test unit for testing hoses, cylinders, valves, castings and pressure components. Using tap water as the test medium it provides direct pump pressure to 160 bar at up to 100 L/min, and up to 800 bar with intensification. Fully programmable with PC data acquisition and recording, variable pressure cycles up to 1 Hz, and open or closed loop testing, in stainless steel construction.',
  '{"max_pressure": 800, "flow_range": "최대 100 L/min (직접 펌프 압력 160 bar 기준)", "motor_power_range": "단상 또는 3상 전원", "tank_capacity": "모듈형 구성(옵션별 상이)", "pump_options": "Janus 액시얼 피스톤 펌프 + 전자 유량 제어 밸브(옵션 증압기)", "application": "pressure_testing", "material": "스테인리스강, 전 부품 내식성 재질", "control_options": "완전 프로그래머블, PC 데이터 수집·기록, 가변 압력 사이클 최대 1Hz"}'::jsonb, true, 5580, 'janus 압력 시험 파워팩 janus pressure test pack 프로그래머블 이동식 수압 시험 유닛, 최대 800bar(증압 시) programmable mobile water pressure test unit, up to 800 bar with intensification janus pressure test pack the water hydraulics co. ltd 워터 유압 파워팩 water hydraulic power packs 800 최대 100 l/min (직접 펌프 압력 160 bar 기준) 단상 또는 3상 전원 모듈형 구성(옵션별 상이) janus 액시얼 피스톤 펌프 + 전자 유량 제어 밸브(옵션 증압기) pressure_testing 압력 시험 pressure testing 스테인리스강, 전 부품 내식성 재질 완전 프로그래머블, pc 데이터 수집·기록, 가변 압력 사이클 최대 1hz')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-purtrex-px', 'PX (예: PX10-10)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-filtration'), (select id from business_areas where slug = 'fluid-gas'),
  'Purtrex 뎁스 필터 카트리지', 'Purtrex Depth Filtration Cartridges', 'FDA 승인 폴리프로필렌 뎁스 카트리지, 1-75µm', 'FDA-approved polypropylene depth cartridges, 1-75 µm', '장수명·고순도 여과용 폴리프로필렌 뎁스 필터 카트리지로 경제적인 프리필터로도 적합합니다. NSF 42 기준의 FDA 승인 재질로 대전방지제, 습윤제, 용제, 바인더를 포함하지 않습니다. 1-75µm(공칭), 4⅞-40인치 길이로 제공되며 주문 코드는 미크론-길이 형식입니다(예: PX10-10).', 'Polypropylene depth filtration cartridges for long-life, high-purity duty or economic pre-filtration. FDA-approved materials to NSF standard 42, free of anti-static agents, wetting agents, solvents and binders. Nominal 1-75 µm in lengths from 4⅞" to 40"; ordered as micron-length (e.g. PX10-10).',
  '{"filter_type": "cartridge", "max_pressure_bar": null, "micron_ratings": "1 / 3 / 5 / 10 / 20 / 30 / 50 / 75 µm (공칭)", "port_size": "-", "temperature_range": "최대 60°C", "material": "폴리프로필렌", "flow_note": "표준 길이 4⅞ / 9¾ / 9⅞ / 10 / 20 / 29¼ / 30 / 40 인치"}'::jsonb, true, 5590, 'purtrex 뎁스 필터 카트리지 purtrex depth filtration cartridges fda 승인 폴리프로필렌 뎁스 카트리지, 1-75µm fda-approved polypropylene depth cartridges, 1-75 µm px (예: px10-10) the water hydraulics co. ltd 여과 시스템 filtration cartridge 카트리지 cartridge 1 / 3 / 5 / 10 / 20 / 30 / 50 / 75 µm (공칭) - 최대 60°c 폴리프로필렌 표준 길이 4⅞ / 9¾ / 9⅞ / 10 / 20 / 29¼ / 30 / 40 인치')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-pv180', 'PV160-180W (P180 Variable)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 가변용량 펌프 P180', 'Janus Variable Displacement Pump P180', '1~225cc/rev 가변용량 워터 유압 펌프', 'Variable displacement water pump, 1-225 cc/rev', '배제용적을 1~225cc/rev 범위에서 조절하는 대용량 가변용량형 Janus 펌프입니다. 최대 160bar에서 390L/min을 제공하며(1500rpm 기준 330L/min, 88kW), 전자·유압·수동 방식의 용량 제어를 지원합니다. 4극 동기 전동기 직결 구동으로 시스템 수요에 맞춰 출력 유량을 0에서 최대까지 제어합니다.', 'Large variable displacement Janus pump adjustable from 1 to 225 cc/rev, delivering up to 390 L/min at 160 bar (330 L/min and 88 kW at 1500 rpm). Supports electronic, hydraulic and manual displacement control, driven directly by a 4-pole synchronous motor with output flow variable from zero to maximum.',
  '{"displacement_max": 225.0, "displacement_min": 1.0, "max_pressure": 160, "max_flow": 390, "max_rpm": 1750, "max_input_power": 105, "weight": 95, "pump_type": "variable_displacement", "inlet_type": "boosted_3port", "material": "stainless_316", "temp_range": "2~50°C", "atex": false}'::jsonb, true, 5600, 'janus 가변용량 펌프 p180 janus variable displacement pump p180 1~225cc/rev 가변용량 워터 유압 펌프 variable displacement water pump, 1-225 cc/rev pv160-180w (p180 variable) the water hydraulics co. ltd 워터 유압 펌프 water hydraulic pumps 225.0 1.0 160 390 1750 105 95 variable_displacement 가변용량형 variable displacement boosted_3port 3포트 가압(부스티드) 3-port boosted stainless_316 스테인리스 316 316 stainless steel 2~50°c false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-pv60', 'PV160-70W (P60 Variable)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pumps'), (select id from business_areas where slug = 'fluid-gas'),
  'Janus 가변용량 펌프 P60', 'Janus Variable Displacement Pump P60', '1~70cc/rev 가변용량 워터 유압 펌프', 'Variable displacement water pump, 1-70 cc/rev', '배제용적을 1~70cc/rev 범위에서 무단 조절할 수 있는 가변용량형 Janus 펌프입니다. 스와시 플레이트 각도를 전자식(리니어 스테퍼 모터), 유압식(정압·로드센싱) 또는 수동 핸드휠로 제어하며, 최대 160bar에서 122L/min을 제공합니다. 316 스테인리스 재질의 무급유 수윤활 구조입니다.', 'Variable displacement Janus pump adjustable from 1 to 70 cc/rev, delivering up to 122 L/min at 160 bar. Swash plate angle is controlled electronically (linear stepper motor), hydraulically (constant pressure or load sensing) or manually by hand wheel. Oil-free, water-lubricated 316 stainless construction.',
  '{"displacement_max": 70.0, "displacement_min": 1.0, "max_pressure": 160, "max_flow": 122, "max_rpm": 1750, "max_input_power": 32, "weight": 40, "pump_type": "variable_displacement", "inlet_type": "boosted_3port", "material": "stainless_316", "temp_range": "2~50°C", "atex": false}'::jsonb, true, 5610, 'janus 가변용량 펌프 p60 janus variable displacement pump p60 1~70cc/rev 가변용량 워터 유압 펌프 variable displacement water pump, 1-70 cc/rev pv160-70w (p60 variable) the water hydraulics co. ltd 워터 유압 펌프 water hydraulic pumps 70.0 1.0 160 122 1750 32 40 variable_displacement 가변용량형 variable displacement boosted_3port 3포트 가압(부스티드) 3-port boosted stainless_316 스테인리스 316 316 stainless steel 2~50°c false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-relief-valve-dn12', '107DXSW / 407DXSW / 207DXSW / 307DXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pressure-control-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '릴리프 밸브 (DN12)', 'Relief Valve (DN12)', 'DN12 릴리프 밸브, 최대 120 L/min', 'DN12 relief valve, up to 120 L/min', '최대 120 L/min 유량에 대응하는 DN12 릴리프 밸브입니다. 설정 압력 범위(10-30/25-100/70-160/>160bar)를 주문 시 지정하며, 니트릴 씰이 표준으로 공급됩니다.', 'DN12 relief valve handling flows up to 120 L/min. The setting range (10-30 / 25-100 / 70-160 / >160 bar) must be specified at order; nitrile seals as standard.',
  '{"valve_type": "relief", "nominal_size": "dn12", "max_inlet_pressure_bar": 180, "setting_range": "10-30 / 25-100 / 70-160 / >160 bar", "max_flow_lpm": 120, "actuation": "spring", "porting": "BSPP", "body_material": "316 스테인리스강 / 폴리머 또는 세라믹"}'::jsonb, true, 5620, '릴리프 밸브 (dn12) relief valve (dn12) dn12 릴리프 밸브, 최대 120 l/min dn12 relief valve, up to 120 l/min 107dxsw / 407dxsw / 207dxsw / 307dxsw the water hydraulics co. ltd 압력 제어 밸브 pressure control valves relief 릴리프 밸브 relief valve dn12 dn12 dn12 180 10-30 / 25-100 / 70-160 / >160 bar 120 spring 스프링(기계식) spring (mechanical) bspp 316 스테인리스강 / 폴리머 또는 세라믹')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-relief-valve-dn16', '107EXSW / 407EXSW / 207EXSW / 307EXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pressure-control-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '릴리프 밸브 (DN16)', 'Relief Valve (DN16)', 'DN16 릴리프 밸브, 최대 450 L/min', 'DN16 relief valve, up to 450 L/min', '최대 450 L/min의 대유량에 대응하는 DN16 릴리프 밸브입니다. 설정 압력 범위별 사양으로 주문하며, 압력장비지침(97/23/EC)상 ''안전 액세서리''에는 해당하지 않습니다.', 'DN16 relief valve for high flows up to 450 L/min, ordered per setting range. Note: these pressure control valves are not ''Safety Accessories'' as defined in the Pressure Equipment Directive 97/23/EC.',
  '{"valve_type": "relief", "nominal_size": "dn16", "max_inlet_pressure_bar": 180, "setting_range": "10-30 / 25-100 / 70-160 / >160 bar", "max_flow_lpm": 450, "actuation": "spring", "porting": "BSPP", "body_material": "316 스테인리스강 / 폴리머 또는 세라믹"}'::jsonb, true, 5630, '릴리프 밸브 (dn16) relief valve (dn16) dn16 릴리프 밸브, 최대 450 l/min dn16 relief valve, up to 450 l/min 107exsw / 407exsw / 207exsw / 307exsw the water hydraulics co. ltd 압력 제어 밸브 pressure control valves relief 릴리프 밸브 relief valve dn16 dn16 dn16 180 10-30 / 25-100 / 70-160 / >160 bar 450 spring 스프링(기계식) spring (mechanical) bspp 316 스테인리스강 / 폴리머 또는 세라믹')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-relief-valve-dn6', '107BXSW / 407BXSW / 207BXSW / 307BXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pressure-control-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '릴리프 밸브 (DN6)', 'Relief Valve (DN6)', 'DN6 릴리프 밸브, 설정 범위 10-160+ bar, 최대 30 L/min', 'DN6 relief valve, setting ranges 10 to over 160 bar, up to 30 L/min', '저점도 부식성 유체용 특허 릴리프 밸브로 압력장비지침(PED)에 적합하며 내부 파열 디스크 조립체 옵션이 있습니다. 고압 릴리프 시에도 소음이 매우 낮고, 설정 압력 범위(10-30/25-100/70-160/>160bar)별로 스프링과 피스톤이 최적화됩니다. 매니폴드 마운트(1M07BXSW 등)로도 공급됩니다.', 'Patented relief valve for low-viscosity corrosive fluids, conforming to the PED with optional internal burst disc assemblies. Very low noise even at high relief pressures; spring and actuation piston are sized per setting range (10-30 / 25-100 / 70-160 / >160 bar). Manifold-mount versions (e.g. 1M07BXSW) available.',
  '{"valve_type": "relief", "nominal_size": "dn6", "max_inlet_pressure_bar": 180, "setting_range": "10-30 / 25-100 / 70-160 / >160 bar", "max_flow_lpm": 30, "actuation": "spring", "porting": "BSPP / 매니폴드", "body_material": "316 스테인리스강 / 폴리머 또는 세라믹"}'::jsonb, true, 5640, '릴리프 밸브 (dn6) relief valve (dn6) dn6 릴리프 밸브, 설정 범위 10-160+ bar, 최대 30 l/min dn6 relief valve, setting ranges 10 to over 160 bar, up to 30 l/min 107bxsw / 407bxsw / 207bxsw / 307bxsw the water hydraulics co. ltd 압력 제어 밸브 pressure control valves relief 릴리프 밸브 relief valve dn6 dn6 dn6 180 10-30 / 25-100 / 70-160 / >160 bar 30 spring 스프링(기계식) spring (mechanical) bspp / 매니폴드 316 스테인리스강 / 폴리머 또는 세라믹')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-slimline-housings', 'NO5SLBL1/2" / NO103GSTBK/BL3/4"', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-filtration'), (select id from business_areas where slug = 'fluid-gas'),
  '슬림라인 필터 하우징 (5"/10")', 'Slimline Filter Housings (5"/10")', '폴리프로필렌 5"/10" 슬림라인 필터 하우징, 최대 8.6bar', 'Polypropylene 5"/10" slimline filter housings, up to 8.6 bar', '저압 급수 여과용 폴리프로필렌 슬림라인 플라스틱 하우징입니다. No.5(1/2", 5인치)와 No.10 3G(3/4", 10인치, 일체형 브래킷/미터 마운트) 타입이 있으며 압력 릴리즈 버튼 옵션이 제공됩니다. 1µm 카트리지 기준 플리티드 28, 뎁스 16, 카본 1.9 lpm의 유량을 처리합니다.', 'Polypropylene slimline plastic housings for low-pressure feed-water filtration. No.5 (1/2", 5-inch) and No.10 3G (3/4", 10-inch with integral bracket or meter mount) types, with optional pressure release button. With a 1 µm cartridge they pass 28 lpm (pleated), 16 (depth) or 1.9 (carbon).',
  '{"filter_type": "housing", "max_pressure_bar": 8.6, "micron_ratings": "카트리지에 따름", "port_size": "1/2\" / 3/4\"", "temperature_range": "최대 52°C", "material": "폴리프로필렌", "flow_note": "1µm 카트리지, 1psi 차압 기준: 플리티드 28 / 뎁스 16 / 카본 1.9 lpm"}'::jsonb, true, 5650, '슬림라인 필터 하우징 (5"/10") slimline filter housings (5"/10") 폴리프로필렌 5"/10" 슬림라인 필터 하우징, 최대 8.6bar polypropylene 5"/10" slimline filter housings, up to 8.6 bar no5slbl1/2" / no103gstbk/bl3/4" the water hydraulics co. ltd 여과 시스템 filtration housing 필터 하우징 filter housing 8.6 카트리지에 따름 1/2" / 3/4" 최대 52°c 폴리프로필렌 1µm 카트리지, 1psi 차압 기준: 플리티드 28 / 뎁스 16 / 카본 1.9 lpm')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-ss130-element', 'SS130-XXV (예: SS130-10V)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-filtration'), (select id from business_areas where slug = 'fluid-gas'),
  '스테인리스 필터 엘리먼트 SS130', 'Stainless Steel Filter Element SS130', '역세척·재사용 가능한 소결 316 메쉬 엘리먼트, 1-100µm', 'Back-flushable sintered 316 mesh elements, 1-100 µm', '여러 겹의 316 메쉬를 소결한 표면 여과형 스테인리스 필터 엘리먼트입니다. 오염물이 표면에 포집되어 세척과 역세척이 용이하며 초음파 세척이 권장됩니다. 고오염 환경이나 최종 필터 전단의 프리필터로 적합하며 Viton, PTFE 또는 어닐링 동 가스켓과 함께 사용합니다.', 'Surface-type stainless filter elements of sintered multi-layer 316 mesh. Contaminants are retained on the surface, making cleaning and back-flushing simple (ultrasonic cleaning recommended). Ideal for heavily contaminated duties or as pre-filters; require Viton, PTFE or annealed copper gaskets.',
  '{"filter_type": "element", "max_pressure_bar": null, "micron_ratings": "1 / 3 / 10 / 25 / 100 µm", "port_size": "-", "temperature_range": "-", "material": "316 스테인리스 소결 메쉬", "flow_note": "내경 25mm, 길이 64mm (136/136HP 하우징용)"}'::jsonb, true, 5660, '스테인리스 필터 엘리먼트 ss130 stainless steel filter element ss130 역세척·재사용 가능한 소결 316 메쉬 엘리먼트, 1-100µm back-flushable sintered 316 mesh elements, 1-100 µm ss130-xxv (예: ss130-10v) the water hydraulics co. ltd 여과 시스템 filtration element 필터 엘리먼트 filter element 1 / 3 / 10 / 25 / 100 µm - - 316 스테인리스 소결 메쉬 내경 25mm, 길이 64mm (136/136hp 하우징용)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-st5-q-nn', 'ST5-Q-NN (561-002 ~ 561-006)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-accessories'), (select id from business_areas where slug = 'fluid-gas'),
  'ST5-Q-NN 마이크로스텝 드라이브', 'ST5-Q-NN Advanced Microstep Drive', 'Janus 비례 밸브용 프로그래머블 스테퍼 모터 드라이브', 'Programmable stepper drive for Janus proportional valves', 'Janus 전자식 비례 유량/압력 제어 밸브 구동용 DC 마이크로스텝 드라이브입니다. 24-48V DC 전원, 0.1-5.0A/상 출력, Q 프로그래머(744라인 프로그램), Modbus/RTU 통신, 8 디지털 입력/4 출력/2 아날로그 입력, RS-232 포트를 갖추고 있습니다. 개루프 유량 제어(조이스틱/아날로그), 폐루프 압력 제어(디지털/아날로그) 등 사전 구성 버전(561-002~006)으로 공급됩니다.', 'DC microstepping drive for Janus electronic proportional flow and pressure control valves. 24-48 VDC supply, 0.1-5.0 A/phase output, Q Programmer (744-line programs), Modbus/RTU, 8 digital inputs / 4 outputs / 2 analog inputs and RS-232. Supplied preconfigured (561-002 to 561-006) for open-loop flow control (joystick/analog) or closed-loop pressure control (digital/analog).',
  '{"product_type": "stepper_drive", "compatible_valve_size": "223/225 시리즈 비례 밸브", "stations": "-", "supply_voltage": "24-48V DC", "material": "-", "mounting": "패널 마운트"}'::jsonb, true, 5670, 'st5-q-nn 마이크로스텝 드라이브 st5-q-nn advanced microstep drive janus 비례 밸브용 프로그래머블 스테퍼 모터 드라이브 programmable stepper drive for janus proportional valves st5-q-nn (561-002 ~ 561-006) the water hydraulics co. ltd 제어기기·액세서리 controls & accessories stepper_drive 스테퍼 드라이브 stepper drive 223/225 시리즈 비례 밸브 - 24-48v dc - 패널 마운트')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-zone-valve', 'Zone Valve (DN3/DN9/DN25)', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '워터미스트용 존 밸브', 'Zone Valves for Water Mist', '고압 워터미스트용 매니폴드 장착형 존 밸브, 솔레노이드/파일럿 구동', 'Manifold-mounted zone valves for high-pressure water mist, solenoid or pilot actuated', '고압 워터미스트(소화) 산업용 316 스테인리스강 매니폴드 장착형 존 밸브입니다. 1-5 스테이션 매니폴드에 장착되며 존별 독립 제어용 솔레노이드(12/24V, 32W) 또는 파일럿(10-40bar) 구동이 가능합니다. DN3, DN9, DN25 크기로 제공되며 파일럿 사양은 ATEX 인증을 획득했습니다.', 'Manifold-mounted zone valves in 316 stainless steel for the high-pressure water mist industry. Fitted to 1-5 station manifolds with solenoid (12/24 V, 32 W coil) or pilot (10-40 bar) actuation per zone. Available in DN3, DN9 and DN25; pilot versions are ATEX approved.',
  '{"valve_function": "2_2", "actuation": "solenoid", "nominal_size": "dn9", "max_inlet_pressure_bar": 160, "operating_pressure_range": "최대 160 bar", "max_flow_lpm": 60, "cv_value": null, "porting": "매니폴드 (1-5 스테이션, DN3/DN9/DN25)", "voltage": "12 / 24V DC (32W) 또는 파일럿 10-40 bar", "body_material": "316 스테인리스강"}'::jsonb, true, 5680, '워터미스트용 존 밸브 zone valves for water mist 고압 워터미스트용 매니폴드 장착형 존 밸브, 솔레노이드/파일럿 구동 manifold-mounted zone valves for high-pressure water mist, solenoid or pilot actuated zone valve (dn3/dn9/dn25) the water hydraulics co. ltd 방향 제어 밸브 directional control valves 2_2 2/2 밸브 2/2 valve solenoid 솔레노이드 solenoid dn9 dn9 dn9 160 최대 160 bar 60 매니폴드 (1-5 스테이션, dn3/dn9/dn25) 12 / 24v dc (32w) 또는 파일럿 10-40 bar 316 스테인리스강')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-180-series', '180 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '180 시리즈 로터리 시어 방향 제어 밸브', '180 Series Rotary Shear Directional Control Valve', '최대 700 bar, 38 L/min의 로터리 시어 방식 방향 제어 밸브입니다.', 'Rotary shear directional control valve rated to 700 bar and 38 L/min.', '180 시리즈는 로터리 시어 방식의 방향 제어 밸브로, 최대 정격 압력 700 bar(10,000 psi), 최대 정격 유량 38 L/min(10 US gpm)입니다. 주위 온도 -20~50°C, 유체 온도 -30~120°C에서 사용 가능하며 BSPP, SAE, NPTF, 매니폴드 마운트 포트를 지원합니다. 알루미늄 바디에 페놀 수지 노브, 카본 스틸 내부 부품, NBR 씰을 사용합니다.', 'The 180 series is a rotary shear directional control valve rated to 700 bar (10,000 psi) and up to 38 L/min (10 US gpm). It operates at ambient temperatures of -20 to 50°C and media temperatures of -30 to 120°C, with BSPP, SAE, NPTF and manifold mount porting. The aluminium body carries a phenolic resin knob with carbon steel internals and NBR seals.',
  '{"valve_type": "directional", "max_pressure_bar": 700, "max_flow_lpm": 38, "porting": "BSPP, SAE, NPTF, Manifold Mount", "body_material": "Aluminium, phenolic resin knob (internal: Carbon Steel)", "seal_material": "NBR"}'::jsonb, true, 5690, '180 시리즈 로터리 시어 방향 제어 밸브 180 series rotary shear directional control valve 최대 700 bar, 38 l/min의 로터리 시어 방식 방향 제어 밸브입니다. rotary shear directional control valve rated to 700 bar and 38 l/min. 180 series webtec products limited 유압 제어 밸브 hydraulic control valves directional 방향 제어 directional control 700 38 bspp, sae, nptf, manifold mount aluminium, phenolic resin knob (internal: carbon steel) nbr')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-280-series', '280 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '280 시리즈 스테인리스 로터리 방향 제어 밸브', '280 Series Stainless Steel Rotary Directional Control Valve', '가혹 환경용 스테인리스 스틸 바디의 최대 700 bar, 38 L/min 로터리 방향 제어 밸브입니다.', 'Stainless steel rotary directional control valve for harsh environments, rated to 700 bar and 38 L/min.', '280 시리즈는 가혹한 환경의 유압 시스템을 위한 스테인리스 스틸 로터리 방향 제어 밸브입니다. 최대 정격 압력 700 bar(10,000 psi), 최대 정격 유량 38 L/min(10 US gpm)이며 주위 온도 -20~50°C, 유체 온도 -30~120°C에서 사용 가능합니다. BSPP, NPTF, SAE, 매니폴드 마운트 포트를 지원하고 스테인리스 스틸 바디에 카본 스틸 내부 부품, NBR 씰을 사용합니다.', 'The 280 series is a stainless steel rotary directional control valve for hydraulics in harsh environments. It is rated to 700 bar (10,000 psi) and up to 38 L/min (10 US gpm), operating at ambient temperatures of -20 to 50°C and media temperatures of -30 to 120°C. Porting options are BSPP, NPTF, SAE and manifold mount, with a stainless steel body, carbon steel internals and NBR seals.',
  '{"valve_type": "directional", "max_pressure_bar": 700, "max_flow_lpm": 38, "porting": "BSPP, NPTF, SAE, Manifold Mount", "body_material": "Stainless Steel, phenolic resin knob (internal: Carbon Steel)", "seal_material": "NBR"}'::jsonb, true, 5700, '280 시리즈 스테인리스 로터리 방향 제어 밸브 280 series stainless steel rotary directional control valve 가혹 환경용 스테인리스 스틸 바디의 최대 700 bar, 38 l/min 로터리 방향 제어 밸브입니다. stainless steel rotary directional control valve for harsh environments, rated to 700 bar and 38 l/min. 280 series webtec products limited 유압 제어 밸브 hydraulic control valves directional 방향 제어 directional control 700 38 bspp, nptf, sae, manifold mount stainless steel, phenolic resin knob (internal: carbon steel) nbr')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-63mm-pressure-gauges', '63 mm Pressure Gauges', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '63mm 압력 게이지', '63 mm Diameter Pressure Gauges', '글리세린 충전식 63mm 직경 압력 게이지입니다.', 'Glycerine-filled 63 mm diameter pressure gauges.', '직경 63mm의 글리세린 충전식 압력 게이지입니다. 하부 또는 중앙 후면 연결 방식을 선택할 수 있으며 1/4인치 BSPP 연결부를 사용합니다.', 'Glycerine-filled pressure gauges with a 63 mm diameter dial. Available with bottom or centre back connection and a 1/4" BSPP fitting.',
  '{"accessory_type": "pressure_gauge", "connection": "1/4\" BSPP, bottom or centre back", "features": "Glycerine filled"}'::jsonb, true, 5710, '63mm 압력 게이지 63 mm diameter pressure gauges 글리세린 충전식 63mm 직경 압력 게이지입니다. glycerine-filled 63 mm diameter pressure gauges. 63 mm pressure gauges webtec products limited 유압 액세서리 hydraulic accessories pressure_gauge 압력 게이지 pressure gauge 1/4" bspp, bottom or centre back glycerine filled')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-apm-advanced-panel-meters', 'APM', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-test-stand-instrumentation'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'APM 고급 패널 미터', 'APM Advanced Panel Meters', '아날로그 센서용 디지털·바그래프 겸용 프로세스 패널 미터입니다.', 'Digital process panel meters for analogue sensors with combined digital and bar graph display.', 'APM 고급 패널 미터는 아날로그 센서용 디지털 프로세스 미터로 디지털 표시와 바그래프 표시를 결합했습니다. 사용자 설정용 USB 포트, 경고 플래시 백라이트, 최소/최대값 표시 기능을 갖추고 있으며 깊이가 53mm 미만으로 컴팩트합니다. 2개의 독립 출력 또는 4-20 mA 아날로그 모니터 출력을 제공합니다.', 'The APM advanced panel meters are digital process meters for analogue sensors combining a digital readout with a bar graph display. Features include a USB port for custom user settings, warning flash backlight, min/max display range and a compact depth under 53 mm. They provide two independent outputs or 4-20 mA analogue monitor outputs.',
  '{"instrument_type": "panel_meter", "output_signal": "Two independent outputs or 4-20 mA analogue monitor outputs; USB for settings"}'::jsonb, true, 5720, 'apm 고급 패널 미터 apm advanced panel meters 아날로그 센서용 디지털·바그래프 겸용 프로세스 패널 미터입니다. digital process panel meters for analogue sensors with combined digital and bar graph display. apm webtec products limited 테스트 스탠드 계측기 test stand instrumentation panel_meter 패널 미터 panel meter two independent outputs or 4-20 ma analogue monitor outputs; usb for settings')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-c2000', 'C2000', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-test-stand-instrumentation'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'C2000 유압 데이터 수집 시스템', 'C2000 Hydraulic Data Acquisition System', '8~64 입력의 모듈형 유압 테스트용 데이터 수집 시스템입니다.', 'Modular hydraulic data acquisition system with 8 to 64 inputs.', 'C2000은 유압 테스트 스탠드용 모듈형 데이터 수집 시스템으로 8~64개의 입력을 지원합니다. Windows 호환 소프트웨어로 운용되며 시험 성적서 출력, TCP/IP 네트워크 연결, 전용 고속 컨트롤러를 갖추고 있습니다.', 'The C2000 is a modular data acquisition system for hydraulic test stands supporting 8 to 64 inputs. It runs on Windows-compatible software, prints test certificates, is TCP/IP network ready and uses a dedicated high-speed controller.',
  '{"instrument_type": "data_acquisition", "output_signal": "TCP/IP network, Windows-compatible software, 8-64 modular inputs"}'::jsonb, true, 5730, 'c2000 유압 데이터 수집 시스템 c2000 hydraulic data acquisition system 8~64 입력의 모듈형 유압 테스트용 데이터 수집 시스템입니다. modular hydraulic data acquisition system with 8 to 64 inputs. c2000 webtec products limited 테스트 스탠드 계측기 test stand instrumentation data_acquisition 데이터 수집 시스템 data acquisition system tcp/ip network, windows-compatible software, 8-64 modular inputs')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-ct-for-hpm-series', 'CT for HPM Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-datalogger-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CT (HPM용) 터빈 유량계', 'CT Turbine Flow Meters for HPM Series', 'HPM 데이터로거용 최대 480 bar, 1500 L/min 터빈 유량계입니다.', 'Turbine flow meters for HPM data loggers, rated to 480 bar and 1500 L/min.', 'HPM 시리즈 데이터로거와 함께 사용하는 CT 터빈 유량계입니다. 최대 정격 압력 480 bar(7000 psi), 최대 유량 1500 L/min(400 US gpm)이며 유체 온도 -20~90°C 연속 사용이 가능합니다. BSPP, SAE 포트를 지원하고 ISO 11158 광유에 적합합니다.', 'CT turbine flow meters for use with the HPM series data loggers. Rated to 480 bar (7000 psi) and up to 1500 L/min (400 US gpm) with continuous fluid temperatures of -20 to 90°C. They offer BSPP and SAE porting and are compatible with mineral oils to ISO 11158.',
  '{"sensor_type": "turbine_flow", "max_pressure_bar": 480, "max_flow_lpm": 1500, "fluid_temp_range": "-20 to 90 °C continuous", "ambient_temp_range": "-10 to 50 °C", "porting": "BSPP, SAE"}'::jsonb, true, 5740, 'ct (hpm용) 터빈 유량계 ct turbine flow meters for hpm series hpm 데이터로거용 최대 480 bar, 1500 l/min 터빈 유량계입니다. turbine flow meters for hpm data loggers, rated to 480 bar and 1500 l/min. ct for hpm series webtec products limited 데이터로거용 센서 sensors for dataloggers turbine_flow 터빈 유량계 turbine flow meter 480 1500 -20 to 90 °c continuous -10 to 50 °c bspp, sae')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-ct-series', 'CT Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-test-stand-instrumentation'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CT 시리즈 터빈 유량계', 'CT Series Turbine Flow Meters with Conditioned Output', '컨디셔닝 출력을 갖춘 최대 480 bar, 1,500 L/min의 터빈 유량계입니다.', 'Turbine flow meters with conditioned output, rated to 480 bar and 1,500 L/min.', 'CT 시리즈는 테스트 스탠드용 컨디셔닝 출력 터빈 유량계입니다. 최대 정격 압력 480 bar(6,960 psi), 최대 유량 1,500 L/min(396 US gpm)이며 유체 온도 5~90°C 범위에서 사용합니다. BSPP, SAE 포트를 지원하고 ISO 11158 광유에 적합합니다.', 'The CT series are turbine flow meters with conditioned output for test stand use. Rated to 480 bar (6,960 psi) and up to 1,500 L/min (396 US gpm) with fluid temperatures of 5 to 90°C. They offer BSPP and SAE porting and are compatible with mineral oils to ISO 11158.',
  '{"instrument_type": "turbine_flow_meter", "max_pressure_bar": 480, "max_flow_lpm": 1500, "output_signal": "Conditioned output", "fluid_temp_range": "5 to 90 °C", "porting": "BSPP, SAE"}'::jsonb, true, 5750, 'ct 시리즈 터빈 유량계 ct series turbine flow meters with conditioned output 컨디셔닝 출력을 갖춘 최대 480 bar, 1,500 l/min의 터빈 유량계입니다. turbine flow meters with conditioned output, rated to 480 bar and 1,500 l/min. ct series webtec products limited 테스트 스탠드 계측기 test stand instrumentation turbine_flow_meter 터빈 유량계 turbine flow meter 480 1500 conditioned output 5 to 90 °c bspp, sae')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-cta-series', 'CTA Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-flow-monitors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CTA 시리즈 헤비듀티 유압 시스템 유량 모니터', 'CTA Series Heavy Duty Hydraulic System Flow Monitor', '모바일·산업 장비 상시 설치용 헤비듀티 유량·온도 모니터로 J1939 CAN 또는 4-20 mA 출력을 제공합니다.', 'Heavy duty flow and temperature monitor for permanent installation in mobile or industrial machinery, with J1939 CAN or 4-20 mA output.', 'CTA 시리즈는 모바일 및 산업 기계에 상시 설치하도록 설계된 견고한 유압 오일 유량·온도 모니터입니다. 폐루프 제어, 실시간 진단, 안전 인터록, 예지보전/IoT 시스템 연동에 적합하며 J1939 CAN 버스 인터페이스 또는 4-20 mA 출력을 제공합니다. 최대 정격 압력 420 bar(6,000 psi), 최대 유량 300 L/min(80 US gpm), 유체 온도 범위 -40~90°C이며 BSPP, SAE 포트를 지원합니다.', 'The CTA series are rugged hydraulic oil flow and temperature monitors designed for permanent installation in mobile or industrial machinery. Suitable for closed loop control, real-time diagnostics, safety interlocks and predictive maintenance/IoT systems, they provide a J1939 CAN-bus interface or 4-20 mA output. Rated to 420 bar (6,000 psi) and 300 L/min (80 US gpm) with a fluid temperature range of -40 to 90°C and BSPP or SAE porting.',
  '{"max_pressure_bar": 420, "max_flow_lpm": 300, "output_signal": "4-20 mA (3-wire, M12 connector) or SAE J1939 CAN (Deutsch connector)", "porting": "BSPP, SAE", "fluid_temp_range": "-40 to 90 °C"}'::jsonb, true, 5760, 'cta 시리즈 헤비듀티 유압 시스템 유량 모니터 cta series heavy duty hydraulic system flow monitor 모바일·산업 장비 상시 설치용 헤비듀티 유량·온도 모니터로 j1939 can 또는 4-20 ma 출력을 제공합니다. heavy duty flow and temperature monitor for permanent installation in mobile or industrial machinery, with j1939 can or 4-20 ma output. cta series webtec products limited 유량·상태 모니터링 flow & condition monitoring 420 300 4-20 ma (3-wire, m12 connector) or sae j1939 can (deutsch connector) bspp, sae -40 to 90 °c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-ctr-for-hpm-series', 'CTR for HPM Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-datalogger-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CTR (HPM용) 부하밸브 내장 터빈 유량계', 'CTR Turbine Flow Meters with Built-In Loading Valve for HPM Series', '부하 밸브를 내장한 HPM 데이터로거용 최대 480 bar, 750 L/min 터빈 유량계입니다.', 'Turbine flow meters with built-in loading valve for HPM data loggers, rated to 480 bar and 750 L/min.', 'HPM 시리즈 데이터로거용 CTR 터빈 유량계로, 부하 시험을 위한 로딩 밸브를 내장하고 있습니다. 최대 정격 압력 480 bar(7000 psi), 최대 유량 750 L/min(200 US gpm)이며 유체 온도 -20~90°C 연속 사용이 가능합니다. BSPP, SAE 포트를 지원합니다.', 'CTR turbine flow meters for the HPM series data loggers include a built-in loading valve for load testing. Rated to 480 bar (7000 psi) and up to 750 L/min (200 US gpm) with continuous fluid temperatures of -20 to 90°C, with BSPP and SAE porting.',
  '{"sensor_type": "turbine_flow_loading", "max_pressure_bar": 480, "max_flow_lpm": 750, "fluid_temp_range": "-20 to 90 °C continuous", "ambient_temp_range": "-10 to 50 °C", "porting": "BSPP, SAE"}'::jsonb, true, 5770, 'ctr (hpm용) 부하밸브 내장 터빈 유량계 ctr turbine flow meters with built-in loading valve for hpm series 부하 밸브를 내장한 hpm 데이터로거용 최대 480 bar, 750 l/min 터빈 유량계입니다. turbine flow meters with built-in loading valve for hpm data loggers, rated to 480 bar and 750 l/min. ctr for hpm series webtec products limited 데이터로거용 센서 sensors for dataloggers turbine_flow_loading 부하밸브 내장 터빈 유량계 turbine flow meter with loading valve 480 750 -20 to 90 °c continuous -10 to 50 °c bspp, sae')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-ctr-series', 'CTR Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-test-stand-instrumentation'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CTR 시리즈 부하밸브 내장 터빈 유량계', 'CTR Series Turbine Flow Meters with Conditioned Output and Built-in Loading Valve', '부하 밸브를 내장한 최대 480 bar, 800 L/min의 컨디셔닝 출력 터빈 유량계입니다.', 'Turbine flow meters with conditioned output and built-in loading valve, rated to 480 bar and 800 L/min.', 'CTR 시리즈는 컨디셔닝 출력과 부하 시험용 로딩 밸브를 내장한 터빈 유량계입니다. 최대 정격 압력 480 bar(7,000 psi), 최대 정격 유량 800 L/min(210 US gpm)이며 유체 온도 5~90°C 범위에서 사용합니다. BSPP, SAE 포트를 지원합니다.', 'The CTR series turbine flow meters combine conditioned output with a built-in loading valve for load testing. Rated to 480 bar (7,000 psi) and up to 800 L/min (210 US gpm) with fluid temperatures of 5 to 90°C, offering BSPP and SAE porting.',
  '{"instrument_type": "turbine_flow_meter_loading", "max_pressure_bar": 480, "max_flow_lpm": 800, "output_signal": "Conditioned output", "fluid_temp_range": "5 to 90 °C", "porting": "BSPP, SAE"}'::jsonb, true, 5780, 'ctr 시리즈 부하밸브 내장 터빈 유량계 ctr series turbine flow meters with conditioned output and built-in loading valve 부하 밸브를 내장한 최대 480 bar, 800 l/min의 컨디셔닝 출력 터빈 유량계입니다. turbine flow meters with conditioned output and built-in loading valve, rated to 480 bar and 800 l/min. ctr series webtec products limited 테스트 스탠드 계측기 test stand instrumentation turbine_flow_meter_loading 부하밸브 내장 터빈 유량계 turbine flow meter with loading valve 480 800 conditioned output 5 to 90 °c bspp, sae')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-cv120-series', 'CV120 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'CV120 시리즈 복합 밸브 (우선 유량 분배 + 방향 제어)', 'CV120 Series Combination Valve - Variable Priority Flow Divider with Directional Control', '가변 우선 유량 분배와 방향 제어를 결합한 최대 250 bar, 120 L/min의 복합 밸브입니다.', 'Combination valve integrating variable priority flow divider and directional control, rated to 250 bar and 120 L/min.', 'CV120 시리즈는 가변 우선 유량 분배 기능과 방향 제어 기능을 하나로 결합한 복합 밸브입니다. 최대 정격 압력 250 bar(3600 psi), 총 유량 용량 120 L/min(32 US gpm), 조절 유량 용량 95 L/min(25 US gpm)입니다. BSPP, SAE 포트를 지원하며 흑색 도장 덕타일 주철 바디에 220 bar(3200 psi) 릴리프 밸브가 포함되고 중량은 8.9 kg입니다.', 'The CV120 series is a combination valve integrating a variable priority flow divider with directional control. It is rated to 250 bar (3600 psi) with a total flow capacity of 120 L/min (32 US gpm) and regulated flow capacity of up to 95 L/min (25 US gpm). It offers BSPP and SAE porting, a black-painted cast ductile iron body with a 220 bar (3200 psi) relief valve, and weighs 8.9 kg.',
  '{"valve_type": "combination", "max_pressure_bar": 250, "max_flow_lpm": 120, "priority_flow_lpm": 95, "porting": "BSPP, SAE", "body_material": "Cast Ductile Iron, painted black (steel components, aluminium knob)", "weight_kg": 8.9}'::jsonb, true, 5790, 'cv120 시리즈 복합 밸브 (우선 유량 분배 + 방향 제어) cv120 series combination valve - variable priority flow divider with directional control 가변 우선 유량 분배와 방향 제어를 결합한 최대 250 bar, 120 l/min의 복합 밸브입니다. combination valve integrating variable priority flow divider and directional control, rated to 250 bar and 120 l/min. cv120 series webtec products limited 유압 제어 밸브 hydraulic control valves combination 복합(분배+방향) combination 250 120 95 bspp, sae cast ductile iron, painted black (steel components, aluminium knob) 8.9')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-dhm-series', 'DHM Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-portable-testers'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DHM 시리즈 디지털 유압 멀티미터', 'DHM Series Digital Hydraulic Multimeter', 'QuickCert+ 앱을 지원하는 최대 480 bar, 800 L/min의 디지털 유압 멀티미터입니다.', 'Digital hydraulic multimeter with QuickCert+ app support, rated to 480 bar and 800 L/min.', 'DHM 시리즈는 iPhone 및 Android용 QuickCert+ 앱과 연동되는 디지털 유압 멀티미터입니다. 최대 정격 압력 480 bar(7000 psi), 최대 정격 유량 800 L/min(210 US gpm)이며 유체 온도 0~120°C 범위에서 사용합니다. 정확도는 유량 지시값의 ±1%(범위의 15~100%), 압력 ±0.5% FS, 온도 ±1°C입니다.', 'The DHM series is a digital hydraulic multimeter with the QuickCert+ app available for iPhone and Android. It is rated to 480 bar (7000 psi) and up to 800 L/min (210 US gpm) with fluid temperatures of 0 to 120°C. Accuracy is ±1% of indicated reading for flow (15 to 100% of range), ±0.5% full scale for pressure and ±1°C for temperature.',
  '{"tester_type": "digital_multimeter", "max_pressure_bar": 480, "max_flow_lpm": 800, "flow_accuracy": "±1% of indicated reading (15-100% of range)", "pressure_accuracy": "±0.5% FS", "temp_accuracy": "±1 °C", "fluid_temp_range": "0 to 120 °C", "ambient_temp_range": "-10 to 50 °C"}'::jsonb, true, 5800, 'dhm 시리즈 디지털 유압 멀티미터 dhm series digital hydraulic multimeter quickcert+ 앱을 지원하는 최대 480 bar, 800 l/min의 디지털 유압 멀티미터입니다. digital hydraulic multimeter with quickcert+ app support, rated to 480 bar and 800 l/min. dhm series webtec products limited 휴대용 유압 테스터 portable hydraulic testers digital_multimeter 디지털 멀티미터 digital multimeter 480 800 ±1% of indicated reading (15-100% of range) ±0.5% fs ±1 °c 0 to 120 °c -10 to 50 °c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-dht-series', 'DHT Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-portable-testers'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DHT 시리즈 디지털 유압 테스터', 'DHT Series Digital Hydraulic Tester', '최대 480 bar, 800 L/min의 휴대용 디지털 유압 테스터입니다.', 'Portable digital hydraulic tester rated to 480 bar and 800 L/min.', 'DHT 시리즈는 유량, 압력, 온도를 디지털로 측정하는 휴대용 유압 테스터입니다. 최대 정격 압력 480 bar(7000 psi), 최대 정격 유량 800 L/min(210 US gpm)이며 유체 온도 -10~120°C 범위에서 사용합니다. 정확도는 유량 ±1% FS, 압력 ±1.6% FS, 온도 ±1°C입니다.', 'The DHT series is a portable digital hydraulic tester measuring flow, pressure and temperature. It is rated to 480 bar (7000 psi) and up to 800 L/min (210 US gpm), with fluid temperatures of -10 to 120°C. Accuracy is ±1% full scale for flow, ±1.6% full scale for pressure and ±1°C for temperature.',
  '{"tester_type": "digital", "max_pressure_bar": 480, "max_flow_lpm": 800, "flow_accuracy": "±1% FS", "pressure_accuracy": "±1.6% FS", "temp_accuracy": "±1 °C", "fluid_temp_range": "-10 to 120 °C", "ambient_temp_range": "-10 to 50 °C"}'::jsonb, true, 5810, 'dht 시리즈 디지털 유압 테스터 dht series digital hydraulic tester 최대 480 bar, 800 l/min의 휴대용 디지털 유압 테스터입니다. portable digital hydraulic tester rated to 480 bar and 800 l/min. dht series webtec products limited 휴대용 유압 테스터 portable hydraulic testers digital 디지털 digital 480 800 ±1% fs ±1.6% fs ±1 °c -10 to 120 °c -10 to 50 °c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-fdc140-series', 'FDC140 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'FDC140 시리즈 고유량 분배·합류 밸브', 'FDC140 Series High Flow Divider Combiner', '최대 420 bar, 140 L/min의 고유량 분배·합류 밸브로 정확도 ±1.5%를 제공합니다.', 'High flow divider combiner rated to 420 bar and 140 L/min with ±1.5% accuracy.', 'FDC140 시리즈는 대유량 시스템용 유량 분배·합류 밸브입니다. 최대 정격 압력 420 bar(6000 psi), 최대 총 유량 140 L/min(37 US gpm)이며 정확도는 밸브 정격 최대 유량의 ±1.5%입니다. 주위 및 유체 온도 범위는 -30~100°C이며 광유 및 합성유에 사용할 수 있습니다.', 'The FDC140 series is a flow divider combiner for high-flow systems, rated to 420 bar (6000 psi) with up to 140 L/min (37 US gpm) total flow and an accuracy of ±1.5% of valve rated maximum flow. Ambient and fluid temperature ranges are -30 to 100°C, and it is compatible with mineral and synthetic oils.',
  '{"valve_type": "flow_divider_combiner", "max_pressure_bar": 420, "max_flow_lpm": 140, "accuracy": "±1.5% of valve rated maximum flow"}'::jsonb, true, 5820, 'fdc140 시리즈 고유량 분배·합류 밸브 fdc140 series high flow divider combiner 최대 420 bar, 140 l/min의 고유량 분배·합류 밸브로 정확도 ±1.5%를 제공합니다. high flow divider combiner rated to 420 bar and 140 l/min with ±1.5% accuracy. fdc140 series webtec products limited 유압 제어 밸브 hydraulic control valves flow_divider_combiner 유량 분배·합류 flow divider combiner 420 140 ±1.5% of valve rated maximum flow')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-fdc60-series', 'FDC60 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'FDC60 시리즈 유량 분배·합류 밸브', 'FDC60 Series Flow Divider Combiner', '최대 310 bar, 70 L/min의 유량 분배·합류 밸브로 정확도 ±2.0%를 제공합니다.', 'Flow divider combiner rated to 310 bar and 70 L/min with ±2.0% accuracy.', 'FDC60 시리즈는 두 액추에이터에 유량을 균등하게 분배하거나 합류시키는 유량 분배·합류 밸브입니다. 최대 정격 압력 310 bar(4,500 psi), 최대 정격 유량 70 L/min(18 US gpm)이며 정확도는 밸브 정격 최대 유량의 ±2.0%입니다. 주위 및 유체 온도 범위는 -30~100°C이고 ISO 11158 광유에 적합합니다.', 'The FDC60 series flow divider combiner splits or combines flow equally between two actuators. It is rated to 310 bar (4,500 psi) and up to 70 L/min (18 US gpm) with an accuracy of ±2.0% of valve rated maximum flow. Ambient and fluid temperature ranges are -30 to 100°C, and it is compatible with mineral oils to ISO 11158.',
  '{"valve_type": "flow_divider_combiner", "max_pressure_bar": 310, "max_flow_lpm": 70, "accuracy": "±2.0% of valve rated maximum flow"}'::jsonb, true, 5830, 'fdc60 시리즈 유량 분배·합류 밸브 fdc60 series flow divider combiner 최대 310 bar, 70 l/min의 유량 분배·합류 밸브로 정확도 ±2.0%를 제공합니다. flow divider combiner rated to 310 bar and 70 l/min with ±2.0% accuracy. fdc60 series webtec products limited 유압 제어 밸브 hydraulic control valves flow_divider_combiner 유량 분배·합류 flow divider combiner 310 70 ±2.0% of valve rated maximum flow')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-fi1500-series', 'FI1500 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-flow-monitors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'FI1500 시리즈 인라인 유량 지시계', 'FI1500 Series In-Line Flow Indicator', '최대 350 bar, 400 L/min의 대유량 인라인 유량 지시계입니다.', 'High-capacity in-line flow indicator rated to 350 bar and 400 L/min.', 'FI1500 시리즈는 대유량 시스템용 인라인 유량 지시계입니다. 최대 정격 압력 350 bar(5000 psi), 최대 정격 유량 400 L/min(100 US gpm)이며 BSPP, SAE 포트를 지원합니다. 알루미늄 2011T6 바디에 황동 내부 부품, FKM 씰을 사용하며 중량은 3.2 kg입니다.', 'The FI1500 series is an in-line flow indicator for high-flow systems, rated to 350 bar (5000 psi) and up to 400 L/min (100 US gpm) with BSPP and SAE porting. The aluminium 2011T6 body houses mainly brass internals with FKM seals and weighs 3.2 kg.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 400, "output_signal": "Visual indicator", "porting": "BSPP, SAE", "ambient_temp_range": "-10 to 50 °C", "weight_kg": 3.2}'::jsonb, true, 5840, 'fi1500 시리즈 인라인 유량 지시계 fi1500 series in-line flow indicator 최대 350 bar, 400 l/min의 대유량 인라인 유량 지시계입니다. high-capacity in-line flow indicator rated to 350 bar and 400 l/min. fi1500 series webtec products limited 유량·상태 모니터링 flow & condition monitoring 350 400 visual indicator bspp, sae -10 to 50 °c 3.2')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-fi750-series', 'FI750 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-flow-monitors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'FI750 시리즈 인라인 유량 지시계', 'FI750 Series In-Line Flow Indicator', '최대 420 bar, 180 L/min의 인라인 유량 지시계입니다.', 'In-line flow indicator rated to 420 bar and 180 L/min.', 'FI750 시리즈는 배관에 직접 설치하여 유량을 육안으로 확인할 수 있는 인라인 유량 지시계입니다. 최대 정격 압력 420 bar(6,000 psi), 최대 정격 유량 180 L/min(48 US gpm)이며 BSPP, NPSF, SAE 포트를 지원합니다. 알루미늄 2011T6 바디에 황동 내부 부품, FKM 씰을 사용하며 중량은 1.4 kg입니다.', 'The FI750 series is an in-line flow indicator for direct visual flow reading in the pipeline. It is rated to 420 bar (6,000 psi) and up to 180 L/min (48 US gpm) with BSPP, NPSF and SAE porting. The aluminium 2011T6 body contains mainly brass internals with FKM seals and weighs 1.4 kg.',
  '{"max_pressure_bar": 420, "max_flow_lpm": 180, "output_signal": "Visual indicator", "porting": "BSPP, NPSF, SAE", "ambient_temp_range": "-10 to 50 °C", "weight_kg": 1.4}'::jsonb, true, 5850, 'fi750 시리즈 인라인 유량 지시계 fi750 series in-line flow indicator 최대 420 bar, 180 l/min의 인라인 유량 지시계입니다. in-line flow indicator rated to 420 bar and 180 l/min. fi750 series webtec products limited 유량·상태 모니터링 flow & condition monitoring 420 180 visual indicator bspp, npsf, sae -10 to 50 °c 1.4')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-flowhub-series', 'FlowHUB Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-flow-monitors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'FlowHUB 시리즈 유량·온도 모니터', 'FlowHUB Series Flow & Temperature Monitor', '유량과 온도를 측정·표시·스위칭·전송하는 최대 420 bar, 360 L/min의 통합 모니터입니다.', 'Integrated monitor that measures, displays, switches and transmits flow and temperature, rated to 420 bar and 360 L/min.', 'FlowHUB 시리즈는 유량과 온도를 측정하여 표시, 스위칭, 신호 전송까지 수행하는 통합형 모니터입니다. 최대 정격 압력 420 bar(6000 psi), 최대 정격 유량 360 L/min(95 US gpm)이며 수나사형 BSPP, SAE JIC 포트를 지원합니다. 알루미늄 바디에 황동, 스테인리스 스틸, 카본 스틸 내부 부품을 사용하며 유체 온도 범위는 5~90°C입니다.', 'The FlowHUB series is an integrated monitor that measures, displays, switches and transmits flow and temperature. It is rated to 420 bar (6000 psi) and up to 360 L/min (95 US gpm) with male BSPP and male SAE JIC porting. The aluminium body contains brass, stainless steel and carbon steel internals; fluid temperature range is 5 to 90°C.',
  '{"max_pressure_bar": 420, "max_flow_lpm": 360, "output_signal": "Display, switch, transmit", "porting": "Male BSPP, Male SAE JIC", "fluid_temp_range": "5 to 90 °C", "ambient_temp_range": "0 to 50 °C"}'::jsonb, true, 5860, 'flowhub 시리즈 유량·온도 모니터 flowhub series flow & temperature monitor 유량과 온도를 측정·표시·스위칭·전송하는 최대 420 bar, 360 l/min의 통합 모니터입니다. integrated monitor that measures, displays, switches and transmits flow and temperature, rated to 420 bar and 360 l/min. flowhub series webtec products limited 유량·상태 모니터링 flow & condition monitoring 420 360 display, switch, transmit male bspp, male sae jic 5 to 90 °c 0 to 50 °c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-fv120-200', 'FV120 / 200', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'FV120/200 고정·비례 유량 분배 밸브', 'FV120 / 200 Fixed and Proportional Flow Divider Valves', '최대 420 bar, 76 L/min의 고정 및 비례식 유량 분배 밸브입니다.', 'Fixed and proportional flow divider valves rated to 420 bar and 76 L/min.', 'FV120/200은 고정 및 비례 방식의 유량 분배 밸브입니다. 최대 정격 압력 420 bar(6000 psi), 최대 유량 용량 76 L/min(20 US gpm)이며 BSPP, SAE 포트를 지원합니다. 주철 바디에 스틸 부품으로 구성되고 M8 또는 5/16인치 볼트 2개로 장착하며 중량은 1.6 kg입니다.', 'The FV120/200 are fixed and proportional flow divider valves rated to 420 bar (6000 psi) with a maximum flow capacity of 76 L/min (20 US gpm). They offer BSPP and SAE porting, with steel components in a cast iron body, mounting via two M8 or 5/16" bolts and weighing 1.6 kg.',
  '{"valve_type": "priority_flow_divider", "max_pressure_bar": 420, "max_flow_lpm": 76, "porting": "BSPP, SAE", "body_material": "Cast Iron (steel components)", "weight_kg": 1.6}'::jsonb, true, 5870, 'fv120/200 고정·비례 유량 분배 밸브 fv120 / 200 fixed and proportional flow divider valves 최대 420 bar, 76 l/min의 고정 및 비례식 유량 분배 밸브입니다. fixed and proportional flow divider valves rated to 420 bar and 76 l/min. fv120 / 200 webtec products limited 유압 제어 밸브 hydraulic control valves priority_flow_divider 우선 유량 분배 priority flow divider 420 76 bspp, sae cast iron (steel components) 1.6')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-gf-series', 'GF Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-test-stand-instrumentation'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GF 시리즈 용적식 유량계', 'GF Series Positive Displacement Flow Meters with Conditioned Output', '컨디셔닝 출력을 갖춘 최대 420 bar, 150 L/min의 용적식 유량계입니다.', 'Positive displacement flow meters with conditioned output, rated to 420 bar and 150 L/min.', 'GF 시리즈는 컨디셔닝된 출력 신호를 제공하는 용적식(PD) 유량계입니다. 최대 정격 압력 420 bar(6,000 psi), 최대 정격 유량 150 L/min(40 US gpm)이며 유체 온도 -40~120°C 범위에서 사용합니다. 바디와 내부 부품 모두 스테인리스 스틸이며 NBR 씰(다른 씰은 문의)과 BSPP, SAE 포트를 지원합니다.', 'The GF series are positive displacement flow meters with conditioned output. Rated to 420 bar (6,000 psi) and 150 L/min (40 US gpm) with fluid temperatures of -40 to 120°C. Both body and internals are stainless steel with NBR seals (other seals on request) and BSPP or SAE porting.',
  '{"instrument_type": "pd_flow_meter", "max_pressure_bar": 420, "max_flow_lpm": 150, "output_signal": "Conditioned output", "fluid_temp_range": "-40 to 120 °C", "porting": "BSPP, SAE"}'::jsonb, true, 5880, 'gf 시리즈 용적식 유량계 gf series positive displacement flow meters with conditioned output 컨디셔닝 출력을 갖춘 최대 420 bar, 150 l/min의 용적식 유량계입니다. positive displacement flow meters with conditioned output, rated to 420 bar and 150 l/min. gf series webtec products limited 테스트 스탠드 계측기 test stand instrumentation pd_flow_meter 용적식 유량계 positive displacement flow meter 420 150 conditioned output -40 to 120 °c bspp, sae')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-hpm110-series', 'HPM110 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-dataloggers'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'HPM110 시리즈 디지털 압력 게이지', 'HPM110 Series Digital Pressure Gauge', '최대 600 bar, 풀스케일 ±0.5% 정확도의 디지털 압력 게이지입니다.', 'Digital pressure gauge rated to 600 bar with ±0.5% full scale accuracy.', 'HPM110 시리즈는 최대 정격 압력 600 bar(8700 psi)의 디지털 압력 게이지입니다. 정확도는 풀스케일 ±0.5%이며 오일, 물 등 다양한 유체에 사용할 수 있습니다. 유체 온도 -20~80°C, 주위 온도 -10~50°C에서 사용 가능하고 BSPP, SAE 포트를 지원합니다.', 'The HPM110 series is a digital pressure gauge rated to 600 bar (8700 psi) with an accuracy of ±0.5% full scale. It is compatible with oil, water and other fluids on request, operates with fluid temperatures of -20 to 80°C and ambient temperatures of -10 to 50°C, and offers BSPP and SAE porting.',
  '{"device_type": "digital_pressure_gauge", "max_pressure_bar": 600, "accuracy": "±0.5% full scale", "ambient_temp_range": "-10 to 50 °C", "porting": "BSPP, SAE"}'::jsonb, true, 5890, 'hpm110 시리즈 디지털 압력 게이지 hpm110 series digital pressure gauge 최대 600 bar, 풀스케일 ±0.5% 정확도의 디지털 압력 게이지입니다. digital pressure gauge rated to 600 bar with ±0.5% full scale accuracy. hpm110 series webtec products limited 유압 데이터로거 hydraulic dataloggers digital_pressure_gauge 디지털 압력 게이지 digital pressure gauge 600 ±0.5% full scale -10 to 50 °c bspp, sae')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-hpm4000-series', 'HPM4000 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-dataloggers'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'HPM4000 시리즈 유압 데이터로거', 'HPM4000 Series Hydraulic Data Logger', 'IP67 보호 등급의 휴대용 유압 데이터로거입니다.', 'Portable hydraulic data logger with IP67 protection rating.', 'HPM4000 시리즈는 IP67(EN60529) 보호 등급의 휴대용 유압 데이터로거입니다. 작동 온도 범위 0~50°C, 100-240 VAC 입력 전원과 마이크로 USB(Type B, +5 VDC 최대 1000 mA) 연결을 지원합니다. 3.7 VDC 4500 mAh 리튬이온 배터리를 탑재하여 센서 2개 연결 시 8시간 이상 사용할 수 있습니다.', 'The HPM4000 series is a portable hydraulic data logger with IP67 (EN60529) protection. It operates from 0 to 50°C with a 100-240 VAC power input and micro-USB Type B connection (+5 VDC max 1000 mA). The 3.7 VDC 4500 mAh lithium-ion battery pack provides more than 8 hours of operation with 2 sensors.',
  '{"device_type": "datalogger", "ports": "Micro-USB Type B (+5 VDC max 1000 mA)", "battery": "Lithium-Ion 3.7 VDC, 4500 mAh (>8 h with 2 sensors)", "protection_rating": "IP67 (EN60529)", "ambient_temp_range": "0 to 50 °C (operating)"}'::jsonb, true, 5900, 'hpm4000 시리즈 유압 데이터로거 hpm4000 series hydraulic data logger ip67 보호 등급의 휴대용 유압 데이터로거입니다. portable hydraulic data logger with ip67 protection rating. hpm4000 series webtec products limited 유압 데이터로거 hydraulic dataloggers datalogger 데이터로거 data logger micro-usb type b (+5 vdc max 1000 ma) lithium-ion 3.7 vdc, 4500 mah (>8 h with 2 sensors) ip67 (en60529) 0 to 50 °c (operating)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-hpm5000-series', 'HPM5000 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-dataloggers'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'HPM5000 시리즈 유압 데이터로거', 'HPM5000 Series Hydraulic Data Logger', 'USB-C 고속 충전과 USB-A 호스트를 지원하는 IP65 유압 데이터로거입니다.', 'IP65 hydraulic data logger with USB-C fast charging and USB-A host port.', 'HPM5000 시리즈는 USB-C(고속 충전 및 PC 데이터 전송)와 USB-A 호스트(USB 메모리 저장) 포트를 갖춘 유압 데이터로거입니다. 7.2 V / 3500 mAh / 25.44 Wh 리튬이온 배터리를 탑재하고 보호 등급은 IP65입니다. 주위 온도 -20~50°C에서 사용 가능하며 ABS/PC 열가소성 바디에 접이식 스탠드와 VESA 75x75 mm 표준 장착을 지원합니다.', 'The HPM5000 series hydraulic data logger features USB-C (fast charging and data transfer to PC) and USB-A host (storage via USB memory stick) ports. It carries a 7.2 V / 3500 mAh / 25.44 Wh lithium-ion battery pack with IP65 protection. It operates at ambient temperatures of -20 to 50°C, with an ABS/PC thermoplastic body, folding stand and VESA 75x75 mm mounting.',
  '{"device_type": "datalogger", "ports": "USB-C (charging/data), USB-A host (USB memory)", "battery": "Lithium-Ion 7.2 V / 3500 mAh / 25.44 Wh", "protection_rating": "IP65 (EN 60529)", "ambient_temp_range": "-20 to 50 °C"}'::jsonb, true, 5910, 'hpm5000 시리즈 유압 데이터로거 hpm5000 series hydraulic data logger usb-c 고속 충전과 usb-a 호스트를 지원하는 ip65 유압 데이터로거입니다. ip65 hydraulic data logger with usb-c fast charging and usb-a host port. hpm5000 series webtec products limited 유압 데이터로거 hydraulic dataloggers datalogger 데이터로거 data logger usb-c (charging/data), usb-a host (usb memory) lithium-ion 7.2 v / 3500 mah / 25.44 wh ip65 (en 60529) -20 to 50 °c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-hpm7000-series', 'HPM7000 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-dataloggers'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'HPM7000 시리즈 유압 데이터로거', 'HPM7000 Series Hydraulic Data Logger', '12GB 메모리와 LAN·다중 USB 포트를 갖춘 고급형 유압 데이터로거입니다.', 'Advanced hydraulic data logger with 12GB memory, LAN and multiple USB ports.', 'HPM7000 시리즈는 12GB 메모리를 내장한 고급형 유압 데이터로거입니다. USB 디바이스 포트(PC 데이터 전송), 외부 저장 매체용 USB 호스트 2개, 네트워크 연결용 LAN 포트를 갖추고 있습니다. 주위 온도 -10~50°C에서 사용 가능하며 ABS/PC 바디에 TPE 보호 커버, 운반 스트랩, 접이식 스탠드와 VESA 100x100 mm 장착을 지원합니다. 입력 모듈 제외 중량은 1.88 kg입니다.', 'The HPM7000 series is an advanced hydraulic data logger with 12GB of internal memory. It provides a USB device port for PC data transfer, two USB host ports for external storage media and a LAN port for network connection. Operating at -10 to 50°C ambient, it has an ABS/PC body with TPE protective covers, carrying strap, folding stand and VESA 100x100 mm mounting, weighing 1.88 kg without input modules.',
  '{"device_type": "datalogger", "ports": "USB device, 2x USB host, LAN", "memory": "12GB", "ambient_temp_range": "-10 to 50 °C"}'::jsonb, true, 5920, 'hpm7000 시리즈 유압 데이터로거 hpm7000 series hydraulic data logger 12gb 메모리와 lan·다중 usb 포트를 갖춘 고급형 유압 데이터로거입니다. advanced hydraulic data logger with 12gb memory, lan and multiple usb ports. hpm7000 series webtec products limited 유압 데이터로거 hydraulic dataloggers datalogger 데이터로거 data logger usb device, 2x usb host, lan 12gb -10 to 50 °c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-hv-series', 'HV Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'HV 시리즈 부하 밸브', 'HV Series Loading Valves', '최대 420 bar, 800 L/min의 유압 부하 밸브입니다.', 'Hydraulic loading valves rated to 420 bar and 800 L/min.', 'HV 시리즈는 유압 시스템 부하 시험용 로딩 밸브입니다. 최대 정격 압력 420 bar(6,000 psi), 최대 정격 유량 800 L/min(210 US gpm)이며 유체 온도 0~120°C 범위에서 사용합니다. BSPP, SAE 포트를 지원하고 ISO 11158 광유에 적합합니다.', 'The HV series loading valves are used for load testing hydraulic systems. Rated to 420 bar (6,000 psi) and up to 800 L/min (210 US gpm) with fluid temperatures of 0 to 120°C. They offer BSPP and SAE porting and are compatible with mineral oils to ISO 11158.',
  '{"accessory_type": "loading_valve", "max_pressure_bar": 420, "max_flow_lpm": 800, "connection": "BSPP, SAE", "fluid_temp_range": "0 to 120 °C"}'::jsonb, true, 5930, 'hv 시리즈 부하 밸브 hv series loading valves 최대 420 bar, 800 l/min의 유압 부하 밸브입니다. hydraulic loading valves rated to 420 bar and 800 l/min. hv series webtec products limited 유압 액세서리 hydraulic accessories loading_valve 부하 밸브 loading valve 420 800 bspp, sae 0 to 120 °c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-ilfc-series', 'ILFC Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ILFC 시리즈 고정 유량 압력보상 제어 밸브', 'ILFC Series Fixed Flow Pressure Compensated Control Valve', '최대 210 bar, 16 L/min의 인라인 장착형 고정 유량 압력보상 제어 밸브입니다.', 'In-line fixed flow pressure compensated control valve rated to 210 bar and 16 L/min.', 'ILFC 시리즈는 부하 변동에 관계없이 설정된 유량을 일정하게 유지하는 고정 유량 압력보상 제어 밸브입니다. 최대 정격 압력 210 bar(3000 psi), 최대 정격 유량 16 L/min(4 US gpm)이며 SAE, BSPP, NPTF 포트를 지원합니다. 아연 도금 스틸 바디에 인라인 방식으로 장착합니다.', 'The ILFC series is a fixed flow pressure compensated control valve that maintains a constant set flow regardless of load variations. It is rated to 210 bar (3000 psi) and 16 L/min (4 US gpm) with SAE, BSPP and NPTF porting options. The zinc plated steel body mounts in-line.',
  '{"valve_type": "flow_control_2port", "max_pressure_bar": 210, "max_flow_lpm": 16, "porting": "SAE, BSPP, NPTF", "body_material": "Zinc Plated Steel (internal: Steel, Aluminium)", "seal_material": "NBR"}'::jsonb, true, 5940, 'ilfc 시리즈 고정 유량 압력보상 제어 밸브 ilfc series fixed flow pressure compensated control valve 최대 210 bar, 16 l/min의 인라인 장착형 고정 유량 압력보상 제어 밸브입니다. in-line fixed flow pressure compensated control valve rated to 210 bar and 16 l/min. ilfc series webtec products limited 유압 제어 밸브 hydraulic control valves flow_control_2port 2포트 유량 제어 two-port flow control 210 16 sae, bspp, nptf zinc plated steel (internal: steel, aluminium) nbr')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-j1939-series', 'J1939 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-flow-monitors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'J1939 시리즈 CAN 호환 유압 모니터링 센서', 'J1939 Series SAE J1939 CAN Compatible Sensors', 'SAE J1939 CAN 버스 호환 유압 시스템 모니터링 센서로 최대 480 bar, 1500 L/min을 지원합니다.', 'SAE J1939 CAN-bus compatible sensors for hydraulic system monitoring, rated to 480 bar and 1500 L/min.', 'J1939 시리즈는 SAE J1939 CAN 버스와 호환되는 유압 시스템 모니터링용 센서입니다. 최대 정격 압력 480 bar(7000 psi), 최대 유량 1500 L/min(400 US gpm)이며 유체 온도 5~90°C에서 연속 사용이 가능합니다. 정확도는 유량 범위의 15~100% 구간에서 지시값의 1%, 15% 미만 구간에서는 풀스케일의 0.15% 고정(CT15는 풀스케일의 1%)입니다.', 'The J1939 series are SAE J1939 CAN-compatible sensors for hydraulic system monitoring, rated to 480 bar (7000 psi) and up to 1500 L/min (400 US gpm) with continuous fluid temperatures of 5 to 90°C. Accuracy is 1% of indicated reading from 15% to 100% of the flow range, and a fixed 0.15% of full scale below 15% (1% of full scale for the CT15).',
  '{"max_pressure_bar": 480, "max_flow_lpm": 1500, "output_signal": "SAE J1939 CAN-bus", "accuracy": "1% of indicated reading (15-100% of range); 0.15% FS below 15% (CT15: 1% FS)", "fluid_temp_range": "5 to 90 °C continuous", "ambient_temp_range": "5 to 40 °C"}'::jsonb, true, 5950, 'j1939 시리즈 can 호환 유압 모니터링 센서 j1939 series sae j1939 can compatible sensors sae j1939 can 버스 호환 유압 시스템 모니터링 센서로 최대 480 bar, 1500 l/min을 지원합니다. sae j1939 can-bus compatible sensors for hydraulic system monitoring, rated to 480 bar and 1500 l/min. j1939 series webtec products limited 유량·상태 모니터링 flow & condition monitoring 480 1500 sae j1939 can-bus 1% of indicated reading (15-100% of range); 0.15% fs below 15% (ct15: 1% fs) 5 to 90 °c continuous 5 to 40 °c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-pt-series', 'PT Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PT 시리즈 맞춤형 압력 테스트 키트', 'PT Series Custom Pressure Test Kits', '게이지, 호스, 테스트 포인트, 어댑터로 구성되는 맞춤형 압력 테스트 키트입니다.', 'Custom-built pressure test kits comprising gauges, hoses, test points and adaptors.', 'PT 시리즈는 고객 사양에 맞춰 구성하는 맞춤형 압력 테스트 키트입니다. 게이지, 호스, 테스트 포인트, 어댑터가 포함되어 신속한 압력 점검을 위한 완전한 테스트 시스템을 제공합니다. 테스트 포인트는 회로 어디에나 설치할 수 있으며, 테스트 호스는 시스템 압력이 걸린 상태에서도 오일 손실이나 이물질 유입 없이 손으로 연결할 수 있어 오일 샘플링과 공기 배출에도 적합합니다. 케이스는 충분한 수납 공간을 제공하고 게이지 패널은 분리하여 사용할 수 있습니다.', 'The PT series are custom pressure test kits built to your specification from a huge pick-and-mix range. Each kit includes gauges, hoses, test points and adaptors, providing a complete system for rapid pressure testing. Test points can be fitted anywhere in the circuit, and test hoses can be connected by hand under full system pressure without oil loss or dirt ingress - ideal for oil sampling and air bleeding. The case provides ample storage and the gauge panel is removable for convenient use.',
  '{"accessory_type": "pressure_test_kit", "features": "Custom built; includes gauges, hoses, test points and adaptors; hot connection under full system pressure"}'::jsonb, true, 5960, 'pt 시리즈 맞춤형 압력 테스트 키트 pt series custom pressure test kits 게이지, 호스, 테스트 포인트, 어댑터로 구성되는 맞춤형 압력 테스트 키트입니다. custom-built pressure test kits comprising gauges, hoses, test points and adaptors. pt series webtec products limited 유압 액세서리 hydraulic accessories pressure_test_kit 압력 테스트 키트 pressure test kit custom built; includes gauges, hoses, test points and adaptors; hot connection under full system pressure')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-rfi-series', 'RFI Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-flow-monitors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RFI 시리즈 양방향 유량 지시계', 'RFI Series Reversible Flow Indicator', '최대 420 bar, 200 L/min의 양방향 유량 지시계입니다.', 'Reversible flow indicator rated to 420 bar and 200 L/min.', 'RFI 시리즈는 양방향 유동을 측정할 수 있는 유량 지시계입니다. 최대 정격 압력 420 bar(6000 psi), 최대 정격 유량 200 L/min(54 US gpm)이며 BSPP, SAE 포트를 지원합니다. 알루미늄 2011T6 바디에 스테인리스 스틸과 황동 내부 부품, NBR/FKM 씰을 사용하며 중량은 2.0 kg입니다.', 'The RFI series is a flow indicator capable of measuring flow in both directions. It is rated to 420 bar (6000 psi) and up to 200 L/min (54 US gpm) with BSPP and SAE porting. The aluminium 2011T6 body contains stainless steel and brass internals with NBR and FKM seals, weighing 2.0 kg.',
  '{"max_pressure_bar": 420, "max_flow_lpm": 200, "output_signal": "Visual indicator (reversible flow)", "porting": "BSPP, SAE", "ambient_temp_range": "-10 to 50 °C", "weight_kg": 2.0}'::jsonb, true, 5970, 'rfi 시리즈 양방향 유량 지시계 rfi series reversible flow indicator 최대 420 bar, 200 l/min의 양방향 유량 지시계입니다. reversible flow indicator rated to 420 bar and 200 l/min. rfi series webtec products limited 유량·상태 모니터링 flow & condition monitoring 420 200 visual indicator (reversible flow) bspp, sae -10 to 50 °c 2.0')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-rfik-series', 'RFIK Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-portable-testers'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RFIK 시리즈 기계식 유압 테스터', 'RFIK Series Mechanical Hydraulic Tester', '최대 420 bar, 270 L/min의 휴대용 기계식 유압 테스터입니다.', 'Portable mechanical hydraulic tester rated to 420 bar and 270 L/min.', 'RFIK 시리즈는 전원 없이 사용하는 기계식 휴대용 유압 테스터입니다. 최대 정격 압력 420 bar(6090 psi), 최대 유량 270 L/min(70 US gpm)이며 유체 온도 20~80°C 범위에서 사용합니다. 정확도는 유량 ±4% FS, 압력 ±1.6% FS, 온도 ±2.5°C입니다.', 'The RFIK series is a mechanical portable hydraulic tester requiring no power supply. It is rated to 420 bar (6090 psi) and up to 270 L/min (70 US gpm), operating with fluid temperatures of 20 to 80°C. Accuracy is ±4% FS for flow, ±1.6% FS for pressure and ±2.5°C for temperature.',
  '{"tester_type": "mechanical", "max_pressure_bar": 420, "max_flow_lpm": 270, "flow_accuracy": "±4% FS", "pressure_accuracy": "±1.6% FS", "temp_accuracy": "±2.5 °C", "fluid_temp_range": "20 to 80 °C", "ambient_temp_range": "-10 to 50 °C"}'::jsonb, true, 5980, 'rfik 시리즈 기계식 유압 테스터 rfik series mechanical hydraulic tester 최대 420 bar, 270 l/min의 휴대용 기계식 유압 테스터입니다. portable mechanical hydraulic tester rated to 420 bar and 270 l/min. rfik series webtec products limited 휴대용 유압 테스터 portable hydraulic testers mechanical 기계식 mechanical 420 270 ±4% fs ±1.6% fs ±2.5 °c 20 to 80 °c -10 to 50 °c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-rv-ck-m-series', 'RV, CK & M Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RV·CK·M 시리즈 릴리프/체크밸브 내장 우선 유량 분배 밸브', 'RV, CK & M Series Variable Priority Flow Dividers with Built-in Relief or Check Valve', '릴리프 또는 체크밸브를 내장한 최대 250 bar, 114 L/min의 가변 우선 유량 분배 밸브입니다.', 'Variable priority flow dividers with built-in relief or check valve, rated to 250 bar and 114 L/min.', 'RV, CK, M 시리즈는 릴리프 밸브 또는 체크 밸브를 내장한 가변 우선 유량 분배 밸브입니다. 최대 정격 압력 250 bar(3630 psi), 최대 정격 유량 114 L/min(30 US gpm)이며 BSPP, NPTF, SAE, 미터법 포트를 지원합니다. 주철 바디에 스틸 부품과 알루미늄 노브 구성으로 중량은 3.5 kg입니다.', 'The RV, CK and M series are variable priority flow dividers with a built-in relief or check valve. They are rated to 250 bar (3630 psi) and up to 114 L/min (30 US gpm) with BSPP, NPTF, SAE and metric porting. Steel components are housed in a cast iron body with an aluminium knob, weighing 3.5 kg.',
  '{"valve_type": "priority_flow_divider", "max_pressure_bar": 250, "max_flow_lpm": 114, "porting": "BSPP, NPTF, SAE, Metric", "body_material": "Cast Iron (steel components, aluminium knob)", "weight_kg": 3.5}'::jsonb, true, 5990, 'rv·ck·m 시리즈 릴리프/체크밸브 내장 우선 유량 분배 밸브 rv, ck & m series variable priority flow dividers with built-in relief or check valve 릴리프 또는 체크밸브를 내장한 최대 250 bar, 114 l/min의 가변 우선 유량 분배 밸브입니다. variable priority flow dividers with built-in relief or check valve, rated to 250 bar and 114 l/min. rv, ck & m series webtec products limited 유압 제어 밸브 hydraulic control valves priority_flow_divider 우선 유량 분배 priority flow divider 250 114 bspp, nptf, sae, metric cast iron (steel components, aluminium knob) 3.5')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-rv5', 'RV5', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RV5 릴리프 밸브', 'RV5 Pressure Relief Valve', '최대 276 bar, 70 L/min의 압력 릴리프 밸브입니다.', 'Pressure relief valve rated to 276 bar and 70 L/min.', 'RV5는 최대 압력 276 bar(4000 psi), 최대 유량 70 L/min(18 US gpm)의 압력 릴리프 밸브입니다. 3/4인치 BSPP 포트를 사용하며 고장력 알루미늄 바디에 스틸 내부 부품과 스틸 카트리지로 구성됩니다. 중량은 0.73 kg이고 8.7mm x 40mm 장착 구멍 1개로 고정합니다.', 'The RV5 is a pressure relief valve rated to 276 bar (4000 psi) and up to 70 L/min (18 US gpm). It uses a 3/4" BSPP port, a high tensile aluminium body with steel internals and steel cartridge, weighs 0.73 kg and mounts via a single 8.7 mm x 40 mm mounting hole.',
  '{"valve_type": "relief", "max_pressure_bar": 276, "max_flow_lpm": 70, "porting": "3/4\" BSPP", "body_material": "High Tensile Aluminium (internal: Steel, steel cartridge)", "weight_kg": 0.73}'::jsonb, true, 6000, 'rv5 릴리프 밸브 rv5 pressure relief valve 최대 276 bar, 70 l/min의 압력 릴리프 밸브입니다. pressure relief valve rated to 276 bar and 70 l/min. rv5 webtec products limited 유압 제어 밸브 hydraulic control valves relief 릴리프 pressure relief 276 70 3/4" bspp high tensile aluminium (internal: steel, steel cartridge) 0.73')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-safety-burst-discs', 'Safety Burst Discs', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '안전 파열판', 'Safety Burst Discs', '부하 밸브를 과압으로부터 보호하는 안전 파열판입니다.', 'Safety burst discs that protect the loading valve from accidental overpressurisation.', '안전 파열판은 지정된 압력 범위 내에서 파열이 보장되어 부하 밸브를 우발적인 과압으로부터 보호합니다. 측면 또는 상부 연결이 가능해 설치가 쉽고 교체도 빠르고 간편합니다.', 'Safety burst discs are guaranteed to rupture within the specified pressure range, protecting the load valve from accidental overpressurisation. Easy installation allows side or top connections, and they are fast and easy to replace.',
  '{"accessory_type": "burst_disc", "features": "Guaranteed rupture within specified pressure range; side or top connection; fast replacement"}'::jsonb, true, 6010, '안전 파열판 safety burst discs 부하 밸브를 과압으로부터 보호하는 안전 파열판입니다. safety burst discs that protect the loading valve from accidental overpressurisation. safety burst discs webtec products limited 유압 액세서리 hydraulic accessories burst_disc 안전 파열판 safety burst disc guaranteed rupture within specified pressure range; side or top connection; fast replacement')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-sp-ttl-series', 'SP-TTL Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-test-stand-instrumentation'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SP-TTL 시리즈 마그네틱 속도 픽업 센서', 'SP-TTL Series Magnetic Speed Pickup with Conditioned Output', '컨디셔닝 출력을 갖춘 마그네틱 방식 회전 속도 픽업 센서입니다.', 'Magnetic speed pickup sensor with conditioned square wave output.', 'SP-TTL 시리즈는 컨디셔닝된 출력을 제공하는 마그네틱 속도 픽업 센서입니다. 공급 전압 12-32 VDC에서 0-5 V 구형파 펄스를 출력하며(최소 부하 600옴) M12x1 5핀 커넥터로 연결합니다. 무전해 니켈 도금 스틸 바디에 알루미늄 리드를 사용하고 중량은 0.25 kg입니다.', 'The SP-TTL series is a magnetic speed pickup with conditioned output. Operating from a 12-32 VDC supply, it outputs a 0-5 V square wave pulse (minimum load 600 ohms) via an M12x1 5-pin connector. The electroless nickel plated steel body has an aluminium lid and weighs 0.25 kg.',
  '{"instrument_type": "speed_sensor", "output_signal": "0-5 V square wave pulse (min load 600 Ω), supply 12-32 VDC, M12x1 5-pin", "weight_kg": 0.25}'::jsonb, true, 6020, 'sp-ttl 시리즈 마그네틱 속도 픽업 센서 sp-ttl series magnetic speed pickup with conditioned output 컨디셔닝 출력을 갖춘 마그네틱 방식 회전 속도 픽업 센서입니다. magnetic speed pickup sensor with conditioned square wave output. sp-ttl series webtec products limited 테스트 스탠드 계측기 test stand instrumentation speed_sensor 속도 센서 speed sensor 0-5 v square wave pulse (min load 600 ω), supply 12-32 vdc, m12x1 5-pin 0.25')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-sr-pressure-temperature-sensors', 'SR / Intelligent Digital (CANopen) Sensors', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-datalogger-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SR·CANopen 압력/온도 센서', 'SR & Intelligent Digital (CANopen) Pressure / Temperature Sensors', 'HPM 시리즈용 최대 1000 bar 압력·온도 센서 및 액세서리입니다.', 'Pressure/temperature sensors and accessories for the HPM series, rated to 1000 bar.', 'HPM 시리즈 데이터로거와 함께 사용하는 SR 및 지능형 디지털(CANopen) 압력·온도 센서입니다. 최대 정격 압력 1000 bar(14,500 psi)이며 압력 정확도는 풀스케일 ±0.5%, 온도 정확도는 ±3°C(SR-PTT-* 전용)입니다. 주위 온도 -25~85°C, 유체 온도 -25~105°C 연속 사용이 가능하며 최대 630 bar 정격의 M16 x 2 테스트 포인트 커넥터가 함께 제공됩니다.', 'SR and Intelligent Digital (CANopen) pressure/temperature sensors and accessories for use with the HPM series data loggers. Rated to 1000 bar (14,500 psi) with pressure accuracy of ±0.5% full scale and temperature accuracy of ±3°C (SR-PTT-* only). Ambient range is -25 to 85°C and fluid range -25 to 105°C continuous; supplied with an M16 x 2 test point connector rated to 630 bar (live connection at 400 bar or less).',
  '{"sensor_type": "pressure_temperature", "max_pressure_bar": 1000, "accuracy": "Pressure ±0.5% FS; Temperature ±3 °C (SR-PTT-* only)", "fluid_temp_range": "-25 to 105 °C continuous", "ambient_temp_range": "-25 to 85 °C", "porting": "M16 x 2 test point connector (max 630 bar, live connection ≤400 bar)"}'::jsonb, true, 6030, 'sr·canopen 압력/온도 센서 sr & intelligent digital (canopen) pressure / temperature sensors hpm 시리즈용 최대 1000 bar 압력·온도 센서 및 액세서리입니다. pressure/temperature sensors and accessories for the hpm series, rated to 1000 bar. sr / intelligent digital (canopen) sensors webtec products limited 데이터로거용 센서 sensors for dataloggers pressure_temperature 압력·온도 센서 pressure/temperature sensor 1000 pressure ±0.5% fs; temperature ±3 °c (sr-ptt-* only) -25 to 105 °c continuous -25 to 85 °c m16 x 2 test point connector (max 630 bar, live connection ≤400 bar)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-sv80-series', 'SV80 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SV80 시리즈 다이버터 밸브', 'SV80 Series Diverter Valve', '최대 210 bar, 80 L/min의 유로 전환용 다이버터 밸브입니다.', 'Diverter valve for switching flow paths, rated to 210 bar and 80 L/min.', 'SV80 시리즈는 유압 회로의 유로를 전환하는 다이버터 밸브입니다. 최대 정격 압력 210 bar(3000 psi), 최대 정격 유량 80 L/min(21 US gpm)이며 ISO 11158 광유에 적합합니다. 주철 바디에 스테인리스 스틸 내부 부품을 사용하고 BSPP, SAE 포트를 지원하며 중량은 2 kg입니다.', 'The SV80 series diverter valve switches flow between circuits, rated to 210 bar (3000 psi) and up to 80 L/min (21 US gpm). It is compatible with mineral oils to ISO 11158, features stainless steel internals in a cast iron body, offers BSPP and SAE porting and weighs 2 kg.',
  '{"valve_type": "diverter", "max_pressure_bar": 210, "max_flow_lpm": 80, "porting": "BSPP, SAE", "body_material": "Cast Iron (internal: Stainless Steel)", "weight_kg": 2.0}'::jsonb, true, 6040, 'sv80 시리즈 다이버터 밸브 sv80 series diverter valve 최대 210 bar, 80 l/min의 유로 전환용 다이버터 밸브입니다. diverter valve for switching flow paths, rated to 210 bar and 80 l/min. sv80 series webtec products limited 유압 제어 밸브 hydraulic control valves diverter 다이버터 diverter 210 80 bspp, sae cast iron (internal: stainless steel) 2.0')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-tp125-series', 'TP125 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-test-stand-instrumentation'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'TP125 시리즈 온도 센서', 'TP125 Series Temperature Sensors', '최대 480 bar 시스템용 온도 센서로 ±1°C 정확도를 제공합니다.', 'Temperature sensors for systems up to 480 bar with ±1°C accuracy.', 'TP125 시리즈는 유압 테스트 스탠드용 온도 센서입니다. 최대 정격 압력 480 bar(7,000 psi) 시스템에 사용할 수 있으며 유체 온도 범위는 0~125°C, 스케일 범위는 0~150°C입니다. 정확도는 ±1°C이고 ISO 11158 광유에 적합합니다.', 'The TP125 series are temperature sensors for hydraulic test stands, usable in systems rated to 480 bar (7,000 psi). Fluid temperature range is 0 to 125°C with a scaled range of 0 to 150°C and an accuracy of ±1°C. Compatible with mineral oils to ISO 11158.',
  '{"instrument_type": "temperature_sensor", "max_pressure_bar": 480, "accuracy": "±1 °C (scaled range 0-150 °C)", "fluid_temp_range": "0 to 125 °C"}'::jsonb, true, 6050, 'tp125 시리즈 온도 센서 tp125 series temperature sensors 최대 480 bar 시스템용 온도 센서로 ±1°c 정확도를 제공합니다. temperature sensors for systems up to 480 bar with ±1°c accuracy. tp125 series webtec products limited 테스트 스탠드 계측기 test stand instrumentation temperature_sensor 온도 센서 temperature sensor 480 ±1 °c (scaled range 0-150 °c) 0 to 125 °c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-vfc-series', 'VFC Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VFC 시리즈 가변 유량 압력보상 제어 밸브', 'VFC Series Variable Flow Pressure Compensated Control Valve', '최대 210 bar, 55 L/min의 가변 유량 압력보상 제어 밸브입니다.', 'Variable flow pressure compensated control valve rated to 210 bar and 55 L/min.', 'VFC 시리즈는 유량을 가변 조절할 수 있는 압력보상 제어 밸브로, 부하 압력 변화에도 설정 유량을 유지합니다. 최대 압력 210 bar(3000 psi), 최대 유량 55 L/min(15 US gpm)이며 SAE, BSPP, NPTF 포트를 지원합니다. 알루미늄 바디에 카본 스틸 내부 부품, NBR/PTFE 씰을 사용합니다.', 'The VFC series is a variable flow pressure compensated control valve that holds the set flow rate despite load pressure changes. It is rated to 210 bar (3000 psi) and 55 L/min (15 US gpm) with SAE, BSPP and NPTF porting. The valve has an aluminium body with carbon steel internals and NBR/PTFE seals.',
  '{"valve_type": "flow_control_2port", "max_pressure_bar": 210, "max_flow_lpm": 55, "porting": "SAE, BSPP, NPTF", "body_material": "Aluminium (internal: Carbon Steel)", "seal_material": "NBR, PTFE"}'::jsonb, true, 6060, 'vfc 시리즈 가변 유량 압력보상 제어 밸브 vfc series variable flow pressure compensated control valve 최대 210 bar, 55 l/min의 가변 유량 압력보상 제어 밸브입니다. variable flow pressure compensated control valve rated to 210 bar and 55 l/min. vfc series webtec products limited 유압 제어 밸브 hydraulic control valves flow_control_2port 2포트 유량 제어 two-port flow control 210 55 sae, bspp, nptf aluminium (internal: carbon steel) nbr, ptfe')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-vfd120-e-series', 'VFD120-E Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VFD120-E 시리즈 전동 구동 우선 유량 분배 밸브', 'VFD120-E Series Variable Priority Flow Divider with Electric Motor Drive', '전기 모터 구동식 최대 420 bar, 120 L/min의 가변 우선 유량 분배 밸브입니다.', 'Electric motor driven variable priority flow divider rated to 420 bar and 120 L/min.', 'VFD120-E 시리즈는 전기 모터 구동 방식의 가변 우선 유량 분배 밸브입니다. 최대 정격 압력 420 bar(6000 psi), 총 유량 120 L/min(32 US gpm), 최대 우선(REG) 유량 110 L/min(30 US gpm)입니다. BSPP, SAE, NPTF, 미터법 포트를 지원하며 흑색 도장 덕타일 주철 바디, 알루미늄 플레이트와 스틸 브래킷에 장착된 구동 메커니즘으로 구성되고 중량은 2.75 kg입니다.', 'The VFD120-E series is a variable priority flow divider with electric motor drive. It is rated to 420 bar (6000 psi) with up to 120 L/min (32 US gpm) total flow and up to 110 L/min (30 US gpm) priority (REG) flow. It offers BSPP, SAE, NPTF and metric porting, with the drive mechanism mounted on an aluminium plate and mild steel bracket on a black-painted cast ductile iron body, weighing 2.75 kg.',
  '{"valve_type": "priority_flow_divider", "max_pressure_bar": 420, "max_flow_lpm": 120, "priority_flow_lpm": 110, "porting": "BSPP, SAE, NPTF, Metric", "body_material": "Cast Ductile Iron, painted black (drive mechanism on aluminium plate / mild steel bracket)", "weight_kg": 2.75}'::jsonb, true, 6070, 'vfd120-e 시리즈 전동 구동 우선 유량 분배 밸브 vfd120-e series variable priority flow divider with electric motor drive 전기 모터 구동식 최대 420 bar, 120 l/min의 가변 우선 유량 분배 밸브입니다. electric motor driven variable priority flow divider rated to 420 bar and 120 l/min. vfd120-e series webtec products limited 유압 제어 밸브 hydraulic control valves priority_flow_divider 우선 유량 분배 priority flow divider 420 120 110 bspp, sae, nptf, metric cast ductile iron, painted black (drive mechanism on aluminium plate / mild steel bracket) 2.75')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-vfd120-series', 'VFD120 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VFD120 시리즈 가변 우선 유량 분배 밸브', 'VFD120 Series Variable Priority Flow Divider', '최대 420 bar, 총 유량 120 L/min의 가변 우선 유량 분배 밸브입니다.', 'Variable priority flow divider rated to 420 bar with 120 L/min total flow.', 'VFD120 시리즈는 최대 정격 압력 420 bar(6000 psi), 총 유량 120 L/min(32 US gpm), 최대 우선(REG) 유량 95 L/min(25 US gpm)의 가변 우선 유량 분배 밸브입니다. BSPP, SAE, NPT, 미터법 포트를 지원하며 흑색 도장 덕타일 주철 바디에 스틸 부품과 알루미늄 노브를 사용합니다. 중량은 약 2.0 kg입니다.', 'The VFD120 series variable priority flow divider is rated to 420 bar (6000 psi) with up to 120 L/min (32 US gpm) total flow and up to 95 L/min (25 US gpm) priority (REG) flow. Porting options include BSPP, SAE, NPT and metric. Steel components are housed in a cast ductile iron body painted black with an aluminium knob, weighing typically 2.0 kg.',
  '{"valve_type": "priority_flow_divider", "max_pressure_bar": 420, "max_flow_lpm": 120, "priority_flow_lpm": 95, "porting": "BSPP, SAE, NPT, Metric", "body_material": "Cast Ductile Iron, painted black (steel components, aluminium knob)", "weight_kg": 2.0}'::jsonb, true, 6080, 'vfd120 시리즈 가변 우선 유량 분배 밸브 vfd120 series variable priority flow divider 최대 420 bar, 총 유량 120 l/min의 가변 우선 유량 분배 밸브입니다. variable priority flow divider rated to 420 bar with 120 l/min total flow. vfd120 series webtec products limited 유압 제어 밸브 hydraulic control valves priority_flow_divider 우선 유량 분배 priority flow divider 420 120 95 bspp, sae, npt, metric cast ductile iron, painted black (steel components, aluminium knob) 2.0')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-vfd120md-series', 'VFD120MD Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VFD120MD 시리즈 원격 비례제어 우선 유량 분배 밸브', 'VFD120MD Series Variable Priority Flow Divider with Remote Proportional Control', '원격 비례 제어 기능을 갖춘 최대 420 bar, 120 L/min의 가변 우선 유량 분배 밸브입니다.', 'Variable priority flow divider with remote proportional control, rated to 420 bar and 120 L/min.', 'VFD120MD 시리즈는 원격 비례 제어가 가능한 가변 우선 유량 분배 밸브입니다. 최대 정격 압력 420 bar(6000 psi), 총 유량 120 L/min(32 US gpm), 최대 우선(REG) 유량 110 L/min(30 US gpm)입니다. BSPP, SAE, NPTF, 미터법 포트를 지원하며 흑색 도장 덕타일 주철 바디에 알루미늄 플레이트와 스틸 브래킷에 장착된 구동 메커니즘을 갖추고 있습니다. 중량은 2.75 kg입니다.', 'The VFD120MD series is a variable priority flow divider with remote proportional control. It is rated to 420 bar (6000 psi) with up to 120 L/min (32 US gpm) total flow and up to 110 L/min (30 US gpm) priority (REG) flow. Porting options are BSPP, SAE, NPTF and metric; the drive mechanism is mounted on an aluminium plate and mild steel bracket on a black-painted cast ductile iron body, weighing 2.75 kg.',
  '{"valve_type": "priority_flow_divider", "max_pressure_bar": 420, "max_flow_lpm": 120, "priority_flow_lpm": 110, "porting": "BSPP, SAE, NPTF, Metric", "body_material": "Cast Ductile Iron, painted black (drive mechanism on aluminium plate / mild steel bracket)", "weight_kg": 2.75}'::jsonb, true, 6090, 'vfd120md 시리즈 원격 비례제어 우선 유량 분배 밸브 vfd120md series variable priority flow divider with remote proportional control 원격 비례 제어 기능을 갖춘 최대 420 bar, 120 l/min의 가변 우선 유량 분배 밸브입니다. variable priority flow divider with remote proportional control, rated to 420 bar and 120 l/min. vfd120md series webtec products limited 유압 제어 밸브 hydraulic control valves priority_flow_divider 우선 유량 분배 priority flow divider 420 120 110 bspp, sae, nptf, metric cast ductile iron, painted black (drive mechanism on aluminium plate / mild steel bracket) 2.75')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-vfd190-series', 'VFD190 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VFD190 시리즈 가변 우선 유량 분배 밸브', 'VFD190 Series Variable Priority Flow Divider', '총 유량 190 L/min, 우선 유량 150 L/min까지 처리하는 고유량 가변 우선 유량 분배 밸브입니다.', 'High-flow variable priority flow divider handling up to 190 L/min total flow and 150 L/min priority flow.', 'VFD190 시리즈는 최대 정격 압력 420 bar(6000 psi), 총 유량 190 L/min(50 US gpm), 최대 우선(REG) 유량 150 L/min(40 US gpm)의 대유량 가변 우선 유량 분배 밸브입니다. BSPP, SAE 포트를 지원하며 흑색 도장 덕타일 주철 바디에 스틸 부품과 알루미늄 노브를 사용합니다. 중량은 3.5~4.0 kg입니다.', 'The VFD190 series is a high-capacity variable priority flow divider rated to 420 bar (6000 psi) with up to 190 L/min (50 US gpm) total flow and up to 150 L/min (40 US gpm) priority (REG) flow. It offers BSPP and SAE porting, with steel components in a black-painted cast ductile iron body and aluminium knob, weighing 3.5 to 4.0 kg.',
  '{"valve_type": "priority_flow_divider", "max_pressure_bar": 420, "max_flow_lpm": 190, "priority_flow_lpm": 150, "porting": "BSPP, SAE", "body_material": "Cast Ductile Iron, painted black (steel components, aluminium knob)", "weight_kg": 4.0}'::jsonb, true, 6100, 'vfd190 시리즈 가변 우선 유량 분배 밸브 vfd190 series variable priority flow divider 총 유량 190 l/min, 우선 유량 150 l/min까지 처리하는 고유량 가변 우선 유량 분배 밸브입니다. high-flow variable priority flow divider handling up to 190 l/min total flow and 150 l/min priority flow. vfd190 series webtec products limited 유압 제어 밸브 hydraulic control valves priority_flow_divider 우선 유량 분배 priority flow divider 420 190 150 bspp, sae cast ductile iron, painted black (steel components, aluminium knob) 4.0')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-vfd50-series', 'VFD50 Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VFD50 시리즈 가변 우선 유량 분배 밸브', 'VFD50 Series Variable Priority Flow Divider', '총 유량 50 L/min, 우선 유량 30 L/min까지 처리하는 가변 우선 유량 분배 밸브입니다.', 'Variable priority flow divider handling up to 50 L/min total flow with up to 30 L/min priority flow.', 'VFD50 시리즈는 입력 유량을 우선(REG) 포트와 바이패스(BP) 포트로 분배하는 소형 가변 우선 유량 분배 밸브입니다. 최대 압력 250 bar(3,625 psi), 총 유량 50 L/min(13.2 US gpm), 최대 우선 유량 30 L/min(7.9 US gpm)입니다. BSPP, NPT, 매니폴드 마운트 포트를 지원하며 주철(SG Iron) 바디에 스틸 부품, 알루미늄 노브 구성으로 중량은 약 0.75 kg입니다.', 'The VFD50 series is a compact variable priority flow divider that splits inlet flow between a priority (REG) port and a bypass (BP) port. It is rated to 250 bar (3,625 psi) with 50 L/min (13.2 US gpm) total flow and up to 30 L/min (7.9 US gpm) priority flow. Porting options are BSPP, NPT and manifold mount, with steel components in a cast SG iron body and aluminium knob, weighing typically 0.75 kg.',
  '{"valve_type": "priority_flow_divider", "max_pressure_bar": 250, "max_flow_lpm": 50, "priority_flow_lpm": 30, "porting": "BSPP, NPT, Manifold Mount", "body_material": "Cast SG Iron (steel components, aluminium knob)", "weight_kg": 0.75}'::jsonb, true, 6110, 'vfd50 시리즈 가변 우선 유량 분배 밸브 vfd50 series variable priority flow divider 총 유량 50 l/min, 우선 유량 30 l/min까지 처리하는 가변 우선 유량 분배 밸브입니다. variable priority flow divider handling up to 50 l/min total flow with up to 30 l/min priority flow. vfd50 series webtec products limited 유압 제어 밸브 hydraulic control valves priority_flow_divider 우선 유량 분배 priority flow divider 250 50 30 bspp, npt, manifold mount cast sg iron (steel components, aluminium knob) 0.75')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-wika-a-10', 'WIKA A-10 Type', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-test-stand-instrumentation'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'WIKA A-10 타입 압력 트랜스듀서', 'WIKA A-10 Type Pressure Transducers', '최대 600 bar, 풀스케일 ±1% 정확도의 압력 트랜스듀서입니다.', 'Pressure transducers rated to 600 bar with ±1% full scale accuracy.', 'WIKA A-10 타입 압력 트랜스듀서는 최대 정격 압력 600 bar이며 정확도는 풀스케일 ±1%입니다. 작동 온도 범위는 -40~100°C이고 스테인리스 스틸 316L 바디를 사용합니다. BSPP, SAE 장착을 지원하며 중량은 0.080 kg입니다.', 'The WIKA A-10 type pressure transducers are rated to 600 bar with ±1% full scale accuracy. Operating temperature range is -40 to 100°C with a stainless steel 316L body. They support BSPP and SAE mounting and weigh 0.080 kg.',
  '{"instrument_type": "pressure_transducer", "max_pressure_bar": 600, "accuracy": "±1% full scale", "porting": "BSPP, SAE", "weight_kg": 0.08}'::jsonb, true, 6120, 'wika a-10 타입 압력 트랜스듀서 wika a-10 type pressure transducers 최대 600 bar, 풀스케일 ±1% 정확도의 압력 트랜스듀서입니다. pressure transducers rated to 600 bar with ±1% full scale accuracy. wika a-10 type webtec products limited 테스트 스탠드 계측기 test stand instrumentation pressure_transducer 압력 트랜스듀서 pressure transducer 600 ±1% full scale bspp, sae 0.08')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('webtec-wp-series', 'WP Series', (select id from manufacturers where slug = 'webtec'), (select id from product_categories where slug = 'webtec-flow-monitors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'WP 시리즈 유압 유량 모니터', 'WP Series Hydraulic Flow Monitor', '최대 420 bar, 550 L/min의 유압 유량 모니터로 풀스케일 ±2.0% 정확도를 제공합니다.', 'Hydraulic flow monitor rated to 420 bar and 550 L/min with ±2.0% full scale accuracy.', 'WP 시리즈는 최대 정격 압력 420 bar(6000 psi), 최대 정격 유량 550 L/min(150 US gpm)의 유압 유량 모니터입니다. 정확도는 풀스케일 ±2.0%(-BI 코드 옵션 시 ±0.4%)이며 최대 정격 온도는 116°C입니다. BSPP, NPTF, SAE 포트를 지원하고 알루미늄, 황동 또는 스테인리스 스틸 바디에 스테인리스 스틸 내부 부품을 사용합니다.', 'The WP series hydraulic flow monitor is rated to 420 bar (6000 psi) and up to 550 L/min (150 US gpm). Accuracy is ±2.0% of full scale (±0.4% with the -BI code option) and the maximum rated temperature is 116°C. Porting options are BSPP, NPTF and SAE, with body materials in aluminium, brass or stainless steel and stainless steel internals.',
  '{"max_pressure_bar": 420, "max_flow_lpm": 550, "accuracy": "±2.0% of full scale (-BI code ±0.4% of full scale)", "porting": "BSPP, NPTF, SAE", "fluid_temp_range": "up to 116 °C"}'::jsonb, true, 6130, 'wp 시리즈 유압 유량 모니터 wp series hydraulic flow monitor 최대 420 bar, 550 l/min의 유압 유량 모니터로 풀스케일 ±2.0% 정확도를 제공합니다. hydraulic flow monitor rated to 420 bar and 550 l/min with ±2.0% full scale accuracy. wp series webtec products limited 유량·상태 모니터링 flow & condition monitoring 420 550 ±2.0% of full scale (-bi code ±0.4% of full scale) bspp, nptf, sae up to 116 °c')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

commit;
