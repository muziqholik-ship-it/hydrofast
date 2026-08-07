-- 004_product_catalog_seed — part 4/5
-- Run parts in order (1 → 5) in the Supabase SQL Editor. Idempotent.

begin;

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ow11as', 'OW11AS', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'OW11AS T-11A 카운터밸런스 카트리지 밸브', 'OW11AS T-11A Counterbalance Cartridge Valve', 'T-11A 캐비티용 카운터밸런스 카트리지 (60 L/min, 350 bar)', 'Counterbalance cartridge for T-11A cavity (60 L/min, 350 bar)', 'OW11AS는 T-11A 표준 캐비티용 나사식 카운터밸런스 카트리지 밸브입니다. 오픈 센터 시스템용으로 파일럿 비율 3:1(설정 70~280 bar) 또는 4:1(설정 100~350 bar)을 선택할 수 있으며 최대 유량 60 L/min, 최대 압력 350 bar 사양입니다. HYTREL/PTFE + NBR/Viton 시일 조합과 아연 CRIII 또는 아연-니켈 표면 처리를 제공합니다.', 'The OW11AS is a screw-in counterbalance cartridge valve for the industry-standard T-11A cavity. Designed for open-center systems, it offers 3:1 (70-280 bar setting) or 4:1 (100-350 bar setting) pilot ratios, 60 L/min max flow and 350 bar max pressure. Seal combinations of HYTREL/PTFE with NBR or Viton and zinc CRIII or zinc-nickel surface treatments are available.',
  '{"valve_function": "counterbalance", "cavity": "T-11A (M20x1.5)", "max_flow_lpm": 60, "max_pressure_bar": 350, "adjustment": "조정 스크류 (59 bar/회전)", "pilot_ratio": "3:1 / 4:1", "cracking_pressure": "설정 범위 70-280 bar (3:1) / 100-350 bar (4:1)", "seal_material": "HYTREL+NBR / PTFE+NBR / HYTREL+Viton / PTFE+Viton", "controlled_flow_range": null}'::jsonb, true, 3560, 'ow11as t-11a 카운터밸런스 카트리지 밸브 ow11as t-11a counterbalance cartridge valve t-11a 캐비티용 카운터밸런스 카트리지 (60 l/min, 350 bar) counterbalance cartridge for t-11a cavity (60 l/min, 350 bar) ow11as oleoweb s.r.l. 카트리지 밸브 cartridge valves counterbalance 카운터밸런스 counterbalance t-11a (m20x1.5) 60 350 조정 스크류 (59 bar/회전) 3:1 / 4:1 설정 범위 70-280 bar (3:1) / 100-350 bar (4:1) hytrel+nbr / ptfe+nbr / hytrel+viton / ptfe+viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-plugs-din3852', 'PLUGS DIN3852', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DIN3852 플러그', 'Plugs DIN3852', 'Oleoweb 유압 밸브 시스템용 DIN3852 규격 플러그입니다.', 'Plugs DIN3852 for Oleoweb hydraulic valve systems.', 'PLUGS DIN3852은(는) 이탈리아 Oleoweb의 유압 시스템 액세서리 라인업 중 DIN3852 규격 플러그 제품군입니다. Oleoweb 솔레노이드 밸브 및 매니폴드 시스템과 함께 사용되며, 세부 사양은 개별 데이터시트를 참조해야 합니다.', 'PLUGS DIN3852 is the Plugs DIN3852 range in Oleoweb''s hydraulic accessory line-up. They are used together with Oleoweb solenoid valves and manifold systems; refer to individual datasheets for detailed specifications.',
  '{"component_type": "Plugs DIN3852"}'::jsonb, true, 3570, 'din3852 플러그 plugs din3852 oleoweb 유압 밸브 시스템용 din3852 규격 플러그입니다. plugs din3852 for oleoweb hydraulic valve systems. plugs din3852 oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories plugs din3852 plugs din3852 plugs din3852')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-plugs-sae8', 'PLUGS SAE8', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SAE8 플러그', 'Plugs SAE8', 'Oleoweb 유압 밸브 시스템용 SAE8 규격 플러그입니다.', 'Plugs SAE8 for Oleoweb hydraulic valve systems.', 'PLUGS SAE8은(는) 이탈리아 Oleoweb의 유압 시스템 액세서리 라인업 중 SAE8 규격 플러그 제품군입니다. Oleoweb 솔레노이드 밸브 및 매니폴드 시스템과 함께 사용되며, 세부 사양은 개별 데이터시트를 참조해야 합니다.', 'PLUGS SAE8 is the Plugs SAE8 range in Oleoweb''s hydraulic accessory line-up. They are used together with Oleoweb solenoid valves and manifold systems; refer to individual datasheets for detailed specifications.',
  '{"component_type": "Plugs SAE8"}'::jsonb, true, 3580, 'sae8 플러그 plugs sae8 oleoweb 유압 밸브 시스템용 sae8 규격 플러그입니다. plugs sae8 for oleoweb hydraulic valve systems. plugs sae8 oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories plugs sae8 plugs sae8 plugs sae8')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pm', 'PM', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PM 틸팅 레버 수동 펌프', 'PM Tilting Lever Hand Pump', '인라인 설치 방식의 틸팅 레버 수동 펌프로 최대 유량 70 L/min, 최대 압력 200 bar를 지원합니다.', 'Tilting Lever Hand Pump with in-line installation, rated for flows up to 70 L/min and pressures up to 200 bar.', 'PM은(는) 이탈리아 Oleoweb의 틸팅 레버 수동 펌프 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 70 L/min, 최대 압력 200 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The PM is a tilting lever hand pump series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 70 L/min and pressures up to 200 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"actuation": "tilting_lever", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 70, "max_pressure_bar": 200}'::jsonb, true, 3590, 'pm 틸팅 레버 수동 펌프 pm tilting lever hand pump 인라인 설치 방식의 틸팅 레버 수동 펌프로 최대 유량 70 l/min, 최대 압력 200 bar를 지원합니다. tilting lever hand pump with in-line installation, rated for flows up to 70 l/min and pressures up to 200 bar. pm oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps tilting_lever 틸팅 레버 tilting lever parts_in_body 바디 일체형 parts in body in_line 인라인 in-line 70 200')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pm20', 'PM20', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PM20 더블 펌핑 수동 펌프 (단동)', 'PM20 Double Pumping Hand Pump (Single Acting)', '단동 실린더용 더블 펌핑 수동 펌프, 20cc, 최대 350bar', 'Double pumping hand pump for single acting cylinder, 20 cc, up to 350 bar', '단동 실린더용 더블 펌핑(양방향 토출) 수동 펌프입니다. 배기량 20cc, 최적 사용 압력 150bar, 최대 350bar이며 600mm 레버가 기본 제공됩니다. 고무 보호커버(소프트 벨로우즈), 조이스틱, 언로딩 레버, 릴리프 밸브, 드레인 밸브 등 다양한 옵션 구성이 가능합니다.', 'Double pumping hand pump for single acting cylinders, delivering oil on both lever strokes. Displacement 20 cc, optimal pressure 150 bar, maximum 350 bar, supplied with a 600 mm lever. Options include rubber protection bellows, joystick, unloading lever, relief valve and drain valve configurations.',
  '{"pump_type": "double_pumping", "acting_type": "single_acting", "displacement_cc": "20", "max_pressure_bar": 350, "optimal_pressure_bar": "150", "ports": "In BSPP 1/2, Out BSPP 3/8", "weight_kg": "3.4", "lever_length_mm": 600, "options": "W / WRV / J / L / RRV, rubber bellows (P)"}'::jsonb, true, 3600, 'pm20 더블 펌핑 수동 펌프 (단동) pm20 double pumping hand pump (single acting) 단동 실린더용 더블 펌핑 수동 펌프, 20cc, 최대 350bar double pumping hand pump for single acting cylinder, 20 cc, up to 350 bar pm20 oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 350 double_pumping 더블 펌핑 double pumping single_acting 단동 실린더용 for single acting cylinder 20 150 in bspp 1/2, out bspp 3/8 3.4 600 w / wrv / j / l / rrv, rubber bellows (p)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pm50', 'PM50', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PM50 더블 펌핑 수동 펌프 (단동)', 'PM50 Double Pumping Hand Pump (Single Acting)', '단동 실린더용 더블 펌핑 수동 펌프, 50cc, 최대 280bar', 'Double pumping hand pump for single acting cylinder, 50 cc, up to 280 bar', '단동 실린더용 대용량 더블 펌핑 수동 펌프입니다. 배기량 50cc, 최적 사용 압력 80bar, 최대 280bar이며 600mm 레버가 기본 제공됩니다. 소프트 벨로우즈, 조이스틱, 언로딩 레버, 릴리프/드레인 밸브 옵션을 선택할 수 있습니다.', 'High-displacement double pumping hand pump for single acting cylinders. Displacement 50 cc, optimal pressure 80 bar, maximum 280 bar, supplied with a 600 mm lever. Available with rubber bellows, joystick, unloading lever and relief/drain valve options.',
  '{"pump_type": "double_pumping", "acting_type": "single_acting", "displacement_cc": "50", "max_pressure_bar": 280, "optimal_pressure_bar": "80", "ports": "BSPP 1/2", "weight_kg": "4.2", "lever_length_mm": 600, "options": "W / WRV / J / L / RRV, rubber bellows (P)"}'::jsonb, true, 3610, 'pm50 더블 펌핑 수동 펌프 (단동) pm50 double pumping hand pump (single acting) 단동 실린더용 더블 펌핑 수동 펌프, 50cc, 최대 280bar double pumping hand pump for single acting cylinder, 50 cc, up to 280 bar pm50 oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 280 double_pumping 더블 펌핑 double pumping single_acting 단동 실린더용 for single acting cylinder 50 80 bspp 1/2 4.2 600 w / wrv / j / l / rrv, rubber bellows (p)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pm70', 'PM70', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PM70 더블 펌핑 수동 펌프 (단동)', 'PM70 Double Pumping Hand Pump (Single Acting)', '단동 실린더용 더블 펌핑 수동 펌프, 70cc, 최대 200bar', 'Double pumping hand pump for single acting cylinder, 70 cc, up to 200 bar', '단동 실린더용 최대 배기량 모델의 더블 펌핑 수동 펌프입니다. 배기량 70cc, 최적 사용 압력 50bar, 최대 200bar이며 600mm 레버가 기본 제공됩니다. 빠른 실린더 이송이 필요한 저압 대유량 용도에 적합합니다.', 'Largest-displacement double pumping hand pump for single acting cylinders. Displacement 70 cc, optimal pressure 50 bar, maximum 200 bar, supplied with a 600 mm lever. Suited to low-pressure, high-volume applications requiring fast cylinder travel.',
  '{"pump_type": "double_pumping", "acting_type": "single_acting", "displacement_cc": "70", "max_pressure_bar": 200, "optimal_pressure_bar": "50", "ports": "BSPP 1/2", "weight_kg": "5.6", "lever_length_mm": 600, "options": "W / WRV / J / L / RRV, rubber bellows (P)"}'::jsonb, true, 3620, 'pm70 더블 펌핑 수동 펌프 (단동) pm70 double pumping hand pump (single acting) 단동 실린더용 더블 펌핑 수동 펌프, 70cc, 최대 200bar double pumping hand pump for single acting cylinder, 70 cc, up to 200 bar pm70 oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 200 double_pumping 더블 펌핑 double pumping single_acting 단동 실린더용 for single acting cylinder 70 50 bspp 1/2 5.6 600 w / wrv / j / l / rrv, rubber bellows (p)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pma', 'PMA (PMA6 / PMA12 / PMA25 / PMA45)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PMA 더블 펌핑 수동 펌프 (복동, 오픈 센터)', 'PMA Double Pumping Hand Pump (Double Acting, Open Center)', '복동 실린더용 오픈 센터 수동 펌프, 6~45cc, 최대 500bar', 'Open-center hand pump for double acting cylinder, 6-45 cc, up to 500 bar', '복동 실린더 제어용 오픈 센터 방식 더블 펌핑 수동 펌프입니다. 배기량 6/12/25/45cc, 최대 압력 280~500bar, A/B 포트는 BSPP 3/8입니다. 언로딩 레버 및 A/B 릴리프 밸브 옵션이 제공되며 성형 가스켓·고정 볼트·600mm 레버가 기본 구성품입니다.', 'Open-center double pumping hand pump for double acting cylinders. Displacements 6/12/25/45 cc, maximum pressures 280 to 500 bar, A/B ports BSPP 3/8. Options include unloading lever and relief valves on A and B; supplied with shaped seal, fixing screws and 600 mm lever.',
  '{"pump_type": "double_pumping", "acting_type": "double_acting", "displacement_cc": "6 / 12 / 25 / 45", "max_pressure_bar": 500, "optimal_pressure_bar": "PMA6 420, PMA12 220, PMA25 120, PMA45 80", "ports": "A/B BSPP 3/8", "weight_kg": "4.2", "lever_length_mm": 600, "options": "L / RV / LRV, rubber bellows (P)"}'::jsonb, true, 3630, 'pma 더블 펌핑 수동 펌프 (복동, 오픈 센터) pma double pumping hand pump (double acting, open center) 복동 실린더용 오픈 센터 수동 펌프, 6~45cc, 최대 500bar open-center hand pump for double acting cylinder, 6-45 cc, up to 500 bar pma (pma6 / pma12 / pma25 / pma45) oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 500 double_pumping 더블 펌핑 double pumping double_acting 복동 실린더용 for double acting cylinder 6 / 12 / 25 / 45 pma6 420, pma12 220, pma25 120, pma45 80 a/b bspp 3/8 4.2 600 l / rv / lrv, rubber bellows (p)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pma-pmi-pms-pmt', 'PMA - PMI - PMS - PMT', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PMA 시리즈 틸팅 레버 수동 펌프', 'PMA Series Tilting Lever Hand Pump', '플랜지형 설치 방식의 틸팅 레버 수동 펌프로 최대 유량 45 L/min, 최대 압력 500 bar를 지원합니다.', 'Tilting Lever Hand Pump with flanged installation, rated for flows up to 45 L/min and pressures up to 500 bar.', 'PMA - PMI - PMS - PMT은(는) 이탈리아 Oleoweb의 틸팅 레버 수동 펌프 시리즈입니다. 바디 일체형 구조와 플랜지형 설치 방식을 채택하였으며, 최대 유량 45 L/min, 최대 압력 500 bar 사양을 갖추고 있습니다. 본 시리즈에는 PMA, PMI, PMS, PMT 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The PMA - PMI - PMS - PMT is a tilting lever hand pump series from Oleoweb, Italy. It features a parts in body execution with flanged installation, rated for flows up to 45 L/min and pressures up to 500 bar. The series includes the PMA, PMI, PMS, PMT models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"actuation": "tilting_lever", "execution": "parts_in_body", "installation": "flanged", "max_flow_lpm": 45, "max_pressure_bar": 500, "variant_codes": "PMA, PMI, PMS, PMT"}'::jsonb, true, 3640, 'pma 시리즈 틸팅 레버 수동 펌프 pma series tilting lever hand pump 플랜지형 설치 방식의 틸팅 레버 수동 펌프로 최대 유량 45 l/min, 최대 압력 500 bar를 지원합니다. tilting lever hand pump with flanged installation, rated for flows up to 45 l/min and pressures up to 500 bar. pma - pmi - pms - pmt oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps tilting_lever 틸팅 레버 tilting lever parts_in_body 바디 일체형 parts in body flanged 플랜지형 flanged 45 500 pma, pmi, pms, pmt')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pmd', 'PMD (PMD5 / PMD10 / PMD17)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PMD 더블 실린더 수동 펌프 (단동)', 'PMD Single Acting Hand Pump with Double Cylinder', '더블 펌핑 엘리먼트 수동 펌프, 5~17cc, 최대 500bar', 'Hand pump with double pumping cylinder, 5-17 cc, up to 500 bar', '펌핑 엘리먼트를 2개 내장한 단동 실린더용 수동 펌프입니다. 배기량 5cc(500bar), 10cc(250bar), 17cc(150bar)이며 포트는 BSPP 3/8입니다. 성형 가스켓, 고정 볼트, 500mm 레버가 기본 제공됩니다.', 'Hand pump with a double pumping element for single acting cylinders. Displacements 5 cc (500 bar), 10 cc (250 bar) and 17 cc (150 bar) with BSPP 3/8 ports. Supplied with shaped seal, fixing screws and a 500 mm lever.',
  '{"pump_type": "double_cylinder", "acting_type": "single_acting", "displacement_cc": "5 / 10 / 17", "max_pressure_bar": 500, "optimal_pressure_bar": "PMD5 500, PMD10 250, PMD17 150", "ports": "BSPP 3/8", "weight_kg": "5.7", "lever_length_mm": 500, "options": "W (without unloading valve)"}'::jsonb, true, 3650, 'pmd 더블 실린더 수동 펌프 (단동) pmd single acting hand pump with double cylinder 더블 펌핑 엘리먼트 수동 펌프, 5~17cc, 최대 500bar hand pump with double pumping cylinder, 5-17 cc, up to 500 bar pmd (pmd5 / pmd10 / pmd17) oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 500 double_cylinder 더블 실린더 double cylinder single_acting 단동 실린더용 for single acting cylinder 5 / 10 / 17 pmd5 500, pmd10 250, pmd17 150 bspp 3/8 5.7 500 w (without unloading valve)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pme-l', 'PME L (PME5L / PME6L / PME7L)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PME L 카트리지 수동 펌프', 'PME L Cartridge Hand Pumps', 'SAE8/2 플랜지 캐비티용 카트리지 수동 펌프, 1~3cc, 최대 300bar', 'Cartridge hand pumps for SAE8/2 flange cavity, 1-3 cc, up to 300 bar', 'SAE8/2 플랜지형 캐비티에 삽입하는 카트리지식 수동 펌프 시리즈입니다. 배기량 1cc(PME5L, 300bar), 2cc(PME6L, 200bar), 3cc(PME7L, 120bar)의 3가지 모델이 있으며, 270mm 작동 레버가 기본 제공됩니다. 매니폴드 블록(바디 코드 62200023)과 조합하여 컴팩트한 비상 작동 회로를 구성할 수 있습니다.', 'Series of cartridge-type hand pumps for the SAE8/2 cavity with flange. Three models are available: 1 cc (PME5L, 300 bar), 2 cc (PME6L, 200 bar) and 3 cc (PME7L, 120 bar). Supplied with a 270 mm acting lever, they combine with manifold blocks (body code 62200023) to build compact emergency actuation circuits.',
  '{"pump_type": "cartridge", "acting_type": "single_acting", "displacement_cc": "1 / 2 / 3", "max_pressure_bar": 300, "optimal_pressure_bar": "PME5L 300, PME6L 200, PME7L 120", "cavity": "SAE8/2 with flange (3/4-16UNF-2A)", "weight_kg": "0.46", "lever_length_mm": 270, "options": "Hand lever L"}'::jsonb, true, 3660, 'pme l 카트리지 수동 펌프 pme l cartridge hand pumps sae8/2 플랜지 캐비티용 카트리지 수동 펌프, 1~3cc, 최대 300bar cartridge hand pumps for sae8/2 flange cavity, 1-3 cc, up to 300 bar pme l (pme5l / pme6l / pme7l) oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 300 cartridge 카트리지형 cartridge single_acting 단동 실린더용 for single acting cylinder 1 / 2 / 3 pme5l 300, pme6l 200, pme7l 120 sae8/2 with flange (3/4-16unf-2a) 0.46 270 hand lever l')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pme1', 'PME1 (PME18 / PME115)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PME1 하향 단일 펌핑 수동 펌프', 'PME1 Single Downward Pumping Hand Pump', '단동 실린더용 하향 펌핑 수동 펌프, 8/15cc, 최대 380bar', 'Single downward pumping hand pump for single acting cylinder, 8/15 cc, up to 380 bar', '레버를 아래로 내릴 때만 토출하는 단일 펌핑 방식의 수동 펌프입니다. 배기량 8cc(최대 380bar) 또는 15cc(최대 350bar)이며 토출 포트는 BSPP 1/4입니다. 성형 가스켓, 고정 볼트, Ø20mm 500mm 레버가 기본 제공됩니다.', 'Hand pump delivering oil only on the downward lever stroke, for single acting cylinders. Displacement 8 cc (380 bar max) or 15 cc (350 bar max) with a BSPP 1/4 delivery port. Supplied with shaped seal, fixing screws and a 500 mm lever (dia. 20 mm).',
  '{"pump_type": "single_downward", "acting_type": "single_acting", "displacement_cc": "8 / 15", "max_pressure_bar": 380, "optimal_pressure_bar": "PME18 180, PME115 110", "ports": "BSPP 1/4", "weight_kg": "2.9", "lever_length_mm": 500, "options": "W / WRV / RV, rubber bellows (P)"}'::jsonb, true, 3670, 'pme1 하향 단일 펌핑 수동 펌프 pme1 single downward pumping hand pump 단동 실린더용 하향 펌핑 수동 펌프, 8/15cc, 최대 380bar single downward pumping hand pump for single acting cylinder, 8/15 cc, up to 380 bar pme1 (pme18 / pme115) oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 380 single_downward 하향 단일 펌핑 single downward pumping single_acting 단동 실린더용 for single acting cylinder 8 / 15 pme18 180, pme115 110 bspp 1/4 2.9 500 w / wrv / rv, rubber bellows (p)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pme1-pme2', 'PME1 - PME2', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PME1 시리즈 틸팅 레버 수동 펌프', 'PME1 Series Tilting Lever Hand Pump', '플랜지형 설치 방식의 틸팅 레버 수동 펌프로 최대 유량 40 L/min, 최대 압력 240 bar를 지원합니다.', 'Tilting Lever Hand Pump with flanged installation, rated for flows up to 40 L/min and pressures up to 240 bar.', 'PME1 - PME2은(는) 이탈리아 Oleoweb의 틸팅 레버 수동 펌프 시리즈입니다. 바디 일체형 구조와 플랜지형 설치 방식을 채택하였으며, 최대 유량 40 L/min, 최대 압력 240 bar 사양을 갖추고 있습니다. 본 시리즈에는 PME1, PME2 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The PME1 - PME2 is a tilting lever hand pump series from Oleoweb, Italy. It features a parts in body execution with flanged installation, rated for flows up to 40 L/min and pressures up to 240 bar. The series includes the PME1, PME2 models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"actuation": "tilting_lever", "execution": "parts_in_body", "installation": "flanged", "max_flow_lpm": 40, "max_pressure_bar": 240, "variant_codes": "PME1, PME2"}'::jsonb, true, 3680, 'pme1 시리즈 틸팅 레버 수동 펌프 pme1 series tilting lever hand pump 플랜지형 설치 방식의 틸팅 레버 수동 펌프로 최대 유량 40 l/min, 최대 압력 240 bar를 지원합니다. tilting lever hand pump with flanged installation, rated for flows up to 40 l/min and pressures up to 240 bar. pme1 - pme2 oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps tilting_lever 틸팅 레버 tilting lever parts_in_body 바디 일체형 parts in body flanged 플랜지형 flanged 40 240 pme1, pme2')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pme10', 'PME10', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PME10 SAE 10 카트리지 수동 펌프', 'PME10 SAE 10 Cartridge Hand Pump', 'SAE10/2 캐비티용 카트리지 수동 펌프, 10cc, 200bar', 'SAE10/2 cartridge hand pump, 10 cc, 200 bar', 'SAE10/2 캐비티(7/8-14UNF-2A)에 장착하는 카트리지 수동 펌프입니다. 배기량 10cc, 최대 압력 200bar이며 500mm 작동 레버가 기본 제공됩니다. 카탈로그에 카트리지 장착 및 레버 조립 절차가 함께 안내되어 있습니다.', 'Cartridge hand pump for the SAE10/2 cavity (7/8-14UNF-2A). It delivers 10 cc per stroke at up to 200 bar and is supplied with a 500 mm acting lever. The catalogue includes cartridge installation and lever assembly instructions.',
  '{"pump_type": "cartridge", "acting_type": "single_acting", "displacement_cc": "10", "max_pressure_bar": 200, "cavity": "SAE10/2 (7/8-14UNF-2A)", "weight_kg": "1.9", "lever_length_mm": 500}'::jsonb, true, 3690, 'pme10 sae 10 카트리지 수동 펌프 pme10 sae 10 cartridge hand pump sae10/2 캐비티용 카트리지 수동 펌프, 10cc, 200bar sae10/2 cartridge hand pump, 10 cc, 200 bar pme10 oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 200 cartridge 카트리지형 cartridge single_acting 단동 실린더용 for single acting cylinder 10 sae10/2 (7/8-14unf-2a) 1.9 500')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pme2', 'PME2 (PME220 / PME230 / PME240)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PME2 하향 단일 펌핑 수동 펌프', 'PME2 Single Downward Pumping Hand Pump', '단동 실린더용 하향 펌핑 수동 펌프, 20~40cc, 최대 240bar', 'Single downward pumping hand pump for single acting cylinder, 20-40 cc, up to 240 bar', '하향 스트로크에서만 토출하는 대용량 단일 펌핑 수동 펌프입니다. 배기량 20cc(최대 240bar), 30cc(185bar), 40cc(160bar) 3가지가 있으며 600mm 레버가 기본 제공됩니다. 언로딩 레버 및 릴리프 밸브 옵션을 조합할 수 있습니다.', 'High-displacement hand pump delivering oil only on the downward stroke. Three displacements: 20 cc (240 bar max), 30 cc (185 bar) and 40 cc (160 bar), supplied with a 600 mm lever. Unloading lever and relief valve options can be combined.',
  '{"pump_type": "single_downward", "acting_type": "single_acting", "displacement_cc": "20 / 30 / 40", "max_pressure_bar": 240, "optimal_pressure_bar": "PME220 80, PME230 60, PME240 40", "weight_kg": "4.2", "lever_length_mm": 600, "options": "W / WRV / L / RV / LRV, rubber bellows (P)"}'::jsonb, true, 3700, 'pme2 하향 단일 펌핑 수동 펌프 pme2 single downward pumping hand pump 단동 실린더용 하향 펌핑 수동 펌프, 20~40cc, 최대 240bar single downward pumping hand pump for single acting cylinder, 20-40 cc, up to 240 bar pme2 (pme220 / pme230 / pme240) oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 240 single_downward 하향 단일 펌핑 single downward pumping single_acting 단동 실린더용 for single acting cylinder 20 / 30 / 40 pme220 80, pme230 60, pme240 40 4.2 600 w / wrv / l / rv / lrv, rubber bellows (p)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pme3', 'PME3', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PME3 페달식 유압 펌프', 'PME3 Foot Pump', '1.5L 탱크 일체형 페달 펌프, 14cc, 최대 220bar', 'Foot pump with integrated 1.5 L reservoir, 14 cc, up to 220 bar', '1.5L 오일 탱크가 일체형으로 구성된 페달식 유압 펌프입니다. 배기량 14cc, 최대 압력 220bar이며 토출 포트는 BSPP 1/4입니다. 양손이 자유로워야 하는 클램핑·시험 장비 용도에 적합합니다.', 'Foot-operated hydraulic pump with an integrated 1.5-litre reservoir. Displacement 14 cc, maximum pressure 220 bar, delivery port BSPP 1/4. Ideal for clamping and test equipment applications where both hands must stay free.',
  '{"pump_type": "foot", "acting_type": "single_acting", "displacement_cc": "14", "max_pressure_bar": 220, "ports": "BSPP 1/4", "weight_kg": "10.4", "options": "Integrated 1.5 L reservoir"}'::jsonb, true, 3710, 'pme3 페달식 유압 펌프 pme3 foot pump 1.5l 탱크 일체형 페달 펌프, 14cc, 최대 220bar foot pump with integrated 1.5 l reservoir, 14 cc, up to 220 bar pme3 oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 220 foot 페달식 foot operated single_acting 단동 실린더용 for single acting cylinder 14 bspp 1/4 10.4 integrated 1.5 l reservoir')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pme5p', 'PME5P', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PME5P SAE 8 카트리지 수동 펌프', 'PME5P SAE 8 Cartridge Hand Pump', 'SAE8/2 캐비티용 소형 카트리지 수동 펌프, 1cc, 50bar', 'Compact SAE8/2 cartridge hand pump, 1 cc, 50 bar', 'SAE8/2 캐비티에 장착하는 초소형 카트리지 수동 펌프입니다. 배기량 1cc, 최대 압력 50bar, 중량 0.2kg으로 저압 보조 회로나 비상 작동용으로 적합합니다.', 'Ultra-compact cartridge hand pump for the SAE8/2 cavity. With 1 cc displacement, 50 bar maximum pressure and only 0.2 kg weight, it suits low-pressure auxiliary or emergency actuation circuits.',
  '{"pump_type": "cartridge", "acting_type": "single_acting", "displacement_cc": "1", "max_pressure_bar": 50, "cavity": "SAE8/2", "weight_kg": "0.2"}'::jsonb, true, 3720, 'pme5p sae 8 카트리지 수동 펌프 pme5p sae 8 cartridge hand pump sae8/2 캐비티용 소형 카트리지 수동 펌프, 1cc, 50bar compact sae8/2 cartridge hand pump, 1 cc, 50 bar pme5p oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 50 cartridge 카트리지형 cartridge single_acting 단동 실린더용 for single acting cylinder 1 sae8/2 0.2')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pmel', 'PMEL', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PMEL 틸팅 레버 수동 펌프', 'PMEL Tilting Lever Hand Pump', '나사 삽입형 설치 방식의 틸팅 레버 수동 펌프로 최대 유량 10 L/min, 최대 압력 200 bar를 지원합니다.', 'Tilting Lever Hand Pump with screwed-in installation, rated for flows up to 10 L/min and pressures up to 200 bar.', 'PMEL은(는) 이탈리아 Oleoweb의 틸팅 레버 수동 펌프 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 10 L/min, 최대 압력 200 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The PMEL is a tilting lever hand pump series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 10 L/min and pressures up to 200 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"actuation": "tilting_lever", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 10, "max_pressure_bar": 200}'::jsonb, true, 3730, 'pmel 틸팅 레버 수동 펌프 pmel tilting lever hand pump 나사 삽입형 설치 방식의 틸팅 레버 수동 펌프로 최대 유량 10 l/min, 최대 압력 200 bar를 지원합니다. tilting lever hand pump with screwed-in installation, rated for flows up to 10 l/min and pressures up to 200 bar. pmel oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps tilting_lever 틸팅 레버 tilting lever cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in 10 200')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pmep', 'PMEP', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PMEP 푸시/풀 수동 펌프', 'PMEP Push/Pull Hand Pump', '나사 삽입형 설치 방식의 푸시/풀 수동 펌프로 최대 유량 10 L/min, 최대 압력 200 bar를 지원합니다.', 'Push/Pull Hand Pump with screwed-in installation, rated for flows up to 10 L/min and pressures up to 200 bar.', 'PMEP은(는) 이탈리아 Oleoweb의 푸시/풀 수동 펌프 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 10 L/min, 최대 압력 200 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The PMEP is a push/pull hand pump series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 10 L/min and pressures up to 200 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"actuation": "push_pull", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 10, "max_pressure_bar": 200}'::jsonb, true, 3740, 'pmep 푸시/풀 수동 펌프 pmep push/pull hand pump 나사 삽입형 설치 방식의 푸시/풀 수동 펌프로 최대 유량 10 l/min, 최대 압력 200 bar를 지원합니다. push/pull hand pump with screwed-in installation, rated for flows up to 10 l/min and pressures up to 200 bar. pmep oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps push_pull 푸시/풀 push/pull cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in 10 200')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pmi', 'PMI (PMI6 / PMI12 / PMI25 / PMI45)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PMI 더블 펌핑 수동 펌프 (복동, 클로즈드 센터)', 'PMI Double Pumping Hand Pump (Double Acting, Closed Center)', '복동 실린더용 클로즈드 센터 수동 펌프, 6~45cc, 최대 500bar', 'Closed-center hand pump for double acting cylinder, 6-45 cc, up to 500 bar', '복동 실린더 제어용 클로즈드 센터 방식 더블 펌핑 수동 펌프입니다. 배기량 6/12/25/45cc, 최대 압력은 배기량에 따라 280~500bar입니다. 내장 방향 선택 레버로 A/B 포트(BSPP 3/8)를 전환하며, 성형 가스켓·고정 볼트·600mm 레버가 기본 제공됩니다.', 'Closed-center double pumping hand pump for controlling double acting cylinders. Displacements 6/12/25/45 cc with maximum pressures from 280 to 500 bar depending on size. An integrated selector controls the A/B ports (BSPP 3/8); supplied with shaped seal, fixing screws and 600 mm lever.',
  '{"pump_type": "double_pumping", "acting_type": "double_acting", "displacement_cc": "6 / 12 / 25 / 45", "max_pressure_bar": 500, "optimal_pressure_bar": "PMI6 420, PMI12 220, PMI25 120, PMI45 80", "ports": "A/B BSPP 3/8", "weight_kg": "4.2", "lever_length_mm": 600, "options": "L / RV / LRV, rubber bellows (P)"}'::jsonb, true, 3750, 'pmi 더블 펌핑 수동 펌프 (복동, 클로즈드 센터) pmi double pumping hand pump (double acting, closed center) 복동 실린더용 클로즈드 센터 수동 펌프, 6~45cc, 최대 500bar closed-center hand pump for double acting cylinder, 6-45 cc, up to 500 bar pmi (pmi6 / pmi12 / pmi25 / pmi45) oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 500 double_pumping 더블 펌핑 double pumping double_acting 복동 실린더용 for double acting cylinder 6 / 12 / 25 / 45 pmi6 420, pmi12 220, pmi25 120, pmi45 80 a/b bspp 3/8 4.2 600 l / rv / lrv, rubber bellows (p)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pms', 'PMS (PMS6 / PMS12 / PMS25 / PMS45)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PMS 더블 펌핑 수동 펌프 (단동, 탱크 장착형)', 'PMS Double Pumping Hand Pump (Single Acting, Tank Mount)', '단동 실린더용 더블 펌핑 수동 펌프, 6~45cc, 최대 500bar', 'Double pumping hand pump for single acting cylinder, 6-45 cc, up to 500 bar', '탱크 위/내부 장착형 더블 펌핑 수동 펌프로 단동 실린더용입니다. 배기량 6/12/25/45cc 4가지이며, PMS6은 최대 500bar(최적 420bar)까지 사용 가능합니다. 성형 가스켓, 고정 볼트, 600mm 레버가 기본 제공되며 조이스틱·언로딩 레버·릴리프 밸브 등 풍부한 옵션 조합을 지원합니다.', 'Tank-mounted double pumping hand pump for single acting cylinders. Four displacements (6/12/25/45 cc); the PMS6 reaches 500 bar maximum (420 bar optimal). Supplied with shaped seal, fixing screws and a 600 mm lever, with a wide set of joystick, unloading lever and relief valve options.',
  '{"pump_type": "double_pumping", "acting_type": "single_acting", "displacement_cc": "6 / 12 / 25 / 45", "max_pressure_bar": 500, "optimal_pressure_bar": "PMS6 420, PMS12 220, PMS25 120, PMS45 80", "weight_kg": "3.7", "lever_length_mm": 600, "options": "W / WRV / J / L / RV / JRV / LRV, rubber bellows (P)"}'::jsonb, true, 3760, 'pms 더블 펌핑 수동 펌프 (단동, 탱크 장착형) pms double pumping hand pump (single acting, tank mount) 단동 실린더용 더블 펌핑 수동 펌프, 6~45cc, 최대 500bar double pumping hand pump for single acting cylinder, 6-45 cc, up to 500 bar pms (pms6 / pms12 / pms25 / pms45) oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 500 double_pumping 더블 펌핑 double pumping single_acting 단동 실린더용 for single acting cylinder 6 / 12 / 25 / 45 pms6 420, pms12 220, pms25 120, pms45 80 3.7 600 w / wrv / j / l / rv / jrv / lrv, rubber bellows (p)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-pmt', 'PMT (PMT6 / PMT12 / PMT25 / PMT45)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-hand-pumps'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PMT 더블 펌핑 수동 펌프 (복동, 체크 밸브 내장)', 'PMT Double Pumping Hand Pump (Double Acting, with Check Valves)', '체크 밸브 내장 복동 실린더용 수동 펌프, 6~45cc, 최대 500bar', 'Hand pump with check valves for double acting cylinder, 6-45 cc, up to 500 bar', '복동 실린더용 체크 밸브(로드 홀딩) 내장형 더블 펌핑 수동 펌프입니다. 배기량 6/12/25/45cc, 최대 압력 280~500bar이며 A/B 포트는 BSPP 1/4입니다. A/B 또는 B 포트 릴리프 밸브 옵션(RVAB/RVB)을 선택할 수 있습니다.', 'Double pumping hand pump with integrated check valves (load holding) for double acting cylinders. Displacements 6/12/25/45 cc, maximum pressures 280 to 500 bar, A/B ports BSPP 1/4. Relief valve options on both ports (RVAB) or port B only (RVB) are available.',
  '{"pump_type": "double_pumping", "acting_type": "double_acting", "displacement_cc": "6 / 12 / 25 / 45", "max_pressure_bar": 500, "optimal_pressure_bar": "PMT6 420, PMT12 220, PMT25 120, PMT45 80", "ports": "A/B BSPP 1/4", "weight_kg": "4.2", "lever_length_mm": 600, "options": "RVAB / RVB, rubber bellows (P)"}'::jsonb, true, 3770, 'pmt 더블 펌핑 수동 펌프 (복동, 체크 밸브 내장) pmt double pumping hand pump (double acting, with check valves) 체크 밸브 내장 복동 실린더용 수동 펌프, 6~45cc, 최대 500bar hand pump with check valves for double acting cylinder, 6-45 cc, up to 500 bar pmt (pmt6 / pmt12 / pmt25 / pmt45) oleoweb s.r.l. 수동 펌프 (핸드 펌프) hand pumps 500 double_pumping 더블 펌핑 double pumping double_acting 복동 실린더용 for double acting cylinder 6 / 12 / 25 / 45 pmt6 420, pmt12 220, pmt25 120, pmt45 80 a/b bspp 1/4 4.2 600 rvab / rvb, rubber bellows (p)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-po', 'PO', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pilot-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PO 싱글 파일럿 체크 밸브', 'PO Single PO Check Valve', '나사 삽입형 설치 방식의 싱글 파일럿 체크 밸브로 최대 유량 60 L/min, 최대 압력 350 bar를 지원합니다.', 'Single PO Check Valve with screwed-in installation, rated for flows up to 60 L/min and pressures up to 350 bar.', 'PO은(는) 이탈리아 Oleoweb의 싱글 파일럿 체크 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 60 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The PO is a single po check valve series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 60 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"operation": "single_po", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 60, "max_pressure_bar": 350}'::jsonb, true, 3780, 'po 싱글 파일럿 체크 밸브 po single po check valve 나사 삽입형 설치 방식의 싱글 파일럿 체크 밸브로 최대 유량 60 l/min, 최대 압력 350 bar를 지원합니다. single po check valve with screwed-in installation, rated for flows up to 60 l/min and pressures up to 350 bar. po oleoweb s.r.l. 파일럿 체크 밸브 (블록 밸브) pilot operated check valves 350 60 single_po 싱글 파일럿 single po cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-po083s', 'PO083S', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PO083S SAE08/3 쇼트 파일럿 체크 카트리지 밸브', 'PO083S SAE08/3 Short Pilot Operated Check Cartridge Valve', 'SAE08/3 쇼트 캐비티용 파일럿 작동 체크 밸브 (30 L/min, 350 bar)', 'Pilot operated check valve for SAE08/3 short cavity (30 L/min, 350 bar)', 'PO083S는 SAE08/3 쇼트 캐비티용 파일럿 작동 체크 카트리지 밸브입니다. 크래킹 압력 2·3·5·7 bar, 파일럿 비율 3:1, 최대 유량 30 L/min, 최대 압력 350 bar 사양입니다. 파일럿 피스톤 O-링 시일과 PTFE+NBR 또는 PTFE+Viton 시일을 제공합니다.', 'The PO083S is a pilot operated check cartridge valve for the SAE08/3 short cavity. Cracking pressures of 2, 3, 5 or 7 bar, 3:1 pilot ratio, 30 L/min max flow and 350 bar max pressure. O-ring sealed pilot piston with PTFE+NBR or PTFE+Viton seals.',
  '{"valve_function": "pilot_operated_check", "cavity": "SAE08/3 SHORT (3/4-16 UNF)", "max_flow_lpm": 30, "max_pressure_bar": 350, "adjustment": "고정식", "pilot_ratio": "3:1", "cracking_pressure": "2 / 3 / 5 / 7 bar", "seal_material": "PTFE+NBR / PTFE+Viton", "controlled_flow_range": null}'::jsonb, true, 3790, 'po083s sae08/3 쇼트 파일럿 체크 카트리지 밸브 po083s sae08/3 short pilot operated check cartridge valve sae08/3 쇼트 캐비티용 파일럿 작동 체크 밸브 (30 l/min, 350 bar) pilot operated check valve for sae08/3 short cavity (30 l/min, 350 bar) po083s oleoweb s.r.l. 카트리지 밸브 cartridge valves pilot_operated_check 파일럿 체크 pilot operated check sae08/3 short (3/4-16 unf) 30 350 고정식 3:1 2 / 3 / 5 / 7 bar ptfe+nbr / ptfe+viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-po11as', 'PO11AS', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PO11AS T-11A 파일럿 체크 카트리지 밸브', 'PO11AS T-11A Pilot Operated Check Cartridge Valve', 'T-11A 캐비티용 파일럿 작동 체크 밸브 (60 L/min, 350 bar)', 'Pilot operated check valve for T-11A cavity (60 L/min, 350 bar)', 'PO11AS는 T-11A 캐비티용 파일럿 작동 체크(로크) 카트리지 밸브로, 파일럿 압력으로 역방향 흐름을 개방합니다. 크래킹 압력 0.3~7 bar(6단계), 파일럿 비율 3:1, 최대 유량 60 L/min, 최대 압력 350 bar 사양입니다. 파일럿 피스톤 O-링 시일 사양(G)이 기본이며 HYTREL/PTFE + NBR/Viton 시일 조합을 제공합니다.', 'The PO11AS is a pilot operated check cartridge valve for the T-11A cavity, opened in the reverse direction by pilot pressure. Cracking pressures from 0.3 to 7 bar (six options), 3:1 pilot ratio, 60 L/min max flow and 350 bar max pressure. Supplied with an O-ring sealed pilot piston (G) and HYTREL/PTFE + NBR/Viton seal combinations.',
  '{"valve_function": "pilot_operated_check", "cavity": "T-11A (M20x1.5)", "max_flow_lpm": 60, "max_pressure_bar": 350, "adjustment": "고정식", "pilot_ratio": "3:1", "cracking_pressure": "0.3 / 1 / 2 / 3.5 / 5 / 7 bar", "seal_material": "HYTREL+NBR / PTFE+NBR / HYTREL+Viton / PTFE+Viton", "controlled_flow_range": null}'::jsonb, true, 3800, 'po11as t-11a 파일럿 체크 카트리지 밸브 po11as t-11a pilot operated check cartridge valve t-11a 캐비티용 파일럿 작동 체크 밸브 (60 l/min, 350 bar) pilot operated check valve for t-11a cavity (60 l/min, 350 bar) po11as oleoweb s.r.l. 카트리지 밸브 cartridge valves pilot_operated_check 파일럿 체크 pilot operated check t-11a (m20x1.5) 60 350 고정식 3:1 0.3 / 1 / 2 / 3.5 / 5 / 7 bar hytrel+nbr / ptfe+nbr / hytrel+viton / ptfe+viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-po163s', 'PO163S', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PO163S T-163A 파일럿 체크 카트리지 밸브', 'PO163S T-163A Pilot Operated Check Cartridge Valve', 'T-163A 캐비티용 파일럿 작동 체크 밸브 (30 L/min, 350 bar)', 'Pilot operated check valve for T-163A cavity (30 L/min, 350 bar)', 'PO163S는 T-163A 캐비티용 파일럿 작동 체크 카트리지 밸브입니다. 크래킹 압력 2 bar, 파일럿 비율 3:1, 최대 유량 30 L/min, 최대 압력 350 bar 사양입니다. 파일럿 피스톤 O-링 시일과 HYTREL/PTFE + NBR/Viton 시일 조합, 아연 CRIII 또는 아연-니켈 표면 처리를 제공합니다.', 'The PO163S is a pilot operated check cartridge valve for the T-163A cavity. 2 bar cracking pressure, 3:1 pilot ratio, 30 L/min max flow and 350 bar max pressure. O-ring sealed pilot piston, HYTREL/PTFE + NBR/Viton seal combinations and zinc CRIII or zinc-nickel surface treatments.',
  '{"valve_function": "pilot_operated_check", "cavity": "T-163A (M16x1.5)", "max_flow_lpm": 30, "max_pressure_bar": 350, "adjustment": "고정식", "pilot_ratio": "3:1", "cracking_pressure": "2 bar", "seal_material": "HYTREL+NBR / PTFE+NBR / HYTREL+Viton / PTFE+Viton", "controlled_flow_range": null}'::jsonb, true, 3810, 'po163s t-163a 파일럿 체크 카트리지 밸브 po163s t-163a pilot operated check cartridge valve t-163a 캐비티용 파일럿 작동 체크 밸브 (30 l/min, 350 bar) pilot operated check valve for t-163a cavity (30 l/min, 350 bar) po163s oleoweb s.r.l. 카트리지 밸브 cartridge valves pilot_operated_check 파일럿 체크 pilot operated check t-163a (m16x1.5) 30 350 고정식 3:1 2 bar hytrel+nbr / ptfe+nbr / hytrel+viton / ptfe+viton')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ras2', 'RAS2 (BSPP / NPT)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RAS2 2웨이 볼 밸브', 'RAS2 2-Way Ball Valves', '고압 2웨이 볼 밸브, 1/8~1-1/2, 최대 500bar', 'High pressure 2-way ball valves, 1/8 to 1-1/2, up to 500 bar', '유압 라인 차단용 고압 2웨이 볼 밸브입니다. BSPP 및 NPT 나사로 1/8~1-1/2 사이즈가 제공되며 최대 유량 15~150l/min, 최대 압력은 사이즈에 따라 350~500bar입니다. 고정 홀 옵션(P)을 선택할 수 있습니다.', 'High pressure 2-way ball valves for shutting off hydraulic lines. Available in BSPP and NPT threads from 1/8 to 1-1/2, with flows of 15 to 150 l/min and maximum pressures of 350 to 500 bar depending on size. Fixing holes option (P) available.',
  '{"component_type": "ball_valve", "ways": 2, "thread_type": "BSPP / NPT", "size_range": "1/8 - 1-1/2", "max_flow_lpm": "15-150 by size", "max_pressure_bar": 500, "weight_kg": "0.5-2.5"}'::jsonb, true, 3820, 'ras2 2웨이 볼 밸브 ras2 2-way ball valves 고압 2웨이 볼 밸브, 1/8~1-1/2, 최대 500bar high pressure 2-way ball valves, 1/8 to 1-1/2, up to 500 bar ras2 (bspp / npt) oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories ball_valve 볼 밸브 ball valve 2 bspp / npt 1/8 - 1-1/2 15-150 by size 500 0.5-2.5')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ras3', 'RAS3 (BSPP / NPT)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RAS3 3웨이 볼 밸브', 'RAS3 3-Way Ball Valves', '고압 3웨이 볼 밸브, 1/8~1-1/2, 최대 400bar', 'High pressure 3-way ball valves, 1/8 to 1-1/2, up to 400 bar', '유로 전환용 고압 3웨이(L포트) 볼 밸브입니다. BSPP 및 NPT 나사로 1/8~1-1/2 사이즈가 제공되며 최대 유량 15~150l/min, 최대 압력은 소형 400bar, 1/2 이상 350bar입니다. 고정 홀 옵션(P)을 선택할 수 있습니다.', 'High pressure 3-way (L-port) ball valves for diverting flow. Available in BSPP and NPT threads from 1/8 to 1-1/2, with flows of 15 to 150 l/min and maximum pressures of 400 bar (small sizes) or 350 bar (1/2 and larger). Fixing holes option (P) available.',
  '{"component_type": "ball_valve", "ways": 3, "thread_type": "BSPP / NPT", "size_range": "1/8 - 1-1/2", "max_flow_lpm": "15-150 by size", "max_pressure_bar": 400, "weight_kg": "0.6-2.8"}'::jsonb, true, 3830, 'ras3 3웨이 볼 밸브 ras3 3-way ball valves 고압 3웨이 볼 밸브, 1/8~1-1/2, 최대 400bar high pressure 3-way ball valves, 1/8 to 1-1/2, up to 400 bar ras3 (bspp / npt) oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories ball_valve 볼 밸브 ball valve 3 bspp / npt 1/8 - 1-1/2 15-150 by size 400 0.6-2.8')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ras4', 'RAS4 (BSPP / NPT)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RAS4 4웨이 볼 밸브', 'RAS4 4-Way Ball Valves', '고압 4웨이 볼 밸브, 1/4~1-1/2, 최대 500bar', 'High pressure 4-way ball valves, 1/4 to 1-1/2, up to 500 bar', '복동 회로 전환용 고압 4웨이 볼 밸브입니다. BSPP 및 NPT 나사로 1/4~1-1/2 사이즈가 제공되며 최대 유량 25~150l/min, 최대 압력은 사이즈에 따라 350~500bar입니다. B/C 두 가지 회로 스킴과 고정 홀(표준 P)을 지원합니다.', 'High pressure 4-way ball valves for switching double acting circuits. Available in BSPP and NPT threads from 1/4 to 1-1/2, with flows of 25 to 150 l/min and maximum pressures of 350 to 500 bar depending on size. Two circuit schemes (B/C) and fixing holes (standard P).',
  '{"component_type": "ball_valve", "ways": 4, "thread_type": "BSPP / NPT", "size_range": "1/4 - 1-1/2", "max_flow_lpm": "25-150 by size", "max_pressure_bar": 500, "weight_kg": "1.8-9.2"}'::jsonb, true, 3840, 'ras4 4웨이 볼 밸브 ras4 4-way ball valves 고압 4웨이 볼 밸브, 1/4~1-1/2, 최대 500bar high pressure 4-way ball valves, 1/4 to 1-1/2, up to 500 bar ras4 (bspp / npt) oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories ball_valve 볼 밸브 ball valve 4 bspp / npt 1/4 - 1-1/2 25-150 by size 500 1.8-9.2')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-rb-ru', 'RB-RU', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RB-RU 시리즈 니들 밸브', 'RB-RU Series Needle Valve', '나사 삽입형 설치 방식의 니들 밸브로 최대 유량 70 L/min, 최대 압력 350 bar를 지원합니다.', 'Needle Valve with screwed-in installation, rated for flows up to 70 L/min and pressures up to 350 bar.', 'RB-RU은(는) 이탈리아 Oleoweb의 니들 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 70 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 RB, RU 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The RB-RU is a needle valve series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 70 L/min and pressures up to 350 bar. The series includes the RB, RU models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"regulator_type": "needle", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 70, "max_pressure_bar": 350, "variant_codes": "RB, RU"}'::jsonb, true, 3850, 'rb-ru 시리즈 니들 밸브 rb-ru series needle valve 나사 삽입형 설치 방식의 니들 밸브로 최대 유량 70 l/min, 최대 압력 350 bar를 지원합니다. needle valve with screwed-in installation, rated for flows up to 70 l/min and pressures up to 350 bar. rb-ru oleoweb s.r.l. 유량 제어 밸브 flow control valves 350 70 needle 니들형 needle cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in rb, ru')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-rb102', 'RB102', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RB102 SAE10/2 양방향 스로틀 카트리지 밸브', 'RB102 Bidirectional Cartridge Flow Restrictor SAE10/2', 'SAE10/2 캐비티용 양방향 교축(스로틀) 밸브 (70 L/min, 350 bar)', 'Bidirectional flow restrictor for SAE10/2 cavity (70 L/min, 350 bar)', 'RB102는 SAE 10/2 캐비티용 양방향 스로틀(교축) 카트리지 밸브입니다. 스크류(S) 또는 핸드놉(H) 조절 방식과 NBR/Viton 시일을 선택할 수 있으며 최대 유량 70 L/min, 최대 압력 350 bar 사양입니다.', 'The RB102 is a bidirectional throttle (flow restrictor) cartridge for SAE 10/2 cavities. Screw (S) or handknob (H) adjustment with NBR or Viton seals; rated 70 L/min and 350 bar.',
  '{"valve_function": "flow_restrictor", "cavity": "SAE10/2 (7/8-14 UNF)", "max_flow_lpm": 70, "max_pressure_bar": 350, "adjustment": "스크류 또는 핸드놉 (Screw or handknob)", "pilot_ratio": null, "cracking_pressure": null, "seal_material": "NBR / Viton", "controlled_flow_range": "양방향 교축 (Bidirectional throttling)"}'::jsonb, true, 3860, 'rb102 sae10/2 양방향 스로틀 카트리지 밸브 rb102 bidirectional cartridge flow restrictor sae10/2 sae10/2 캐비티용 양방향 교축(스로틀) 밸브 (70 l/min, 350 bar) bidirectional flow restrictor for sae10/2 cavity (70 l/min, 350 bar) rb102 oleoweb s.r.l. 카트리지 밸브 cartridge valves flow_restrictor 스로틀(교축) flow restrictor sae10/2 (7/8-14 unf) 70 350 스크류 또는 핸드놉 (screw or handknob) nbr / viton 양방향 교축 (bidirectional throttling)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-ru102', 'RU102', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'RU102 SAE10/2 단방향 스로틀 카트리지 밸브', 'RU102 Unidirectional Cartridge Flow Restrictor SAE10/2', 'SAE10/2 캐비티용 단방향 교축(스로틀) 밸브 (70 L/min, 350 bar)', 'Unidirectional flow restrictor for SAE10/2 cavity (70 L/min, 350 bar)', 'RU102는 SAE 10/2 캐비티용 단방향 스로틀 카트리지 밸브로, 교축 방향(2→1 또는 1→2)을 선택할 수 있습니다. 스크류(S) 또는 핸드놉(H) 조절 방식과 NBR/Viton 시일을 제공하며 최대 유량 70 L/min, 최대 압력 350 bar 사양입니다.', 'The RU102 is a unidirectional throttle (flow restrictor) cartridge for SAE 10/2 cavities, with selectable restriction direction (2-to-1 or 1-to-2). Screw (S) or handknob (H) adjustment with NBR or Viton seals; rated 70 L/min and 350 bar.',
  '{"valve_function": "flow_restrictor", "cavity": "SAE10/2 (7/8-14 UNF)", "max_flow_lpm": 70, "max_pressure_bar": 350, "adjustment": "스크류 또는 핸드놉 (Screw or handknob)", "pilot_ratio": null, "cracking_pressure": null, "seal_material": "NBR / Viton", "controlled_flow_range": "단방향 교축, 방향 선택형 (Unidirectional, direction selectable)"}'::jsonb, true, 3870, 'ru102 sae10/2 단방향 스로틀 카트리지 밸브 ru102 unidirectional cartridge flow restrictor sae10/2 sae10/2 캐비티용 단방향 교축(스로틀) 밸브 (70 l/min, 350 bar) unidirectional flow restrictor for sae10/2 cavity (70 l/min, 350 bar) ru102 oleoweb s.r.l. 카트리지 밸브 cartridge valves flow_restrictor 스로틀(교축) flow restrictor sae10/2 (7/8-14 unf) 70 350 스크류 또는 핸드놉 (screw or handknob) nbr / viton 단방향 교축, 방향 선택형 (unidirectional, direction selectable)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-s0vbcd', 'S0VBCD', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'S0VBCD 더블 카운터밸런스 밸브 (오픈 센터)', 'S0VBCD Double Counterbalance Valves, Open Center', '단일 블록 바디의 오픈 센터용 더블 카운터밸런스 밸브 (최대 60 L/min)', 'Single-block open-center double counterbalance valve (up to 60 L/min)', 'S0VBCD는 단일 블록 바디에 두 개의 카운터밸런스 카트리지를 통합한 오픈 센터용 더블 카운터밸런스 밸브입니다. BSPP 1/4(30 L/min)·3/8(40 L/min)·1/2(60 L/min) 사이즈, 최대 압력 350 bar이며 스프링 설정 범위 30~210/60~350 bar, 파일럿 비율 1:4.25 또는 1:8.75를 제공합니다.', 'The S0VBCD is an open-center double counterbalance valve integrating two counterbalance elements in a single block body. Sizes BSPP 1/4 (30 L/min), 3/8 (40 L/min) and 1/2 (60 L/min) at 350 bar max pressure, with 30-210/60-350 bar setting ranges and 1:4.25 or 1:8.75 pilot ratios.',
  '{"valve_type": "double_counterbalance", "center_type": "open_center", "mounting": "인라인, 단일 블록 (In-line, single block)", "port_sizes": "BSPP 1/4, 3/8, 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 또는 아연-니켈 도금) (Steel, zinc or zinc-nickel plated)"}'::jsonb, true, 3880, 's0vbcd 더블 카운터밸런스 밸브 (오픈 센터) s0vbcd double counterbalance valves, open center 단일 블록 바디의 오픈 센터용 더블 카운터밸런스 밸브 (최대 60 l/min) single-block open-center double counterbalance valve (up to 60 l/min) s0vbcd oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves double_counterbalance 더블 카운터밸런스 double counterbalance open_center 오픈 센터 open center 인라인, 단일 블록 (in-line, single block) bspp 1/4, 3/8, 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 또는 아연-니켈 도금) (steel, zinc or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-sae-blocks', 'BLOCCHI SAE (SAE8/2, SAE8/3, SAE10/2, SAE10/3, SAE8/3 SHORT)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-manifolds'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SAE 카트리지 밸브 블록', 'SAE Cartridge Valve Blocks', 'SAE8/SAE10 2·3웨이 캐비티 블록, 강철 350bar / 알루미늄 210bar', 'SAE8/SAE10 2- and 3-way cavity blocks, steel 350 bar / aluminium 210 bar', 'SAE8/2, SAE8/3, SAE10/2, SAE10/3 및 SAE8/3 쇼트 캐비티용 밸브 블록 시리즈입니다. 아연 도금 강철(350bar) 또는 흑색 아노다이징 알루미늄(210bar) 재질이며 포트는 BSPP 1/4~1/2입니다. PME6 플랜지 부착형 SAE8/2 블록(62200023)도 제공되어 카트리지 수동 펌프와 조합할 수 있습니다.', 'Valve block series for SAE8/2, SAE8/3, SAE10/2, SAE10/3 and SAE8/3 short cavities. Available in zinc-plated steel (350 bar) or black anodized aluminium (210 bar) with BSPP 1/4 to 1/2 ports. The SAE8/2 block with PME6 flange (62200023) pairs with the cartridge hand pumps.',
  '{"manifold_type": "sae_block", "max_pressure_bar": 350, "material": "aluminium_or_steel", "ports": "BSPP 1/4 / 3/8 / 1/2", "weight_kg": "0.16-0.77"}'::jsonb, true, 3890, 'sae 카트리지 밸브 블록 sae cartridge valve blocks sae8/sae10 2·3웨이 캐비티 블록, 강철 350bar / 알루미늄 210bar sae8/sae10 2- and 3-way cavity blocks, steel 350 bar / aluminium 210 bar blocchi sae (sae8/2, sae8/3, sae10/2, sae10/3, sae8/3 short) oleoweb s.r.l. 매니폴드 / 블록 manifolds / blocks sae_block sae 블록 sae block 350 aluminium_or_steel 알루미늄/강철 aluminium or steel bspp 1/4 / 3/8 / 1/2 0.16-0.77')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-sae8-sae10', 'SAE8 - SAE10', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-manifolds'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SAE8 시리즈 SAE 매니폴드', 'SAE8 Series SAE Manifold', '인라인 설치 방식의 SAE 매니폴드로 최대 유량 70 L/min, 최대 압력 350 bar를 지원합니다.', 'SAE Manifold with in-line installation, rated for flows up to 70 L/min and pressures up to 350 bar.', 'SAE8 - SAE10은(는) 이탈리아 Oleoweb의 SAE 매니폴드 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 70 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 SAE8, SAE10 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The SAE8 - SAE10 is a sae manifold series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 70 L/min and pressures up to 350 bar. The series includes the SAE8, SAE10 models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"base_type": "sae", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 70, "max_pressure_bar": 350, "variant_codes": "SAE8, SAE10"}'::jsonb, true, 3900, 'sae8 시리즈 sae 매니폴드 sae8 series sae manifold 인라인 설치 방식의 sae 매니폴드로 최대 유량 70 l/min, 최대 압력 350 bar를 지원합니다. sae manifold with in-line installation, rated for flows up to 70 l/min and pressures up to 350 bar. sae8 - sae10 oleoweb s.r.l. 매니폴드 / 블록 manifolds / blocks 70 350 sae sae 매니폴드 sae manifolds parts_in_body 바디 일체형 parts in body in_line 인라인 in-line sae8, sae10')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-scf-dcf-dcm-dcv', 'SCF-DCF-DCM-DCV', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pressure-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SCF-DCF-DCM-DCV 안티쇼크 밸브 (바디 일체형)', 'SCF-DCF-DCM-DCV Antishock Valve (Parts in body)', '플랜지형 설치 방식의 안티쇼크 밸브로 최대 유량 40 L/min, 최대 압력 350 bar를 지원합니다.', 'Antishock Valve with flanged installation, rated for flows up to 40 L/min and pressures up to 350 bar.', 'SCF-DCF-DCM-DCV은(는) 이탈리아 Oleoweb의 안티쇼크 밸브 시리즈입니다. 바디 일체형 구조와 플랜지형 설치 방식을 채택하였으며, 최대 유량 40 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 SCF, DCF, DCM, DCV 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The SCF-DCF-DCM-DCV is an antishock valve series from Oleoweb, Italy. It features a parts in body execution with flanged installation, rated for flows up to 40 L/min and pressures up to 350 bar. The series includes the SCF, DCF, DCM, DCV models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"valve_function": "antishock", "execution": "parts_in_body", "installation": "flanged", "max_flow_lpm": 40, "max_pressure_bar": 350, "variant_codes": "SCF, DCF, DCM, DCV"}'::jsonb, true, 3910, 'scf-dcf-dcm-dcv 안티쇼크 밸브 (바디 일체형) scf-dcf-dcm-dcv antishock valve (parts in body) 플랜지형 설치 방식의 안티쇼크 밸브로 최대 유량 40 l/min, 최대 압력 350 bar를 지원합니다. antishock valve with flanged installation, rated for flows up to 40 l/min and pressures up to 350 bar. scf-dcf-dcm-dcv oleoweb s.r.l. 압력 제어 밸브 (릴리프/시퀀스) pressure control valves (relief / sequence) 350 40 antishock antishock antishock parts_in_body 바디 일체형 parts in body flanged 플랜지형 flanged scf, dcf, dcm, dcv')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-scvb', 'SCVB', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SCVB 유압 모터용 싱글 카운터밸런스 밸브 (OMP/OMR)', 'SCVB Single Counterbalance Valve for OMP-OMR Motors, Open Center', 'OMP·OMR 오비탈 모터에 직접 장착하는 오픈 센터용 싱글 카운터밸런스 밸브', 'Open-center single counterbalance valve for direct mounting on OMP/OMR orbital motors', 'SCVB는 OMP·OMR 계열 오비탈(제로터) 유압 모터에 직접 장착하도록 설계된 오픈 센터용 싱글 카운터밸런스 밸브입니다. BSPP 1/2 포트, 최대 유량 60 L/min, 최대 압력 350 bar이며 스프링 설정 범위 30~210 bar 또는 60~350 bar를 제공합니다.', 'The SCVB is a single counterbalance valve for open-center systems designed for direct mounting on OMP/OMR orbital (gerotor) hydraulic motors. BSPP 1/2 ports, 60 L/min max flow and 350 bar max pressure, with 30-210 bar or 60-350 bar spring setting ranges.',
  '{"valve_type": "single_counterbalance", "center_type": "open_center", "mounting": "모터 직결 플랜지 (OMP/OMR motor mounted)", "port_sizes": "BSPP 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 3920, 'scvb 유압 모터용 싱글 카운터밸런스 밸브 (omp/omr) scvb single counterbalance valve for omp-omr motors, open center omp·omr 오비탈 모터에 직접 장착하는 오픈 센터용 싱글 카운터밸런스 밸브 open-center single counterbalance valve for direct mounting on omp/omr orbital motors scvb oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance open_center 오픈 센터 open center 모터 직결 플랜지 (omp/omr motor mounted) bspp 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-sov', 'SOV', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SOV 게이지 아이솔레이터', 'SOV Gauge Isolators', 'Oleoweb 유압 밸브 시스템용 게이지 아이솔레이터입니다.', 'Gauge isolators for Oleoweb hydraulic valve systems.', 'SOV은(는) 이탈리아 Oleoweb의 유압 시스템 액세서리 라인업 중 게이지 아이솔레이터 제품군입니다. Oleoweb 솔레노이드 밸브 및 매니폴드 시스템과 함께 사용되며, 세부 사양은 개별 데이터시트를 참조해야 합니다.', 'SOV is the Gauge isolators range in Oleoweb''s hydraulic accessory line-up. They are used together with Oleoweb solenoid valves and manifold systems; refer to individual datasheets for detailed specifications.',
  '{"component_type": "Gauge isolators"}'::jsonb, true, 3930, 'sov 게이지 아이솔레이터 sov gauge isolators oleoweb 유압 밸브 시스템용 게이지 아이솔레이터입니다. gauge isolators for oleoweb hydraulic valve systems. sov oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories gauge isolators gauge isolators gauge isolators')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-sov1400', 'SOV1400 / SOV1400FF / SOV1400MF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SOV1400 인라인 압력계 차단 밸브', 'SOV1400 In-Line Pressure Gauge Shut-Off Valves', '인라인 게이지 아이솔레이터 콕, BSPP/BSPT 1/4, 400bar', 'In-line gauge isolator cocks, BSPP/BSPT 1/4, 400 bar', '압력계를 회로에서 분리·보호하는 인라인형 차단 밸브(게이지 아이솔레이터)입니다. BSPP 1/4 및 BSPT 1/4 조합의 3가지 포트 구성(SOV1400, FF, MF)이 있으며 최대 압력 400bar, 중량 약 0.15kg입니다.', 'In-line shut-off valves (gauge isolators) that isolate and protect pressure gauges from the circuit. Three port configurations (SOV1400, FF, MF) combining BSPP 1/4 and BSPT 1/4 threads, rated 400 bar, weighing about 0.15 kg.',
  '{"component_type": "gauge_shutoff_valve", "thread_type": "BSPP / BSPT", "size_range": "1/4", "max_pressure_bar": 400, "weight_kg": "0.15"}'::jsonb, true, 3940, 'sov1400 인라인 압력계 차단 밸브 sov1400 in-line pressure gauge shut-off valves 인라인 게이지 아이솔레이터 콕, bspp/bspt 1/4, 400bar in-line gauge isolator cocks, bspp/bspt 1/4, 400 bar sov1400 / sov1400ff / sov1400mf oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories gauge_shutoff_valve 압력계 차단 밸브 gauge shut-off valve bspp / bspt 1/4 400 0.15')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-sov1490', 'SOV1490 / SOV1490FF / SOV1490MF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SOV1490 90° 압력계 차단 밸브', 'SOV1490 90-Degree Pressure Gauge Shut-Off Valves', '90° 게이지 아이솔레이터 콕, BSPP/BSPT 1/4, 400bar', '90-degree gauge isolator cocks, BSPP/BSPT 1/4, 400 bar', '직각 배치용 90° 압력계 차단 밸브(게이지 아이솔레이터)입니다. BSPP 1/4 및 BSPT 1/4 조합의 3가지 포트 구성(SOV1490, FF, MF)이 있으며 최대 압력 400bar, 중량 약 0.15kg입니다.', '90-degree pressure gauge shut-off valves (gauge isolators) for right-angle installation. Three port configurations (SOV1490, FF, MF) combining BSPP 1/4 and BSPT 1/4 threads, rated 400 bar, weighing about 0.15 kg.',
  '{"component_type": "gauge_shutoff_valve", "thread_type": "BSPP / BSPT", "size_range": "1/4", "max_pressure_bar": 400, "weight_kg": "0.15"}'::jsonb, true, 3950, 'sov1490 90° 압력계 차단 밸브 sov1490 90-degree pressure gauge shut-off valves 90° 게이지 아이솔레이터 콕, bspp/bspt 1/4, 400bar 90-degree gauge isolator cocks, bspp/bspt 1/4, 400 bar sov1490 / sov1490ff / sov1490mf oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories gauge_shutoff_valve 압력계 차단 밸브 gauge shut-off valve bspp / bspt 1/4 400 0.15')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-stb', 'STB', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'STB 양방향 유량 제어 밸브 (니들형)', 'STB Bidirectional Flow Control Valve (Needle Type)', '핸드 노브 조절식 양방향 스로틀 밸브, BSPP/NPTF/SAE 1/8"-1 1/2", 최대 400 bar', 'Handknob-adjustable bidirectional throttle valve, BSPP/NPTF/SAE 1/8"-1 1/2", up to 400 bar', '양방향 모두 유량을 교축하는 니들형 스로틀 밸브로 알루미늄 핸드 노브로 조절합니다. BSPP·NPTF 1/8"~1-1/2", SAE 7/16"~1-7/8" 나사, 유량 10~300 L/min, 최대 압력 400 bar(대구경 350 bar)입니다.', 'Needle-type throttle valve restricting flow in both directions, adjusted by an aluminium handknob. BSPP and NPTF 1/8"-1-1/2" and SAE 7/16" to 1-7/8" threads; flows 10-300 L/min at up to 400 bar (350 bar for the largest sizes).',
  '{"max_pressure_bar": 400, "max_flow_lpm": 300, "port_sizes": "1/8\" - 1-1/2\" (SAE 7/16-20UNF - 1-7/8-12UN)", "thread_types": "BSPP, NPTF, SAE UNF/UN", "control_type": "bidirectional", "pressure_compensated": false, "adjustment_type": "handknob", "controlled_flow_range": "10-300 L/min by size", "mounting_style": "in_line"}'::jsonb, true, 3960, 'stb 양방향 유량 제어 밸브 (니들형) stb bidirectional flow control valve (needle type) 핸드 노브 조절식 양방향 스로틀 밸브, bspp/nptf/sae 1/8"-1 1/2", 최대 400 bar handknob-adjustable bidirectional throttle valve, bspp/nptf/sae 1/8"-1 1/2", up to 400 bar stb oleoweb s.r.l. 유량 제어 밸브 flow control valves 400 300 1/8" - 1-1/2" (sae 7/16-20unf - 1-7/8-12un) bspp, nptf, sae unf/un bidirectional 양방향 유량 제어 bidirectional false handknob 핸드 노브 handknob 10-300 l/min by size in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-stbf', 'STBF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'STBF 양방향 유량 제어 밸브 (패널 장착형)', 'STBF Bidirectional Flow Control Valve (Panel Mount)', '패널 장착 나사부를 갖춘 양방향 스로틀 밸브, BSPP/NPTF/SAE, 최대 400 bar', 'Bidirectional throttle valve with panel-mounting thread, BSPP/NPTF/SAE, up to 400 bar', 'STB 양방향 스로틀 밸브에 패널 장착용 나사부(M15x1~M45x1.5)와 옵션 보호 캡을 추가한 버전입니다. BSPP·NPTF 1/8"~1-1/2", SAE 7/16"~1-7/8" 나사, 유량 10~300 L/min, 최대 압력 400 bar(대구경 350 bar)입니다.', 'Version of the STB bidirectional throttle valve with a panel-mounting thread (M15x1 to M45x1.5) and optional protection cap. BSPP and NPTF 1/8"-1-1/2" and SAE 7/16" to 1-7/8" threads; flows 10-300 L/min at up to 400 bar (350 bar for the largest sizes).',
  '{"max_pressure_bar": 400, "max_flow_lpm": 300, "port_sizes": "1/8\" - 1-1/2\" (SAE 7/16-20UNF - 1-7/8-12UN)", "thread_types": "BSPP, NPTF, SAE UNF/UN", "control_type": "bidirectional", "pressure_compensated": false, "adjustment_type": "handknob", "controlled_flow_range": "10-300 L/min by size", "mounting_style": "in_line_panel"}'::jsonb, true, 3970, 'stbf 양방향 유량 제어 밸브 (패널 장착형) stbf bidirectional flow control valve (panel mount) 패널 장착 나사부를 갖춘 양방향 스로틀 밸브, bspp/nptf/sae, 최대 400 bar bidirectional throttle valve with panel-mounting thread, bspp/nptf/sae, up to 400 bar stbf oleoweb s.r.l. 유량 제어 밸브 flow control valves 400 300 1/8" - 1-1/2" (sae 7/16-20unf - 1-7/8-12un) bspp, nptf, sae unf/un bidirectional 양방향 유량 제어 bidirectional false handknob 핸드 노브 handknob 10-300 l/min by size in_line_panel 인라인/패널 장착 in-line / panel mount')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-stu', 'STU', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'STU 단방향 유량 제어 밸브 (니들형)', 'STU Unidirectional Flow Control Valve (Needle Type)', '핸드 노브 조절식 단방향 유량 제어 밸브, BSPP/NPTF/SAE 1/8"-1 1/2", 최대 400 bar', 'Handknob-adjustable unidirectional flow control valve, BSPP/NPTF/SAE 1/8"-1 1/2", up to 400 bar', '알루미늄 핸드 노브로 조절하는 니들형 단방향 유량 제어 밸브로, 역방향은 자유 흐름입니다. BSPP·NPTF 1/8"~1-1/2", SAE 7/16"-20UNF~1-7/8"-12UN 나사에 대응하며 유량 10~300 L/min, 최대 압력 400 bar(대구경 350 bar)입니다. 180/140/380/120 사이즈는 볼 시트 사양입니다.', 'Needle-type unidirectional flow control valve adjusted by an aluminium handknob, with free reverse flow. Available in BSPP and NPTF 1/8"-1-1/2" and SAE 7/16"-20UNF to 1-7/8"-12UN threads; flows 10-300 L/min at up to 400 bar (350 bar for the largest sizes). Ball sealing on sizes 180/140/380/120.',
  '{"max_pressure_bar": 400, "max_flow_lpm": 300, "port_sizes": "1/8\" - 1-1/2\" (SAE 7/16-20UNF - 1-7/8-12UN)", "thread_types": "BSPP, NPTF, SAE UNF/UN", "control_type": "unidirectional", "pressure_compensated": false, "adjustment_type": "handknob", "controlled_flow_range": "10-300 L/min by size", "mounting_style": "in_line"}'::jsonb, true, 3980, 'stu 단방향 유량 제어 밸브 (니들형) stu unidirectional flow control valve (needle type) 핸드 노브 조절식 단방향 유량 제어 밸브, bspp/nptf/sae 1/8"-1 1/2", 최대 400 bar handknob-adjustable unidirectional flow control valve, bspp/nptf/sae 1/8"-1 1/2", up to 400 bar stu oleoweb s.r.l. 유량 제어 밸브 flow control valves 400 300 1/8" - 1-1/2" (sae 7/16-20unf - 1-7/8-12un) bspp, nptf, sae unf/un unidirectional 단방향 유량 제어 unidirectional false handknob 핸드 노브 handknob 10-300 l/min by size in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-stu-stuf-stb-stbf', 'STU - STUF - STB - STBF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'STU 시리즈 니들 밸브', 'STU Series Needle Valve', '인라인 설치 방식의 니들 밸브로 최대 유량 300 L/min, 최대 압력 400 bar를 지원합니다.', 'Needle Valve with in-line installation, rated for flows up to 300 L/min and pressures up to 400 bar.', 'STU - STUF - STB - STBF은(는) 이탈리아 Oleoweb의 니들 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 300 L/min, 최대 압력 400 bar 사양을 갖추고 있습니다. 본 시리즈에는 STU, STUF, STB, STBF 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The STU - STUF - STB - STBF is a needle valve series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 300 L/min and pressures up to 400 bar. The series includes the STU, STUF, STB, STBF models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"regulator_type": "needle", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 300, "max_pressure_bar": 400, "variant_codes": "STU, STUF, STB, STBF"}'::jsonb, true, 3990, 'stu 시리즈 니들 밸브 stu series needle valve 인라인 설치 방식의 니들 밸브로 최대 유량 300 l/min, 최대 압력 400 bar를 지원합니다. needle valve with in-line installation, rated for flows up to 300 l/min and pressures up to 400 bar. stu - stuf - stb - stbf oleoweb s.r.l. 유량 제어 밸브 flow control valves 400 300 needle 니들형 needle parts_in_body 바디 일체형 parts in body in_line 인라인 in-line stu, stuf, stb, stbf')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-stuf', 'STUF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'STUF 단방향 유량 제어 밸브 (패널 장착형)', 'STUF Unidirectional Flow Control Valve (Panel Mount)', '패널 장착 나사부를 갖춘 단방향 유량 제어 밸브, BSPP/NPTF/SAE, 최대 400 bar', 'Unidirectional flow control valve with panel-mounting thread, BSPP/NPTF/SAE, up to 400 bar', 'STU와 동일한 니들형 단방향 유량 제어 밸브에 패널 장착용 나사부(M15x1~M45x1.5)와 옵션 보호 캡을 추가한 버전입니다. BSPP·NPTF 1/8"~1-1/2", SAE 7/16"~1-7/8" 나사, 유량 10~300 L/min, 최대 압력 400 bar(대구경 350 bar)입니다.', 'Version of the STU needle-type unidirectional flow control valve with a panel-mounting thread (M15x1 to M45x1.5) and optional protection cap. BSPP and NPTF 1/8"-1-1/2" and SAE 7/16" to 1-7/8" threads; flows 10-300 L/min at up to 400 bar (350 bar for the largest sizes).',
  '{"max_pressure_bar": 400, "max_flow_lpm": 300, "port_sizes": "1/8\" - 1-1/2\" (SAE 7/16-20UNF - 1-7/8-12UN)", "thread_types": "BSPP, NPTF, SAE UNF/UN", "control_type": "unidirectional", "pressure_compensated": false, "adjustment_type": "handknob", "controlled_flow_range": "10-300 L/min by size", "mounting_style": "in_line_panel"}'::jsonb, true, 4000, 'stuf 단방향 유량 제어 밸브 (패널 장착형) stuf unidirectional flow control valve (panel mount) 패널 장착 나사부를 갖춘 단방향 유량 제어 밸브, bspp/nptf/sae, 최대 400 bar unidirectional flow control valve with panel-mounting thread, bspp/nptf/sae, up to 400 bar stuf oleoweb s.r.l. 유량 제어 밸브 flow control valves 400 300 1/8" - 1-1/2" (sae 7/16-20unf - 1-7/8-12un) bspp, nptf, sae unf/un unidirectional 단방향 유량 제어 unidirectional false handknob 핸드 노브 handknob 10-300 l/min by size in_line_panel 인라인/패널 장착 in-line / panel mount')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-sv', 'SV (SV08 / SV10)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SV 셔틀 밸브 (로드 셔틀)', 'SV Load Shuttle Ball Valves', 'SAE8/SAE10 볼 셔틀 밸브, 최대 30l/min, 350bar', 'SAE8/SAE10 ball-type shuttle valves, up to 30 l/min, 350 bar', '두 입력 중 높은 압력을 선택해 출력하는 볼 타입 셔틀(선택) 카트리지 밸브입니다. SV08(3/4-16UNF, 15l/min)과 SV10(7/8-14UNF, 30l/min) 두 사이즈이며 최대 압력 350bar입니다.', 'Ball-type load shuttle cartridge valves that route the higher of two input pressures to the output. Two sizes: SV08 (3/4-16UNF, 15 l/min) and SV10 (7/8-14UNF, 30 l/min), rated 350 bar.',
  '{"valve_function": "shuttle", "cavity": "SAE8/3 / SAE10/3", "thread": "3/4-16UNF / 7/8-14UNF", "max_flow_lpm": 30, "max_pressure_bar": 350, "tightening_torque_nm": "25-30 (SV08), 41-47 (SV10)", "weight_kg": "0.07-0.10"}'::jsonb, true, 4010, 'sv 셔틀 밸브 (로드 셔틀) sv load shuttle ball valves sae8/sae10 볼 셔틀 밸브, 최대 30l/min, 350bar sae8/sae10 ball-type shuttle valves, up to 30 l/min, 350 bar sv (sv08 / sv10) oleoweb s.r.l. 카트리지 밸브 cartridge valves shuttle shuttle shuttle sae8/3 / sae10/3 30 350 3/4-16unf / 7/8-14unf 25-30 (sv08), 41-47 (sv10) 0.07-0.10')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-t-11a', 'T-11A', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-manifolds'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'T-11A T-캐비티 매니폴드', 'T-11A T-Cavity Manifold', '인라인 설치 방식의 T-캐비티 매니폴드로 최대 유량 60 L/min, 최대 압력 210 bar를 지원합니다.', 'T-Cavity Manifold with in-line installation, rated for flows up to 60 L/min and pressures up to 210 bar.', 'T-11A은(는) 이탈리아 Oleoweb의 T-캐비티 매니폴드 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 60 L/min, 최대 압력 210 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The T-11A is a t-cavity manifold series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 60 L/min and pressures up to 210 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"base_type": "t_cavity", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 60, "max_pressure_bar": 210}'::jsonb, true, 4020, 't-11a t-캐비티 매니폴드 t-11a t-cavity manifold 인라인 설치 방식의 t-캐비티 매니폴드로 최대 유량 60 l/min, 최대 압력 210 bar를 지원합니다. t-cavity manifold with in-line installation, rated for flows up to 60 l/min and pressures up to 210 bar. t-11a oleoweb s.r.l. 매니폴드 / 블록 manifolds / blocks 60 210 t_cavity t-캐비티 매니폴드 t-cavities manifolds parts_in_body 바디 일체형 parts in body in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-tna', 'TNA (TNA1 / TNA2 / TNA3 / TNA5)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-tanks'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'TNA 알루미늄 오일 탱크', 'TNA Aluminium Reservoirs', '수동 펌프용 알루미늄 오일 탱크, 1~5L', 'Aluminium oil reservoirs for hand pumps, 1-5 L', '수동 펌프 조합용 경량 알루미늄 오일 탱크 시리즈입니다. 1/2/3/5L 용량이 있으며 BSPP 1/4 에어 블리딩(브리더) 플러그, 드레인 플러그, 흡입 튜브가 기본 포함됩니다.', 'Lightweight aluminium oil reservoir series for hand pump assemblies. Capacities of 1/2/3/5 litres, supplied with BSPP 1/4 air bleeding plug, drain plug and suction tube.',
  '{"material": "aluminium", "capacity_liters": "1 / 2 / 3 / 5", "included_accessories": "Air bleeding plug (BSPP 1/4), cap, gasket, suction tube", "weight_kg": "1.1-1.8"}'::jsonb, true, 4030, 'tna 알루미늄 오일 탱크 tna aluminium reservoirs 수동 펌프용 알루미늄 오일 탱크, 1~5l aluminium oil reservoirs for hand pumps, 1-5 l tna (tna1 / tna2 / tna3 / tna5) oleoweb s.r.l. 오일 탱크 oil reservoirs aluminium 알루미늄 aluminium 1 / 2 / 3 / 5 air bleeding plug (bspp 1/4), cap, gasket, suction tube 1.1-1.8')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-tnk', 'TNK', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-tanks'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'TNK 강철 오일 탱크', 'TNK Steel Reservoirs', '수동 펌프용 강철 오일 탱크, 1~20L', 'Steel oil reservoirs for hand pumps, 1-20 L', '수동 펌프 조합용 강철 오일 탱크 시리즈입니다. 1/2/3/5/7/10/13/15/20L 용량이 있으며 수평·수직 장착이 모두 가능합니다. RAL9005 내유성 흑색 도장 처리되며 브리더 플러그, 드레인 플러그, 흡입 튜브가 기본 포함됩니다.', 'Steel oil reservoir series for hand pump assemblies. Capacities of 1/2/3/5/7/10/13/15/20 litres with both horizontal and vertical mounting. Finished in RAL9005 oil-proof black paint and supplied with breather plug, drain plug and draft tube.',
  '{"material": "steel", "capacity_liters": "1 / 2 / 3 / 5 / 7 / 10 / 13 / 15 / 20", "mounting": "Horizontal or vertical", "included_accessories": "Breather plug, drain plug, draft tube", "finish": "RAL9005 oil-proof black painting", "weight_kg": "2.2-16"}'::jsonb, true, 4040, 'tnk 강철 오일 탱크 tnk steel reservoirs 수동 펌프용 강철 오일 탱크, 1~20l steel oil reservoirs for hand pumps, 1-20 l tnk oleoweb s.r.l. 오일 탱크 oil reservoirs steel 강철 steel 1 / 2 / 3 / 5 / 7 / 10 / 13 / 15 / 20 horizontal or vertical breather plug, drain plug, draft tube ral9005 oil-proof black painting 2.2-16')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-valve-bodies', 'COR / COS (T-11A, SAE10/3 SHORT bodies)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-manifolds'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '카트리지 밸브 바디 (T-11A / SAE10/3)', 'Cartridge Valve Bodies (T-11A / SAE10/3)', 'T-11A 싱글/더블 캐비티 및 SAE10/3 쇼트 캐비티용 밸브 바디', 'Valve bodies for T-11A single/double cavities and SAE10/3 short cavity', '카트리지 밸브 장착용 라인 바디 시리즈입니다. T-11A 더블 캐비티(크로스 파일럿) 및 싱글 캐비티 알루미늄 바디(SAE08, BSPP 3/8, BSPP 1/2 포트, 210bar)와 SAE10/3 쇼트 캐비티용 강철(350bar)/알루미늄(210bar) 바디가 있습니다.', 'Line-mount body series for cartridge valves. Includes T-11A double-cavity (cross piloted) and single-cavity aluminium bodies (SAE08, BSPP 3/8 or BSPP 1/2 ports, 210 bar) and SAE10/3 short-cavity bodies in steel (350 bar) or aluminium (210 bar).',
  '{"manifold_type": "cartridge_body", "max_pressure_bar": 350, "material": "aluminium_or_steel", "ports": "SAE 08 / BSPP 3/8 / BSPP 1/2", "weight_kg": "0.3-0.44"}'::jsonb, true, 4050, '카트리지 밸브 바디 (t-11a / sae10/3) cartridge valve bodies (t-11a / sae10/3) t-11a 싱글/더블 캐비티 및 sae10/3 쇼트 캐비티용 밸브 바디 valve bodies for t-11a single/double cavities and sae10/3 short cavity cor / cos (t-11a, sae10/3 short bodies) oleoweb s.r.l. 매니폴드 / 블록 manifolds / blocks cartridge_body 카트리지 밸브 바디 cartridge valve body 350 aluminium_or_steel 알루미늄/강철 aluminium or steel sae 08 / bspp 3/8 / bspp 1/2 0.3-0.44')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vara', 'VARA', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-application-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VARA 플라우용 밸브', 'VARA Plough Valve', '인라인 설치 방식의 플라우(쟁기)용 밸브로 최대 유량 40 L/min, 최대 압력 350 bar를 지원합니다.', 'Plough valve with in-line installation, rated for flows up to 40 L/min and pressures up to 350 bar.', 'VARA은(는) 이탈리아 Oleoweb의 플라우(쟁기)용 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 40 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VARA is a plough valve series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 40 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"application": "plough", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 40, "max_pressure_bar": 350}'::jsonb, true, 4060, 'vara 플라우용 밸브 vara plough valve 인라인 설치 방식의 플라우(쟁기)용 밸브로 최대 유량 40 l/min, 최대 압력 350 bar를 지원합니다. plough valve with in-line installation, rated for flows up to 40 l/min and pressures up to 350 bar. vara oleoweb s.r.l. 어플리케이션 전용 밸브 valves for applications plough 플라우(쟁기) plough parts_in_body 바디 일체형 parts in body in_line 인라인 in-line 40 350')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vara01', 'VARA01', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VARA01 무정지 쟁기용 로딩·완충 밸브 블록', 'VARA01 Loading and Anti-Shock Valve Block for No-Stop Ploughs', '노스톱 쟁기·심토파쇄기용 완충 밸브 블록, BSPP 3/8, 350bar', 'Anti-shock valve block for no-stop ploughs and subsoilers, BSPP 3/8, 350 bar', '무정지(no-stop) 쟁기와 심토파쇄기의 하중 유지 및 충격 흡수를 위한 강철 밸브 블록입니다. BSPP 3/8 포트, 최대 유량 40l/min, 최대 압력 350bar이며 고압측 250bar/저압측 80bar로 봉인 설정된 릴리프 밸브가 내장됩니다. 아연 도금(CRII) 표면 처리와 NBR 시일이 표준입니다.', 'Steel valve block for load holding and shock absorption on no-stop ploughs and subsoilers. BSPP 3/8 ports, 40 l/min maximum flow and 350 bar maximum pressure, with factory-sealed relief settings of 250 bar (AP) and 80 bar (BP) at 5 l/min. Zinc-plated (CRII) finish with NBR seals as standard.',
  '{"component_type": "valve_block", "thread_type": "BSPP", "size_range": "BSPP 3/8", "max_flow_lpm": "40", "max_pressure_bar": 350, "weight_kg": "1.8"}'::jsonb, true, 4070, 'vara01 무정지 쟁기용 로딩·완충 밸브 블록 vara01 loading and anti-shock valve block for no-stop ploughs 노스톱 쟁기·심토파쇄기용 완충 밸브 블록, bspp 3/8, 350bar anti-shock valve block for no-stop ploughs and subsoilers, bspp 3/8, 350 bar vara01 oleoweb s.r.l. 유압 부품 / 액세서리 hydraulic components / accessories valve_block 밸브 블록 valve block bspp bspp 3/8 40 350 1.8')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbca', 'VBCA', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCA 볼트 체결형 더블 카운터밸런스 밸브 (오픈 센터)', 'VBCA Bolt-Fitting Double Counterbalance Valve, Open Center', '반조 볼트 장착형 오픈 센터용 더블 카운터밸런스 밸브', 'Banjo-bolt mounted double counterbalance valve for open-center systems', 'VBCA는 반조 볼트로 실린더 양 포트에 직접 장착하는 오픈 센터용 더블 카운터밸런스 밸브입니다. BSPP 3/8 포트, 최대 유량 40 L/min, 최대 압력 350 bar이며 스프링 설정 범위 30~210/60~350 bar, 파일럿 비율 1:4.25 또는 1:8.75를 제공합니다.', 'The VBCA is a bolt-fitting (banjo) double counterbalance valve for open-center systems, mounted directly on both cylinder ports. BSPP 3/8 ports, 40 L/min max flow and 350 bar max pressure, with 30-210/60-350 bar setting ranges and 1:4.25 or 1:8.75 pilot ratios.',
  '{"valve_type": "double_counterbalance", "center_type": "open_center", "mounting": "볼트(반조) 체결 (Bolt/banjo fitting)", "port_sizes": "BSPP 3/8", "max_flow_lpm": 40, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 또는 아연-니켈 도금) (Steel, zinc or zinc-nickel plated)"}'::jsonb, true, 4080, 'vbca 볼트 체결형 더블 카운터밸런스 밸브 (오픈 센터) vbca bolt-fitting double counterbalance valve, open center 반조 볼트 장착형 오픈 센터용 더블 카운터밸런스 밸브 banjo-bolt mounted double counterbalance valve for open-center systems vbca oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves double_counterbalance 더블 카운터밸런스 double counterbalance open_center 오픈 센터 open center 볼트(반조) 체결 (bolt/banjo fitting) bspp 3/8 40 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 또는 아연-니켈 도금) (steel, zinc or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcb', 'VBCB', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCB 볼트 체결형 싱글 카운터밸런스 밸브 (오픈 센터)', 'VBCB Bolt-Fitting Single Counterbalance Valve, Open Center', '실린더에 반조 볼트로 직접 장착하는 오픈 센터용 싱글 카운터밸런스 밸브', 'Banjo-bolt mounted single counterbalance valve for open-center systems', 'VBCB는 반조 볼트로 실린더 포트에 직접 장착하는 오픈 센터용 싱글 카운터밸런스 밸브입니다. BSPP 3/8 포트, 최대 유량 40 L/min, 최대 압력 350 bar 사양이며, 스프링 설정 범위 30~210 bar 또는 60~350 bar, 파일럿 비율 1:4.25(표준) 또는 1:8.75를 선택할 수 있습니다.', 'The VBCB is a bolt-fitting (banjo) single counterbalance valve for open-center systems, mounted directly on the cylinder port. It offers BSPP 3/8 ports, 40 L/min max flow and 350 bar max pressure, with spring setting ranges of 30-210 bar or 60-350 bar and pilot ratios of 1:4.25 (standard) or 1:8.75.',
  '{"valve_type": "single_counterbalance", "center_type": "open_center", "mounting": "볼트(반조) 체결 (Bolt/banjo fitting)", "port_sizes": "BSPP 3/8", "max_flow_lpm": 40, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 또는 아연-니켈 도금) (Steel, zinc or zinc-nickel plated)"}'::jsonb, true, 4090, 'vbcb 볼트 체결형 싱글 카운터밸런스 밸브 (오픈 센터) vbcb bolt-fitting single counterbalance valve, open center 실린더에 반조 볼트로 직접 장착하는 오픈 센터용 싱글 카운터밸런스 밸브 banjo-bolt mounted single counterbalance valve for open-center systems vbcb oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance open_center 오픈 센터 open center 볼트(반조) 체결 (bolt/banjo fitting) bspp 3/8 40 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 또는 아연-니켈 도금) (steel, zinc or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcb-vccb', 'VBCB - VCCB', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCB 시리즈 싱글 오버센터 밸브', 'VBCB Series Single Overcenter Valve', '반조 볼트형 설치 방식의 싱글 오버센터 밸브로 최대 유량 40 L/min, 최대 압력 350 bar를 지원합니다.', 'Single Overcenter Valve with banjo bolt installation, rated for flows up to 40 L/min and pressures up to 350 bar.', 'VBCB - VCCB은(는) 이탈리아 Oleoweb의 싱글 오버센터 밸브 시리즈입니다. 바디 일체형 구조와 반조 볼트형 설치 방식을 채택하였으며, 최대 유량 40 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 VBCB, VCCB 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VBCB - VCCB is a single overcenter valve series from Oleoweb, Italy. It features a parts in body execution with banjo bolt installation, rated for flows up to 40 L/min and pressures up to 350 bar. The series includes the VBCB, VCCB models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"configuration": "single", "execution": "parts_in_body", "installation": "banjo_bolt", "max_flow_lpm": 40, "max_pressure_bar": 350, "variant_codes": "VBCB, VCCB"}'::jsonb, true, 4100, 'vbcb 시리즈 싱글 오버센터 밸브 vbcb series single overcenter valve 반조 볼트형 설치 방식의 싱글 오버센터 밸브로 최대 유량 40 l/min, 최대 압력 350 bar를 지원합니다. single overcenter valve with banjo bolt installation, rated for flows up to 40 l/min and pressures up to 350 bar. vbcb - vccb oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves 40 350 single 싱글 single parts_in_body 바디 일체형 parts in body banjo_bolt 반조 볼트형 banjo bolt vbcb, vccb')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcc', 'VBCC', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCC 더블 카운터밸런스 밸브 (클로즈드 센터)', 'VBCC Double Counterbalance Valves, Closed Center', 'BSPP 및 SAE UNF 포트, 최대 60 L/min의 클로즈드 센터용 더블 카운터밸런스 밸브', 'Closed-center double counterbalance valves with BSPP and SAE UNF ports, up to 60 L/min', 'VBCC는 클로즈드 센터 시스템용 더블 카운터밸런스 밸브입니다. BSPP 1/4·3/8·1/2 및 SAE UNF(7/16-20, 9/16-18, 3/4-16) 포트로 제공되며 사이즈별 최대 30~60 L/min, 350 bar 사양입니다. 스프링 설정 범위 30~210/60~350 bar, 파일럿 비율 1:4.25(표준) 또는 1:8.75를 지원합니다.', 'The VBCC is a double counterbalance valve for closed-center systems. Offered with BSPP 1/4, 3/8 and 1/2 ports and SAE UNF (7/16-20, 9/16-18, 3/4-16) ports, with 30 to 60 L/min max flow depending on size at 350 bar. Setting ranges of 30-210/60-350 bar with 1:4.25 (standard) or 1:8.75 pilot ratios.',
  '{"valve_type": "double_counterbalance", "center_type": "closed_center", "mounting": "인라인 (In-line)", "port_sizes": "BSPP 1/4, 3/8, 1/2 / SAE 7/16-20, 9/16-18, 3/4-16 UNF", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 4110, 'vbcc 더블 카운터밸런스 밸브 (클로즈드 센터) vbcc double counterbalance valves, closed center bspp 및 sae unf 포트, 최대 60 l/min의 클로즈드 센터용 더블 카운터밸런스 밸브 closed-center double counterbalance valves with bspp and sae unf ports, up to 60 l/min vbcc oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves double_counterbalance 더블 카운터밸런스 double counterbalance closed_center 클로즈드 센터 closed center 인라인 (in-line) bspp 1/4, 3/8, 1/2 / sae 7/16-20, 9/16-18, 3/4-16 unf 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcd', 'VBCD', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCD 더블 카운터밸런스 밸브 (오픈 센터)', 'VBCD Double Counterbalance Valves, Open Center', 'BSPP 1/4~1인치 및 SAE UNF 포트, 최대 150 L/min의 오픈 센터용 더블 카운터밸런스 밸브', 'Open-center double counterbalance valves with BSPP 1/4-1 and SAE UNF ports, up to 150 L/min', 'VBCD는 복동 실린더의 양방향 하중 제어를 위한 오픈 센터용 더블 카운터밸런스 밸브입니다. BSPP 1/4·3/8·1/2·3/4·1 및 SAE UNF(7/16-20, 9/16-18, 3/4-16) 포트로 제공되며 사이즈에 따라 최대 30~150 L/min, 350 bar 사양입니다. 스프링 설정 범위 30~210/60~350 bar, 파일럿 비율 1:4.25(표준)·1:8.75, 3/4 사이즈는 1:6.2·1:10.6을 지원합니다.', 'The VBCD is an open-center double counterbalance valve for bidirectional load control of double-acting cylinders. Available with BSPP 1/4, 3/8, 1/2, 3/4 and 1 ports as well as SAE UNF (7/16-20, 9/16-18, 3/4-16), covering 30 to 150 L/min depending on size at 350 bar. Setting ranges of 30-210/60-350 bar; pilot ratios 1:4.25 (standard) and 1:8.75, or 1:6.2 and 1:10.6 for the 3/4 size.',
  '{"valve_type": "double_counterbalance", "center_type": "open_center", "mounting": "인라인 (In-line)", "port_sizes": "BSPP 1/4, 3/8, 1/2, 3/4, 1 / SAE 7/16-20, 9/16-18, 3/4-16 UNF", "max_flow_lpm": 150, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75, 3/4 사이즈: 1:6.2 / 1:10.6", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 또는 아연-니켈 도금) (Steel, zinc or zinc-nickel plated)"}'::jsonb, true, 4120, 'vbcd 더블 카운터밸런스 밸브 (오픈 센터) vbcd double counterbalance valves, open center bspp 1/4~1인치 및 sae unf 포트, 최대 150 l/min의 오픈 센터용 더블 카운터밸런스 밸브 open-center double counterbalance valves with bspp 1/4-1 and sae unf ports, up to 150 l/min vbcd oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves double_counterbalance 더블 카운터밸런스 double counterbalance open_center 오픈 센터 open center 인라인 (in-line) bspp 1/4, 3/8, 1/2, 3/4, 1 / sae 7/16-20, 9/16-18, 3/4-16 unf 150 350 1:4.25 (표준) / 1:8.75, 3/4 사이즈: 1:6.2 / 1:10.6 30-210 bar / 60-350 bar 강(아연 또는 아연-니켈 도금) (steel, zinc or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcd-sovbcd-vbcc-sovbcc', 'VBCD - SOVBCD - VBCC - SOVBCC', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCD 시리즈 더블 오버센터 밸브', 'VBCD Series Double Overcenter Valve', '인라인 설치 방식의 더블 오버센터 밸브로 최대 유량 60 L/min, 최대 압력 350 bar를 지원합니다.', 'Double Overcenter Valve with in-line installation, rated for flows up to 60 L/min and pressures up to 350 bar.', 'VBCD - SOVBCD - VBCC - SOVBCC은(는) 이탈리아 Oleoweb의 더블 오버센터 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 60 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 VBCD, SOVBCD, VBCC, SOVBCC 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VBCD - SOVBCD - VBCC - SOVBCC is a double overcenter valve series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 60 L/min and pressures up to 350 bar. The series includes the VBCD, SOVBCD, VBCC, SOVBCC models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"configuration": "double", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 60, "max_pressure_bar": 350, "variant_codes": "VBCD, SOVBCD, VBCC, SOVBCC"}'::jsonb, true, 4130, 'vbcd 시리즈 더블 오버센터 밸브 vbcd series double overcenter valve 인라인 설치 방식의 더블 오버센터 밸브로 최대 유량 60 l/min, 최대 압력 350 bar를 지원합니다. double overcenter valve with in-line installation, rated for flows up to 60 l/min and pressures up to 350 bar. vbcd - sovbcd - vbcc - sovbcc oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves 60 350 double 더블 double parts_in_body 바디 일체형 parts in body in_line 인라인 in-line vbcd, sovbcd, vbcc, sovbcc')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcf', 'VBCF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCF 플랜지형 더블 카운터밸런스 밸브 (오픈 센터)', 'VBCF Double Counterbalance Valves, Flanged, Open Center', '플랜지 장착형 오픈 센터용 더블 카운터밸런스 밸브 (최대 60 L/min)', 'Flanged open-center double counterbalance valve (up to 60 L/min)', 'VBCF는 실린더에 직접 플랜지 장착하는 오픈 센터용 더블 카운터밸런스 밸브입니다. BSPP 1/4·3/8(40 L/min)·1/2(60 L/min) 사이즈, 최대 압력 350 bar이며 스프링 설정 범위 30~210/60~350 bar, 파일럿 비율 1:4.25 또는 1:8.75를 제공합니다.', 'The VBCF is a flanged double counterbalance valve for open-center systems, mounted directly on the cylinder. Sizes BSPP 1/4 and 3/8 (40 L/min) and 1/2 (60 L/min) at 350 bar max pressure, with 30-210/60-350 bar setting ranges and 1:4.25 or 1:8.75 pilot ratios.',
  '{"valve_type": "double_counterbalance", "center_type": "open_center", "mounting": "플랜지 (Flanged)", "port_sizes": "BSPP 1/4, 3/8, 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 또는 아연-니켈 도금) (Steel, zinc or zinc-nickel plated)"}'::jsonb, true, 4140, 'vbcf 플랜지형 더블 카운터밸런스 밸브 (오픈 센터) vbcf double counterbalance valves, flanged, open center 플랜지 장착형 오픈 센터용 더블 카운터밸런스 밸브 (최대 60 l/min) flanged open-center double counterbalance valve (up to 60 l/min) vbcf oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves double_counterbalance 더블 카운터밸런스 double counterbalance open_center 오픈 센터 open center 플랜지 (flanged) bspp 1/4, 3/8, 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 또는 아연-니켈 도금) (steel, zinc or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcf-vbcfe', 'VBCF - VBCFE', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCF 시리즈 더블 오버센터 밸브', 'VBCF Series Double Overcenter Valve', '플랜지형 설치 방식의 더블 오버센터 밸브로 최대 유량 60 L/min, 최대 압력 350 bar를 지원합니다.', 'Double Overcenter Valve with flanged installation, rated for flows up to 60 L/min and pressures up to 350 bar.', 'VBCF - VBCFE은(는) 이탈리아 Oleoweb의 더블 오버센터 밸브 시리즈입니다. 바디 일체형 구조와 플랜지형 설치 방식을 채택하였으며, 최대 유량 60 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 VBCF, VBCFE 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VBCF - VBCFE is a double overcenter valve series from Oleoweb, Italy. It features a parts in body execution with flanged installation, rated for flows up to 60 L/min and pressures up to 350 bar. The series includes the VBCF, VBCFE models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"configuration": "double", "execution": "parts_in_body", "installation": "flanged", "max_flow_lpm": 60, "max_pressure_bar": 350, "variant_codes": "VBCF, VBCFE"}'::jsonb, true, 4150, 'vbcf 시리즈 더블 오버센터 밸브 vbcf series double overcenter valve 플랜지형 설치 방식의 더블 오버센터 밸브로 최대 유량 60 l/min, 최대 압력 350 bar를 지원합니다. double overcenter valve with flanged installation, rated for flows up to 60 l/min and pressures up to 350 bar. vbcf - vbcfe oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves 60 350 double 더블 double parts_in_body 바디 일체형 parts in body flanged 플랜지형 flanged vbcf, vbcfe')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcfe', 'VBCFE', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCFE 브레이크 해제용 더블 카운터밸런스 밸브', 'VBCFE Double Counterbalance Valve for Brake Release', '브레이크 해제 포트를 통합한 더블 카운터밸런스 밸브 (60 L/min, 350 bar)', 'Double counterbalance valve with integrated brake release port (60 L/min, 350 bar)', 'VBCFE는 유압 모터의 네거티브 브레이크 해제 기능(F 포트)을 통합한 더블 카운터밸런스 밸브입니다. 오픈 센터(세미 보상형)와 클로즈드 센터(비보상형) 버전이 있으며, V1·V2 포트 BSPP 1/2, M1·M2·F 포트 BSPP 1/4 사양입니다. 최대 유량 60 L/min, 최대 압력 350 bar, 파일럿 비율 1:4, 1:8.75, 1:11을 제공합니다.', 'The VBCFE is a double counterbalance valve with integrated brake release (F port) for negative brakes on hydraulic motors. Open-center (semi-compensated) and closed-center (non-compensated) versions are available, with BSPP 1/2 V1/V2 ports and BSPP 1/4 M1/M2/F ports. 60 L/min max flow, 350 bar max pressure, pilot ratios 1:4, 1:8.75 and 1:11.',
  '{"valve_type": "double_counterbalance", "center_type": "open_and_closed", "mounting": "인라인, 브레이크 해제 포트 (In-line, with brake release port)", "port_sizes": "V1/V2: BSPP 1/2, M1/M2/F: BSPP 1/4", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4 / 1:8.75 / 1:11", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 CRIII 또는 아연-니켈 도금) (Steel, zinc CRIII or zinc-nickel plated)"}'::jsonb, true, 4160, 'vbcfe 브레이크 해제용 더블 카운터밸런스 밸브 vbcfe double counterbalance valve for brake release 브레이크 해제 포트를 통합한 더블 카운터밸런스 밸브 (60 l/min, 350 bar) double counterbalance valve with integrated brake release port (60 l/min, 350 bar) vbcfe oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves double_counterbalance 더블 카운터밸런스 double counterbalance open_and_closed 오픈/클로즈드 겸용(버전 선택) open and closed center versions 인라인, 브레이크 해제 포트 (in-line, with brake release port) v1/v2: bspp 1/2, m1/m2/f: bspp 1/4 60 350 1:4 / 1:8.75 / 1:11 30-210 bar / 60-350 bar 강(아연 criii 또는 아연-니켈 도금) (steel, zinc criii or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcl', 'VBCL', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCL 싱글 카운터밸런스 밸브 (오픈 센터)', 'VBCL Single Counterbalance Valves, Open Center', 'BSPP 1/4~3/4 및 SAE UNF 포트, 최대 120 L/min의 오픈 센터용 싱글 카운터밸런스 밸브', 'Open-center single counterbalance valves with BSPP 1/4-3/4 and SAE UNF ports, up to 120 L/min', 'VBCL은 올레오웹의 대표적인 인라인 싱글 카운터밸런스 밸브로 오픈 센터 시스템에 사용됩니다. BSPP 1/4·3/8·1/2·3/4 및 SAE UNF(7/16-20, 9/16-18, 3/4-16) 포트 사이즈로 제공되며 사이즈에 따라 최대 30~120 L/min, 350 bar 사양입니다. 스프링 설정 범위 30~210 bar/60~350 bar, 파일럿 비율 1:4.25(표준)·1:8.75, 3/4 사이즈는 1:6.2·1:10.6을 지원합니다.', 'The VBCL is Oleoweb''s core in-line single counterbalance valve for open-center systems. Available with BSPP 1/4, 3/8, 1/2 and 3/4 ports as well as SAE UNF (7/16-20, 9/16-18, 3/4-16) ports, covering 30 to 120 L/min depending on size at 350 bar max pressure. Spring setting ranges of 30-210 bar and 60-350 bar; pilot ratios 1:4.25 (standard) and 1:8.75, or 1:6.2 and 1:10.6 for the 3/4 size.',
  '{"valve_type": "single_counterbalance", "center_type": "open_center", "mounting": "인라인 (In-line)", "port_sizes": "BSPP 1/4, 3/8, 1/2, 3/4 / SAE 7/16-20, 9/16-18, 3/4-16 UNF", "max_flow_lpm": 120, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75, 3/4 사이즈: 1:6.2 / 1:10.6", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 또는 아연-니켈 도금) (Steel, zinc or zinc-nickel plated)"}'::jsonb, true, 4170, 'vbcl 싱글 카운터밸런스 밸브 (오픈 센터) vbcl single counterbalance valves, open center bspp 1/4~3/4 및 sae unf 포트, 최대 120 l/min의 오픈 센터용 싱글 카운터밸런스 밸브 open-center single counterbalance valves with bspp 1/4-3/4 and sae unf ports, up to 120 l/min vbcl oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance open_center 오픈 센터 open center 인라인 (in-line) bspp 1/4, 3/8, 1/2, 3/4 / sae 7/16-20, 9/16-18, 3/4-16 unf 120 350 1:4.25 (표준) / 1:8.75, 3/4 사이즈: 1:6.2 / 1:10.6 30-210 bar / 60-350 bar 강(아연 또는 아연-니켈 도금) (steel, zinc or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcl-vccl-vblp-vclp-vbcr-vccr-vbfp', 'VBCL - VCCL - VBLP - VCLP - VBCR - VCCR - VBFP', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCL 시리즈 싱글 오버센터 밸브', 'VBCL Series Single Overcenter Valve', '인라인 설치 방식의 싱글 오버센터 밸브로 최대 유량 120 L/min, 최대 압력 350 bar를 지원합니다.', 'Single Overcenter Valve with in-line installation, rated for flows up to 120 L/min and pressures up to 350 bar.', 'VBCL - VCCL - VBLP - VCLP - VBCR - VCCR - VBFP은(는) 이탈리아 Oleoweb의 싱글 오버센터 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 120 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 VBCL, VCCL, VBLP, VCLP, VBCR, VCCR, VBFP 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VBCL - VCCL - VBLP - VCLP - VBCR - VCCR - VBFP is a single overcenter valve series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 120 L/min and pressures up to 350 bar. The series includes the VBCL, VCCL, VBLP, VCLP, VBCR, VCCR, VBFP models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"configuration": "single", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 120, "max_pressure_bar": 350, "variant_codes": "VBCL, VCCL, VBLP, VCLP, VBCR, VCCR, VBFP"}'::jsonb, true, 4180, 'vbcl 시리즈 싱글 오버센터 밸브 vbcl series single overcenter valve 인라인 설치 방식의 싱글 오버센터 밸브로 최대 유량 120 l/min, 최대 압력 350 bar를 지원합니다. single overcenter valve with in-line installation, rated for flows up to 120 l/min and pressures up to 350 bar. vbcl - vccl - vblp - vclp - vbcr - vccr - vbfp oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves 120 350 single 싱글 single parts_in_body 바디 일체형 parts in body in_line 인라인 in-line vbcl, vccl, vblp, vclp, vbcr, vccr, vbfp')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcm', 'VBCM', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCM 플랜지형 더블 카운터밸런스 밸브 (클로즈드 센터)', 'VBCM Double Counterbalance Valves, Flanged, Closed Center', '플랜지 장착형 클로즈드 센터용 더블 카운터밸런스 밸브 (최대 60 L/min)', 'Flanged closed-center double counterbalance valve (up to 60 L/min)', 'VBCM은 클로즈드 센터 시스템용 플랜지 장착 더블 카운터밸런스 밸브입니다. BSPP 1/4·3/8(40 L/min)·1/2(60 L/min) 사이즈, 최대 압력 350 bar이며 스프링 설정 범위 30~210/60~350 bar, 파일럿 비율 1:4.25 또는 1:8.75를 제공합니다.', 'The VBCM is a flanged double counterbalance valve for closed-center systems. Sizes BSPP 1/4 and 3/8 (40 L/min) and 1/2 (60 L/min) at 350 bar max pressure, with 30-210/60-350 bar setting ranges and 1:4.25 or 1:8.75 pilot ratios.',
  '{"valve_type": "double_counterbalance", "center_type": "closed_center", "mounting": "플랜지 (Flanged)", "port_sizes": "BSPP 1/4, 3/8, 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 4190, 'vbcm 플랜지형 더블 카운터밸런스 밸브 (클로즈드 센터) vbcm double counterbalance valves, flanged, closed center 플랜지 장착형 클로즈드 센터용 더블 카운터밸런스 밸브 (최대 60 l/min) flanged closed-center double counterbalance valve (up to 60 l/min) vbcm oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves double_counterbalance 더블 카운터밸런스 double counterbalance closed_center 클로즈드 센터 closed center 플랜지 (flanged) bspp 1/4, 3/8, 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcr', 'VBCR', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCR 외부 파일럿 싱글 카운터밸런스 밸브 (오픈 센터)', 'VBCR Single Counterbalance Valves with External Pilot, Open Center', '외부 파일럿 포트를 갖춘 오픈 센터용 싱글 카운터밸런스 밸브 (최대 60 L/min)', 'Open-center single counterbalance valve with external pilot port (up to 60 L/min)', 'VBCR은 외부 파일럿 라인(P 포트)으로 개방되는 오픈 센터용 싱글 카운터밸런스 밸브입니다. BSPP 1/4·3/8·1/2 사이즈로 최대 30~60 L/min, 350 bar 사양이며 파일럿 비율 1:4.25(표준) 또는 1:8.75, 설정 범위 30~210/60~350 bar를 제공합니다.', 'The VBCR is a single counterbalance valve for open-center systems opened via an external pilot line (P port). Available in BSPP 1/4, 3/8 and 1/2 sizes for 30 to 60 L/min at 350 bar, with 1:4.25 (standard) or 1:8.75 pilot ratios and 30-210/60-350 bar setting ranges.',
  '{"valve_type": "single_counterbalance", "center_type": "open_center", "mounting": "인라인, 외부 파일럿 (In-line, external pilot)", "port_sizes": "BSPP 1/4, 3/8, 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 또는 아연-니켈 도금) (Steel, zinc or zinc-nickel plated)"}'::jsonb, true, 4200, 'vbcr 외부 파일럿 싱글 카운터밸런스 밸브 (오픈 센터) vbcr single counterbalance valves with external pilot, open center 외부 파일럿 포트를 갖춘 오픈 센터용 싱글 카운터밸런스 밸브 (최대 60 l/min) open-center single counterbalance valve with external pilot port (up to 60 l/min) vbcr oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance open_center 오픈 센터 open center 인라인, 외부 파일럿 (in-line, external pilot) bspp 1/4, 3/8, 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 또는 아연-니켈 도금) (steel, zinc or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcs-vbct', 'VBCS - VBCT', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCS 시리즈 더블 오버센터 밸브', 'VBCS Series Double Overcenter Valve', '플랜지형 설치 방식의 더블 오버센터 밸브로 최대 유량 40 L/min, 최대 압력 350 bar를 지원합니다.', 'Double Overcenter Valve with flanged installation, rated for flows up to 40 L/min and pressures up to 350 bar.', 'VBCS - VBCT은(는) 이탈리아 Oleoweb의 더블 오버센터 밸브 시리즈입니다. 바디 일체형 구조와 플랜지형 설치 방식을 채택하였으며, 최대 유량 40 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 VBCS, VBCT 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VBCS - VBCT is a double overcenter valve series from Oleoweb, Italy. It features a parts in body execution with flanged installation, rated for flows up to 40 L/min and pressures up to 350 bar. The series includes the VBCS, VBCT models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"configuration": "double", "execution": "parts_in_body", "installation": "flanged", "max_flow_lpm": 40, "max_pressure_bar": 350, "variant_codes": "VBCS, VBCT"}'::jsonb, true, 4210, 'vbcs 시리즈 더블 오버센터 밸브 vbcs series double overcenter valve 플랜지형 설치 방식의 더블 오버센터 밸브로 최대 유량 40 l/min, 최대 압력 350 bar를 지원합니다. double overcenter valve with flanged installation, rated for flows up to 40 l/min and pressures up to 350 bar. vbcs - vbct oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves 40 350 double 더블 double parts_in_body 바디 일체형 parts in body flanged 플랜지형 flanged vbcs, vbct')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbcs06', 'VBCS06', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCS06 CETOP3 모듈러 더블 카운터밸런스 밸브 (오픈 센터)', 'VBCS06 Double CETOP3 Modular Counterbalance Valve, Open Center', 'CETOP3(NG6) 서브플레이트 적층형 오픈 센터용 더블 카운터밸런스 밸브', 'CETOP3 (NG6) sandwich-mounted double counterbalance valve for open-center systems', 'VBCS06은 CETOP3(NG6) 방향제어밸브 아래에 적층(모듈러)하여 사용하는 오픈 센터용 더블 카운터밸런스 밸브입니다. 최대 유량 40 L/min, 최대 압력 350 bar이며 스프링 설정 범위 30~210/60~350 bar, 파일럿 비율 1:4.25 또는 1:8.75를 제공합니다.', 'The VBCS06 is a double counterbalance valve for open-center systems in CETOP3 (NG6) modular sandwich format, stacked under a directional control valve. 40 L/min max flow and 350 bar max pressure, with 30-210/60-350 bar setting ranges and 1:4.25 or 1:8.75 pilot ratios.',
  '{"valve_type": "double_counterbalance", "center_type": "open_center", "mounting": "CETOP3 모듈러(적층) (CETOP3 modular sandwich)", "port_sizes": "CETOP3 / NG6 인터페이스", "max_flow_lpm": 40, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 4220, 'vbcs06 cetop3 모듈러 더블 카운터밸런스 밸브 (오픈 센터) vbcs06 double cetop3 modular counterbalance valve, open center cetop3(ng6) 서브플레이트 적층형 오픈 센터용 더블 카운터밸런스 밸브 cetop3 (ng6) sandwich-mounted double counterbalance valve for open-center systems vbcs06 oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves double_counterbalance 더블 카운터밸런스 double counterbalance open_center 오픈 센터 open center cetop3 모듈러(적층) (cetop3 modular sandwich) cetop3 / ng6 인터페이스 40 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbct06', 'VBCT06', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBCT06 CETOP3 모듈러 더블 카운터밸런스 밸브 (클로즈드 센터)', 'VBCT06 Double CETOP3 Modular Counterbalance Valve, Closed Center', 'CETOP3(NG6) 적층형 클로즈드 센터용 더블 카운터밸런스 밸브', 'CETOP3 (NG6) sandwich-mounted double counterbalance valve for closed-center systems', 'VBCT06은 클로즈드 센터 시스템용 CETOP3(NG6) 모듈러 더블 카운터밸런스 밸브입니다. 최대 유량 40 L/min, 최대 압력 350 bar이며 스프링 설정 범위 30~210/60~350 bar, 파일럿 비율 1:4.25 또는 1:8.75를 제공합니다.', 'The VBCT06 is a CETOP3 (NG6) modular double counterbalance valve for closed-center systems. 40 L/min max flow and 350 bar max pressure, with 30-210/60-350 bar setting ranges and 1:4.25 or 1:8.75 pilot ratios.',
  '{"valve_type": "double_counterbalance", "center_type": "closed_center", "mounting": "CETOP3 모듈러(적층) (CETOP3 modular sandwich)", "port_sizes": "CETOP3 / NG6 인터페이스", "max_flow_lpm": 40, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 4230, 'vbct06 cetop3 모듈러 더블 카운터밸런스 밸브 (클로즈드 센터) vbct06 double cetop3 modular counterbalance valve, closed center cetop3(ng6) 적층형 클로즈드 센터용 더블 카운터밸런스 밸브 cetop3 (ng6) sandwich-mounted double counterbalance valve for closed-center systems vbct06 oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves double_counterbalance 더블 카운터밸런스 double counterbalance closed_center 클로즈드 센터 closed center cetop3 모듈러(적층) (cetop3 modular sandwich) cetop3 / ng6 인터페이스 40 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbdc', 'VBDC', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-shock-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBDC 안티쇼크 밸브 (더블 크로스 릴리프)', 'VBDC Dual Cross-Line Anti-Shock Valve', '인라인 블록형 더블 크로스 릴리프 밸브, BSPP 3/8"-1/2", 350 bar, 40 L/min', 'In-line block dual cross-line relief valve, BSPP 3/8"-1/2", 350 bar, 40 L/min', '유압 모터 양측 라인의 압력 서지를 상호 릴리프하는 인라인 블록형 더블 크로스 직동 릴리프 밸브입니다. BSPP 3/8"·1/2" 포트, 최대 40 L/min, 350 bar에 대응하며 VMD40S 릴리프 카트리지를 사용합니다. 스프링은 10~90, 20~210, 70~350 bar 3종입니다.', 'In-line block with two crossed direct acting relief valves protecting both lines of a hydraulic motor against pressure shocks. BSPP 3/8" or 1/2" ports, 40 L/min at up to 350 bar, using VMD40S relief cartridges. Three spring ranges: 10-90, 20-210 and 70-350 bar.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 40, "port_sizes": "BSPP 3/8\", 1/2\"", "setting_ranges": "10-90 / 20-210 / 70-350 bar (12 / 33 / 70 bar per turn)", "mounting_style": "in_line", "motor_compatibility": "Generic hydraulic motor circuits", "relief_cartridge": "VMD40S"}'::jsonb, true, 4240, 'vbdc 안티쇼크 밸브 (더블 크로스 릴리프) vbdc dual cross-line anti-shock valve 인라인 블록형 더블 크로스 릴리프 밸브, bspp 3/8"-1/2", 350 bar, 40 l/min in-line block dual cross-line relief valve, bspp 3/8"-1/2", 350 bar, 40 l/min vbdc oleoweb s.r.l. 안티쇼크 밸브 (더블 크로스 릴리프) anti-shock valves (dual cross-line relief) 350 40 bspp 3/8", 1/2" 10-90 / 20-210 / 70-350 bar (12 / 33 / 70 bar per turn) in_line 인라인 블록 in-line block generic hydraulic motor circuits vmd40s')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbf6', 'VBF6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBF6 SAE8 양방향 유량 제어 밸브', 'VBF6 SAE8 Bidirectional Flow Control Valve', 'SAE8 캐비티용 양방향 교축식 유량 제어 밸브 (30 L/min, 350 bar)', 'Bidirectional throttle-type flow control for SAE8 cavity (30 L/min, 350 bar)', 'VBF6은 SAE 8/2 캐비티용 양방향 유량 제어(교축) 밸브 카트리지입니다. 스크류(C) 또는 핸드놉(V) 조절 방식을 선택할 수 있으며 최대 유량 30 L/min, 최대 압력 350 bar 사양입니다.', 'The VBF6 is a bidirectional flow control (throttle) cartridge for SAE 8/2 cavities. Screw (C) or handknob (V) adjustment, rated 30 L/min and 350 bar.',
  '{"valve_function": "flow_control", "cavity": "SAE8/2 (3/4-16 UNF)", "max_flow_lpm": 30, "max_pressure_bar": 350, "adjustment": "스크류 또는 핸드놉 (Screw or handknob)", "pilot_ratio": null, "cracking_pressure": null, "seal_material": null, "controlled_flow_range": "양방향 교축 (Bidirectional throttling)"}'::jsonb, true, 4250, 'vbf6 sae8 양방향 유량 제어 밸브 vbf6 sae8 bidirectional flow control valve sae8 캐비티용 양방향 교축식 유량 제어 밸브 (30 l/min, 350 bar) bidirectional throttle-type flow control for sae8 cavity (30 l/min, 350 bar) vbf6 oleoweb s.r.l. 카트리지 밸브 cartridge valves flow_control 유량 제어 flow control sae8/2 (3/4-16 unf) 30 350 스크류 또는 핸드놉 (screw or handknob) 양방향 교축 (bidirectional throttling)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbf6-vrf6', 'VBF6 - VRF6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBF6 시리즈 니들 밸브', 'VBF6 Series Needle Valve', '나사 삽입형 설치 방식의 니들 밸브로 최대 유량 40 L/min, 최대 압력 350 bar를 지원합니다.', 'Needle Valve with screwed-in installation, rated for flows up to 40 L/min and pressures up to 350 bar.', 'VBF6 - VRF6은(는) 이탈리아 Oleoweb의 니들 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 40 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 VBF6, VRF6 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VBF6 - VRF6 is a needle valve series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 40 L/min and pressures up to 350 bar. The series includes the VBF6, VRF6 models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"regulator_type": "needle", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 40, "max_pressure_bar": 350, "variant_codes": "VBF6, VRF6"}'::jsonb, true, 4260, 'vbf6 시리즈 니들 밸브 vbf6 series needle valve 나사 삽입형 설치 방식의 니들 밸브로 최대 유량 40 l/min, 최대 압력 350 bar를 지원합니다. needle valve with screwed-in installation, rated for flows up to 40 l/min and pressures up to 350 bar. vbf6 - vrf6 oleoweb s.r.l. 유량 제어 밸브 flow control valves 350 40 needle 니들형 needle cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in vbf6, vrf6')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbfp', 'VBFP', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBFP 브레이크 해제 기능 싱글 카운터밸런스 밸브', 'VBFP Single Counterbalance Valve with Brake Un-locking', '브레이크 해제(F) 포트가 통합된 오픈 센터용 싱글 카운터밸런스 밸브', 'Open-center single counterbalance valve with integrated brake release (F) port', 'VBFP는 유압 모터의 네거티브 브레이크 해제 포트(F, BSPP 1/4)를 통합한 오픈 센터용 싱글 카운터밸런스 밸브입니다. BSPP 3/8 포트, 최대 유량 40 L/min, 최대 압력 350 bar이며 파일럿 비율 1:4.25, 설정 범위 30~210/60~350 bar를 제공합니다. 윈치 등 브레이크 부착 모터 구동부에 적합합니다.', 'The VBFP is an open-center single counterbalance valve with an integrated brake release port (F, BSPP 1/4) for negative brakes on hydraulic motors. BSPP 3/8 ports, 40 L/min max flow and 350 bar max pressure, with 1:4.25 pilot ratio and 30-210/60-350 bar setting ranges. Suitable for winches and other brake-equipped motor drives.',
  '{"valve_type": "single_counterbalance", "center_type": "open_center", "mounting": "인라인, 브레이크 해제 포트 (In-line, with brake release port)", "port_sizes": "BSPP 3/8 (F 포트: BSPP 1/4)", "max_flow_lpm": 40, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준)", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 또는 아연-니켈 도금) (Steel, zinc or zinc-nickel plated)"}'::jsonb, true, 4270, 'vbfp 브레이크 해제 기능 싱글 카운터밸런스 밸브 vbfp single counterbalance valve with brake un-locking 브레이크 해제(f) 포트가 통합된 오픈 센터용 싱글 카운터밸런스 밸브 open-center single counterbalance valve with integrated brake release (f) port vbfp oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance open_center 오픈 센터 open center 인라인, 브레이크 해제 포트 (in-line, with brake release port) bspp 3/8 (f 포트: bspp 1/4) 40 350 1:4.25 (표준) 30-210 bar / 60-350 bar 강(아연 또는 아연-니켈 도금) (steel, zinc or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vblf', 'VBLF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBLF 더블 플랜지형 싱글 카운터밸런스 밸브 (오픈 센터)', 'VBLF Single Counterbalance Valves, Double Flanged, Open Center', '양면 플랜지 장착형 오픈 센터용 싱글 카운터밸런스 밸브', 'Double-flanged open-center single counterbalance valve', 'VBLF는 V1·V2 양측을 플랜지 결합하는 더블 플랜지형 싱글 카운터밸런스 밸브(오픈 센터용)입니다. BSPP 3/8(40 L/min)과 BSPP 1/2(60 L/min) 사이즈, 최대 압력 350 bar, 보조 포트 M(BSPP 1/4)을 갖추고 있으며 파일럿 비율 1:4.25 또는 1:8.75를 제공합니다.', 'The VBLF is a double-flanged single counterbalance valve (open center) with flange connections on both V1 and V2 sides. Available in BSPP 3/8 (40 L/min) and BSPP 1/2 (60 L/min) sizes at 350 bar, with an auxiliary M port (BSPP 1/4) and 1:4.25 or 1:8.75 pilot ratios.',
  '{"valve_type": "single_counterbalance", "center_type": "open_center", "mounting": "더블 플랜지 (Double flanged)", "port_sizes": "BSPP 3/8, 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 또는 아연-니켈 도금) (Steel, zinc or zinc-nickel plated)"}'::jsonb, true, 4280, 'vblf 더블 플랜지형 싱글 카운터밸런스 밸브 (오픈 센터) vblf single counterbalance valves, double flanged, open center 양면 플랜지 장착형 오픈 센터용 싱글 카운터밸런스 밸브 double-flanged open-center single counterbalance valve vblf oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance open_center 오픈 센터 open center 더블 플랜지 (double flanged) bspp 3/8, 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 또는 아연-니켈 도금) (steel, zinc or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vblh', 'VBLH', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBLH 싱글 플랜지형 카운터밸런스 밸브 (오픈 센터)', 'VBLH Single Counterbalance Valves, Single Flanged, Open Center', '실린더에 직접 플랜지 장착하는 오픈 센터용 싱글 카운터밸런스 밸브', 'Single-flanged open-center counterbalance valve for direct cylinder mounting', 'VBLH는 V2 포트를 실린더에 직접 플랜지 결합하는 싱글 플랜지형 카운터밸런스 밸브(오픈 센터용)입니다. BSPP 3/8(40 L/min)과 BSPP 1/2(60 L/min) 사이즈, 최대 압력 350 bar, 보조 포트 M(BSPP 1/4)을 갖추고 있으며 파일럿 비율 1:4.25 또는 1:8.75를 제공합니다.', 'The VBLH is a single-flanged counterbalance valve (open center) whose V2 port flanges directly onto the cylinder. Available in BSPP 3/8 (40 L/min) and BSPP 1/2 (60 L/min) sizes at 350 bar, with an auxiliary M port (BSPP 1/4) and 1:4.25 or 1:8.75 pilot ratios.',
  '{"valve_type": "single_counterbalance", "center_type": "open_center", "mounting": "싱글 플랜지 (Single flanged)", "port_sizes": "BSPP 3/8, 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 또는 아연-니켈 도금) (Steel, zinc or zinc-nickel plated)"}'::jsonb, true, 4290, 'vblh 싱글 플랜지형 카운터밸런스 밸브 (오픈 센터) vblh single counterbalance valves, single flanged, open center 실린더에 직접 플랜지 장착하는 오픈 센터용 싱글 카운터밸런스 밸브 single-flanged open-center counterbalance valve for direct cylinder mounting vblh oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance open_center 오픈 센터 open center 싱글 플랜지 (single flanged) bspp 3/8, 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 또는 아연-니켈 도금) (steel, zinc or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vblh-vclh-vblf-vclf', 'VBLH - VCLH - VBLF - VCLF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBLH 시리즈 싱글 오버센터 밸브', 'VBLH Series Single Overcenter Valve', '플랜지형 설치 방식의 싱글 오버센터 밸브로 최대 유량 60 L/min, 최대 압력 350 bar를 지원합니다.', 'Single Overcenter Valve with flanged installation, rated for flows up to 60 L/min and pressures up to 350 bar.', 'VBLH - VCLH - VBLF - VCLF은(는) 이탈리아 Oleoweb의 싱글 오버센터 밸브 시리즈입니다. 바디 일체형 구조와 플랜지형 설치 방식을 채택하였으며, 최대 유량 60 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 VBLH, VCLH, VBLF, VCLF 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VBLH - VCLH - VBLF - VCLF is a single overcenter valve series from Oleoweb, Italy. It features a parts in body execution with flanged installation, rated for flows up to 60 L/min and pressures up to 350 bar. The series includes the VBLH, VCLH, VBLF, VCLF models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"configuration": "single", "execution": "parts_in_body", "installation": "flanged", "max_flow_lpm": 60, "max_pressure_bar": 350, "variant_codes": "VBLH, VCLH, VBLF, VCLF"}'::jsonb, true, 4300, 'vblh 시리즈 싱글 오버센터 밸브 vblh series single overcenter valve 플랜지형 설치 방식의 싱글 오버센터 밸브로 최대 유량 60 l/min, 최대 압력 350 bar를 지원합니다. single overcenter valve with flanged installation, rated for flows up to 60 l/min and pressures up to 350 bar. vblh - vclh - vblf - vclf oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves 60 350 single 싱글 single parts_in_body 바디 일체형 parts in body flanged 플랜지형 flanged vblh, vclh, vblf, vclf')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vblp', 'VBLP', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBLP 싱글 카운터밸런스 밸브 (오픈 센터)', 'VBLP Single Counterbalance Valves, Open Center', '게이지 포트가 있는 오픈 센터용 인라인 싱글 카운터밸런스 밸브 (최대 60 L/min)', 'In-line open-center single counterbalance valve with auxiliary port (up to 60 L/min)', 'VBLP는 오픈 센터 시스템용 인라인 싱글 카운터밸런스 밸브로, 1/2 사이즈에는 보조 포트(M, BSPP 1/4)가 마련되어 있습니다. BSPP 3/8(40 L/min)과 BSPP 1/2(60 L/min) 두 가지 사이즈, 최대 압력 350 bar이며 파일럿 비율 1:4.25(표준) 또는 1:8.75, 설정 범위 30~210/60~350 bar를 제공합니다.', 'The VBLP is an in-line single counterbalance valve for open-center systems; the 1/2 size includes an auxiliary port (M, BSPP 1/4). Two sizes are available, BSPP 3/8 (40 L/min) and BSPP 1/2 (60 L/min), rated 350 bar, with 1:4.25 (standard) or 1:8.75 pilot ratios and 30-210/60-350 bar setting ranges.',
  '{"valve_type": "single_counterbalance", "center_type": "open_center", "mounting": "인라인 (In-line)", "port_sizes": "BSPP 3/8, 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 또는 아연-니켈 도금) (Steel, zinc or zinc-nickel plated)"}'::jsonb, true, 4310, 'vblp 싱글 카운터밸런스 밸브 (오픈 센터) vblp single counterbalance valves, open center 게이지 포트가 있는 오픈 센터용 인라인 싱글 카운터밸런스 밸브 (최대 60 l/min) in-line open-center single counterbalance valve with auxiliary port (up to 60 l/min) vblp oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance open_center 오픈 센터 open center 인라인 (in-line) bspp 3/8, 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 또는 아연-니켈 도금) (steel, zinc or zinc-nickel plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vbrf', 'VBRF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VBRF 양방향 유량 제어 밸브', 'VBRF Bidirectional Flow Control Valve', '양방향 유량 제어 밸브, BSPP 1/8"-1 1/4", 최대 350 bar', 'Bidirectional flow control valve, BSPP 1/8"-1 1/4", up to 350 bar', '양방향 모두 유량을 교축하는 인라인 유량 제어 밸브입니다. BSPP 1/8"~1-1/4" 7개 사이즈, 유량 5~200 L/min, 최대 압력 350 bar(3/4"는 300, 1" 이상은 250 bar)로 VURF와 동일한 치수 계열입니다.', 'In-line flow control valve throttling flow in both directions. Seven sizes BSPP 1/8" to 1-1/4" cover 5-200 L/min; max pressure 350 bar (300 bar for 3/4", 250 bar for 1" and 1-1/4"), sharing dimensions with the VURF series.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 200, "port_sizes": "BSPP 1/8\", 1/4\", 3/8\", 1/2\", 3/4\", 1\", 1-1/4\"", "thread_types": "BSPP", "control_type": "bidirectional", "pressure_compensated": false, "adjustment_type": "handknob", "controlled_flow_range": "5-200 L/min by size", "mounting_style": "in_line"}'::jsonb, true, 4320, 'vbrf 양방향 유량 제어 밸브 vbrf bidirectional flow control valve 양방향 유량 제어 밸브, bspp 1/8"-1 1/4", 최대 350 bar bidirectional flow control valve, bspp 1/8"-1 1/4", up to 350 bar vbrf oleoweb s.r.l. 유량 제어 밸브 flow control valves 350 200 bspp 1/8", 1/4", 3/8", 1/2", 3/4", 1", 1-1/4" bspp bidirectional 양방향 유량 제어 bidirectional false handknob 핸드 노브 handknob 5-200 l/min by size in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vcc', 'VCC140 / VCC380 / VCC120', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VCC 하강 제어 밸브 (고정형 압력 보상)', 'VCC Fixed Lowering Control Valve (Pressure Compensated)', '고정 유량 압력 보상형 하강 속도 제어 인서트 밸브, BSPP 1/4"-1/2", 250 bar', 'Fixed pressure-compensated lowering speed control insert valve, BSPP 1/4"-1/2", 250 bar', '액추에이터 하강 속도를 부하 압력과 무관하게 일정하게 유지하는 고정형 압력 보상 인서트 밸브입니다. VCC140(BSPP 1/4", 1~15 L/min), VCC380(BSPP 3/8", 1~18 L/min), VCC120(BSPP 1/2", 9~47 L/min) 시리즈로 구성되며 최대 250 bar에서 사용합니다. 제어 유량은 100 bar 기준 ±10% 공차로 공장 설정되며, 인라인 하우징 블록이 별도 제공됩니다.', 'Fixed pressure-compensated insert valves that keep actuator lowering speed constant regardless of load pressure. The family comprises VCC140 (BSPP 1/4", 1-15 L/min), VCC380 (BSPP 3/8", 1-18 L/min) and VCC120 (BSPP 1/2", 9-47 L/min), all rated to 250 bar. Controlled flow is factory set at 100 bar with ±10% tolerance; in-line housing blocks are available.',
  '{"max_pressure_bar": 250, "max_flow_lpm": 47, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\" (cavity)", "thread_types": "BSPP", "control_type": "fixed_compensated", "pressure_compensated": true, "adjustment_type": "fixed", "controlled_flow_range": "1-47 L/min at 100 bar (±10%), by series and code", "mounting_style": "insert"}'::jsonb, true, 4330, 'vcc 하강 제어 밸브 (고정형 압력 보상) vcc fixed lowering control valve (pressure compensated) 고정 유량 압력 보상형 하강 속도 제어 인서트 밸브, bspp 1/4"-1/2", 250 bar fixed pressure-compensated lowering speed control insert valve, bspp 1/4"-1/2", 250 bar vcc140 / vcc380 / vcc120 oleoweb s.r.l. 유량 제어 밸브 flow control valves 250 47 bspp 1/4", 3/8", 1/2" (cavity) bspp fixed_compensated 고정형 압력 보상 fixed, pressure compensated true fixed 고정(공장 설정) fixed 1-47 l/min at 100 bar (±10%), by series and code insert 인서트(카트리지) insert (cartridge)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vcc-vscr', 'VCC - VSCR', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VCC 시리즈 압력 보상형 유량 조절 밸브', 'VCC Series Compensated Flow Control Valve', '나사 삽입형 설치 방식의 압력 보상형 유량 조절 밸브로 최대 유량 47 L/min, 최대 압력 250 bar를 지원합니다.', 'Compensated Flow Control Valve with screwed-in installation, rated for flows up to 47 L/min and pressures up to 250 bar.', 'VCC - VSCR은(는) 이탈리아 Oleoweb의 압력 보상형 유량 조절 밸브 시리즈입니다. 인서트 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 47 L/min, 최대 압력 250 bar 사양을 갖추고 있습니다. 본 시리즈에는 VCC, VSCR 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VCC - VSCR is a compensated flow control valve series from Oleoweb, Italy. It features a insert execution with screwed-in installation, rated for flows up to 47 L/min and pressures up to 250 bar. The series includes the VCC, VSCR models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"regulator_type": "compensated", "execution": "insert", "installation": "screwed_in", "max_flow_lpm": 47, "max_pressure_bar": 250, "variant_codes": "VCC, VSCR"}'::jsonb, true, 4340, 'vcc 시리즈 압력 보상형 유량 조절 밸브 vcc series compensated flow control valve 나사 삽입형 설치 방식의 압력 보상형 유량 조절 밸브로 최대 유량 47 l/min, 최대 압력 250 bar를 지원합니다. compensated flow control valve with screwed-in installation, rated for flows up to 47 l/min and pressures up to 250 bar. vcc - vscr oleoweb s.r.l. 유량 제어 밸브 flow control valves 250 47 compensated 압력 보상형 compensated insert 인서트 insert screwed_in 나사 삽입형 screwed-in vcc, vscr')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vccb', 'VCCB', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VCCB 볼트 체결형 싱글 카운터밸런스 밸브 (클로즈드 센터)', 'VCCB Bolt-Fitting Single Counterbalance Valve, Closed Center', '클로즈드 센터 시스템용 반조 볼트 장착 싱글 카운터밸런스 밸브', 'Banjo-bolt mounted single counterbalance valve for closed-center systems', 'VCCB는 클로즈드 센터 시스템용 볼트(반조) 체결형 싱글 카운터밸런스 밸브입니다. BSPP 3/8 포트, 최대 유량 40 L/min, 최대 압력 350 bar이며 스프링 설정 범위 30~210 bar 또는 60~350 bar, 파일럿 비율 1:4.25 또는 1:8.75를 제공합니다.', 'The VCCB is a bolt-fitting (banjo) single counterbalance valve for closed-center systems. BSPP 3/8 ports, 40 L/min max flow and 350 bar max pressure, with 30-210 bar or 60-350 bar spring setting ranges and 1:4.25 or 1:8.75 pilot ratios.',
  '{"valve_type": "single_counterbalance", "center_type": "closed_center", "mounting": "볼트(반조) 체결 (Bolt/banjo fitting)", "port_sizes": "BSPP 3/8", "max_flow_lpm": 40, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 4350, 'vccb 볼트 체결형 싱글 카운터밸런스 밸브 (클로즈드 센터) vccb bolt-fitting single counterbalance valve, closed center 클로즈드 센터 시스템용 반조 볼트 장착 싱글 카운터밸런스 밸브 banjo-bolt mounted single counterbalance valve for closed-center systems vccb oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance closed_center 클로즈드 센터 closed center 볼트(반조) 체결 (bolt/banjo fitting) bspp 3/8 40 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vccl', 'VCCL', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VCCL 싱글 카운터밸런스 밸브 (클로즈드 센터)', 'VCCL Single Counterbalance Valves, Closed Center', 'BSPP 및 SAE UNF 포트, 최대 60 L/min의 클로즈드 센터용 싱글 카운터밸런스 밸브', 'Closed-center single counterbalance valves with BSPP and SAE UNF ports, up to 60 L/min', 'VCCL은 클로즈드 센터 시스템용 인라인 싱글 카운터밸런스 밸브입니다. BSPP 1/4·3/8·1/2 및 SAE UNF(7/16-20, 9/16-18, 3/4-16) 포트로 제공되며 사이즈별 최대 30~60 L/min, 350 bar 사양입니다. 스프링 설정 범위 30~210 bar/60~350 bar, 파일럿 비율 1:4.25(표준) 또는 1:8.75를 지원합니다.', 'The VCCL is an in-line single counterbalance valve for closed-center systems. Offered with BSPP 1/4, 3/8 and 1/2 ports and SAE UNF (7/16-20, 9/16-18, 3/4-16) ports, with 30 to 60 L/min max flow depending on size and 350 bar max pressure. Setting ranges of 30-210 bar and 60-350 bar with 1:4.25 (standard) or 1:8.75 pilot ratios.',
  '{"valve_type": "single_counterbalance", "center_type": "closed_center", "mounting": "인라인 (In-line)", "port_sizes": "BSPP 1/4, 3/8, 1/2 / SAE 7/16-20, 9/16-18, 3/4-16 UNF", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 4360, 'vccl 싱글 카운터밸런스 밸브 (클로즈드 센터) vccl single counterbalance valves, closed center bspp 및 sae unf 포트, 최대 60 l/min의 클로즈드 센터용 싱글 카운터밸런스 밸브 closed-center single counterbalance valves with bspp and sae unf ports, up to 60 l/min vccl oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance closed_center 클로즈드 센터 closed center 인라인 (in-line) bspp 1/4, 3/8, 1/2 / sae 7/16-20, 9/16-18, 3/4-16 unf 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vccr', 'VCCR', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VCCR 외부 파일럿 싱글 카운터밸런스 밸브 (클로즈드 센터)', 'VCCR Single Counterbalance Valves with External Pilot, Closed Center', '외부 파일럿 포트를 갖춘 클로즈드 센터용 싱글 카운터밸런스 밸브 (최대 60 L/min)', 'Closed-center single counterbalance valve with external pilot port (up to 60 L/min)', 'VCCR은 외부 파일럿 라인으로 작동하는 클로즈드 센터용 싱글 카운터밸런스 밸브입니다. BSPP 1/4·3/8·1/2 사이즈로 최대 30~60 L/min, 350 bar 사양이며 파일럿 비율 1:4.25(표준) 또는 1:8.75를 제공합니다.', 'The VCCR is a single counterbalance valve for closed-center systems operated by an external pilot line. Available in BSPP 1/4, 3/8 and 1/2 sizes for 30 to 60 L/min at 350 bar, with 1:4.25 (standard) or 1:8.75 pilot ratios.',
  '{"valve_type": "single_counterbalance", "center_type": "closed_center", "mounting": "인라인, 외부 파일럿 (In-line, external pilot)", "port_sizes": "BSPP 1/4, 3/8, 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 4370, 'vccr 외부 파일럿 싱글 카운터밸런스 밸브 (클로즈드 센터) vccr single counterbalance valves with external pilot, closed center 외부 파일럿 포트를 갖춘 클로즈드 센터용 싱글 카운터밸런스 밸브 (최대 60 l/min) closed-center single counterbalance valve with external pilot port (up to 60 l/min) vccr oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance closed_center 클로즈드 센터 closed center 인라인, 외부 파일럿 (in-line, external pilot) bspp 1/4, 3/8, 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vcf6', 'VCF6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VCF6 SAE8 가변형 압력 보상 유량 제어 밸브', 'VCF6 SAE8 Adjustable Flow Control Valve, Pressure Compensated', '0.6~18 L/min 조절 가능한 SAE8 압력 보상형 유량 제어 밸브', 'SAE8 pressure-compensated adjustable flow control, 0.6-18 L/min', 'VCF6은 SAE 8/2 캐비티용 가변형 압력 보상 유량 제어 밸브 카트리지입니다. 100 bar 기준 제어 유량 범위 0.6~2.2에서 7.2~18 L/min까지 7개 레인지를 제공하며 스크류(C) 또는 핸드놉(V) 조절 방식을 선택합니다. 최대 유량 18 L/min, 최대 압력 350 bar 사양입니다.', 'The VCF6 is an adjustable, pressure-compensated flow control cartridge for SAE 8/2 cavities. Seven controlled-flow ranges from 0.6-2.2 up to 7.2-18 L/min (±10% at 100 bar), with screw (C) or handknob (V) adjustment. 18 L/min max flow and 350 bar max pressure.',
  '{"valve_function": "flow_control", "cavity": "SAE8/2 (3/4-16 UNF)", "max_flow_lpm": 18, "max_pressure_bar": 350, "adjustment": "스크류 또는 핸드놉 (Screw or handknob)", "pilot_ratio": null, "cracking_pressure": null, "seal_material": null, "controlled_flow_range": "0.6-2.2 ~ 7.2-18 L/min (7개 레인지, 100 bar 기준)"}'::jsonb, true, 4380, 'vcf6 sae8 가변형 압력 보상 유량 제어 밸브 vcf6 sae8 adjustable flow control valve, pressure compensated 0.6~18 l/min 조절 가능한 sae8 압력 보상형 유량 제어 밸브 sae8 pressure-compensated adjustable flow control, 0.6-18 l/min vcf6 oleoweb s.r.l. 카트리지 밸브 cartridge valves flow_control 유량 제어 flow control sae8/2 (3/4-16 unf) 18 350 스크류 또는 핸드놉 (screw or handknob) 0.6-2.2 ~ 7.2-18 l/min (7개 레인지, 100 bar 기준)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vclf', 'VCLF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VCLF 더블 플랜지형 싱글 카운터밸런스 밸브 (클로즈드 센터)', 'VCLF Single Counterbalance Valves, Flanged, Closed Center', '클로즈드 센터 시스템용 플랜지 장착 싱글 카운터밸런스 밸브', 'Flanged single counterbalance valve for closed-center systems', 'VCLF는 클로즈드 센터 시스템용 플랜지 장착 싱글 카운터밸런스 밸브입니다. BSPP 3/8(40 L/min)과 BSPP 1/2(60 L/min) 사이즈, 최대 압력 350 bar이며 파일럿 비율 1:4.25 또는 1:8.75, 설정 범위 30~210/60~350 bar를 제공합니다.', 'The VCLF is a flanged single counterbalance valve for closed-center systems. Available in BSPP 3/8 (40 L/min) and BSPP 1/2 (60 L/min) sizes at 350 bar max pressure, with 1:4.25 or 1:8.75 pilot ratios and 30-210/60-350 bar setting ranges.',
  '{"valve_type": "single_counterbalance", "center_type": "closed_center", "mounting": "더블 플랜지 (Double flanged)", "port_sizes": "BSPP 3/8, 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 4390, 'vclf 더블 플랜지형 싱글 카운터밸런스 밸브 (클로즈드 센터) vclf single counterbalance valves, flanged, closed center 클로즈드 센터 시스템용 플랜지 장착 싱글 카운터밸런스 밸브 flanged single counterbalance valve for closed-center systems vclf oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance closed_center 클로즈드 센터 closed center 더블 플랜지 (double flanged) bspp 3/8, 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vclh', 'VCLH', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VCLH 싱글 플랜지형 카운터밸런스 밸브 (클로즈드 센터)', 'VCLH Single Counterbalance Valves, Single Flanged, Closed Center', '클로즈드 센터 시스템용 싱글 플랜지형 카운터밸런스 밸브', 'Single-flanged counterbalance valve for closed-center systems', 'VCLH는 클로즈드 센터 시스템용 싱글 플랜지형 카운터밸런스 밸브입니다. BSPP 3/8(40 L/min)과 BSPP 1/2(60 L/min) 사이즈, 최대 압력 350 bar이며 파일럿 비율 1:4.25 또는 1:8.75, 설정 범위 30~210/60~350 bar를 제공합니다.', 'The VCLH is a single-flanged counterbalance valve for closed-center systems. Available in BSPP 3/8 (40 L/min) and BSPP 1/2 (60 L/min) sizes at 350 bar max pressure, with 1:4.25 or 1:8.75 pilot ratios and 30-210/60-350 bar setting ranges.',
  '{"valve_type": "single_counterbalance", "center_type": "closed_center", "mounting": "싱글 플랜지 (Single flanged)", "port_sizes": "BSPP 3/8, 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 4400, 'vclh 싱글 플랜지형 카운터밸런스 밸브 (클로즈드 센터) vclh single counterbalance valves, single flanged, closed center 클로즈드 센터 시스템용 싱글 플랜지형 카운터밸런스 밸브 single-flanged counterbalance valve for closed-center systems vclh oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance closed_center 클로즈드 센터 closed center 싱글 플랜지 (single flanged) bspp 3/8, 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vclp', 'VCLP', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-balancing-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VCLP 싱글 카운터밸런스 밸브 (클로즈드 센터)', 'VCLP Single Counterbalance Valves, Closed Center', '클로즈드 센터 시스템용 인라인 싱글 카운터밸런스 밸브 (최대 60 L/min)', 'In-line closed-center single counterbalance valve (up to 60 L/min)', 'VCLP는 클로즈드 센터 시스템용 인라인 싱글 카운터밸런스 밸브입니다. BSPP 3/8(40 L/min)과 BSPP 1/2(60 L/min) 사이즈, 최대 압력 350 bar이며 파일럿 비율 1:4.25(표준) 또는 1:8.75, 설정 범위 30~210/60~350 bar를 제공합니다.', 'The VCLP is an in-line single counterbalance valve for closed-center systems. Available in BSPP 3/8 (40 L/min) and BSPP 1/2 (60 L/min) sizes at 350 bar max pressure, with 1:4.25 (standard) or 1:8.75 pilot ratios and 30-210/60-350 bar setting ranges.',
  '{"valve_type": "single_counterbalance", "center_type": "closed_center", "mounting": "인라인 (In-line)", "port_sizes": "BSPP 3/8, 1/2", "max_flow_lpm": 60, "max_pressure_bar": 350, "pilot_ratio": "1:4.25 (표준) / 1:8.75", "setting_range": "30-210 bar / 60-350 bar", "body_material": "강(아연 도금) (Steel, zinc plated)"}'::jsonb, true, 4410, 'vclp 싱글 카운터밸런스 밸브 (클로즈드 센터) vclp single counterbalance valves, closed center 클로즈드 센터 시스템용 인라인 싱글 카운터밸런스 밸브 (최대 60 l/min) in-line closed-center single counterbalance valve (up to 60 l/min) vclp oleoweb s.r.l. 밸런싱/카운터밸런스 밸브 counterbalance / balancing valves single_counterbalance 싱글 카운터밸런스 single counterbalance closed_center 클로즈드 센터 closed center 인라인 (in-line) bspp 3/8, 1/2 60 350 1:4.25 (표준) / 1:8.75 30-210 bar / 60-350 bar 강(아연 도금) (steel, zinc plated)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vdrf', 'VDRF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VDRF 유량 분배/합류 밸브', 'VDRF Flow Divider/Combiner', '나사 삽입형 설치 방식의 유량 분배/합류 밸브로 최대 유량 40 L/min, 최대 압력 350 bar를 지원합니다.', 'Flow Divider/Combiner with screwed-in installation, rated for flows up to 40 L/min and pressures up to 350 bar.', 'VDRF은(는) 이탈리아 Oleoweb의 유량 분배/합류 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 40 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VDRF is a flow divider/combiner series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 40 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"regulator_type": "divider_combiner", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 40, "max_pressure_bar": 350}'::jsonb, true, 4420, 'vdrf 유량 분배/합류 밸브 vdrf flow divider/combiner 나사 삽입형 설치 방식의 유량 분배/합류 밸브로 최대 유량 40 l/min, 최대 압력 350 bar를 지원합니다. flow divider/combiner with screwed-in installation, rated for flows up to 40 l/min and pressures up to 350 bar. vdrf oleoweb s.r.l. 유량 제어 밸브 flow control valves 350 40 divider_combiner 유량 분배/합류 flow divider/combiner cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vdrf10', 'VDRF10', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VDRF10 SAE10 유량 분배/합류 카트리지 밸브', 'VDRF10 SAE10 Cartridge Flow Divider/Combiner', 'SAE10/4 캐비티용 유량 분배·합류 밸브 (입력 유량 2~40 L/min)', 'Flow divider/combiner for SAE10/4 cavity (inlet flow 2-40 L/min)', 'VDRF10은 SAE 10/4 캐비티용 유량 분배/합류(디바이더-컴바이너) 카트리지 밸브로, 두 액추에이터에 유량을 균등 분배하거나 합류시킵니다. 입력 유량 범위 2~5, 3~10, 7~20, 15~40 L/min의 4가지 사양이 있으며 최대 유량 40 L/min, 최대 압력 350 bar입니다.', 'The VDRF10 is a flow divider/combiner cartridge for SAE 10/4 cavities, splitting or recombining flow equally between two actuators. Four inlet flow ranges are available (2-5, 3-10, 7-20 and 15-40 L/min), with 40 L/min max flow and 350 bar max pressure.',
  '{"valve_function": "flow_divider_combiner", "cavity": "SAE10/4 (7/8-14 UNF)", "max_flow_lpm": 40, "max_pressure_bar": 350, "adjustment": "고정형 (입력 유량 레인지 선택)", "pilot_ratio": null, "cracking_pressure": null, "seal_material": null, "controlled_flow_range": "입력 유량 2-5 / 3-10 / 7-20 / 15-40 L/min"}'::jsonb, true, 4430, 'vdrf10 sae10 유량 분배/합류 카트리지 밸브 vdrf10 sae10 cartridge flow divider/combiner sae10/4 캐비티용 유량 분배·합류 밸브 (입력 유량 2~40 l/min) flow divider/combiner for sae10/4 cavity (inlet flow 2-40 l/min) vdrf10 oleoweb s.r.l. 카트리지 밸브 cartridge valves flow_divider_combiner 유량 분배/합류 flow divider/combiner sae10/4 (7/8-14 unf) 40 350 고정형 (입력 유량 레인지 선택) 입력 유량 2-5 / 3-10 / 7-20 / 15-40 l/min')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vem', 'VEM (VEM6 / VEM10)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VEM 수동 비상 밸브', 'VEM Manual Emergency Valves', 'SAE8/SAE10 카트리지 수동 비상 밸브, 최대 50l/min, 320bar', 'SAE8/SAE10 cartridge manual emergency valves, up to 50 l/min, 320 bar', '수동 노브 조작으로 회로를 개방·차단하는 비상용 카트리지 밸브입니다. VEM6(3/4-16UNF, 30l/min)과 VEM10(7/8-14UNF, 50l/min) 두 사이즈가 있으며 최대 압력은 320bar입니다. 최대 누유량 0.25cc/min(5방울/min)의 우수한 기밀성을 갖습니다.', 'Manually operated cartridge emergency valves that open or block the circuit via a hand knob. Two sizes: VEM6 (3/4-16UNF, 30 l/min) and VEM10 (7/8-14UNF, 50 l/min), rated 320 bar. Maximum leakage is only 0.25 cc/min (5 drops/min).',
  '{"valve_function": "manual_emergency", "cavity": "SAE8/2 / SAE10/2", "thread": "3/4-16UNF-2A / 7/8-14UNF-2A", "max_flow_lpm": 50, "max_pressure_bar": 320, "adjustment": "Manual knob", "tightening_torque_nm": "25-30 (VEM6), 41-47 (VEM10)", "weight_kg": "0.12-0.20"}'::jsonb, true, 4440, 'vem 수동 비상 밸브 vem manual emergency valves sae8/sae10 카트리지 수동 비상 밸브, 최대 50l/min, 320bar sae8/sae10 cartridge manual emergency valves, up to 50 l/min, 320 bar vem (vem6 / vem10) oleoweb s.r.l. 카트리지 밸브 cartridge valves manual_emergency manual_emergency manual_emergency sae8/2 / sae10/2 50 320 manual knob 3/4-16unf-2a / 7/8-14unf-2a 25-30 (vem6), 41-47 (vem10) 0.12-0.20')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vmd', 'VMD', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pressure-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VMD 릴리프 밸브 (카트리지)', 'VMD Pressure Relief Valve (Cartridge)', '나사 삽입형 설치 방식의 릴리프 밸브로 최대 유량 120 L/min, 최대 압력 350 bar를 지원합니다.', 'Pressure Relief Valve with screwed-in installation, rated for flows up to 120 L/min and pressures up to 350 bar.', 'VMD은(는) 이탈리아 Oleoweb의 릴리프 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 120 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VMD is a pressure relief valve series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 120 L/min and pressures up to 350 bar. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"valve_function": "pressure_relief", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 120, "max_pressure_bar": 350}'::jsonb, true, 4450, 'vmd 릴리프 밸브 (카트리지) vmd pressure relief valve (cartridge) 나사 삽입형 설치 방식의 릴리프 밸브로 최대 유량 120 l/min, 최대 압력 350 bar를 지원합니다. pressure relief valve with screwed-in installation, rated for flows up to 120 l/min and pressures up to 350 bar. vmd oleoweb s.r.l. 압력 제어 밸브 (릴리프/시퀀스) pressure control valves (relief / sequence) 350 120 pressure_relief pressure_relief pressure_relief cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vmd10', 'VMD10', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VMD10 SAE 8 직동식 릴리프 밸브', 'VMD10 SAE8 Direct Acting Pressure Relief Valve', 'SAE8 직동식 릴리프 밸브(핸드노브 옵션), 20l/min, 350bar', 'SAE8 direct acting relief valve with handknob option, 20 l/min, 350 bar', 'SAE8/2 캐비티용 직동식 릴리프 밸브로 육각 렌치(C, 봉인 캡 옵션) 또는 핸드노브(V) 조정 방식을 선택할 수 있습니다. 최대 유량 20l/min, 최대 압력 350bar이며 4종 스프링으로 10~350bar 범위를 커버합니다.', 'Direct acting relief valve for the SAE8/2 cavity available with hex socket screw adjustment (C, tamper-proof cap option) or handknob (V). Maximum flow 20 l/min, maximum pressure 350 bar, four spring ranges covering 10 to 350 bar.',
  '{"valve_function": "pressure_relief", "cavity": "SAE8/2", "thread": "3/4-16UNF-2A", "max_flow_lpm": 20, "max_pressure_bar": 350, "setting_range_bar": "10-40 / 20-110 / 30-210 / 40-350", "adjustment": "Hex socket screw (C) or handknob (V)", "tightening_torque_nm": "25-30", "weight_kg": "0.14"}'::jsonb, true, 4460, 'vmd10 sae 8 직동식 릴리프 밸브 vmd10 sae8 direct acting pressure relief valve sae8 직동식 릴리프 밸브(핸드노브 옵션), 20l/min, 350bar sae8 direct acting relief valve with handknob option, 20 l/min, 350 bar vmd10 oleoweb s.r.l. 카트리지 밸브 cartridge valves pressure_relief pressure_relief pressure_relief sae8/2 20 350 hex socket screw (c) or handknob (v) 3/4-16unf-2a 10-40 / 20-110 / 30-210 / 40-350 25-30 0.14')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vmd120', 'VMD120', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VMD120 M28x1.5 직동식 릴리프 밸브', 'VMD120 M28x1.5 Direct Acting Pressure Relief Valve', 'M28x1.5 직동식 릴리프 밸브, 120l/min, 350bar', 'M28x1.5 direct acting relief valve, 120 l/min, 350 bar', 'M28x1.5 캐비티(C2815/2)용 대유량 직동식 릴리프 밸브입니다. 최대 유량 120l/min, 최대 압력 350bar이며 3종 스프링(10~100, 20~250, 40~350bar)을 제공합니다. 렌치(C) 또는 핸드노브(V) 조정 방식이 있습니다.', 'High-flow direct acting relief valve for the M28x1.5 cavity (C2815/2). Maximum flow 120 l/min, maximum pressure 350 bar, with three spring ranges (10-100, 20-250, 40-350 bar). Hex screw (C) or handknob (V) adjustment.',
  '{"valve_function": "pressure_relief", "cavity": "C2815/2", "thread": "M28x1.5", "max_flow_lpm": 120, "max_pressure_bar": 350, "setting_range_bar": "10-100 / 20-250 / 40-350", "adjustment": "Hex socket screw (C) or handknob (V)", "tightening_torque_nm": "60-65", "weight_kg": "0.32"}'::jsonb, true, 4470, 'vmd120 m28x1.5 직동식 릴리프 밸브 vmd120 m28x1.5 direct acting pressure relief valve m28x1.5 직동식 릴리프 밸브, 120l/min, 350bar m28x1.5 direct acting relief valve, 120 l/min, 350 bar vmd120 oleoweb s.r.l. 카트리지 밸브 cartridge valves pressure_relief pressure_relief pressure_relief c2815/2 120 350 hex socket screw (c) or handknob (v) m28x1.5 10-100 / 20-250 / 40-350 60-65 0.32')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vmd160', 'VMD160', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VMD160 차등 면적 직동식 릴리프 밸브', 'VMD160 Direct Acting Differential Area Relief Valve', 'SAE12 차등 면적 릴리프 밸브, 160l/min, 380bar', 'SAE12 differential area relief valve, 160 l/min, 380 bar', '차등 면적 구조로 대유량에서도 안정적인 특성을 갖는 직동식 릴리프 밸브입니다. SAE12/2 캐비티(1-1/16-12 UN)용으로 최대 유량 160l/min, 최대 압력 380bar입니다. 3종 스프링(10~120, 100~250, 190~350bar)을 제공합니다.', 'Direct acting relief valve with differential area design for stable characteristics at high flow. Fits the SAE12/2 cavity (1-1/16-12 UN), rated 160 l/min and 380 bar. Three spring ranges (10-120, 100-250, 190-350 bar).',
  '{"valve_function": "pressure_relief", "cavity": "SAE12/2", "thread": "1-1/16-12UN-2A", "max_flow_lpm": 160, "max_pressure_bar": 380, "setting_range_bar": "10-120 / 100-250 / 190-350", "adjustment": "Hex socket screw (C) or handknob (V)", "tightening_torque_nm": "60-65", "weight_kg": "0.35"}'::jsonb, true, 4480, 'vmd160 차등 면적 직동식 릴리프 밸브 vmd160 direct acting differential area relief valve sae12 차등 면적 릴리프 밸브, 160l/min, 380bar sae12 differential area relief valve, 160 l/min, 380 bar vmd160 oleoweb s.r.l. 카트리지 밸브 cartridge valves pressure_relief pressure_relief pressure_relief sae12/2 160 380 hex socket screw (c) or handknob (v) 1-1/16-12un-2a 10-120 / 100-250 / 190-350 60-65 0.35')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vmd1n', 'VMD1N', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VMD1N SAE 8 직동식 릴리프 밸브', 'VMD1N SAE8 Direct Acting Pressure Relief Valve', 'SAE8 직동식 릴리프 밸브, 20l/min, 최대 350bar', 'SAE8 direct acting relief valve, 20 l/min, up to 350 bar', 'SAE8/2 캐비티용 직동식 압력 릴리프 카트리지 밸브입니다. 최대 유량 20l/min, 최대 압력 350bar이며 4종의 스프링(10~40, 20~110, 30~210, 40~350bar)으로 설정 범위를 선택합니다. 육각 렌치 조정식이며 세이프티 캡 옵션이 있습니다.', 'Direct acting pressure relief cartridge valve for the SAE8/2 cavity. Maximum flow 20 l/min, maximum pressure 350 bar, with four spring ranges (10-40, 20-110, 30-210, 40-350 bar). Hex-key adjustment with an optional safety cap.',
  '{"valve_function": "pressure_relief", "cavity": "SAE8/2", "thread": "3/4-16UNF-2A", "max_flow_lpm": 20, "max_pressure_bar": 350, "setting_range_bar": "10-40 / 20-110 / 30-210 / 40-350", "adjustment": "Hex socket screw (safety cap option)", "tightening_torque_nm": "25-30", "weight_kg": "0.11"}'::jsonb, true, 4490, 'vmd1n sae 8 직동식 릴리프 밸브 vmd1n sae8 direct acting pressure relief valve sae8 직동식 릴리프 밸브, 20l/min, 최대 350bar sae8 direct acting relief valve, 20 l/min, up to 350 bar vmd1n oleoweb s.r.l. 카트리지 밸브 cartridge valves pressure_relief pressure_relief pressure_relief sae8/2 20 350 hex socket screw (safety cap option) 3/4-16unf-2a 10-40 / 20-110 / 30-210 / 40-350 25-30 0.11')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vmd30', 'VMD30', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VMD30 M20x1.5 직동식 릴리프 밸브', 'VMD30 M20x1.5 Direct Acting Pressure Relief Valve', 'M20x1.5 직동식 릴리프 밸브, 30l/min, 320bar', 'M20x1.5 direct acting relief valve, 30 l/min, 320 bar', 'M20x1.5 미터나사 캐비티(C2015/30)용 직동식 릴리프 밸브입니다. 최대 유량 30l/min, 최대 압력 320bar이며 3종 스프링(10~90, 20~210, 70~350bar)으로 설정합니다. 렌치(C) 또는 핸드노브(V) 조정 방식이 있습니다.', 'Direct acting relief valve for the M20x1.5 metric cavity (C2015/30). Maximum flow 30 l/min, maximum pressure 320 bar, with three spring ranges (10-90, 20-210, 70-350 bar). Hex screw (C) or handknob (V) adjustment.',
  '{"valve_function": "pressure_relief", "cavity": "C2015/30", "thread": "M20x1.5", "max_flow_lpm": 30, "max_pressure_bar": 320, "setting_range_bar": "10-90 / 20-210 / 70-350", "adjustment": "Hex socket screw (C) or handknob (V)", "tightening_torque_nm": "25-30", "weight_kg": "0.16"}'::jsonb, true, 4500, 'vmd30 m20x1.5 직동식 릴리프 밸브 vmd30 m20x1.5 direct acting pressure relief valve m20x1.5 직동식 릴리프 밸브, 30l/min, 320bar m20x1.5 direct acting relief valve, 30 l/min, 320 bar vmd30 oleoweb s.r.l. 카트리지 밸브 cartridge valves pressure_relief pressure_relief pressure_relief c2015/30 30 320 hex socket screw (c) or handknob (v) m20x1.5 10-90 / 20-210 / 70-350 25-30 0.16')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vmd40s', 'VMD40S', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VMD40S M20x1.5 직동식 릴리프 밸브', 'VMD40S M20x1.5 Direct Acting Pressure Relief Valve', 'M20x1.5 직동식 릴리프 밸브, 40l/min, 350bar', 'M20x1.5 direct acting relief valve, 40 l/min, 350 bar', 'M20x1.5/M14x1.5 이중 나사 구조(C2015/1415/2 캐비티)의 직동식 릴리프 밸브입니다. 최대 유량 40l/min, 최대 압력 350bar이며 BS3/BP3/BM 매니폴드 시리즈에 표준 장착되는 밸브입니다. 3종 스프링(10~90, 20~210, 70~350bar)과 전용 설치 공구(61700008)가 제공됩니다.', 'Direct acting relief valve with M20x1.5/M14x1.5 double thread (cavity C2015/1415/2). Maximum flow 40 l/min, maximum pressure 350 bar; it is the standard relief valve of the BS3/BP3/BM manifold series. Three spring ranges (10-90, 20-210, 70-350 bar) and a dedicated installation tool (61700008).',
  '{"valve_function": "pressure_relief", "cavity": "C2015/1415/2", "thread": "M20x1.5 / M14x1.5", "max_flow_lpm": 40, "max_pressure_bar": 350, "setting_range_bar": "10-90 / 20-210 / 70-350", "adjustment": "Hex socket screw (C) or handknob (V)", "tightening_torque_nm": "M20 40-45, M14 10-15", "weight_kg": "0.13"}'::jsonb, true, 4510, 'vmd40s m20x1.5 직동식 릴리프 밸브 vmd40s m20x1.5 direct acting pressure relief valve m20x1.5 직동식 릴리프 밸브, 40l/min, 350bar m20x1.5 direct acting relief valve, 40 l/min, 350 bar vmd40s oleoweb s.r.l. 카트리지 밸브 cartridge valves pressure_relief pressure_relief pressure_relief c2015/1415/2 40 350 hex socket screw (c) or handknob (v) m20x1.5 / m14x1.5 10-90 / 20-210 / 70-350 m20 40-45, m14 10-15 0.13')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vmd8', 'VMD8', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VMD8 SAE 10 직동식 릴리프 밸브', 'VMD8 SAE10 Direct Acting Pressure Relief Valve', 'SAE10 직동식 릴리프 밸브, 40l/min, 최대 350bar', 'SAE10 direct acting relief valve, 40 l/min, up to 350 bar', 'SAE10/2 캐비티(7/8-14UNF-2A)용 직동식 릴리프 밸브입니다. 최대 유량 40l/min, 최대 압력 350bar이며 3종 스프링(10~90, 20~210, 70~350bar)을 제공합니다. 렌치 조정(C) 또는 핸드노브(V) 방식을 선택할 수 있습니다.', 'Direct acting relief valve for the SAE10/2 cavity (7/8-14UNF-2A). Maximum flow 40 l/min, maximum pressure 350 bar, with three spring ranges (10-90, 20-210, 70-350 bar). Available with hex screw (C) or handknob (V) adjustment.',
  '{"valve_function": "pressure_relief", "cavity": "SAE10/2", "thread": "7/8-14UNF-2A", "max_flow_lpm": 40, "max_pressure_bar": 350, "setting_range_bar": "10-90 / 20-210 / 70-350", "adjustment": "Hex socket screw (C) or handknob (V)", "tightening_torque_nm": "41-47", "weight_kg": "0.17"}'::jsonb, true, 4520, 'vmd8 sae 10 직동식 릴리프 밸브 vmd8 sae10 direct acting pressure relief valve sae10 직동식 릴리프 밸브, 40l/min, 최대 350bar sae10 direct acting relief valve, 40 l/min, up to 350 bar vmd8 oleoweb s.r.l. 카트리지 밸브 cartridge valves pressure_relief pressure_relief pressure_relief sae10/2 40 350 hex socket screw (c) or handknob (v) 7/8-14unf-2a 10-90 / 20-210 / 70-350 41-47 0.17')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vmd90', 'VMD90', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VMD90 M24x1.5 직동식 릴리프 밸브', 'VMD90 M24x1.5 Direct Acting Pressure Relief Valve', 'M24x1.5 직동식 릴리프 밸브, 80l/min, 350bar', 'M24x1.5 direct acting relief valve, 80 l/min, 350 bar', 'M24x1.5 캐비티(C2415/2)용 직동식 릴리프 밸브로 최대 유량 80l/min, 최대 압력 350bar입니다. 3종 스프링(10~90, 20~210, 50~350bar)을 제공하며 BS5 CETOP5 매니폴드에 표준 장착됩니다.', 'Direct acting relief valve for the M24x1.5 cavity (C2415/2), rated 80 l/min and 350 bar. Three spring ranges (10-90, 20-210, 50-350 bar); it is the standard relief valve of the BS5 CETOP5 manifold.',
  '{"valve_function": "pressure_relief", "cavity": "C2415/2", "thread": "M24x1.5", "max_flow_lpm": 80, "max_pressure_bar": 350, "setting_range_bar": "10-90 / 20-210 / 50-350", "adjustment": "Hex socket screw (C) or handknob (V)", "tightening_torque_nm": "60-65", "weight_kg": "0.25"}'::jsonb, true, 4530, 'vmd90 m24x1.5 직동식 릴리프 밸브 vmd90 m24x1.5 direct acting pressure relief valve m24x1.5 직동식 릴리프 밸브, 80l/min, 350bar m24x1.5 direct acting relief valve, 80 l/min, 350 bar vmd90 oleoweb s.r.l. 카트리지 밸브 cartridge valves pressure_relief pressure_relief pressure_relief c2415/2 80 350 hex socket screw (c) or handknob (v) m24x1.5 10-90 / 20-210 / 50-350 60-65 0.25')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vmdr', 'VMDR40 / VMDR90 / VMDR120', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pressure-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VMDR 인라인 직동 릴리프 밸브', 'VMDR In-line Direct Acting Relief Valve', '인라인 직동형 릴리프 밸브, BSPP 3/8"-1", 350 bar, 40-120 L/min', 'In-line direct acting pressure relief valve, BSPP 3/8"-1", 350 bar, 40-120 L/min', '회로 최대 압력을 제한하는 인라인 직동형 릴리프 밸브 시리즈입니다. VMDR40(BSPP 3/8"·1/2", 40 L/min), VMDR90(1/2"·3/4", 80 L/min), VMDR120(3/4"·1", 120 L/min)으로 구성되며 최대 350 bar에서 사용합니다. 스크류(C) 또는 핸드 노브(V) 조절 방식과 최대 350 bar까지의 3종 스프링을 선택할 수 있습니다.', 'In-line direct acting relief valve series limiting maximum circuit pressure. Comprises VMDR40 (BSPP 3/8"/1/2", 40 L/min), VMDR90 (1/2"/3/4", 80 L/min) and VMDR120 (3/4"/1", 120 L/min), rated to 350 bar. Screw (C) or handknob (V) adjustment with three spring ranges up to 350 bar.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 120, "port_sizes": "BSPP 3/8\", 1/2\", 3/4\", 1\" (by series)", "thread_types": "BSPP", "valve_function": "relief", "setting_ranges": "VMDR40: 10-90/20-210/70-350 bar; VMDR90: 10-100/20-250/50-350 bar; VMDR120: 10-100/20-250/40-350 bar", "adjustment_type": "screw_or_handknob"}'::jsonb, true, 4540, 'vmdr 인라인 직동 릴리프 밸브 vmdr in-line direct acting relief valve 인라인 직동형 릴리프 밸브, bspp 3/8"-1", 350 bar, 40-120 l/min in-line direct acting pressure relief valve, bspp 3/8"-1", 350 bar, 40-120 l/min vmdr40 / vmdr90 / vmdr120 oleoweb s.r.l. 압력 제어 밸브 (릴리프/시퀀스) pressure control valves (relief / sequence) 350 120 bspp 3/8", 1/2", 3/4", 1" (by series) bspp relief 릴리프 relief vmdr40: 10-90/20-210/70-350 bar; vmdr90: 10-100/20-250/50-350 bar; vmdr120: 10-100/20-250/40-350 bar screw_or_handknob 스크류/핸드 노브 선택 screw or handknob')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vmf', 'VMF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VMF 체크 밸브 (M/F 인라인형)', 'VMF Check Valve (M/F In-line Housing)', '수/암 인라인 체크 밸브, BSPP 1/4"-1", 최대 400 bar, 15-150 L/min', 'Male/female in-line check valve, BSPP 1/4"-1", up to 400 bar, 15-150 L/min', '한쪽 수나사, 한쪽 암나사(M/F) 구조로 포트에 직접 체결하는 인라인 체크 밸브입니다. BSPP 1/4"~1" 5개 사이즈로 15~150 L/min, 최대 400 bar(1"은 350 bar)에 대응합니다. 볼 시트(1/4"~1/2", 0.5 bar 스프링) 또는 포핏 시트를 선택할 수 있으며 스프링 0.5/3/4.5/6/10 bar, 교축 오리피스 -H 버전이 제공됩니다.', 'In-line check valve with male/female ends that screws directly into a port. Five sizes BSPP 1/4" to 1" handle 15-150 L/min at up to 400 bar (350 bar for 1"). Ball sealing (1/4"-1/2" with 0.5 bar spring) or poppet sealing; spring options 0.5/3/4.5/6/10 bar and a -H restriction-hole version are available.',
  '{"max_pressure_bar": 400, "max_flow_lpm": 150, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\", 3/4\", 1\"", "thread_types": "BSPP", "sealing_type": "ball_or_poppet", "cracking_pressure": "0.5 bar std; 3 / 4.5 / 6 / 10 bar options", "mounting_style": "in_line", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4550, 'vmf 체크 밸브 (m/f 인라인형) vmf check valve (m/f in-line housing) 수/암 인라인 체크 밸브, bspp 1/4"-1", 최대 400 bar, 15-150 l/min male/female in-line check valve, bspp 1/4"-1", up to 400 bar, 15-150 l/min vmf oleoweb s.r.l. 체크 밸브 check valves 150 400 bspp 1/4", 3/8", 1/2", 3/4", 1" bspp ball_or_poppet 볼/포핏 선택 ball or poppet 0.5 bar std; 3 / 4.5 / 6 / 10 bar options in_line 인라인 in-line 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vpn6', 'VPN6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VPN6 SAE 8 공압 작동 밸브', 'VPN6 SAE 8 Pneumatic Valve', '공압 파일럿 작동식 SAE8 카트리지 밸브, 30l/min, 350bar', 'Air-piloted SAE8 cartridge valve, 30 l/min, 350 bar', '공압 파일럿(4~15bar)으로 개폐하는 SAE8/2 캐비티용 2웨이 카트리지 밸브입니다. 최대 유량 30l/min, 최대 압력 350bar이며 파일럿 포트는 BSPP 1/4입니다. 원격 공압 신호로 유압 회로를 제어할 때 사용합니다.', 'Two-way cartridge valve for the SAE8/2 cavity, opened and closed by an air pilot signal (4-15 bar). Maximum flow 30 l/min, maximum pressure 350 bar, pilot port BSPP 1/4. Used to control hydraulic circuits with a remote pneumatic signal.',
  '{"valve_function": "pneumatic", "cavity": "SAE8/2", "thread": "3/4-16UNF-2A", "max_flow_lpm": 30, "max_pressure_bar": 350, "setting_range_bar": "Pilot pressure 4-15", "tightening_torque_nm": "25-30", "weight_kg": "0.16"}'::jsonb, true, 4560, 'vpn6 sae 8 공압 작동 밸브 vpn6 sae 8 pneumatic valve 공압 파일럿 작동식 sae8 카트리지 밸브, 30l/min, 350bar air-piloted sae8 cartridge valve, 30 l/min, 350 bar vpn6 oleoweb s.r.l. 카트리지 밸브 cartridge valves pneumatic pneumatic pneumatic sae8/2 30 350 3/4-16unf-2a pilot pressure 4-15 25-30 0.16')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vpp', 'VPP', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VPP 3웨이 유량 레귤레이터 (잉여 유량 가압 회로)', 'VPP 3-Way Flow Regulator (Excess Flow to Pressure)', '잉여 유량을 2차 가압 회로로 보내는 3웨이 압력 보상 유량 레귤레이터, BSPP 3/8"-3/4", 250 bar', '3-way pressure-compensated flow regulator with excess flow to a pressure line, BSPP 3/8"-3/4", 250 bar', '설정 유량을 우선 회로로 보내고 잉여 유량을 탱크가 아닌 2차 가압 회로(E 포트)로 보내는 3웨이 압력 보상형 유량 레귤레이터입니다. BSPP 3/8"~3/4" 3개 사이즈로 최대 250 bar, 유량 50~150 L/min에 대응합니다. 릴리프 밸브와 전기식 언로더 밸브(12/24 VDC, 220 VRAC 코일)를 조합한 VPP-RV 버전이 제공됩니다.', '3-way pressure-compensated flow regulator delivering the set flow to the priority circuit while routing excess flow to a secondary pressure line (port E) instead of tank. Three sizes BSPP 3/8" to 3/4" rated 250 bar with flows of 50-150 L/min. The VPP-RV variant adds a relief valve and an electrical unloader valve (12/24 VDC or 220 VRAC coils).',
  '{"max_pressure_bar": 250, "max_flow_lpm": 150, "port_sizes": "BSPP 3/8\", 1/2\", 3/4\"", "thread_types": "BSPP", "control_type": "three_way_compensated", "pressure_compensated": true, "adjustment_type": "handwheel", "controlled_flow_range": "Regulated 30-80 L/min with inlet 50-150 L/min, by size", "mounting_style": "in_line"}'::jsonb, true, 4570, 'vpp 3웨이 유량 레귤레이터 (잉여 유량 가압 회로) vpp 3-way flow regulator (excess flow to pressure) 잉여 유량을 2차 가압 회로로 보내는 3웨이 압력 보상 유량 레귤레이터, bspp 3/8"-3/4", 250 bar 3-way pressure-compensated flow regulator with excess flow to a pressure line, bspp 3/8"-3/4", 250 bar vpp oleoweb s.r.l. 유량 제어 밸브 flow control valves 250 150 bspp 3/8", 1/2", 3/4" bspp three_way_compensated 3웨이 압력 보상 3-way pressure compensated true handwheel 핸드 휠 hand wheel regulated 30-80 l/min with inlet 50-150 l/min, by size in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vpp-vpp-rv', 'VPP - VPP/RV', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VPP 시리즈 3-way 압력 보상형 유량 조절 밸브 (압력측 배출)', 'VPP Series 3-Way Compensated Flow Regulator (Excess to Pressure)', '인라인 설치 방식의 3-way 압력 보상형 유량 조절 밸브 (압력측 배출)(으)로 최대 유량 150 L/min, 최대 압력 250 bar를 지원합니다.', '3-Way Compensated Flow Regulator (Excess to Pressure) with in-line installation, rated for flows up to 150 L/min and pressures up to 250 bar.', 'VPP - VPP/RV은(는) 이탈리아 Oleoweb의 3-way 압력 보상형 유량 조절 밸브 (압력측 배출) 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 150 L/min, 최대 압력 250 bar 사양을 갖추고 있습니다. 본 시리즈에는 VPP, VPP/RV 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VPP - VPP/RV is a 3-way compensated flow regulator (excess to pressure) series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 150 L/min and pressures up to 250 bar. The series includes the VPP, VPP/RV models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"regulator_type": "three_way_to_pressure", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 150, "max_pressure_bar": 250, "variant_codes": "VPP, VPP/RV"}'::jsonb, true, 4580, 'vpp 시리즈 3-way 압력 보상형 유량 조절 밸브 (압력측 배출) vpp series 3-way compensated flow regulator (excess to pressure) 인라인 설치 방식의 3-way 압력 보상형 유량 조절 밸브 (압력측 배출)(으)로 최대 유량 150 l/min, 최대 압력 250 bar를 지원합니다. 3-way compensated flow regulator (excess to pressure) with in-line installation, rated for flows up to 150 l/min and pressures up to 250 bar. vpp - vpp/rv oleoweb s.r.l. 유량 제어 밸브 flow control valves 250 150 three_way_to_pressure 3-way 보상형 (압력측 배출) 3-way compensated, excess to pressure parts_in_body 바디 일체형 parts in body in_line 인라인 in-line vpp, vpp/rv')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vpr', 'VPR (VPR08 / VPR10)', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VPR 단동용 파일럿 체크 밸브', 'VPR Single Acting Pilot Check Valves', 'SAE8/SAE10 파일럿 체크 밸브, 최대 30l/min, 350bar', 'SAE8/SAE10 pilot check valves, up to 30 l/min, 350 bar', '단동 실린더의 하중 유지용 파일럿 체크(블록) 카트리지 밸브입니다. VPR08(3/4-16UNF, 15l/min)과 VPR10(7/8-14UNF, 30l/min) 두 사이즈이며 최대 압력 350bar, 파일럿비 1:2.5입니다.', 'Pilot operated check (load holding) cartridge valves for single acting cylinders. Two sizes: VPR08 (3/4-16UNF, 15 l/min) and VPR10 (7/8-14UNF, 30 l/min), rated 350 bar with a 1:2.5 pilot ratio.',
  '{"valve_function": "pilot_check", "cavity": "SAE8/3 / SAE10/3", "thread": "3/4-16UNF / 7/8-14UNF", "max_flow_lpm": 30, "max_pressure_bar": 350, "setting_range_bar": "Pilot ratio 1:2.5", "tightening_torque_nm": "25-30 (VPR08), 41-47 (VPR10)", "weight_kg": "0.09-0.11"}'::jsonb, true, 4590, 'vpr 단동용 파일럿 체크 밸브 vpr single acting pilot check valves sae8/sae10 파일럿 체크 밸브, 최대 30l/min, 350bar sae8/sae10 pilot check valves, up to 30 l/min, 350 bar vpr (vpr08 / vpr10) oleoweb s.r.l. 카트리지 밸브 cartridge valves pilot_check pilot_check pilot_check sae8/3 / sae10/3 30 350 3/4-16unf / 7/8-14unf pilot ratio 1:2.5 25-30 (vpr08), 41-47 (vpr10) 0.09-0.11')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vpr22', 'VPR22', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VPR22 M22x1.5 파일럿 체크 밸브', 'VPR22 M22x1.5 Single Acting Pilot Check Valve', 'M22x1.5 파일럿 체크 밸브, 50l/min, 350bar', 'M22x1.5 pilot check valve, 50 l/min, 350 bar', 'M22x1.5 캐비티(C2215/3)용 단동 파일럿 체크 밸브입니다. 포핏 시일 구조(SP)로 최대 유량 50l/min, 최대 압력 350bar, 파일럿비 1:2.5입니다. 5bar 또는 8bar 스프링을 선택할 수 있습니다.', 'Single acting pilot check valve for the M22x1.5 cavity (C2215/3). Poppet sealing (SP) design rated 50 l/min and 350 bar with a 1:2.5 pilot ratio. Available with a 5 bar or 8 bar spring.',
  '{"valve_function": "pilot_check", "cavity": "C2215/3", "thread": "M22x1.5", "max_flow_lpm": 50, "max_pressure_bar": 350, "setting_range_bar": "Spring 5 or 8 bar, pilot ratio 1:2.5", "tightening_torque_nm": "44-50", "weight_kg": "0.14"}'::jsonb, true, 4600, 'vpr22 m22x1.5 파일럿 체크 밸브 vpr22 m22x1.5 single acting pilot check valve m22x1.5 파일럿 체크 밸브, 50l/min, 350bar m22x1.5 pilot check valve, 50 l/min, 350 bar vpr22 oleoweb s.r.l. 카트리지 밸브 cartridge valves pilot_check pilot_check pilot_check c2215/3 50 350 m22x1.5 spring 5 or 8 bar, pilot ratio 1:2.5 44-50 0.14')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vpt', 'VPT', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VPT 3웨이 유량 레귤레이터 (잉여 유량 탱크 복귀)', 'VPT 3-Way Flow Regulator (Excess Flow to Tank)', '잉여 유량을 탱크로 배출하는 3웨이 압력 보상 유량 레귤레이터, BSPP 3/8"-1", 250 bar', '3-way pressure-compensated flow regulator with excess flow to tank, BSPP 3/8"-1", 250 bar', '핸드 휠로 설정한 유량만 우선 회로로 보내고 잉여 유량은 탱크로 배출하는 3웨이 압력 보상형 유량 레귤레이터입니다. BSPP 3/8"~1" 4개 사이즈로 최대 250 bar, 최대 유량 50~240 L/min(우선 유량 30~150 L/min)에 대응합니다. 역류용 체크 밸브 내장형(VPT-AR)과 릴리프 밸브 내장형(VPT-RV, 10~250 bar) 버전이 있습니다.', '3-way pressure-compensated flow regulator sending the handwheel-set flow to the priority circuit and dumping excess flow to tank. Four sizes BSPP 3/8" to 1" rated 250 bar with max flows of 50-240 L/min (regulated flow 30-150 L/min). Variants include VPT-AR with a check valve for free reverse flow and VPT-RV with a built-in relief valve (10-250 bar).',
  '{"max_pressure_bar": 250, "max_flow_lpm": 240, "port_sizes": "BSPP 3/8\", 1/2\", 3/4\", 1\"", "thread_types": "BSPP", "control_type": "three_way_compensated", "pressure_compensated": true, "adjustment_type": "handwheel", "controlled_flow_range": "Regulated 30-150 L/min with inlet 50-240 L/min, by size", "mounting_style": "in_line"}'::jsonb, true, 4610, 'vpt 3웨이 유량 레귤레이터 (잉여 유량 탱크 복귀) vpt 3-way flow regulator (excess flow to tank) 잉여 유량을 탱크로 배출하는 3웨이 압력 보상 유량 레귤레이터, bspp 3/8"-1", 250 bar 3-way pressure-compensated flow regulator with excess flow to tank, bspp 3/8"-1", 250 bar vpt oleoweb s.r.l. 유량 제어 밸브 flow control valves 250 240 bspp 3/8", 1/2", 3/4", 1" bspp three_way_compensated 3웨이 압력 보상 3-way pressure compensated true handwheel 핸드 휠 hand wheel regulated 30-150 l/min with inlet 50-240 l/min, by size in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vpt-vpt-ar-vpt-rv', 'VPT - VPT/AR - VPT/RV', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VPT 시리즈 3-way 압력 보상형 유량 조절 밸브 (탱크 배출)', 'VPT Series 3-Way Compensated Flow Regulator (Excess to Tank)', '인라인 설치 방식의 3-way 압력 보상형 유량 조절 밸브 (탱크 배출)(으)로 최대 유량 240 L/min, 최대 압력 250 bar를 지원합니다.', '3-Way Compensated Flow Regulator (Excess to Tank) with in-line installation, rated for flows up to 240 L/min and pressures up to 250 bar.', 'VPT - VPT/AR - VPT/RV은(는) 이탈리아 Oleoweb의 3-way 압력 보상형 유량 조절 밸브 (탱크 배출) 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 240 L/min, 최대 압력 250 bar 사양을 갖추고 있습니다. 본 시리즈에는 VPT, VPT/AR, VPT/RV 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VPT - VPT/AR - VPT/RV is a 3-way compensated flow regulator (excess to tank) series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 240 L/min and pressures up to 250 bar. The series includes the VPT, VPT/AR, VPT/RV models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"regulator_type": "three_way_to_tank", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 240, "max_pressure_bar": 250, "variant_codes": "VPT, VPT/AR, VPT/RV"}'::jsonb, true, 4620, 'vpt 시리즈 3-way 압력 보상형 유량 조절 밸브 (탱크 배출) vpt series 3-way compensated flow regulator (excess to tank) 인라인 설치 방식의 3-way 압력 보상형 유량 조절 밸브 (탱크 배출)(으)로 최대 유량 240 l/min, 최대 압력 250 bar를 지원합니다. 3-way compensated flow regulator (excess to tank) with in-line installation, rated for flows up to 240 l/min and pressures up to 250 bar. vpt - vpt/ar - vpt/rv oleoweb s.r.l. 유량 제어 밸브 flow control valves 250 240 three_way_to_tank 3-way 보상형 (탱크 배출) 3-way compensated, excess to tank parts_in_body 바디 일체형 parts in body in_line 인라인 in-line vpt, vpt/ar, vpt/rv')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrc', 'VRC', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRC 2웨이 압력 보상 유량 제어 밸브', 'VRC 2-Way Pressure Compensated Flow Control Valve', '2웨이 압력 보상형 유량 제어 밸브, BSPP 1/4"-1/2", 250 bar', '2-way pressure-compensated flow control valve, BSPP 1/4"-1/2", 250 bar', '부하 압력 변동과 무관하게 설정 유량을 유지하는 2웨이 압력 보상형 유량 제어 밸브입니다. VRC140(BSPP 1/4", 10 L/min), VRC380(3/8", 18 L/min), VRC120(1/2", 33 L/min) 사이즈로 최대 250 bar에서 사용하며 역방향은 자유 흐름입니다.', '2-way pressure-compensated flow control valve maintaining a set flow independent of load pressure changes. Sizes VRC140 (BSPP 1/4", 10 L/min), VRC380 (3/8", 18 L/min) and VRC120 (1/2", 33 L/min) rated to 250 bar, with free reverse flow.',
  '{"max_pressure_bar": 250, "max_flow_lpm": 33, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\"", "thread_types": "BSPP", "control_type": "two_way_compensated", "pressure_compensated": true, "adjustment_type": "handknob", "controlled_flow_range": "10-33 L/min by size", "mounting_style": "in_line"}'::jsonb, true, 4630, 'vrc 2웨이 압력 보상 유량 제어 밸브 vrc 2-way pressure compensated flow control valve 2웨이 압력 보상형 유량 제어 밸브, bspp 1/4"-1/2", 250 bar 2-way pressure-compensated flow control valve, bspp 1/4"-1/2", 250 bar vrc oleoweb s.r.l. 유량 제어 밸브 flow control valves 250 33 bspp 1/4", 3/8", 1/2" bspp two_way_compensated 2웨이 압력 보상 2-way pressure compensated true handknob 핸드 노브 handknob 10-33 l/min by size in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrd', 'VRD', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRD 하강 제어 밸브 (가변형 압력 보상)', 'VRD Adjustable Lowering Control Valve (Pressure Compensated)', '가변식 압력 보상형 하강 속도 제어 밸브, BSPP 1/4"-3/4", 300 bar, 최대 150 L/min', 'Adjustable pressure-compensated lowering control valve, BSPP 1/4"-3/4", 300 bar, up to 150 L/min', '설정(F값)으로 제어 유량을 조정할 수 있는 압력 보상형 하강 속도 제어 밸브입니다. BSPP 1/4"~3/4" 4개 사이즈, 최대 300 bar, 최대 유량 20~150 L/min에 대응합니다. 50 bar 기준 제어 유량은 사이즈와 스풀(A~F) 및 설정값에 따라 1.4~151 L/min 범위이며, M/F·F/F 하우징(콜로네트)이 별도 제공됩니다.', 'Pressure-compensated lowering control valve whose controlled flow is adjusted by the F setting. Four sizes BSPP 1/4" to 3/4", rated 300 bar with max flows of 20-150 L/min. Controlled flow at 50 bar ranges from 1.4 to 151 L/min depending on size, spool option (A-F) and setting; M/F and F/F housings are available.',
  '{"max_pressure_bar": 300, "max_flow_lpm": 150, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\", 3/4\"", "thread_types": "BSPP", "control_type": "adjustable_compensated", "pressure_compensated": true, "adjustment_type": "shim_setting", "controlled_flow_range": "1.4-151 L/min at 50 bar (±10%), by size/spool/setting", "mounting_style": "insert"}'::jsonb, true, 4640, 'vrd 하강 제어 밸브 (가변형 압력 보상) vrd adjustable lowering control valve (pressure compensated) 가변식 압력 보상형 하강 속도 제어 밸브, bspp 1/4"-3/4", 300 bar, 최대 150 l/min adjustable pressure-compensated lowering control valve, bspp 1/4"-3/4", 300 bar, up to 150 l/min vrd oleoweb s.r.l. 유량 제어 밸브 flow control valves 300 150 bspp 1/4", 3/8", 1/2", 3/4" bspp adjustable_compensated 가변형 압력 보상 adjustable, pressure compensated true shim_setting 심(스페이서) 설정 shim setting 1.4-151 l/min at 50 bar (±10%), by size/spool/setting insert 인서트(카트리지) insert (cartridge)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrdd', 'VRDD', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pilot-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRDD 복동 파일럿 체크 밸브 (DIN2353 접속)', 'VRDD Double Acting Pilot Check Valve (DIN2353)', 'DIN2353 튜브 접속형 복동 파일럿 체크 밸브, BSPP 1/4"-1/2", 350 bar', 'Double acting pilot check valve with DIN2353 tube fittings, BSPP 1/4"-1/2", 350 bar', 'DIN2353 컷링 튜브 피팅(Ø8/12/15 튜브)이 일체화된 복동형 파일럿 체크 밸브로, 실린더 양측 라인을 고정합니다. BSPP 1/4"~1/2" 사이즈로 10~45 L/min, 최대 350 bar에 대응합니다. 파일럿 비율은 1:4(T8 버전은 1:9)입니다.', 'Double acting pilot operated check valve with integrated DIN2353 cutting-ring tube fittings (Ø8/12/15 pipe), locking both cylinder lines. Sizes BSPP 1/4" to 1/2" cover 10-45 L/min at up to 350 bar. Pilot ratio 1:4 (1:9 for the T8 version).',
  '{"max_pressure_bar": 350, "max_flow_lpm": 45, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\" (pipe Ø8/12/15)", "acting_type": "double", "pilot_ratio": "1:4 (T8: 1:9)", "connection_standard": "DIN2353 tube fitting", "mounting_style": "in_line", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4650, 'vrdd 복동 파일럿 체크 밸브 (din2353 접속) vrdd double acting pilot check valve (din2353) din2353 튜브 접속형 복동 파일럿 체크 밸브, bspp 1/4"-1/2", 350 bar double acting pilot check valve with din2353 tube fittings, bspp 1/4"-1/2", 350 bar vrdd oleoweb s.r.l. 파일럿 체크 밸브 (블록 밸브) pilot operated check valves 350 45 bspp 1/4", 3/8", 1/2" (pipe ø8/12/15) double 복동 (더블) double acting 1:4 (t8: 1:9) din2353 tube fitting in_line 인라인 in-line 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrde', 'VRDE', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pilot-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRDE 복동 파일럿 체크 밸브', 'VRDE Double Acting Pilot Check Valve', '복동형 파일럿 체크(블록) 밸브, BSPP 1/4"-3/4", 350 bar, 파일럿 비율 1:4', 'Double acting pilot operated check valve, BSPP 1/4"-3/4", 350 bar, pilot ratio 1:4', '실린더 양측 라인을 모두 고정하는 복동형 파일럿 체크 밸브입니다. BSPP 1/4"~3/4" 4개 사이즈로 15~70 L/min, 최대 350 bar에 대응합니다. 파일럿 비율은 1:4(3/4"는 1:2.9)이며 최대 누유량은 0.25 cm³/min입니다.', 'Double acting pilot operated check valve locking both cylinder lines. Four sizes BSPP 1/4" to 3/4" cover 15-70 L/min at up to 350 bar. Pilot ratio 1:4 (1:2.9 for 3/4"); max leakage 0.25 cm³/min.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 70, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\", 3/4\"", "acting_type": "double", "pilot_ratio": "1:4 (3/4\": 1:2.9)", "connection_standard": "BSPP threaded ports", "mounting_style": "in_line", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4660, 'vrde 복동 파일럿 체크 밸브 vrde double acting pilot check valve 복동형 파일럿 체크(블록) 밸브, bspp 1/4"-3/4", 350 bar, 파일럿 비율 1:4 double acting pilot operated check valve, bspp 1/4"-3/4", 350 bar, pilot ratio 1:4 vrde oleoweb s.r.l. 파일럿 체크 밸브 (블록 밸브) pilot operated check valves 350 70 bspp 1/4", 3/8", 1/2", 3/4" double 복동 (더블) double acting 1:4 (3/4": 1:2.9) bspp threaded ports in_line 인라인 in-line 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrde-vrdd-vrdl', 'VRDE - VRDD - VRDL', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pilot-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRDE 시리즈 더블 파일럿 체크 밸브', 'VRDE Series Double PO Check Valve', '인라인 설치 방식의 더블 파일럿 체크 밸브로 최대 유량 70 L/min, 최대 압력 350 bar를 지원합니다.', 'Double PO Check Valve with in-line installation, rated for flows up to 70 L/min and pressures up to 350 bar.', 'VRDE - VRDD - VRDL은(는) 이탈리아 Oleoweb의 더블 파일럿 체크 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 70 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 VRDE, VRDD, VRDL 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VRDE - VRDD - VRDL is a double po check valve series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 70 L/min and pressures up to 350 bar. The series includes the VRDE, VRDD, VRDL models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"operation": "double_po", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 70, "max_pressure_bar": 350, "variant_codes": "VRDE, VRDD, VRDL"}'::jsonb, true, 4670, 'vrde 시리즈 더블 파일럿 체크 밸브 vrde series double po check valve 인라인 설치 방식의 더블 파일럿 체크 밸브로 최대 유량 70 l/min, 최대 압력 350 bar를 지원합니다. double po check valve with in-line installation, rated for flows up to 70 l/min and pressures up to 350 bar. vrde - vrdd - vrdl oleoweb s.r.l. 파일럿 체크 밸브 (블록 밸브) pilot operated check valves 350 70 double_po 더블 파일럿 double po parts_in_body 바디 일체형 parts in body in_line 인라인 in-line vrde, vrdd, vrdl')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrdf', 'VRDF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pilot-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRDF 복동 파일럿 체크 밸브 (플랜지형)', 'VRDF Double Acting Pilot Check Valve (Flanged)', '플랜지 장착형 복동 파일럿 체크(로크) 밸브, BSPP 3/8"-1/2", 350 bar', 'Flange-mounted double acting pilot check (lock) valve, BSPP 3/8"-1/2", 350 bar', '실린더에 플랜지로 직접 장착하는 복동형 파일럿 체크(로크) 밸브입니다. BSPP 3/8"(35 L/min)과 1/2"(50 L/min) 사이즈로 최대 350 bar에 대응합니다. 파일럿 비율은 1:7(1/2"는 1:3.2 선택 가능), 스프링은 1 bar 또는 6 bar(표준), 파일럿 피스톤 O-링 유무를 주문 코드로 지정합니다.', 'Double acting pilot operated check (lock) valve flange-mounted directly onto the cylinder. Sizes BSPP 3/8" (35 L/min) and 1/2" (50 L/min) rated to 350 bar. Pilot ratio 1:7 (1:3.2 optional on size 120); spring 1 bar or 6 bar (standard) and O-ring on the pilot piston selectable via ordering code.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 50, "port_sizes": "BSPP 3/8\", 1/2\"", "acting_type": "double", "pilot_ratio": "1:7 (size 120 also 1:3.2)", "connection_standard": "Flanged, BSPP ports", "mounting_style": "flanged", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4680, 'vrdf 복동 파일럿 체크 밸브 (플랜지형) vrdf double acting pilot check valve (flanged) 플랜지 장착형 복동 파일럿 체크(로크) 밸브, bspp 3/8"-1/2", 350 bar flange-mounted double acting pilot check (lock) valve, bspp 3/8"-1/2", 350 bar vrdf oleoweb s.r.l. 파일럿 체크 밸브 (블록 밸브) pilot operated check valves 350 50 bspp 3/8", 1/2" double 복동 (더블) double acting 1:7 (size 120 also 1:3.2) flanged, bspp ports flanged 플랜지 flanged 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrdl', 'VRDL', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pilot-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRDL 복동 파일럿 체크 밸브 (블록형)', 'VRDL Double Acting Pilot Check Valve (Block Type)', '블록형 복동 파일럿 체크 밸브, BSPP 1/4"-1/2", 350 bar, 파일럿 비율 1:7', 'Block-type double acting pilot check valve, BSPP 1/4"-1/2", 350 bar, pilot ratio 1:7', '장착 구멍을 갖춘 블록 바디의 복동형 파일럿 체크 밸브로 실린더 양측 라인을 고정합니다. BSPP 1/4"·3/8"(35 L/min), 1/2"(50 L/min) 사이즈로 최대 350 bar, 파일럿 비율 1:7입니다.', 'Double acting pilot operated check valve in a block body with mounting holes, locking both cylinder lines. Sizes BSPP 1/4" and 3/8" (35 L/min) and 1/2" (50 L/min) rated to 350 bar, pilot ratio 1:7.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 50, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\"", "acting_type": "double", "pilot_ratio": "1:7", "connection_standard": "BSPP threaded ports, block body", "mounting_style": "in_line", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4690, 'vrdl 복동 파일럿 체크 밸브 (블록형) vrdl double acting pilot check valve (block type) 블록형 복동 파일럿 체크 밸브, bspp 1/4"-1/2", 350 bar, 파일럿 비율 1:7 block-type double acting pilot check valve, bspp 1/4"-1/2", 350 bar, pilot ratio 1:7 vrdl oleoweb s.r.l. 파일럿 체크 밸브 (블록 밸브) pilot operated check valves 350 50 bspp 1/4", 3/8", 1/2" double 복동 (더블) double acting 1:7 bspp threaded ports, block body in_line 인라인 in-line 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrf6', 'VRF6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRF6 SAE8 단방향 유량 제어 밸브', 'VRF6 SAE8 Unidirectional Flow Control Valve', '역방향 자유 흐름 체크 내장 SAE8 단방향 유량 제어 밸브 (40 L/min, 350 bar)', 'Unidirectional flow control with reverse free-flow check for SAE8 cavity (40 L/min, 350 bar)', 'VRF6은 SAE 8/2 캐비티용 단방향 유량 제어 밸브 카트리지로, 한 방향은 교축 제어하고 역방향은 체크를 통해 자유 흐름을 허용합니다. 스크류(C) 또는 핸드놉(V) 조절 방식, 최대 유량 40 L/min, 최대 압력 350 bar 사양입니다.', 'The VRF6 is a unidirectional flow control cartridge for SAE 8/2 cavities, throttling flow in one direction while allowing free reverse flow through a check. Screw (C) or handknob (V) adjustment, rated 40 L/min and 350 bar.',
  '{"valve_function": "flow_control", "cavity": "SAE8/2 (3/4-16 UNF)", "max_flow_lpm": 40, "max_pressure_bar": 350, "adjustment": "스크류 또는 핸드놉 (Screw or handknob)", "pilot_ratio": null, "cracking_pressure": null, "seal_material": null, "controlled_flow_range": "단방향 교축 + 역방향 자유 흐름 (Unidirectional throttling with reverse free flow)"}'::jsonb, true, 4700, 'vrf6 sae8 단방향 유량 제어 밸브 vrf6 sae8 unidirectional flow control valve 역방향 자유 흐름 체크 내장 sae8 단방향 유량 제어 밸브 (40 l/min, 350 bar) unidirectional flow control with reverse free-flow check for sae8 cavity (40 l/min, 350 bar) vrf6 oleoweb s.r.l. 카트리지 밸브 cartridge valves flow_control 유량 제어 flow control sae8/2 (3/4-16 unf) 40 350 스크류 또는 핸드놉 (screw or handknob) 단방향 교축 + 역방향 자유 흐름 (unidirectional throttling with reverse free flow)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrp', 'VRP', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pilot-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRP 단동 파일럿 체크 밸브 (블록형)', 'VRP Single Acting Pilot Check Valve (Block Type)', '블록형 단동 파일럿 체크 밸브, BSPP 3/8"-1/2", 350 bar, 파일럿 비율 1:4', 'Block-type single acting pilot check valve, BSPP 3/8"-1/2", 350 bar, pilot ratio 1:4', '장착 구멍을 갖춘 블록 바디의 단동형 파일럿 체크 밸브입니다. BSPP 3/8"(35 L/min)과 1/2"(50 L/min) 사이즈로 최대 350 bar에 대응하며 파일럿 비율은 1:4입니다.', 'Single acting pilot operated check valve in a block body with mounting holes. Sizes BSPP 3/8" (35 L/min) and 1/2" (50 L/min) rated to 350 bar, pilot ratio 1:4.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 50, "port_sizes": "BSPP 3/8\", 1/2\"", "acting_type": "single", "pilot_ratio": "1:4", "connection_standard": "BSPP threaded ports, block body", "mounting_style": "in_line", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4710, 'vrp 단동 파일럿 체크 밸브 (블록형) vrp single acting pilot check valve (block type) 블록형 단동 파일럿 체크 밸브, bspp 3/8"-1/2", 350 bar, 파일럿 비율 1:4 block-type single acting pilot check valve, bspp 3/8"-1/2", 350 bar, pilot ratio 1:4 vrp oleoweb s.r.l. 파일럿 체크 밸브 (블록 밸브) pilot operated check valves 350 50 bspp 3/8", 1/2" single 단동 (싱글) single acting 1:4 bspp threaded ports, block body in_line 인라인 in-line 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrpe', 'VRPE', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pilot-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRPE 단동 파일럿 체크 밸브 (인라인 하우징형)', 'VRPE Single Acting Pilot Check Valve (In-line Housing)', '콜로네트형 단동 파일럿 체크 밸브, BSPP 1/4"-1", 최대 350 bar, 150 L/min', 'Housing-type single acting pilot check valve, BSPP 1/4"-1", up to 350 bar and 150 L/min', '배관 라인에 직접 연결하는 콜로네트(하우징) 타입의 단동형 파일럿 체크 밸브로, 파일럿 포트는 BSPP 1/4"입니다. BSPP 1/4"~1" 5개 사이즈로 25~150 L/min, 최대 350 bar(3/4" 이상은 300 bar)에 대응합니다. 파일럿 비율은 사이즈별 1:4~1:5.3입니다.', 'Housing-type single acting pilot operated check valve for direct pipe mounting, with a BSPP 1/4" pilot port. Five sizes BSPP 1/4" to 1" cover 25-150 L/min at up to 350 bar (300 bar for 3/4" and 1"). Pilot ratio 1:4 to 1:5.3 depending on size.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 150, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\", 3/4\", 1\" (pilot BSPP 1/4\")", "acting_type": "single", "pilot_ratio": "1:4 - 1:5.3 by size", "connection_standard": "BSPP threaded ports", "mounting_style": "in_line", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4720, 'vrpe 단동 파일럿 체크 밸브 (인라인 하우징형) vrpe single acting pilot check valve (in-line housing) 콜로네트형 단동 파일럿 체크 밸브, bspp 1/4"-1", 최대 350 bar, 150 l/min housing-type single acting pilot check valve, bspp 1/4"-1", up to 350 bar and 150 l/min vrpe oleoweb s.r.l. 파일럿 체크 밸브 (블록 밸브) pilot operated check valves 350 150 bspp 1/4", 3/8", 1/2", 3/4", 1" (pilot bspp 1/4") single 단동 (싱글) single acting 1:4 - 1:5.3 by size bspp threaded ports in_line 인라인 in-line 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrsd', 'VRSD', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pilot-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRSD 단동 파일럿 체크 밸브 (DIN2353 접속)', 'VRSD Single Acting Pilot Check Valve (DIN2353)', 'DIN2353 튜브 접속형 단동 파일럿 체크 밸브, BSPP 1/4"-1/2", 350 bar', 'Single acting pilot check valve with DIN2353 tube fittings, BSPP 1/4"-1/2", 350 bar', 'DIN2353 컷링 튜브 피팅(Ø8/12/15 튜브)이 일체화된 단동형 파일럿 체크 밸브입니다. BSPP 1/4"~1/2" 사이즈로 10~45 L/min, 최대 350 bar에 대응합니다. 파일럿 비율은 1:4(T8 버전은 1:9)입니다.', 'Single acting pilot operated check valve with integrated DIN2353 cutting-ring tube fittings (Ø8/12/15 pipe). Sizes BSPP 1/4" to 1/2" cover 10-45 L/min at up to 350 bar. Pilot ratio 1:4 (1:9 for the T8 version).',
  '{"max_pressure_bar": 350, "max_flow_lpm": 45, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\" (pipe Ø8/12/15)", "acting_type": "single", "pilot_ratio": "1:4 (T8: 1:9)", "connection_standard": "DIN2353 tube fitting", "mounting_style": "in_line", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4730, 'vrsd 단동 파일럿 체크 밸브 (din2353 접속) vrsd single acting pilot check valve (din2353) din2353 튜브 접속형 단동 파일럿 체크 밸브, bspp 1/4"-1/2", 350 bar single acting pilot check valve with din2353 tube fittings, bspp 1/4"-1/2", 350 bar vrsd oleoweb s.r.l. 파일럿 체크 밸브 (블록 밸브) pilot operated check valves 350 45 bspp 1/4", 3/8", 1/2" (pipe ø8/12/15) single 단동 (싱글) single acting 1:4 (t8: 1:9) din2353 tube fitting in_line 인라인 in-line 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrse', 'VRSE', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pilot-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRSE 단동 파일럿 체크 밸브', 'VRSE Single Acting Pilot Check Valve', '단동형 파일럿 체크(블록) 밸브, BSPP 1/4"-3/4", 350 bar, 파일럿 비율 1:4', 'Single acting pilot operated check valve, BSPP 1/4"-3/4", 350 bar, pilot ratio 1:4', '한쪽 라인의 하중을 고정하고 반대 라인의 파일럿 압력으로 개방하는 단동형 파일럿 체크 밸브입니다. BSPP 1/4"~3/4" 4개 사이즈로 15~70 L/min, 최대 350 bar에 대응합니다. 파일럿 비율은 1:4(3/4"는 1:2.9)이며 최대 누유량은 0.25 cm³/min입니다.', 'Single acting pilot operated check valve holding the load on one line and released by pilot pressure from the opposite line. Four sizes BSPP 1/4" to 3/4" cover 15-70 L/min at up to 350 bar. Pilot ratio 1:4 (1:2.9 for 3/4"); max leakage 0.25 cm³/min.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 70, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\", 3/4\"", "acting_type": "single", "pilot_ratio": "1:4 (3/4\": 1:2.9)", "connection_standard": "BSPP threaded ports", "mounting_style": "in_line", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4740, 'vrse 단동 파일럿 체크 밸브 vrse single acting pilot check valve 단동형 파일럿 체크(블록) 밸브, bspp 1/4"-3/4", 350 bar, 파일럿 비율 1:4 single acting pilot operated check valve, bspp 1/4"-3/4", 350 bar, pilot ratio 1:4 vrse oleoweb s.r.l. 파일럿 체크 밸브 (블록 밸브) pilot operated check valves 350 70 bspp 1/4", 3/8", 1/2", 3/4" single 단동 (싱글) single acting 1:4 (3/4": 1:2.9) bspp threaded ports in_line 인라인 in-line 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vrse-vrsd-vrp', 'VRSE - VRSD - VRP', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pilot-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VRSE 시리즈 싱글 파일럿 체크 밸브', 'VRSE Series Single PO Check Valve', '인라인 설치 방식의 싱글 파일럿 체크 밸브로 최대 유량 70 L/min, 최대 압력 350 bar를 지원합니다.', 'Single PO Check Valve with in-line installation, rated for flows up to 70 L/min and pressures up to 350 bar.', 'VRSE - VRSD - VRP은(는) 이탈리아 Oleoweb의 싱글 파일럿 체크 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 70 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 VRSE, VRSD, VRP 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VRSE - VRSD - VRP is a single po check valve series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 70 L/min and pressures up to 350 bar. The series includes the VRSE, VRSD, VRP models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"operation": "single_po", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 70, "max_pressure_bar": 350, "variant_codes": "VRSE, VRSD, VRP"}'::jsonb, true, 4750, 'vrse 시리즈 싱글 파일럿 체크 밸브 vrse series single po check valve 인라인 설치 방식의 싱글 파일럿 체크 밸브로 최대 유량 70 l/min, 최대 압력 350 bar를 지원합니다. single po check valve with in-line installation, rated for flows up to 70 l/min and pressures up to 350 bar. vrse - vrsd - vrp oleoweb s.r.l. 파일럿 체크 밸브 (블록 밸브) pilot operated check valves 350 70 single_po 싱글 파일럿 single po parts_in_body 바디 일체형 parts in body in_line 인라인 in-line vrse, vrsd, vrp')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vsc6', 'VSC6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-cartridge-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VSC6 SAE8 고정형 압력 보상 유량 제어 밸브', 'VSC6 SAE8 Fixed Flow Control Valve, Pressure Compensated', '1~12 L/min 고정 제어 유량의 SAE8 압력 보상형 유량 제어 밸브', 'SAE8 pressure-compensated flow control with fixed regulated flow of 1-12 L/min', 'VSC6은 SAE 8/2 캐비티용 고정형 압력 보상 유량 제어 밸브 카트리지입니다. 100 bar 기준 제어 유량 1~12 L/min(12단계, ±10%)을 오리피스 지름별로 선택하며 최대 유량 12 L/min, 최대 압력 250 bar 사양입니다.', 'The VSC6 is a fixed, pressure-compensated flow control cartridge for SAE 8/2 cavities. Regulated flows from 1 to 12 L/min (12 steps, ±10% at 100 bar) selected by orifice size; 12 L/min max flow and 250 bar max pressure.',
  '{"valve_function": "flow_control", "cavity": "SAE8/2 (3/4-16 UNF)", "max_flow_lpm": 12, "max_pressure_bar": 250, "adjustment": "고정형 (오리피스 선택)", "pilot_ratio": null, "cracking_pressure": null, "seal_material": null, "controlled_flow_range": "1-12 L/min (100 bar 기준 ±10%)"}'::jsonb, true, 4760, 'vsc6 sae8 고정형 압력 보상 유량 제어 밸브 vsc6 sae8 fixed flow control valve, pressure compensated 1~12 l/min 고정 제어 유량의 sae8 압력 보상형 유량 제어 밸브 sae8 pressure-compensated flow control with fixed regulated flow of 1-12 l/min vsc6 oleoweb s.r.l. 카트리지 밸브 cartridge valves flow_control 유량 제어 flow control sae8/2 (3/4-16 unf) 12 250 고정형 (오리피스 선택) 1-12 l/min (100 bar 기준 ±10%)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vsc6-vscf6', 'VSC6 - VSCF6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VSC6 시리즈 압력 보상형 유량 조절 밸브', 'VSC6 Series Compensated Flow Control Valve', '나사 삽입형 설치 방식의 압력 보상형 유량 조절 밸브로 최대 유량 18 L/min, 최대 압력 350 bar를 지원합니다.', 'Compensated Flow Control Valve with screwed-in installation, rated for flows up to 18 L/min and pressures up to 350 bar.', 'VSC6 - VSCF6은(는) 이탈리아 Oleoweb의 압력 보상형 유량 조절 밸브 시리즈입니다. 카트리지 구조와 나사 삽입형 설치 방식을 채택하였으며, 최대 유량 18 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 VSC6, VSCF6 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VSC6 - VSCF6 is a compensated flow control valve series from Oleoweb, Italy. It features a cartridge execution with screwed-in installation, rated for flows up to 18 L/min and pressures up to 350 bar. The series includes the VSC6, VSCF6 models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"regulator_type": "compensated", "execution": "cartridge", "installation": "screwed_in", "max_flow_lpm": 18, "max_pressure_bar": 350, "variant_codes": "VSC6, VSCF6"}'::jsonb, true, 4770, 'vsc6 시리즈 압력 보상형 유량 조절 밸브 vsc6 series compensated flow control valve 나사 삽입형 설치 방식의 압력 보상형 유량 조절 밸브로 최대 유량 18 l/min, 최대 압력 350 bar를 지원합니다. compensated flow control valve with screwed-in installation, rated for flows up to 18 l/min and pressures up to 350 bar. vsc6 - vscf6 oleoweb s.r.l. 유량 제어 밸브 flow control valves 350 18 compensated 압력 보상형 compensated cartridge 카트리지 cartridge screwed_in 나사 삽입형 screwed-in vsc6, vscf6')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vscr6', 'VSCR6', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VSCR6 하강 제어 밸브 (소형 고정형 압력 보상)', 'VSCR6 Compact Fixed Flow Control Valve (Pressure Compensated)', '소형 고정 유량 압력 보상 인서트 밸브, 1-12 L/min, 250 bar', 'Compact fixed pressure-compensated insert flow control, 1-12 L/min, 250 bar', '소형 카트리지 형태의 고정형 압력 보상 유량 제어 밸브입니다. 오리피스 직경 Ø1~3.3 mm에 따라 100 bar 기준 1~12 L/min의 제어 유량을 제공하며 최대 250 bar에서 사용합니다. O-링(9.25x1.78) 장착형으로 중량은 약 0.012 kg입니다.', 'Miniature cartridge-type fixed pressure-compensated flow control valve. Orifice diameters of Ø1 to 3.3 mm give controlled flows of 1-12 L/min at 100 bar (±10%), with a maximum pressure of 250 bar. Mounted with a 9.25x1.78 O-ring; weight approx. 0.012 kg.',
  '{"max_pressure_bar": 250, "max_flow_lpm": 12, "port_sizes": "Cartridge with O-ring 9.25x1.78", "thread_types": "-", "control_type": "fixed_compensated", "pressure_compensated": true, "adjustment_type": "fixed", "controlled_flow_range": "1-12 L/min at 100 bar (±10%), orifice Ø1-3.3 mm", "mounting_style": "insert"}'::jsonb, true, 4780, 'vscr6 하강 제어 밸브 (소형 고정형 압력 보상) vscr6 compact fixed flow control valve (pressure compensated) 소형 고정 유량 압력 보상 인서트 밸브, 1-12 l/min, 250 bar compact fixed pressure-compensated insert flow control, 1-12 l/min, 250 bar vscr6 oleoweb s.r.l. 유량 제어 밸브 flow control valves 250 12 cartridge with o-ring 9.25x1.78 - fixed_compensated 고정형 압력 보상 fixed, pressure compensated true fixed 고정(공장 설정) fixed 1-12 l/min at 100 bar (±10%), orifice ø1-3.3 mm insert 인서트(카트리지) insert (cartridge)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vsl', 'VSL', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pressure-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VSL 인라인 시퀀스 밸브', 'VSL In-line Direct Sequence Valve', '인라인 직동형 시퀀스 밸브, BSPP 1/4"-1/2", 350 bar, 20-40 L/min', 'In-line direct acting sequence valve, BSPP 1/4"-1/2", 350 bar, 20-40 L/min', '1차 회로가 설정 압력에 도달하면 2차 회로로 유량을 보내는 인라인 직동형 시퀀스 밸브입니다. BSPP 1/4"(20 L/min), 3/8"·1/2"(40 L/min) 사이즈로 최대 350 bar에 대응하며, 스프링은 10~90, 20~210, 70~350 bar 3종입니다.', 'In-line direct acting sequence valve that opens flow to a secondary circuit once the primary circuit reaches the set pressure. Sizes BSPP 1/4" (20 L/min) and 3/8"/1/2" (40 L/min) rated to 350 bar, with three spring ranges: 10-90, 20-210 and 70-350 bar.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 40, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\"", "thread_types": "BSPP", "valve_function": "sequence", "setting_ranges": "10-90 / 20-210 / 70-350 bar (12 / 30 / 65 bar per turn)", "adjustment_type": "screw"}'::jsonb, true, 4790, 'vsl 인라인 시퀀스 밸브 vsl in-line direct sequence valve 인라인 직동형 시퀀스 밸브, bspp 1/4"-1/2", 350 bar, 20-40 l/min in-line direct acting sequence valve, bspp 1/4"-1/2", 350 bar, 20-40 l/min vsl oleoweb s.r.l. 압력 제어 밸브 (릴리프/시퀀스) pressure control valves (relief / sequence) 350 40 bspp 1/4", 3/8", 1/2" bspp sequence 시퀀스 sequence 10-90 / 20-210 / 70-350 bar (12 / 30 / 65 bar per turn) screw 스크류 screw')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vslh', 'VSLH', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-pressure-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VSLH 고정 설정 시퀀스 밸브', 'VSLH Fixed-Setting Sequence Valve', '고정 설정(50 bar) 인라인 시퀀스 밸브, 3/8" BSPP/NPTF, 350 bar, 45 L/min', 'Fixed-setting (50 bar) in-line sequence valve, 3/8" BSPP/NPTF, 350 bar, 45 L/min', '시퀀스 압력이 50 bar로 공장 설정된 고정형 인라인 시퀀스 밸브로, 체크 밸브 개방 압력은 0.5 bar입니다. 3/8" 사이즈(BSPP 또는 NPTF)로 최대 45 L/min, 350 bar에 대응합니다. 표준 이외의 설정 압력은 별도 문의로 제작됩니다.', 'Fixed-setting in-line sequence valve factory set to 50 bar sequence pressure, with a 0.5 bar check valve cracking pressure. Size 3/8" (BSPP or NPTF) handles up to 45 L/min at 350 bar. Non-standard settings are available on request.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 45, "port_sizes": "3/8\"", "thread_types": "BSPP, NPTF", "valve_function": "sequence", "setting_ranges": "Fixed 50 bar (other settings on request); check valve 0.5 bar", "adjustment_type": "fixed"}'::jsonb, true, 4800, 'vslh 고정 설정 시퀀스 밸브 vslh fixed-setting sequence valve 고정 설정(50 bar) 인라인 시퀀스 밸브, 3/8" bspp/nptf, 350 bar, 45 l/min fixed-setting (50 bar) in-line sequence valve, 3/8" bspp/nptf, 350 bar, 45 l/min vslh oleoweb s.r.l. 압력 제어 밸브 (릴리프/시퀀스) pressure control valves (relief / sequence) 350 45 3/8" bspp, nptf sequence 시퀀스 sequence fixed 50 bar (other settings on request); check valve 0.5 bar fixed 고정 설정 fixed setting')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vuba', 'VUBA', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-safety-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VUBA 배관 안전 밸브', 'VUBA Hose Burst Valve', '인서트형 호스 파열 방지 안전 밸브, BSPP 1/4"-1", 350 bar, 최대 180 L/min', 'Insert-type hose burst safety valve, BSPP 1/4"-1", 350 bar, up to 180 L/min', '실린더 포트나 콜로네트(하우징)에 삽입하는 호스 파열 방지 안전 밸브입니다. BSPP 1/4"~1" 5개 사이즈로 최대 350 bar, 25~180 L/min에 대응합니다. 심(F) 설정값 0.1~2 mm로 차단 유량을 조정하며(사이즈별 3~124 L/min, 공차 ±10%), 포핏 오리피스 옵션과 M/F·F/F 하우징(콜로네트)이 별도 제공됩니다.', 'Hose burst safety valve inserted into cylinder ports or supplied housings. Five sizes BSPP 1/4" to 1" cover 25-180 L/min at up to 350 bar. The trip flow is set by an F shim of 0.1-2 mm (3-124 L/min depending on size, ±10% tolerance); an orifice on the flat poppet and M/F or F/F housings are available as options.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 180, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\", 3/4\", 1\"", "connection_standard": "Insert cartridge; M/F and F/F housings available", "setting_range": "Shim setting F 0.1-2 mm; trip flow 3-124 L/min by size (±10%)", "orifice_option": true, "mounting_style": "insert", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4810, 'vuba 배관 안전 밸브 vuba hose burst valve 인서트형 호스 파열 방지 안전 밸브, bspp 1/4"-1", 350 bar, 최대 180 l/min insert-type hose burst safety valve, bspp 1/4"-1", 350 bar, up to 180 l/min vuba oleoweb s.r.l. 배관 안전 밸브 hose burst safety valves 350 180 bspp 1/4", 3/8", 1/2", 3/4", 1" insert cartridge; m/f and f/f housings available shim setting f 0.1-2 mm; trip flow 3-124 l/min by size (±10%) true insert 인서트(카트리지) insert (cartridge) 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vuba-din', 'VUBA-DIN', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-safety-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VUBA-DIN 배관 안전 밸브 (DIN 튜브 접속형)', 'VUBA-DIN Hose Burst Valve (DIN Tube Fitting)', 'DIN 튜브 피팅 일체형 호스 파열 방지 밸브, BSPP 3/8"-1/2", 315 bar', 'Hose burst safety valve with integrated DIN tube fitting, BSPP 3/8"-1/2", 315 bar', 'DIN 규격 튜브 피팅(M16x1.5/M18x1.5/M22x1.5, Ø10/12/15 튜브)이 일체화된 배관 안전 밸브입니다. 호스나 배관 파손 시 설정 유량을 초과하는 흐름을 감지하여 자동으로 차단, 하중의 자유 낙하를 방지합니다. BSPP 3/8"(50 L/min)과 1/2"(80 L/min) 규격으로 최대 315 bar에서 사용하며, 심(F) 설정과 포핏 오리피스(P) 옵션을 지정할 수 있습니다.', 'Pipe safety valve with an integrated DIN tube fitting (M16x1.5/M18x1.5/M22x1.5 for Ø10/12/15 pipe). If a hose or pipe bursts, the valve senses the excess flow and shuts off automatically, preventing free fall of the load. Sizes BSPP 3/8" (50 L/min) and 1/2" (80 L/min) rated to 315 bar; trip setting (F shim) and an orifice on the flat poppet (P) can be specified in the ordering code.',
  '{"max_pressure_bar": 315, "max_flow_lpm": 80, "port_sizes": "BSPP 3/8\", 1/2\"", "connection_standard": "DIN pipe fitting M16x1.5 / M18x1.5 / M22x1.5 (Ø10/12/15 pipe)", "setting_range": "Shim setting F 0.1-2 mm (factory set on request)", "orifice_option": true, "mounting_style": "in_line", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4820, 'vuba-din 배관 안전 밸브 (din 튜브 접속형) vuba-din hose burst valve (din tube fitting) din 튜브 피팅 일체형 호스 파열 방지 밸브, bspp 3/8"-1/2", 315 bar hose burst safety valve with integrated din tube fitting, bspp 3/8"-1/2", 315 bar vuba-din oleoweb s.r.l. 배관 안전 밸브 hose burst safety valves 315 80 bspp 3/8", 1/2" din pipe fitting m16x1.5 / m18x1.5 / m22x1.5 (ø10/12/15 pipe) shim setting f 0.1-2 mm (factory set on request) true in_line 인라인 in-line 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vuc', 'VUC', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VUC 인서트 체크 밸브 (포핏 타입)', 'VUC Insert Check Valve (Poppet Type)', '포핏(오투라토레) 방식 인서트 체크 밸브, BSPP 1/4"-3/8", 350 bar', 'Poppet-type insert check valve, BSPP 1/4"-3/8", 350 bar', '포핏 시트 방식의 나사 삽입식 인서트 체크 밸브입니다. BSPP 1/4"(20 L/min) 및 3/8"(30 L/min) 캐비티용으로 최대 350 bar에서 사용합니다. 개방 압력 0.5 bar, 최대 누유량 0.25 cm³/min이며 전용 설치 공구가 제공됩니다.', 'Screw-in insert check valve with poppet sealing. Available for BSPP 1/4" (20 L/min) and 3/8" (30 L/min) cavities at up to 350 bar. Cracking pressure 0.5 bar, max leakage 0.25 cm³/min; a dedicated installation tool is available.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 30, "port_sizes": "BSPP 1/4\", 3/8\" (cavity)", "thread_types": "BSPP", "sealing_type": "poppet", "cracking_pressure": "0.5 bar", "mounting_style": "insert", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4830, 'vuc 인서트 체크 밸브 (포핏 타입) vuc insert check valve (poppet type) 포핏(오투라토레) 방식 인서트 체크 밸브, bspp 1/4"-3/8", 350 bar poppet-type insert check valve, bspp 1/4"-3/8", 350 bar vuc oleoweb s.r.l. 체크 밸브 check valves 30 350 bspp 1/4", 3/8" (cavity) bspp poppet 포핏(콘) 시트 poppet 0.5 bar insert 인서트(카트리지) insert (cartridge) 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vui', 'VUI', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VUI 인서트 체크 밸브 (볼 타입)', 'VUI Insert Check Valve (Ball Type)', '볼 시트 방식의 나사 삽입식 인서트 체크 밸브, BSPP 1/4"-3/4", 350 bar', 'Ball-type screw-in insert check valve, BSPP 1/4"-3/4", 350 bar', '매니폴드 캐비티에 직접 삽입하는 볼 시트 방식의 단방향 체크 밸브입니다. BSPP 1/4"~3/4" 캐비티에 대응하며 최대 350 bar, 20~80 L/min의 유량을 처리합니다. 개방 압력 0.5 bar, 최대 누유량 0.25 cm³/min(5방울/분)이며 양방향으로 설치가 가능합니다.', 'One-way ball-type check valve that screws directly into a manifold cavity. Covers BSPP 1/4" to 3/4" cavities with flows of 20-80 L/min at up to 350 bar. Cracking pressure 0.5 bar, max leakage 0.25 cm³/min (5 drops/min); the cartridge can be installed in both directions.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 80, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\", 3/4\" (cavity)", "thread_types": "BSPP", "sealing_type": "ball", "cracking_pressure": "0.5 bar", "mounting_style": "insert", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4840, 'vui 인서트 체크 밸브 (볼 타입) vui insert check valve (ball type) 볼 시트 방식의 나사 삽입식 인서트 체크 밸브, bspp 1/4"-3/4", 350 bar ball-type screw-in insert check valve, bspp 1/4"-3/4", 350 bar vui oleoweb s.r.l. 체크 밸브 check valves 80 350 bspp 1/4", 3/8", 1/2", 3/4" (cavity) bspp ball 볼 시트 ball 0.5 bar insert 인서트(카트리지) insert (cartridge) 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vun', 'VUN', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VUN 체크 밸브 (M/M 인라인형)', 'VUN Check Valve (M/M In-line)', '수/수 인라인 체크 밸브, BSPP 1/4"-1", 500 bar, 5-90 L/min', 'Male/male in-line check valve, BSPP 1/4"-1", 500 bar, 5-90 L/min', '양단 수나사(M/M) 구조의 컴팩트 인라인 체크 밸브로 최대 500 bar의 고압에 대응합니다. BSPP 1/4"~1" 5개 사이즈, 유량 5~90 L/min이며 볼 시트(1/4"~1/2", 0.5 bar 스프링) 또는 포핏 시트를 선택합니다. 스프링 0.5/3/4.5/6 bar 옵션과 교축 오리피스 -H 버전이 제공됩니다.', 'Compact in-line check valve with male/male ends rated to 500 bar. Five sizes BSPP 1/4" to 1" cover 5-90 L/min, with ball sealing (1/4"-1/2", 0.5 bar spring) or poppet sealing. Spring options 0.5/3/4.5/6 bar (6 bar not for 1/4") and a -H restriction-hole version are available.',
  '{"max_pressure_bar": 500, "max_flow_lpm": 90, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\", 3/4\", 1\"", "thread_types": "BSPP", "sealing_type": "ball_or_poppet", "cracking_pressure": "0.5 bar std; 3 / 4.5 / 6 bar options", "mounting_style": "in_line", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4850, 'vun 체크 밸브 (m/m 인라인형) vun check valve (m/m in-line) 수/수 인라인 체크 밸브, bspp 1/4"-1", 500 bar, 5-90 l/min male/male in-line check valve, bspp 1/4"-1", 500 bar, 5-90 l/min vun oleoweb s.r.l. 체크 밸브 check valves 90 500 bspp 1/4", 3/8", 1/2", 3/4", 1" bspp ball_or_poppet 볼/포핏 선택 ball or poppet 0.5 bar std; 3 / 4.5 / 6 bar options in_line 인라인 in-line 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vup', 'VUP', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VUP 인서트 체크 밸브 (디스크 타입)', 'VUP Insert Check Valve (Disk Type)', '디스크 방식 인서트 체크 밸브, BSPP 1/2"-3/4", 350 bar', 'Disk-type insert check valve, BSPP 1/2"-3/4", 350 bar', '디스크 시트 방식의 나사 삽입식 인서트 체크 밸브입니다. BSPP 1/2"(60 L/min)와 3/4"(80 L/min) 캐비티용으로 최대 350 bar에서 사용합니다. 개방 압력 0.5 bar, 최대 누유량 0.25 cm³/min이며 전용 설치 공구가 제공됩니다.', 'Screw-in insert check valve with disk sealing. Available for BSPP 1/2" (60 L/min) and 3/4" (80 L/min) cavities at up to 350 bar. Cracking pressure 0.5 bar, max leakage 0.25 cm³/min; a dedicated installation tool is available.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 80, "port_sizes": "BSPP 1/2\", 3/4\" (cavity)", "thread_types": "BSPP", "sealing_type": "disk", "cracking_pressure": "0.5 bar", "mounting_style": "insert", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4860, 'vup 인서트 체크 밸브 (디스크 타입) vup insert check valve (disk type) 디스크 방식 인서트 체크 밸브, bspp 1/2"-3/4", 350 bar disk-type insert check valve, bspp 1/2"-3/4", 350 bar vup oleoweb s.r.l. 체크 밸브 check valves 80 350 bspp 1/2", 3/4" (cavity) bspp disk 디스크 시트 disk 0.5 bar insert 인서트(카트리지) insert (cartridge) 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vur', 'VUR', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VUR 체크 밸브 (F/F 인라인형)', 'VUR Check Valve (F/F In-line Housing)', '암/암 인라인 체크 밸브, BSPP 1/8"-2"·NPTF·SAE, 최대 400 bar, 최대 430 L/min', 'Female/female in-line check valve, BSPP 1/8"-2", NPTF and SAE, up to 400 bar and 430 L/min', '양단 암나사(F/F) 하우징 타입의 인라인 체크 밸브입니다. BSPP 1/8"~2", NPTF 1/8"~2", SAE(UNF/UN 7/16"~2-1/2") 나사에 대응하며, 사이즈에 따라 최대 400 bar(대구경은 350/250 bar), 유량 5~430 L/min을 처리합니다. 볼 시트(소구경) 또는 포핏 시트를 선택할 수 있고 스프링은 0.5(표준)/1.5/3/4.5/6/10 bar 옵션이 있습니다. 교축 오리피스가 가공된 -H 버전도 주문 가능합니다.', 'In-line check valve with female/female housing. Available in BSPP 1/8"-2", NPTF 1/8"-2" and SAE (7/16"-20UNF to 2-1/2"-12UN) threads; ratings up to 400 bar (350/250 bar for larger sizes) and flows of 5-430 L/min. Ball sealing (small sizes) or poppet sealing, with spring options of 0.5 (standard)/1.5/3/4.5/6/10 bar. A -H version with a calibrated restriction hole is available.',
  '{"max_pressure_bar": 400, "max_flow_lpm": 430, "port_sizes": "1/8\" - 2\" (SAE 7/16-20UNF - 2-1/2-12UN)", "thread_types": "BSPP, NPTF, SAE UNF/UN", "sealing_type": "ball_or_poppet", "cracking_pressure": "0.5 bar std; 1.5 / 3 / 4.5 / 6 / 10 bar options", "mounting_style": "in_line", "max_leakage": "0.25 cm³/min (5 drops/min)"}'::jsonb, true, 4870, 'vur 체크 밸브 (f/f 인라인형) vur check valve (f/f in-line housing) 암/암 인라인 체크 밸브, bspp 1/8"-2"·nptf·sae, 최대 400 bar, 최대 430 l/min female/female in-line check valve, bspp 1/8"-2", nptf and sae, up to 400 bar and 430 l/min vur oleoweb s.r.l. 체크 밸브 check valves 430 400 1/8" - 2" (sae 7/16-20unf - 2-1/2-12un) bspp, nptf, sae unf/un ball_or_poppet 볼/포핏 선택 ball or poppet 0.5 bar std; 1.5 / 3 / 4.5 / 6 / 10 bar options in_line 인라인 in-line 0.25 cm³/min (5 drops/min)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vurf', 'VURF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VURF 단방향 유량 제어 밸브', 'VURF Unidirectional Flow Control Valve', '체크 밸브 내장 단방향 유량 제어 밸브, BSPP 1/8"-1 1/4", 최대 350 bar', 'Unidirectional flow control valve with integrated check, BSPP 1/8"-1 1/4", up to 350 bar', '한 방향의 유량을 조절하고 역방향은 체크 밸브를 통해 자유 흐름을 허용하는 인라인 유량 제어 밸브입니다. BSPP 1/8"~1-1/4" 7개 사이즈, 유량 5~200 L/min, 최대 압력 350 bar(3/4"는 300, 1" 이상은 250 bar)입니다. 140/380/120 사이즈는 볼 시트 사양입니다.', 'In-line flow control valve regulating flow in one direction with free reverse flow through an integrated check. Seven sizes BSPP 1/8" to 1-1/4" cover 5-200 L/min; max pressure 350 bar (300 bar for 3/4", 250 bar for 1" and 1-1/4"). Ball sealing on sizes 140/380/120.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 200, "port_sizes": "BSPP 1/8\", 1/4\", 3/8\", 1/2\", 3/4\", 1\", 1-1/4\"", "thread_types": "BSPP", "control_type": "unidirectional", "pressure_compensated": false, "adjustment_type": "handknob", "controlled_flow_range": "5-200 L/min by size", "mounting_style": "in_line"}'::jsonb, true, 4880, 'vurf 단방향 유량 제어 밸브 vurf unidirectional flow control valve 체크 밸브 내장 단방향 유량 제어 밸브, bspp 1/8"-1 1/4", 최대 350 bar unidirectional flow control valve with integrated check, bspp 1/8"-1 1/4", up to 350 bar vurf oleoweb s.r.l. 유량 제어 밸브 flow control valves 350 200 bspp 1/8", 1/4", 3/8", 1/2", 3/4", 1", 1-1/4" bspp unidirectional 단방향 유량 제어 unidirectional false handknob 핸드 노브 handknob 5-200 l/min by size in_line 인라인 in-line')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vurf-vbrf', 'VURF - VBRF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-flow-control-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VURF 시리즈 니들 밸브', 'VURF Series Needle Valve', '인라인 설치 방식의 니들 밸브로 최대 유량 200 L/min, 최대 압력 350 bar를 지원합니다.', 'Needle Valve with in-line installation, rated for flows up to 200 L/min and pressures up to 350 bar.', 'VURF - VBRF은(는) 이탈리아 Oleoweb의 니들 밸브 시리즈입니다. 바디 일체형 구조와 인라인 설치 방식을 채택하였으며, 최대 유량 200 L/min, 최대 압력 350 bar 사양을 갖추고 있습니다. 본 시리즈에는 VURF, VBRF 모델이 포함됩니다. 농업기계, 건설·토목기계, 리프팅 장비 및 산업용 유압 시스템에 적용됩니다.', 'The VURF - VBRF is a needle valve series from Oleoweb, Italy. It features a parts in body execution with in-line installation, rated for flows up to 200 L/min and pressures up to 350 bar. The series includes the VURF, VBRF models. Typical applications include agricultural, construction, lifting and industrial hydraulic systems.',
  '{"regulator_type": "needle", "execution": "parts_in_body", "installation": "in_line", "max_flow_lpm": 200, "max_pressure_bar": 350, "variant_codes": "VURF, VBRF"}'::jsonb, true, 4890, 'vurf 시리즈 니들 밸브 vurf series needle valve 인라인 설치 방식의 니들 밸브로 최대 유량 200 l/min, 최대 압력 350 bar를 지원합니다. needle valve with in-line installation, rated for flows up to 200 l/min and pressures up to 350 bar. vurf - vbrf oleoweb s.r.l. 유량 제어 밸브 flow control valves 350 200 needle 니들형 needle parts_in_body 바디 일체형 parts in body in_line 인라인 in-line vurf, vbrf')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('oleoweb-vusf', 'VUSF', (select id from manufacturers where slug = 'oleoweb'), (select id from product_categories where slug = 'oleoweb-check-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'VUSF 셔틀 밸브', 'VUSF Load Shuttle Valve', '3포트 로드 셔틀 밸브, BSPP 1/4"-1/2", 350 bar, 20-60 L/min', '3-port load shuttle valve, BSPP 1/4"-1/2", 350 bar, 20-60 L/min', '두 입력 포트 중 높은 압력을 자동으로 선택하여 출력하는 3포트 셔틀 밸브입니다. BSPP 1/4"(20 L/min), 3/8"(40 L/min), 1/2"(60 L/min) 사이즈로 최대 350 bar에서 사용하며, 로드센싱 신호 선택 등 부하 신호 회로에 적합합니다.', '3-port shuttle valve that automatically selects the higher of two input pressures to its outlet. Sizes BSPP 1/4" (20 L/min), 3/8" (40 L/min) and 1/2" (60 L/min) rated to 350 bar, suited to load-sensing and load signal circuits.',
  '{"max_pressure_bar": 350, "max_flow_lpm": 60, "port_sizes": "BSPP 1/4\", 3/8\", 1/2\"", "thread_types": "BSPP", "sealing_type": "shuttle", "cracking_pressure": "-", "mounting_style": "in_line", "max_leakage": "-"}'::jsonb, true, 4900, 'vusf 셔틀 밸브 vusf load shuttle valve 3포트 로드 셔틀 밸브, bspp 1/4"-1/2", 350 bar, 20-60 l/min 3-port load shuttle valve, bspp 1/4"-1/2", 350 bar, 20-60 l/min vusf oleoweb s.r.l. 체크 밸브 check valves 60 350 bspp 1/4", 3/8", 1/2" bspp shuttle 셔틀 shuttle - in_line 인라인 in-line -')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-109bxsw', '109BXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pressure-control-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '감압 밸브 (DN6, 10-30 bar)', 'Pressure Reducing Valve (DN6, 10-30 bar)', '무유량 조건에서도 출구 압력 제한, 설정 10-30 bar', 'Limits P-out even at zero flow demand, 10-30 bar setting', '다기능 회로에서 장비를 고압으로부터 보호하는 특허 감압 밸브입니다. 유량이 없는 상태에서도 P out 포트 압력을 제한해 실린더가 스톨되거나 엔드 스톱에 도달해도 힘 제어가 유지됩니다. 1단 감압은 입구 압력의 최대 70%까지 가능하며 역방향 유동은 제한이 없습니다.', 'Patented reducing valve protecting equipment from high system pressure in multi-function circuits. Limits P-out pressure even at zero flow demand, keeping cylinder force control under stall or end-stop conditions. Pressure can be reduced by up to 70% of inlet pressure in one stage; reverse flow is unrestricted.',
  '{"valve_type": "reducing", "nominal_size": "dn6", "max_inlet_pressure_bar": 180, "setting_range": "10-30 bar", "max_flow_lpm": 30, "actuation": "spring", "porting": "1/4\" BSPP", "body_material": "316 스테인리스강 / 폴리머"}'::jsonb, true, 4910, '감압 밸브 (dn6, 10-30 bar) pressure reducing valve (dn6, 10-30 bar) 무유량 조건에서도 출구 압력 제한, 설정 10-30 bar limits p-out even at zero flow demand, 10-30 bar setting 109bxsw the water hydraulics co. ltd 압력 제어 밸브 pressure control valves reducing 감압 밸브 reducing valve dn6 dn6 dn6 180 10-30 bar 30 spring 스프링(기계식) spring (mechanical) 1/4" bspp 316 스테인리스강 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-136-bspp-filter', '136-BSPP-XXT', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-filtration'), (select id from business_areas where slug = 'fluid-gas'),
  '고압 인라인 필터 136 시리즈 (100 bar)', 'High Pressure In-Line Filter 136 Series (100 bar)', '316L 고압 인라인 필터, 100bar, 1-100µm 엘리먼트', '316L high-pressure in-line filter, 100 bar, 1-100 µm elements', '최대 사용 압력 100bar(시험 압력 300bar)의 316L 스테인리스강 인라인 고압 필터입니다. 소결 316 메쉬 다층 구조의 스테인리스 엘리먼트를 사용하며 바이패스 밸브가 내장되어 있습니다. 1-100µm 등급 엘리먼트를 지정해 주문합니다(예: 136-BSPP-25T).', 'In-line high-pressure filter in 316L stainless steel rated 100 bar working (300 bar test). Uses multi-layer sintered 316 mesh elements and an integrated by-pass valve. Ordered with element grade 1-100 µm (e.g. 136-BSPP-25T).',
  '{"filter_type": "high_pressure_filter", "max_pressure_bar": 100, "micron_ratings": "1 / 3 / 5 / 10 / 20 / 25 / 50 / 100 µm", "port_size": "1/2\" BSP", "temperature_range": "-20 ~ +200°C", "material": "316L (DIN 17440-1.4404), 씰: NBR/Viton", "flow_note": "수직 설치, 볼륨 110cc, 중량 0.7kg"}'::jsonb, true, 4920, '고압 인라인 필터 136 시리즈 (100 bar) high pressure in-line filter 136 series (100 bar) 316l 고압 인라인 필터, 100bar, 1-100µm 엘리먼트 316l high-pressure in-line filter, 100 bar, 1-100 µm elements 136-bspp-xxt the water hydraulics co. ltd 여과 시스템 filtration high_pressure_filter 고압 필터 high pressure filter 100 1 / 3 / 5 / 10 / 20 / 25 / 50 / 100 µm 1/2" bsp -20 ~ +200°c 316l (din 17440-1.4404), 씰: nbr/viton 수직 설치, 볼륨 110cc, 중량 0.7kg')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-136hp-bspp-filter', '136HP-BSPP-XXT', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-filtration'), (select id from business_areas where slug = 'fluid-gas'),
  '고압 인라인 필터 136HP 시리즈 (200 bar)', 'High Pressure In-Line Filter 136HP Series (200 bar)', '316L 고압 인라인 필터, 200bar, 1-100µm 엘리먼트', '316L high-pressure in-line filter, 200 bar, 1-100 µm elements', '최대 사용 압력 200bar(시험 압력 500bar)의 316L 스테인리스강 인라인 고압 필터입니다. 소결 316 메쉬 스테인리스 엘리먼트(1-100µm)를 사용하며 엘리먼트 등급을 지정해 주문합니다(예: 136HP-BSPP-25T).', 'In-line high-pressure filter in 316L stainless steel rated 200 bar working (500 bar test). Uses sintered 316 mesh stainless elements (1-100 µm), ordered by grade (e.g. 136HP-BSPP-25T).',
  '{"filter_type": "high_pressure_filter", "max_pressure_bar": 200, "micron_ratings": "1 / 3 / 5 / 10 / 20 / 25 / 50 / 100 µm", "port_size": "1/2\" BSP", "temperature_range": "-20 ~ +200°C", "material": "316L (DIN 17440-1.4404), 씰: NBR/Viton", "flow_note": "수직 설치, 볼륨 115cc, 중량 2.1kg"}'::jsonb, true, 4930, '고압 인라인 필터 136hp 시리즈 (200 bar) high pressure in-line filter 136hp series (200 bar) 316l 고압 인라인 필터, 200bar, 1-100µm 엘리먼트 316l high-pressure in-line filter, 200 bar, 1-100 µm elements 136hp-bspp-xxt the water hydraulics co. ltd 여과 시스템 filtration high_pressure_filter 고압 필터 high pressure filter 200 1 / 3 / 5 / 10 / 20 / 25 / 50 / 100 µm 1/2" bsp -20 ~ +200°c 316l (din 17440-1.4404), 씰: nbr/viton 수직 설치, 볼륨 115cc, 중량 2.1kg')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-201bbsw', '201BBSW / 2M01BBSW / 2C01BBSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '4/2 솔레노이드 방향 제어 밸브', '4/2 Solenoid Directional Valve', 'DN6 4/2 솔레노이드 방향 제어 밸브 (스프링 리턴)', 'DN6 4/2 solenoid directional valve, spring return', '저점도 유체 전용으로 설계된 특허 4/2 방향 제어 밸브입니다. 24V DC 솔레노이드 구동에 수동 오버라이드가 기본이며, 더블 솔레노이드 디텐트 구성도 가능합니다. 스프링 위치는 P-B, A-T 연결입니다.', 'Patented 4/2 directional control valve designed for low-viscosity fluids. 24V DC solenoid actuation with manual override; double-solenoid detent configuration available. Sprung position joins P to B and A to T.',
  '{"valve_function": "4_2", "actuation": "solenoid", "nominal_size": "dn6", "max_inlet_pressure_bar": 160, "operating_pressure_range": "0-160 bar", "max_flow_lpm": 30, "cv_value": 0.62, "porting": "1/4\" BSPP / 매니폴드 / Cetop 3", "voltage": "24V DC", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 4940, '4/2 솔레노이드 방향 제어 밸브 4/2 solenoid directional valve dn6 4/2 솔레노이드 방향 제어 밸브 (스프링 리턴) dn6 4/2 solenoid directional valve, spring return 201bbsw / 2m01bbsw / 2c01bbsw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 4_2 4/2 밸브 4/2 valve solenoid 솔레노이드 solenoid dn6 dn6 dn6 160 0-160 bar 30 0.62 1/4" bspp / 매니폴드 / cetop 3 24v dc aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-201e-dn16-pilot', '201EJSW / 201EFSW / 201ELSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  'DN16 파일럿 작동 4/2 방향 제어 밸브', 'DN16 Pilot-Operated 4/2 Directional Valve', '물·공기·오일 파일럿 구동 DN16 4/2 밸브, 최대 140 L/min', 'Water, air or oil pilot DN16 4/2 valve, up to 140 L/min', '대유량 DN16 4/2 방향 제어 밸브로 물(EJ), 공기(EF), 오일(EL) 파일럿 구동이 가능합니다. 파일럿 피스톤 크기 조정으로 2-80bar의 파일럿 압력 대응이 가능하며, 일체형 DN3 솔레노이드 파일럿 밸브 사양(EESW)도 제공됩니다. 스프링 리턴 외 디텐트·파일럿 리턴 옵션이 있습니다.', 'High-flow DN16 4/2 directional valve with water (EJ), air (EF) or oil (EL) pilot actuation. The pilot piston can be sized for 2-80 bar pilot pressures, and a version with integral DN3 solenoid pilot (EESW) is offered. Detent and pilot-return options besides spring return.',
  '{"valve_function": "4_2", "actuation": "pilot", "nominal_size": "dn16", "max_inlet_pressure_bar": 160, "operating_pressure_range": "0-100 bar", "max_flow_lpm": 140, "cv_value": 5.0, "porting": "3/4\" BSPP", "voltage": "- (파일럿: 물/공기/오일, 표준 40 bar)", "body_material": "AISI 316 / 폴리머 / 마르텐사이트계 스테인리스"}'::jsonb, true, 4950, 'dn16 파일럿 작동 4/2 방향 제어 밸브 dn16 pilot-operated 4/2 directional valve 물·공기·오일 파일럿 구동 dn16 4/2 밸브, 최대 140 l/min water, air or oil pilot dn16 4/2 valve, up to 140 l/min 201ejsw / 201efsw / 201elsw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 4_2 4/2 밸브 4/2 valve pilot 파일럿 pilot dn16 dn16 dn16 160 0-100 bar 140 5.0 3/4" bspp - (파일럿: 물/공기/오일, 표준 40 bar) aisi 316 / 폴리머 / 마르텐사이트계 스테인리스')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-203bbsw', '203BBSW / 2M03BBSW / 2C03BBSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '3/2 솔레노이드 방향 제어 밸브 (스프링 클로즈드 P)', '3/2 Solenoid Directional Valve (Spring to Closed P)', 'DN6 3/2 솔레노이드 밸브, 스프링 위치에서 P 차단', 'DN6 3/2 solenoid valve, spring position closes P', '수돗물용 3/2 방향 제어 밸브로 스프링 위치에서 P 포트가 차단되는 노멀 클로즈드 사양입니다. 24V DC 솔레노이드 구동(수동 오버라이드 기본)이며 매니폴드, Cetop 3 마운트로도 공급됩니다.', '3/2 directional control valve for tap water, normally closed with the spring position blocking P. 24V DC solenoid actuation with manual override; also supplied in manifold and Cetop 3 mounts.',
  '{"valve_function": "3_2", "actuation": "solenoid", "nominal_size": "dn6", "max_inlet_pressure_bar": 160, "operating_pressure_range": "0-160 bar", "max_flow_lpm": 30, "cv_value": 0.62, "porting": "1/4\" BSPP / 매니폴드 / Cetop 3", "voltage": "24V DC", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 4960, '3/2 솔레노이드 방향 제어 밸브 (스프링 클로즈드 p) 3/2 solenoid directional valve (spring to closed p) dn6 3/2 솔레노이드 밸브, 스프링 위치에서 p 차단 dn6 3/2 solenoid valve, spring position closes p 203bbsw / 2m03bbsw / 2c03bbsw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 3_2 3/2 밸브 3/2 valve solenoid 솔레노이드 solenoid dn6 dn6 dn6 160 0-160 bar 30 0.62 1/4" bspp / 매니폴드 / cetop 3 24v dc aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-203e-dn16-pilot', '203EJSW / 203EFSW / 203ELSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  'DN16 파일럿 작동 3/2 방향 제어 밸브 (N/C)', 'DN16 Pilot-Operated 3/2 Directional Valve (N/C)', '물·공기·오일 파일럿 구동 DN16 3/2 노멀 클로즈드 밸브', 'Water, air or oil pilot DN16 3/2 normally closed valve', '대유량 DN16 3/2 방향 제어 밸브(스프링 시 P 차단)로 물·공기·오일 파일럿 구동이 가능합니다. 4/3 오픈/클로즈드 센터 기능도 동일 시리즈에서 제공되며, 이 사이즈는 직동 솔레노이드 구동이 불가하여 파일럿 구동을 사용합니다.', 'High-flow DN16 3/2 directional valve (spring to closed P) with water, air or oil pilot actuation. 4/3 closed and open centre functions are also offered in the series; direct solenoid operation is not possible at this size.',
  '{"valve_function": "3_2", "actuation": "pilot", "nominal_size": "dn16", "max_inlet_pressure_bar": 160, "operating_pressure_range": "0-100 bar", "max_flow_lpm": 140, "cv_value": 5.0, "porting": "3/4\" BSPP", "voltage": "- (파일럿: 물/공기/오일, 표준 40 bar)", "body_material": "AISI 316 / 폴리머 / 마르텐사이트계 스테인리스"}'::jsonb, true, 4970, 'dn16 파일럿 작동 3/2 방향 제어 밸브 (n/c) dn16 pilot-operated 3/2 directional valve (n/c) 물·공기·오일 파일럿 구동 dn16 3/2 노멀 클로즈드 밸브 water, air or oil pilot dn16 3/2 normally closed valve 203ejsw / 203efsw / 203elsw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 3_2 3/2 밸브 3/2 valve pilot 파일럿 pilot dn16 dn16 dn16 160 0-100 bar 140 5.0 3/4" bspp - (파일럿: 물/공기/오일, 표준 40 bar) aisi 316 / 폴리머 / 마르텐사이트계 스테인리스')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-204axxw', '204AXXW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-flow-control-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '유량 제어 밸브 (DN3)', 'Flow Control Valve (DN3)', '썸휠 조절식 DN3 유량 제어 밸브, 0.1-200 bar', 'Thumb-wheel adjustable DN3 flow control valve, 0.1-200 bar', '나선형 포트를 통해 전 범위에서 정밀한 유량 제어를 제공하는 수돗물용 DN3 유량 제어 밸브입니다. 공구 없이 조절 가능한 외부 썸휠과 설정 보호용 잠금 나사가 기본 장착되어 있습니다. 고압 제트에 의한 유체 침식에 강한 재질로 장기간 설정이 유지됩니다.', 'DN3 flow control valve for tap water with helical ports giving precise control throughout the range. Supplied with an externally adjusted thumb wheel and a tamper-proof locking screw. Erosion-resistant materials preserve the long-term setting.',
  '{"control_type": "manual", "nominal_size": "dn3", "operating_pressure_range": "0.1-200 bar", "flow_range": "약 0-6 L/min (자유 유동 특성 그래프 기준)", "cv_value": 0.02, "adjustment_turns": 4, "porting": "1/4\" BSPP", "body_material": "AISI 316 / 폴리머", "media": "수돗물"}'::jsonb, true, 4980, '유량 제어 밸브 (dn3) flow control valve (dn3) 썸휠 조절식 dn3 유량 제어 밸브, 0.1-200 bar thumb-wheel adjustable dn3 flow control valve, 0.1-200 bar 204axxw the water hydraulics co. ltd 유량 제어 밸브 flow control valves manual 수동 조절식 manual adjustment dn3 dn3 dn3 0.1-200 bar 약 0-6 l/min (자유 유동 특성 그래프 기준) 0.02 4 1/4" bspp aisi 316 / 폴리머 수돗물')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-204bxxw', '204BXXW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-flow-control-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '유량 제어 밸브 (DN6)', 'Flow Control Valve (DN6)', '썸휠 조절식 DN6 유량 제어 밸브, 0.1-200 bar', 'Thumb-wheel adjustable DN6 flow control valve, 0.1-200 bar', '나선형 포트 설계의 수돗물용 DN6 유량 제어 밸브로 약 30 L/min까지의 유량을 정밀하게 제어합니다. 외부 썸휠 조절식이며 잠금 나사로 설정을 보호할 수 있습니다.', 'DN6 tap-water flow control valve with helical-port design, precisely controlling flows up to about 30 L/min. Externally adjusted thumb wheel with tamper-proof locking screw.',
  '{"control_type": "manual", "nominal_size": "dn6", "operating_pressure_range": "0.1-200 bar", "flow_range": "약 0-30 L/min (자유 유동 특성 그래프 기준)", "cv_value": 0.62, "adjustment_turns": 4, "porting": "1/4\" BSPP", "body_material": "AISI 316 / 폴리머", "media": "수돗물"}'::jsonb, true, 4990, '유량 제어 밸브 (dn6) flow control valve (dn6) 썸휠 조절식 dn6 유량 제어 밸브, 0.1-200 bar thumb-wheel adjustable dn6 flow control valve, 0.1-200 bar 204bxxw the water hydraulics co. ltd 유량 제어 밸브 flow control valves manual 수동 조절식 manual adjustment dn6 dn6 dn6 0.1-200 bar 약 0-30 l/min (자유 유동 특성 그래프 기준) 0.62 4 1/4" bspp aisi 316 / 폴리머 수돗물')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-206bbsw', '206BBSW / 2M06BBSW / 2C06BBSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '4/3 솔레노이드 방향 제어 밸브 (센터 클로즈드 P)', '4/3 Solenoid Directional Valve (Closed P Centre)', '센터 위치에서 P 차단·AB&T 연결형 DN6 4/3 솔레노이드 밸브', 'DN6 4/3 solenoid valve, centre position closed P with A, B & T connected', '수돗물(EU 98/83/EC)용 특허 설계 4/3 방향 제어 밸브로, 센터 위치에서 P 포트가 차단되고 A·B·T가 연결됩니다. 24V DC 솔레노이드 구동에 수동 오버라이드가 기본 제공되며 20bar 이상 구동 시 004-010 구동 카드가 필요합니다. 단품(BSPP), TWHC 매니폴드, Cetop 3 마운트로 공급됩니다.', 'Patented 4/3 directional control valve for tap water to EU 98/83/EC; the centre position blocks P with A, B and T connected. 24V DC solenoid actuation with manual override as standard; actuation card 004-010 is required above 20 bar. Available stand-alone (BSPP), TWHC manifold or Cetop 3 mount.',
  '{"valve_function": "4_3", "actuation": "solenoid", "nominal_size": "dn6", "max_inlet_pressure_bar": 200, "operating_pressure_range": "0-160 bar", "max_flow_lpm": 30, "cv_value": 0.62, "porting": "1/4\" BSPP / 매니폴드 / Cetop 3", "voltage": "24V DC", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5000, '4/3 솔레노이드 방향 제어 밸브 (센터 클로즈드 p) 4/3 solenoid directional valve (closed p centre) 센터 위치에서 p 차단·ab&t 연결형 dn6 4/3 솔레노이드 밸브 dn6 4/3 solenoid valve, centre position closed p with a, b & t connected 206bbsw / 2m06bbsw / 2c06bbsw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 4_3 4/3 밸브 4/3 valve solenoid 솔레노이드 solenoid dn6 dn6 dn6 200 0-160 bar 30 0.62 1/4" bspp / 매니폴드 / cetop 3 24v dc aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-206bgsw', '206BGSW / 2M06BGSW / 2C06BGSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '4/3 수동 방향 제어 밸브 (센터 클로즈드 P)', '4/3 Manual Directional Valve (Closed P Centre)', '레버 조작식 DN6 4/3 방향 제어 밸브, 센터 클로즈드 P', 'Lever-operated DN6 4/3 directional valve, closed P at centre', '수동(레버) 조작식 4/3 방향 제어 밸브로 센터 위치에서 P가 차단되고 A·B·T가 연결됩니다. 스프링 리턴 또는 디텐트 사양이 가능하며, 요청 시 듀플렉스 2205 재질로도 제작됩니다.', 'Manually (lever) operated 4/3 directional control valve; the centre position blocks P with A, B and T connected. Spring return or detent versions available; Duplex 2205 construction on request.',
  '{"valve_function": "4_3", "actuation": "manual", "nominal_size": "dn6", "max_inlet_pressure_bar": 200, "operating_pressure_range": "0-160 bar", "max_flow_lpm": 30, "cv_value": 0.62, "porting": "1/4\" BSPP / 매니폴드 / Cetop 3", "voltage": "-", "body_material": "AISI 316 / 폴리머 (듀플렉스 2205 옵션)"}'::jsonb, true, 5010, '4/3 수동 방향 제어 밸브 (센터 클로즈드 p) 4/3 manual directional valve (closed p centre) 레버 조작식 dn6 4/3 방향 제어 밸브, 센터 클로즈드 p lever-operated dn6 4/3 directional valve, closed p at centre 206bgsw / 2m06bgsw / 2c06bgsw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 4_3 4/3 밸브 4/3 valve manual 수동 manual dn6 dn6 dn6 200 0-160 bar 30 0.62 1/4" bspp / 매니폴드 / cetop 3 - aisi 316 / 폴리머 (듀플렉스 2205 옵션)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-208bbsw', '208BBSW / 2M08BBSW / 2C08BBSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '3/2 솔레노이드 방향 제어 밸브 (스프링 오픈 P)', '3/2 Solenoid Directional Valve (Spring to Open P)', 'DN6 3/2 솔레노이드 밸브, 스프링 위치에서 P 오픈', 'DN6 3/2 solenoid valve, spring position opens P', '수돗물용 3/2 방향 제어 밸브로 스프링 위치에서 P 포트가 열리는 노멀 오픈 사양입니다. 24V DC 솔레노이드 구동이며 매니폴드 및 Cetop 3 마운트가 가능합니다.', '3/2 directional control valve for tap water, normally open with the spring position opening P. 24V DC solenoid actuation; manifold and Cetop 3 mounting options available.',
  '{"valve_function": "3_2", "actuation": "solenoid", "nominal_size": "dn6", "max_inlet_pressure_bar": 160, "operating_pressure_range": "0-160 bar", "max_flow_lpm": 30, "cv_value": 0.62, "porting": "1/4\" BSPP / 매니폴드 / Cetop 3", "voltage": "24V DC", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5020, '3/2 솔레노이드 방향 제어 밸브 (스프링 오픈 p) 3/2 solenoid directional valve (spring to open p) dn6 3/2 솔레노이드 밸브, 스프링 위치에서 p 오픈 dn6 3/2 solenoid valve, spring position opens p 208bbsw / 2m08bbsw / 2c08bbsw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 3_2 3/2 밸브 3/2 valve solenoid 솔레노이드 solenoid dn6 dn6 dn6 160 0-160 bar 30 0.62 1/4" bspp / 매니폴드 / cetop 3 24v dc aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-208e-dn16-pilot', '208EJSW / 208EFSW / 208ELSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-directional-valves'), (select id from business_areas where slug = 'fluid-gas'),
  'DN16 파일럿 작동 3/2 방향 제어 밸브 (N/O)', 'DN16 Pilot-Operated 3/2 Directional Valve (N/O)', '물·공기·오일 파일럿 구동 DN16 3/2 노멀 오픈 밸브', 'Water, air or oil pilot DN16 3/2 normally open valve', '대유량 DN16 3/2 방향 제어 밸브(스프링 시 P 오픈)로 물·공기·오일 파일럿 구동이 가능합니다. 최대 140 L/min, 사용 압력 0-100bar이며 오일 파일럿의 경우 유체 간 오염 방지를 위한 이중 씰·에어 벤트 구조가 적용됩니다.', 'High-flow DN16 3/2 directional valve (spring to open P) with water, air or oil pilot actuation. Rated 0-100 bar and up to 140 L/min; the oil-pilot actuator has a dual seal and air vent to prevent cross contamination.',
  '{"valve_function": "3_2", "actuation": "pilot", "nominal_size": "dn16", "max_inlet_pressure_bar": 160, "operating_pressure_range": "0-100 bar", "max_flow_lpm": 140, "cv_value": 5.0, "porting": "3/4\" BSPP", "voltage": "- (파일럿: 물/공기/오일, 표준 40 bar)", "body_material": "AISI 316 / 폴리머 / 마르텐사이트계 스테인리스"}'::jsonb, true, 5030, 'dn16 파일럿 작동 3/2 방향 제어 밸브 (n/o) dn16 pilot-operated 3/2 directional valve (n/o) 물·공기·오일 파일럿 구동 dn16 3/2 노멀 오픈 밸브 water, air or oil pilot dn16 3/2 normally open valve 208ejsw / 208efsw / 208elsw the water hydraulics co. ltd 방향 제어 밸브 directional control valves 3_2 3/2 밸브 3/2 valve pilot 파일럿 pilot dn16 dn16 dn16 160 0-100 bar 140 5.0 3/4" bspp - (파일럿: 물/공기/오일, 표준 40 bar) aisi 316 / 폴리머 / 마르텐사이트계 스테인리스')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-209bxsw', '209BXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-pressure-control-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '감압 밸브 (DN6, 30-160 bar)', 'Pressure Reducing Valve (DN6, 30-160 bar)', '고압 설정용 DN6 감압 밸브, 30-100 / 70-160 bar 스프링', 'DN6 reducing valve for higher settings, 30-100 / 70-160 bar springs', '30-100bar 및 70-160bar 스프링 범위로 제공되는 고압 설정용 DN6 감압 밸브입니다. 설정 압력 부근에서 입구를 교축하는 동시에 서비스 라인을 탱크로 릴리브하여 에너지 손실을 최소화합니다.', 'DN6 reducing valve for higher settings, supplied with 30-100 bar or 70-160 bar spring ranges. Near the set pressure it restricts the inlet while relieving the service line to tank, minimising energy loss.',
  '{"valve_type": "reducing", "nominal_size": "dn6", "max_inlet_pressure_bar": 180, "setting_range": "30-100 / 70-160 bar", "max_flow_lpm": 30, "actuation": "spring", "porting": "1/4\" BSPP", "body_material": "316 스테인리스강 / 폴리머"}'::jsonb, true, 5040, '감압 밸브 (dn6, 30-160 bar) pressure reducing valve (dn6, 30-160 bar) 고압 설정용 dn6 감압 밸브, 30-100 / 70-160 bar 스프링 dn6 reducing valve for higher settings, 30-100 / 70-160 bar springs 209bxsw the water hydraulics co. ltd 압력 제어 밸브 pressure control valves reducing 감압 밸브 reducing valve dn6 dn6 dn6 180 30-100 / 70-160 bar 30 spring 스프링(기계식) spring (mechanical) 1/4" bspp 316 스테인리스강 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('water-hydraulics-210bxsw', '210BXSW', (select id from manufacturers where slug = 'water-hydraulics'), (select id from product_categories where slug = 'water-hydraulics-check-valves'), (select id from business_areas where slug = 'fluid-gas'),
  '체크 밸브 (DN6)', 'Check Valve (DN6)', '316 스테인리스 DN6 체크 밸브, 최대 30 L/min', '316 stainless DN6 check valve, up to 30 L/min', '316 스테인리스강과 고급 엔지니어링 폴리머로 제작된 수돗물용 체크 밸브입니다. 씰링과 유량 제어가 밸브 내 2개의 분리된 위치에서 이루어져 씰의 유체 침식을 최소화합니다. 표준 크래킹 압력은 0.6bar이며 0.1-3bar 범위에서 지정 가능합니다.', 'Tap-water check valve in 316 stainless steel and engineering polymer. Sealing and flow control occur at two separate positions, minimising seal flow erosion. Standard cracking pressure 0.6 bar, specifiable from 0.1 to 3 bar.',
  '{"valve_type": "check", "nominal_size": "dn6", "pressure_range": "0.1-200 bar", "cv_value": 0.65, "max_flow_lpm": 30, "porting": "1/4\" BSPP", "cracking_pressure": "표준 0.6 bar (0.1-3 bar 지정 가능)", "body_material": "AISI 316 / 폴리머"}'::jsonb, true, 5050, '체크 밸브 (dn6) check valve (dn6) 316 스테인리스 dn6 체크 밸브, 최대 30 l/min 316 stainless dn6 check valve, up to 30 l/min 210bxsw the water hydraulics co. ltd 체크·안전 밸브 check & safety valves check 체크 밸브 check valve dn6 dn6 dn6 0.1-200 bar 0.65 30 1/4" bspp 표준 0.6 bar (0.1-3 bar 지정 가능) aisi 316 / 폴리머')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

commit;
