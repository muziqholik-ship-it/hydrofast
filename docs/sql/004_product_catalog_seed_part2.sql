-- 004_product_catalog_seed — part 2/5
-- Run parts in order (1 → 5) in the Supabase SQL Editor. Idempotent.

begin;

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-ecl-1-7', 'ECL 1-7', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-capacitive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ECL 1-7 정전용량식 온/오프 레벨 센서', 'ECL 1-7 On/Off Capacitive Electronic Level Sensor', '가동부 없는 정전용량식 레벨 센서 (NPN 출력, G1/2 황동)', 'Capacitive level sensor with no moving parts (NPN output, brass G1/2)', '가동부 없이 정전용량 방식으로 유체 유무를 감지하는 온/오프 전자식 레벨 센서입니다. 황동 바디 G1/2 나사, NPN 최대 50mA 출력, 공급 전압 5~18V 사양이며 ECL1은 0.2bar, ECL7은 25bar 사용 압력에 대응합니다. 역극성 보호와 50mA 전류 제한을 내장합니다.', 'On/off capacitive electronic level sensor with no moving parts. Brass G1/2 body, NPN output max 50 mA, 5-18 V supply; ECL1 rated 0.2 bar, ECL7 25 bar working pressure. Built-in reverse polarity protection and 50 mA current limiting.',
  '{"output_signal": "NPN 온/오프 (최대 50mA)", "supply_voltage": "5~18 V", "ntc_included": false, "working_pressure": "ECL1: 0.2bar / ECL7: 25bar", "body_material": "황동", "process_connection": "G1/2", "electrical_connection": "AMP SS 1.5 3핀 커넥터 (기타 요청 시)", "protection_rating": "IP65 / IP67", "ambient_temp": "-25~+80°C", "fluid_temp": "-20~+125°C", "media": "오일·수용성 절삭유·물·경유 (사용 유체 지정 필요)"}'::jsonb, true, 670, 'ecl 1-7 정전용량식 온/오프 레벨 센서 ecl 1-7 on/off capacitive electronic level sensor 가동부 없는 정전용량식 레벨 센서 (npn 출력, g1/2 황동) capacitive level sensor with no moving parts (npn output, brass g1/2) ecl 1-7 euroswitch 정전용량식 레벨 센서 capacitive level sensors npn 온/오프 (최대 50ma) 5~18 v false ecl1: 0.2bar / ecl7: 25bar 황동 g1/2 amp ss 1.5 3핀 커넥터 (기타 요청 시) ip65 / ip67 -25~+80°c -20~+125°c 오일·수용성 절삭유·물·경유 (사용 유체 지정 필요)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-eclt-0-6', 'ECLT 0-6', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-capacitive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ECLT 0-6 NTC 내장 정전용량식 레벨 센서', 'ECLT 0-6 Capacitive Electronic Level Sensor with NTC', '레벨 감지 + NTC 온도 출력 일체형 정전용량식 센서', 'Capacitive sensor combining level detection and NTC temperature output', '정전용량식 레벨 감지에 NTC 서미스터(25°C 기준 2.2kΩ, B25/50=3950) 온도 출력을 통합한 전자식 센서입니다. 황동 바디 G1/2, 공급 전압 5~24V, 레벨 출력 0.5~4.5V(설정 커스텀 가능) 사양이며 ECLT0은 0.2bar, ECLT6은 25bar에 대응합니다.', 'Capacitive level sensor with integrated NTC thermistor output (2.2 kΩ at 25°C, B25/50=3950). Brass G1/2 body, 5-24 V supply, level output 0.5-4.5 V (custom setting on request); ECLT0 rated 0.2 bar, ECLT6 25 bar.',
  '{"output_signal": "레벨 0.5~4.5V (설정 커스텀 가능) + NTC 온도 출력", "supply_voltage": "5~24 V", "ntc_included": true, "working_pressure": "ECLT0: 0.2bar / ECLT6: 25bar", "body_material": "황동", "process_connection": "G1/2", "electrical_connection": "AMP SS 1.5 4핀 커넥터 (기타 요청 시)", "protection_rating": "IP65 / IP67", "ambient_temp": "-25~+80°C", "fluid_temp": "-20~+125°C", "media": "오일·수용성 절삭유·물·경유 (사용 유체 지정 필요)"}'::jsonb, true, 680, 'eclt 0-6 ntc 내장 정전용량식 레벨 센서 eclt 0-6 capacitive electronic level sensor with ntc 레벨 감지 + ntc 온도 출력 일체형 정전용량식 센서 capacitive sensor combining level detection and ntc temperature output eclt 0-6 euroswitch 정전용량식 레벨 센서 capacitive level sensors 레벨 0.5~4.5v (설정 커스텀 가능) + ntc 온도 출력 5~24 v true eclt0: 0.2bar / eclt6: 25bar 황동 g1/2 amp ss 1.5 4핀 커넥터 (기타 요청 시) ip65 / ip67 -25~+80°c -20~+125°c 오일·수용성 절삭유·물·경유 (사용 유체 지정 필요)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-esl', 'ESL', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-analog-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ESL 아날로그 4-20mA 레벨·온도 센서', 'ESL Analog 4-20 mA Level and Temperature Sensor', '4-20mA + PNP 디지털 출력 2점(프로그래머블) 스테인리스 레벨 센서', 'Stainless level sensor with 4-20 mA output and 2 programmable PNP digital outputs', '4-20mA 아날로그 출력과 프로그래머블 PNP 디지털 출력 2점(레벨/온도, 표준 설정 PIN3 온도 80°C N.C., PIN4 레벨 100 N.C.)을 제공하는 레벨 센서입니다. SCD 4.0 구성 장치나 Euroswitch를 통해 설정값과 히스테리시스를 변경할 수 있습니다. AISI 316 케이스/스템, M12 커넥터, IP65/IP67 사양입니다.', 'Level sensor with 4-20 mA analog output and two programmable PNP digital outputs (level/temperature; standard setting PIN3 T.80°C N.C., PIN4 L.100 N.C.), configurable with the SCD 4.0 device or by Euroswitch. AISI 316 case/stem, M12 connection, IP65/IP67.',
  '{"output_signal": "아날로그 4-20mA", "digital_outputs": "PNP N.O./N.C. 2점 (레벨/온도, 최대 0.2A, 지연시간 설정)", "supply_voltage": "10~32 Vdc", "fixing": "G1\" (AISI 316)", "stem_material": "스테인리스 AISI 316", "float_material": "NBR", "length_range": "L = 100~2000mm (50mm 단위)", "resolution_pitch": null, "protection_rating": "IP65 / IP67", "operating_temp": "주위 -25~+60°C / 유체 -20~+95°C", "min_specific_gravity": "0.6", "media": "오일·수용성 절삭유·물·경유"}'::jsonb, true, 690, 'esl 아날로그 4-20ma 레벨·온도 센서 esl analog 4-20 ma level and temperature sensor 4-20ma + pnp 디지털 출력 2점(프로그래머블) 스테인리스 레벨 센서 stainless level sensor with 4-20 ma output and 2 programmable pnp digital outputs esl euroswitch 아날로그 레벨 센서 (4-20ma) analog level sensors (4-20 ma) 아날로그 4-20ma pnp n.o./n.c. 2점 (레벨/온도, 최대 0.2a, 지연시간 설정) 10~32 vdc g1" (aisi 316) 스테인리스 aisi 316 nbr l = 100~2000mm (50mm 단위) ip65 / ip67 주위 -25~+60°c / 유체 -20~+95°c 0.6 오일·수용성 절삭유·물·경유')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-eslt-io', 'ESLT-IO', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-analog-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IO-Link 레벨 센서 ESLT-IO', 'ESLT-IO IO-Link Level Sensor', '레벨과 온도를 IO-Link 디지털 출력으로 동시에 전송하는 연속식 레벨 센서입니다.', 'Continuous level sensor transmitting level and temperature over IO-Link.', 'ESLT-IO는 IO-Link 통신으로 레벨(정확도 ±10/20mm)과 온도(-20~+95°C, ±2.5°C)를 동시에 측정·전송하는 산업용 레벨 센서입니다. AISI 316 스테인리스 스템과 NBR 플로트를 사용하며, 전체 길이 100~2000mm(50mm 단위)로 주문할 수 있습니다. 오일, 수용성 쿨런트, 물, 경유 등 다양한 유체에 사용 가능합니다.', 'The ESLT-IO is an industrial level sensor that measures and transmits both level (accuracy ±10/20 mm) and temperature (-20 to +95°C, ±2.5°C) over IO-Link. It features an AISI 316 stainless steel stem and NBR float, with total lengths of 100-2000 mm in 50 mm steps, for oils, water-based coolants, water and diesel.',
  '{"output_signal": "IO-Link (레벨 + 온도)", "supply_voltage": "24 VDC ±10%", "fixing": "G1\" 나사식", "stem_material": "AISI 316", "float_material": "NBR", "length_range": "100-2000 mm (50 mm 단위)", "resolution_pitch": "±10/20 mm", "protection_rating": "IP65 / IP67", "operating_temp": "유체 -25~+95°C, 주위 -25~+80°C", "min_specific_gravity": "> 0.6", "media": "오일, 수용성 쿨런트, 물, 경유"}'::jsonb, true, 700, 'io-link 레벨 센서 eslt-io eslt-io io-link level sensor 레벨과 온도를 io-link 디지털 출력으로 동시에 전송하는 연속식 레벨 센서입니다. continuous level sensor transmitting level and temperature over io-link. eslt-io euroswitch 아날로그 레벨 센서 (4-20ma) analog level sensors (4-20 ma) io-link (레벨 + 온도) 24 vdc ±10% g1" 나사식 aisi 316 nbr 100-2000 mm (50 mm 단위) ±10/20 mm ip65 / ip67 유체 -25~+95°c, 주위 -25~+80°c > 0.6 오일, 수용성 쿨런트, 물, 경유')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-esp1', 'ESP1', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-pressure-transmitters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ESP1 세라믹 압력 트랜스미터 (전압 출력)', 'ESP1 Pressure Transmitter Ceramic - Output Voltage', '0-10V / 1-5V / 0.5-4.5V 전압 출력 세라믹 압력 트랜스미터', 'Ceramic pressure transmitter with 0-10 V, 1-5 V or 0.5-4.5 V voltage output', '세라믹 측정 셀 기반의 전압 출력형 압력 트랜스미터입니다. 0~10V(15-30Vdc), 1~5V(10-30Vdc), 0.5~4.5V(9.5-30Vdc) 출력 사양을 선택할 수 있으며, 측정 범위는 -1~1 bar부터 0~600 bar까지 제공됩니다. AISI 316L 바디와 G1/4 DIN 3852-E 접속, IP67 등급입니다.', 'Voltage-output pressure transmitter based on a ceramic measuring cell. Output options 0-10 V (15-30 Vdc supply), 1-5 V (10-30 Vdc) and 0.5-4.5 V (9.5-30 Vdc); measuring ranges from -1 to 1 bar up to 0-600 bar. AISI 316L body, G1/4 DIN 3852-E connection, IP67.',
  '{"measuring_range": "-1~1 / -1~9 / 0~2 ... 0~600 bar (17개 범위)", "max_range_bar": 600, "output_signal": "0-10 V / 1-5 V / 0.5-4.5 V", "supply_voltage": "9.5-30 Vdc (출력 사양에 따라 상이)", "accuracy": "typ ≤±0.5% span (저압 범위 ≤±1%), 열드리프트 ≤1.5% (10-50°C)", "process_connection": "G1/4 실린더 DIN 3852-E", "electrical_connection": "M12x1 (표준), Deutsch DT04-3P, 케이블", "protection_class": "IP67", "response_time": "≤ 2 ms", "media_temp_range": "0 ~ +80°C (옵션 -40 ~ +105°C)"}'::jsonb, true, 710, 'esp1 세라믹 압력 트랜스미터 (전압 출력) esp1 pressure transmitter ceramic - output voltage 0-10v / 1-5v / 0.5-4.5v 전압 출력 세라믹 압력 트랜스미터 ceramic pressure transmitter with 0-10 v, 1-5 v or 0.5-4.5 v voltage output esp1 euroswitch 압력 트랜스미터 / 전자식 압력 스위치 pressure transmitters / electronic pressure switches -1~1 / -1~9 / 0~2 ... 0~600 bar (17개 범위) 600 0-10 v / 1-5 v / 0.5-4.5 v 9.5-30 vdc (출력 사양에 따라 상이) typ ≤±0.5% span (저압 범위 ≤±1%), 열드리프트 ≤1.5% (10-50°c) g1/4 실린더 din 3852-e m12x1 (표준), deutsch dt04-3p, 케이블 ip67 ≤ 2 ms 0 ~ +80°c (옵션 -40 ~ +105°c)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-esp10', 'ESP10', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-pressure-transmitters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ESP10 세라믹 압력 트랜스미터 (4-20mA)', 'ESP10 Pressure Transmitter Ceramic - Output 4-20 mA', '세라믹 셀 기반 4-20mA 압력 트랜스미터, -1~600 bar', 'Ceramic-cell pressure transmitter with 4-20 mA output, ranges -1 to 600 bar', '세라믹 측정 셀을 사용한 컴팩트 압력 트랜스미터로 4-20mA 2선식 출력을 제공합니다. 측정 범위는 -1~1 bar부터 0~600 bar까지 17개 사양이 있으며, 정확도는 대부분 범위에서 typ ±0.5% span입니다. AISI 316L 바디, G1/4 DIN 3852-E 접속, M12x1·Deutsch DT04-3P·케이블 전기 접속을 지원합니다.', 'Compact pressure transmitter with ceramic measuring cell and 4-20 mA two-wire output. Seventeen measuring ranges from -1 to 1 bar up to 0-600 bar; accuracy typically ±0.5% of span for most ranges. AISI 316L body, G1/4 DIN 3852-E process connection, M12x1, Deutsch DT04-3P or cable electrical connection.',
  '{"measuring_range": "-1~1 / -1~9 / 0~2 ... 0~600 bar (17개 범위)", "max_range_bar": 600, "output_signal": "4-20 mA (2선식)", "supply_voltage": "8-30 Vdc", "accuracy": "typ ≤±0.5% span (저압 범위 ≤±1%), 열드리프트 ≤1.5% (10-50°C)", "process_connection": "G1/4 실린더 DIN 3852-E", "electrical_connection": "M12x1, Deutsch DT04-3P, 케이블", "protection_class": "IP67", "response_time": "≤ 2 ms", "media_temp_range": "0 ~ +80°C (옵션 -40 ~ +105°C)"}'::jsonb, true, 720, 'esp10 세라믹 압력 트랜스미터 (4-20ma) esp10 pressure transmitter ceramic - output 4-20 ma 세라믹 셀 기반 4-20ma 압력 트랜스미터, -1~600 bar ceramic-cell pressure transmitter with 4-20 ma output, ranges -1 to 600 bar esp10 euroswitch 압력 트랜스미터 / 전자식 압력 스위치 pressure transmitters / electronic pressure switches -1~1 / -1~9 / 0~2 ... 0~600 bar (17개 범위) 600 4-20 ma (2선식) 8-30 vdc typ ≤±0.5% span (저압 범위 ≤±1%), 열드리프트 ≤1.5% (10-50°c) g1/4 실린더 din 3852-e m12x1, deutsch dt04-3p, 케이블 ip67 ≤ 2 ms 0 ~ +80°c (옵션 -40 ~ +105°c)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-espd', 'ESPD', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-pressure-transmitters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ESPD 전자식 압력 스위치 (디지털 2출력)', 'ESPD Electronic Pressure Switch with 2 Digital Outputs', '프로그래머블 PNP 디지털 2출력의 전자식 압력 스위치', 'Electronic pressure switch with two programmable PNP digital outputs', '세라믹 셀 기반의 전자식 압력 스위치로, 설정점과 NO/NC 상태를 프로그래밍할 수 있는 2개의 PNP 디지털 출력(최대 부하 각 0.2A)을 제공합니다. 기본 설정은 출력1이 FS의 50%, 출력2가 100%이며 SCD 4.0 프로그래머 또는 공장에서 변경할 수 있습니다. 측정 범위는 -1~1 bar부터 0~600 bar까지, 보호 등급은 IP67입니다.', 'Electronic pressure switch based on a ceramic cell with two programmable PNP digital outputs (max load 0.2 A each) whose set points and NO/NC states are configurable via the SCD 4.0 programmer or at the factory (defaults 50% and 100% of FS). Measuring ranges from -1 to 1 bar up to 0-600 bar; protection degree IP67.',
  '{"measuring_range": "-1~1 / -1~9 / 0~2 ... 0~600 bar", "max_range_bar": 600, "output_signal": "PNP 디지털 2점 (프로그래머블, 최대 0.2A)", "supply_voltage": "10-30 Vdc ±10%", "accuracy": "typ ≤±0.5% span (저압 범위 ≤±1%), 열드리프트 ≤1.5% (10-50°C)", "process_connection": "G1/4 실린더 DIN 3852-E", "electrical_connection": "M12x1 (표준), 케이블", "protection_class": "IP67", "response_time": "≤ 4 ms", "media_temp_range": "0 ~ +80°C (옵션 -40 ~ +105°C)"}'::jsonb, true, 730, 'espd 전자식 압력 스위치 (디지털 2출력) espd electronic pressure switch with 2 digital outputs 프로그래머블 pnp 디지털 2출력의 전자식 압력 스위치 electronic pressure switch with two programmable pnp digital outputs espd euroswitch 압력 트랜스미터 / 전자식 압력 스위치 pressure transmitters / electronic pressure switches -1~1 / -1~9 / 0~2 ... 0~600 bar 600 pnp 디지털 2점 (프로그래머블, 최대 0.2a) 10-30 vdc ±10% typ ≤±0.5% span (저압 범위 ≤±1%), 열드리프트 ≤1.5% (10-50°c) g1/4 실린더 din 3852-e m12x1 (표준), 케이블 ip67 ≤ 4 ms 0 ~ +80°c (옵션 -40 ~ +105°c)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-est', 'EST', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-temperature-transmitters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EST 온도 트랜스미터 (4-20 mA + 디지털 2점)', 'EST Temperature Transmitter 4-20 mA with 2 Programmable Digital Outputs', '4-20 mA 출력과 프로그래머블 PNP 디지털 출력 2점을 갖춘 온도 트랜스미터', 'Temperature transmitter with 4-20 mA output and 2 programmable PNP digital outputs', 'EST 시리즈는 4-20 mA 아날로그 출력과 함께 NO/NC 및 히스테리시스를 프로그래밍할 수 있는 PNP 디지털 출력 2점(최대 부하 0.2 A)을 제공하는 온도 트랜스미터입니다. 디지털 출력은 공장 설정 또는 SCD 프로그래머로 설정할 수 있습니다. G1" 나사, Ø8 프로브(길이 85~800 mm 선택), 공급 전압 24 V ±10%, 유체 온도 -25~+95°C, 최대 압력 210 bar, IP65/IP67, M12 커넥터, AISI 316 바디입니다.', 'The EST series temperature transmitter provides a 4-20 mA analogue output plus two PNP digital outputs (max load 0.2 A) programmable for NO/NC and hysteresis, either at the factory or via the SCD device. It features a G1" thread, Ø8 probe with lengths from 85 to 800 mm, 24 V ±10% supply, fluid temperature -25 to +95 °C, 210 bar max pressure, IP65/IP67, M12 connector and AISI 316 body.',
  '{"output_signal": "4_20_ma", "fluid_temperature_range": "-25~+95°C (동작 온도 -25~+80°C)", "supply_voltage": "24 V DC ±10% (역극성 보호)", "max_pressure_bar": 210, "process_connection": "G1\", 프로브 Ø8", "electrical_connection": "M12 커넥터 (5핀)", "protection_class": "IP65 / IP67", "body_material": "AISI 316 스테인리스", "digital_outputs": 2, "probe_length_options": "L2: 85, 100, 150, 200, 250, 300, 350, 500, 700, 800 mm"}'::jsonb, true, 740, 'est 온도 트랜스미터 (4-20 ma + 디지털 2점) est temperature transmitter 4-20 ma with 2 programmable digital outputs 4-20 ma 출력과 프로그래머블 pnp 디지털 출력 2점을 갖춘 온도 트랜스미터 temperature transmitter with 4-20 ma output and 2 programmable pnp digital outputs est euroswitch 온도 트랜스미터 / 전자식 온도 센서 temperature transmitters / electronic temperature sensors 4_20_ma 4-20 ma 아날로그 4-20 ma analogue -25~+95°c (동작 온도 -25~+80°c) 24 v dc ±10% (역극성 보호) 210 g1", 프로브 ø8 m12 커넥터 (5핀) ip65 / ip67 aisi 316 스테인리스 2 l2: 85, 100, 150, 200, 250, 300, 350, 500, 700, 800 mm')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-est-io', 'EST-IO', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-temperature-transmitters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EST-IO IO-Link 온도 트랜스미터', 'EST-IO IO-Link Temperature Transmitter', 'IO-Link 통신 출력의 산업용 온도 트랜스미터', 'Industrial temperature transmitter with IO-Link output', 'EST-IO 시리즈는 IO-Link 통신으로 온도 데이터를 전송하는 산업용 온도 트랜스미터입니다(코드 ESTI 120). 오일, 수용성 절삭유, 물, 경유 등에 사용되며 G1" 나사, Ø8 프로브(길이 85~800 mm), 공급 전압 24 V ±10%, 사용 온도 -25~+95°C, 보호 등급 IP65/IP67, M12 커넥터, AISI 316 바디/스템 사양입니다.', 'The EST-IO series (code ESTI 120) is an industrial temperature transmitter communicating via IO-Link. Suitable for oils, water-based coolants, water and diesel, it features a G1" thread, Ø8 probe (lengths 85-800 mm), 24 V ±10% supply, working temperature -25 to +95 °C, IP65/IP67 protection, M12 connector and AISI 316 case/stem.',
  '{"output_signal": "io_link", "fluid_temperature_range": "-25~+95°C", "supply_voltage": "24 V DC ±10% (역극성 보호)", "max_pressure_bar": null, "process_connection": "G1\", 프로브 Ø8", "electrical_connection": "M12 커넥터 (IO-Link, CQ 핀 4)", "protection_class": "IP65 / IP67", "body_material": "AISI 316 스테인리스", "digital_outputs": 0, "probe_length_options": "L2: 85, 100, 150, 200, 250, 300, 350, 500, 700, 800 mm"}'::jsonb, true, 750, 'est-io io-link 온도 트랜스미터 est-io io-link temperature transmitter io-link 통신 출력의 산업용 온도 트랜스미터 industrial temperature transmitter with io-link output est-io euroswitch 온도 트랜스미터 / 전자식 온도 센서 temperature transmitters / electronic temperature sensors io_link io-link io-link -25~+95°c 24 v dc ±10% (역극성 보호) g1", 프로브 ø8 m12 커넥터 (io-link, cq 핀 4) ip65 / ip67 aisi 316 스테인리스 0 l2: 85, 100, 150, 200, 250, 300, 350, 500, 700, 800 mm')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-est-pz', 'EST-PZ1 / EST-PZ2', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-temperature-accessories'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EST-PZ 온도 센서용 보호관(써모웰)', 'EST-PZ Thermowell for Temperature Sensors', '유체 누출 없이 센서 탈착이 가능한 AISI 316 보호관', 'AISI 316 thermowell allowing sensor removal without fluid leakage', 'EST-PZ 보호관(써모웰)은 배관·탱크에서 유체를 배출하지 않고 온도 센서를 탈착할 수 있게 해주는 액세서리입니다. EST-PZ1은 G1"에서 G1/2"로, EST-PZ2는 G1/2"(DIN3852-2)에서 G1/2"로 변환하며, AISI 316 재질로 고압 및 부식성 유체에 대한 보호 성능을 제공합니다.', 'The EST-PZ thermowell allows temperature sensors to be removed from pipes or tanks without draining the fluid. EST-PZ1 adapts a G1" process connection to G1/2", while EST-PZ2 adapts G1/2" (DIN3852-2) to G1/2". Made of AISI 316, it offers high pressure resistance and protection against aggressive media.',
  '{"model_variants": "EST-PZ1 (G1\" → G1/2\") / EST-PZ2 (G1/2\" → G1/2\")", "material": "AISI 316 스테인리스", "process_connection": "EST-PZ1: G1\" / EST-PZ2: G1/2\"A DIN3852-2", "sensor_connection": "G1/2\"", "overall_length": "EST-PZ1: 87.5 mm / EST-PZ2: 55 mm", "well_bore_diameter_mm": 12}'::jsonb, true, 760, 'est-pz 온도 센서용 보호관(써모웰) est-pz thermowell for temperature sensors 유체 누출 없이 센서 탈착이 가능한 aisi 316 보호관 aisi 316 thermowell allowing sensor removal without fluid leakage est-pz1 / est-pz2 euroswitch 온도 센서 액세서리 temperature sensor accessories est-pz1 (g1" → g1/2") / est-pz2 (g1/2" → g1/2") aisi 316 스테인리스 est-pz1: g1" / est-pz2: g1/2"a din3852-2 g1/2" est-pz1: 87.5 mm / est-pz2: 55 mm 12')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-est2', 'EST2', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-temperature-transmitters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'EST2 온도/레벨 복합 트랜스미터 (4-20 mA + 디지털 2점)', 'EST2 Temperature/Level Transmitter 4-20 mA with 2 Programmable Digital Outputs', '온도 4-20 mA 출력과 레벨/온도 겸용 디지털 출력 2점의 복합 트랜스미터', 'Combined transmitter with 4-20 mA temperature output and 2 digital outputs assignable to level or temperature', 'EST2 시리즈는 온도를 4-20 mA(±1°C)로 출력하면서, 레벨 또는 온도에 할당 가능한 프로그래머블 PNP 디지털 출력 2점(최대 부하 0.2 A, 지연 시간 설정 가능)을 제공하는 온도/레벨 복합 트랜스미터입니다. 오일, 수용성 절삭유, 물, 경유 등에 사용되며 G1" 나사, Ø13 스템(요청 시 최대 2000 mm), NBR 플로트, 공급 전압 24 V ±10%, 사용 온도 -25~+95°C, IP65/IP67, M12 커넥터, AISI 316 바디/스템 사양입니다. 액체 비중은 0.6 이상이어야 합니다.', 'The EST2 series is a combined temperature/level transmitter with a 4-20 mA (±1 °C) temperature output and two programmable PNP digital outputs (max load 0.2 A, settable delay time) assignable to level or temperature thresholds. Suitable for oils, water-based coolants, water and diesel, it features a G1" thread, Ø13 stem (up to 2000 mm on request), NBR float, 24 V ±10% supply, working temperature -25 to +95 °C, IP65/IP67, M12 connector and AISI 316 case/stem. Liquid specific gravity must exceed 0.6.',
  '{"output_signal": "4_20_ma", "fluid_temperature_range": "-25~+95°C", "supply_voltage": "24 V DC ±10% (역극성 보호)", "max_pressure_bar": null, "process_connection": "G1\", 스템 Ø13 (플로트 Ø30)", "electrical_connection": "M12 커넥터 (5핀)", "protection_class": "IP65 / IP67", "body_material": "AISI 316 스테인리스 (플로트/O-링 NBR)", "digital_outputs": 2, "probe_length_options": "요청 사양, 최대 2000 mm"}'::jsonb, true, 770, 'est2 온도/레벨 복합 트랜스미터 (4-20 ma + 디지털 2점) est2 temperature/level transmitter 4-20 ma with 2 programmable digital outputs 온도 4-20 ma 출력과 레벨/온도 겸용 디지털 출력 2점의 복합 트랜스미터 combined transmitter with 4-20 ma temperature output and 2 digital outputs assignable to level or temperature est2 euroswitch 온도 트랜스미터 / 전자식 온도 센서 temperature transmitters / electronic temperature sensors 4_20_ma 4-20 ma 아날로그 4-20 ma analogue -25~+95°c 24 v dc ±10% (역극성 보호) g1", 스템 ø13 (플로트 ø30) m12 커넥터 (5핀) ip65 / ip67 aisi 316 스테인리스 (플로트/o-링 nbr) 2 요청 사양, 최대 2000 mm')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-ests', 'ESTS', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-temperature-transmitters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ESTS 소형 전자식 온도 센서 (4-20 mA)', 'ESTS Electronic Sensor Temperature Small 4-20 mA', 'M12 커넥터·250 bar 대응 소형 4-20 mA 온도 트랜스미터', 'Miniature 4-20 mA temperature transmitter, M12 connector, up to 250 bar', 'ESTS는 소형화된 전자식 온도 트랜스미터로 4-20 mA 아날로그 출력을 제공합니다(센서 자체 출력 범위 2-24 mA). G1/4" 또는 G1/2"(DIN3852-2) 나사와 Ø6, 50 mm 프로브 구조이며, HT(-15/+125°C)·LT(-24/+80°C) 두 가지 유체 온도 버전이 있습니다. 공급 전압 10-32 Vdc, 역극성 보호 내장, 최대 압력 250 bar, 보호 등급 IP65/IP67, M12 커넥터, AISI 316 바디, EMC EN61326 2-3:2013 적합입니다.', 'The ESTS is a miniaturised electronic temperature transmitter with 4-20 mA analogue output (sensor output range 2-24 mA). It features G1/4" or G1/2" (DIN3852-2) threads with a Ø6 x 50 mm probe, in HT (-15/+125 °C) and LT (-24/+80 °C) fluid temperature versions. Supply 10-32 Vdc with reverse polarity protection, max pressure 250 bar, IP65/IP67, M12 connector, AISI 316 body, EMC per EN61326 2-3:2013.',
  '{"output_signal": "4_20_ma", "fluid_temperature_range": "HT: -15~+125°C / LT: -24~+80°C (주위 온도 -20~+80°C)", "supply_voltage": "10~32 V DC (역극성 보호)", "max_pressure_bar": 250, "process_connection": "G1/4\"A 또는 G1/2\"A (DIN3852-2), 프로브 Ø6 x 50 mm", "electrical_connection": "M12 커넥터", "protection_class": "IP65 / IP67", "body_material": "AISI 316 스테인리스", "digital_outputs": 0, "probe_length_options": "50 mm"}'::jsonb, true, 780, 'ests 소형 전자식 온도 센서 (4-20 ma) ests electronic sensor temperature small 4-20 ma m12 커넥터·250 bar 대응 소형 4-20 ma 온도 트랜스미터 miniature 4-20 ma temperature transmitter, m12 connector, up to 250 bar ests euroswitch 온도 트랜스미터 / 전자식 온도 센서 temperature transmitters / electronic temperature sensors 4_20_ma 4-20 ma 아날로그 4-20 ma analogue ht: -15~+125°c / lt: -24~+80°c (주위 온도 -20~+80°c) 10~32 v dc (역극성 보호) 250 g1/4"a 또는 g1/2"a (din3852-2), 프로브 ø6 x 50 mm m12 커넥터 ip65 / ip67 aisi 316 스테인리스 0 50 mm')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-i930-i935', 'I930-I935', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-reed-position-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'I930-I935 리드 위치 센서', 'I930-I935 Reed Position Sensors', 'M8x1.25 알루미늄 하우징 리드 위치 센서', 'Reed position sensors in M8x1.25 aluminum housing', '자석의 접근을 리드 접점으로 감지하는 소형 위치 센서입니다. M8x1.25 양극산화 알루미늄 하우징에 500mm PVC 케이블 사양이며, I930은 원통형, I935는 육각 렌치 타입입니다. -40~+80°C에서 사용 가능합니다.', 'Compact position sensors detecting magnet proximity via a reed contact. M8x1.25 anodized aluminum housing with 500 mm PVC cable; I930 cylindrical, I935 hex-body. Working temperature -40 to +80°C.',
  '{"stem_material": "양극산화 알루미늄 M8x1.25", "electrical_connection": "케이블 500mm PVC", "contact_type": "Reed N.O.", "max_switching_power_w": 10, "max_switching_current_a": 0.5, "max_switching_voltage": "<50 V", "operating_temp": "-40~+80°C", "weight_g": "약 10~12g"}'::jsonb, true, 790, 'i930-i935 리드 위치 센서 i930-i935 reed position sensors m8x1.25 알루미늄 하우징 리드 위치 센서 reed position sensors in m8x1.25 aluminum housing i930-i935 euroswitch 리드 위치 센서 reed position sensors 양극산화 알루미늄 m8x1.25 케이블 500mm pvc reed n.o. 10 0.5 <50 v -40~+80°c 약 10~12g')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imd', 'IMD', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMD 스테인리스 전자기식 레벨 센서 (단자함형)', 'IMD Stainless Steel Electromagnetic Level Sensor with Junction Box', '2" gas 스테인리스, 알루미늄 단자함 채용 레벨 스위치 (L 100~2000mm)', '2" gas stainless level switch with aluminum junction box (L 100-2000 mm)', '2" gas 스테인리스 고정과 알루미늄 단자함을 채용한 수직 레벨 스위치입니다. AISI 304 스템, 316 구형 플로트로 물·오일·산성 유체·연료에 사용되며 길이는 100~2000mm(50mm 단위)입니다. Ex 인증을 요청할 수 있습니다.', 'Vertical level switch with 2" gas stainless fixing and an aluminum junction box. AISI 304 stem and 316 spherical float for water, oil, acids and fuels; lengths 100-2000 mm in 50 mm steps. Ex certification on request.',
  '{"mounting": "vertical", "process_connection": "2\" gas (스테인리스)", "stem_material": "스테인리스 AISI 304", "float_material": "스테인리스 AISI 316", "contact_type": "N.O./N.C.", "max_switching_power_w": null, "max_switching_current_a": 0.5, "max_switching_voltage": "24 V", "min_specific_gravity": 0.8, "operating_temp": "-20~+60°C", "media": "물·오일·산성 유체·연료 (식품용 유체 요청 시)", "length_options": "L 총 100~2000mm (50mm 단위)"}'::jsonb, true, 800, 'imd 스테인리스 전자기식 레벨 센서 (단자함형) imd stainless steel electromagnetic level sensor with junction box 2" gas 스테인리스, 알루미늄 단자함 채용 레벨 스위치 (l 100~2000mm) 2" gas stainless level switch with aluminum junction box (l 100-2000 mm) imd euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 2" gas (스테인리스) 스테인리스 aisi 304 스테인리스 aisi 316 n.o./n.c. 0.5 24 v 0.8 -20~+60°c 물·오일·산성 유체·연료 (식품용 유체 요청 시) l 총 100~2000mm (50mm 단위)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imk', 'IMK', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMK 모듈형 다단 레벨 센서', 'IMK Modular Componible Multi-Level Sensor', '푸시인 피팅으로 1~5점 감지를 구성하는 모듈형 레벨 스위치', 'Modular level switch building 1-5 switching points with push-in fittings', '푸시인 피팅 모듈을 호스 튜브로 연결해 1~5개의 감지 레벨을 빠르게 구성하는 모듈형 레벨 스위치입니다. 유연한 튜브 구조로 수 미터의 긴 센서도 작은 공간에 보관할 수 있습니다. 알루미늄 G1" 플랜지 고정, DINB 단자대, IP65 사양입니다.', 'Modular multi-level sensor (1-5 points) built by connecting push-in fitting modules with a hose pipe, assembled by hand to the desired length; the flexible system allows long sensors to be stored compactly. Aluminum 1" gas flange, DINB terminal blocks, IP65.',
  '{"mounting": "vertical", "process_connection": "알루미늄 G1\" 플랜지", "stem_material": "나일론 (주름 튜브)", "float_material": "NBR", "contact_type": "Reed, 1~5점 (IMK021-101~105)", "max_switching_power_w": 12, "max_switching_current_a": 1, "max_switching_voltage": "-", "min_specific_gravity": 0.6, "operating_temp": "-10~+80°C", "media": "광유·연료", "length_options": "감지점 1~5개, 2점 사양 최대 2m"}'::jsonb, true, 810, 'imk 모듈형 다단 레벨 센서 imk modular componible multi-level sensor 푸시인 피팅으로 1~5점 감지를 구성하는 모듈형 레벨 스위치 modular level switch building 1-5 switching points with push-in fittings imk euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 알루미늄 g1" 플랜지 나일론 (주름 튜브) nbr reed, 1~5점 (imk021-101~105) 12 1 - 0.6 -10~+80°c 광유·연료 감지점 1~5개, 2점 사양 최대 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imk2', 'IMK2', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMK2 모듈형 전자기식 레벨 센서', 'IMK2 Modular Electromagnetic Level Sensor', '주름 튜브 슬라이딩으로 감지점을 최대 4m까지 조정하는 레벨 스위치', 'Level switch with sliding corrugated tube, switching point adjustable up to 4 m', '주름 튜브를 피팅 안에서 슬라이딩시켜 감지 지점을 최대 4m 높이까지 조정하고 파이프 클램프로 고정하는 모듈형 레벨 스위치입니다. 탱크 내부에서 카운터웨이트가 플로트 유닛을 수직으로 유지하며, 정적(비유동) 용도에 권장됩니다.', 'Modular level switch whose corrugated pipe slides inside the fitting to set the tripping point up to 4 m, locked by the pipe clamp. A counterweight keeps the floating unit vertical; recommended for static, non-dynamic applications.',
  '{"mounting": "vertical", "process_connection": "G1\" 황동", "stem_material": "나일론 (주름 튜브 PVC L=4m)", "float_material": "NBR", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "50 V", "min_specific_gravity": 0.7, "operating_temp": "-10~+100°C", "media": "광유·경유·가솔린", "length_options": "감지점 최대 4m 조정 (IMK221-100)"}'::jsonb, true, 820, 'imk2 모듈형 전자기식 레벨 센서 imk2 modular electromagnetic level sensor 주름 튜브 슬라이딩으로 감지점을 최대 4m까지 조정하는 레벨 스위치 level switch with sliding corrugated tube, switching point adjustable up to 4 m imk2 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical g1" 황동 나일론 (주름 튜브 pvc l=4m) nbr reed n.o./n.c. (spdt) 40 1 50 v 0.7 -10~+100°c 광유·경유·가솔린 감지점 최대 4m 조정 (imk221-100)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imm', 'IMM', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMM 모듈형 전자기식 레벨 센서', 'IMM Modular Electromagnetic Level Sensor', '스템 절단으로 감지 높이를 조정하는 모듈형 레벨 스위치 (180~860mm)', 'Modular level switch with cut-to-length stem (180-860 mm)', '스테인리스 316L 스템을 원하는 길이로 절단해 감지 지점을 약 180mm에서 560mm(860mm)까지 조정하는 모듈형 레벨 스위치입니다. 나일론 2/3/6홀 플랜지 또는 G1" 나사 고정을 하나의 코드로 지원하며, 자석이 상부에 있어 철분 오염 유체에도 사용 가능합니다.', 'Modular level switch whose stainless steel 316L stem is cut to length, adjusting the switching point from ~180 mm up to 560 mm (860 mm). One code supports nylon 2/3/6-hole flanges or G1" thread; the magnet at the top allows use in fluids polluted by ferrous particles.',
  '{"mounting": "vertical", "process_connection": "나일론 플랜지 2·3·6홀 / G1\" 나사", "stem_material": "스테인리스 AISI 316L", "float_material": "NBR", "contact_type": "Reed / SPDT", "max_switching_power_w": 50, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac (SPDT 220 Vac) / 24 Vdc / 110 Vdc", "min_specific_gravity": 0.85, "operating_temp": "-15~+100°C", "media": "광유·연료", "length_options": "L = 560mm(IMM500) / 860mm(IMM860), 절단 조정"}'::jsonb, true, 830, 'imm 모듈형 전자기식 레벨 센서 imm modular electromagnetic level sensor 스템 절단으로 감지 높이를 조정하는 모듈형 레벨 스위치 (180~860mm) modular level switch with cut-to-length stem (180-860 mm) imm euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 나일론 플랜지 2·3·6홀 / g1" 나사 스테인리스 aisi 316l nbr reed / spdt 50 1 250 vac (spdt 220 vac) / 24 vdc / 110 vdc 0.85 -15~+100°c 광유·연료 l = 560mm(imm500) / 860mm(imm860), 절단 조정')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imp', 'IMP', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMP 스테인리스 전자기식 레벨 센서', 'IMP Stainless Steel Electromagnetic Level Sensor', '1/8" gas 스테인리스 소형 레벨 스위치 (HT +200°C 사양)', 'Compact stainless steel level switch, 1/8" gas (HT version to +200°C)', '스테인리스 AISI 304 스템(플로트 316)의 소형 수직 레벨 스위치입니다. 1/8" gas 고정으로 물·오일·산성 유체·연료에 사용되며 HT 버전은 -20~+200°C까지 지원합니다. Ex, RINA, cULus 인증을 요청할 수 있습니다.', 'Compact vertical level switch with AISI 304 stainless stem and 316 float, 1/8" gas fixing. For water, oil, acids and fuels; HT version rated -20 to +200°C. Ex, RINA and cULus certifications on request.',
  '{"mounting": "vertical", "process_connection": "1/8\" gas", "stem_material": "스테인리스 AISI 304", "float_material": "스테인리스 AISI 316", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac (SPDT 50 V, UL 125 Vac)", "min_specific_gravity": 0.8, "operating_temp": "-20~+100°C (HT -20~+200°C)", "media": "물·오일·산성 유체·연료 (식품용 유체 요청 시)", "length_options": "케이블 500mm (기타 요청 시), UL AVLV2 배선"}'::jsonb, true, 840, 'imp 스테인리스 전자기식 레벨 센서 imp stainless steel electromagnetic level sensor 1/8" gas 스테인리스 소형 레벨 스위치 (ht +200°c 사양) compact stainless steel level switch, 1/8" gas (ht version to +200°c) imp euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 1/8" gas 스테인리스 aisi 304 스테인리스 aisi 316 reed n.o./n.c. (spdt) 40 1 250 vac (spdt 50 v, ul 125 vac) 0.8 -20~+100°c (ht -20~+200°c) 물·오일·산성 유체·연료 (식품용 유체 요청 시) 케이블 500mm (기타 요청 시), ul avlv2 배선')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-impg', 'IMPG', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMPG 스테인리스 전자기식 레벨 센서', 'IMPG Stainless Steel Electromagnetic Level Sensor', '90° 굽힘 스테인리스 스템 G1/8 레벨 스위치 (HT +200°C)', '90° bent stainless stem level switch, G1/8 (HT to +200°C)', '90°로 굽은 스테인리스 스템(AISI 304, 요청 시 316)의 측면 장착형 레벨 스위치입니다. G1/8" 원통형 고정, 스테인리스 316 플로트로 물·오일·산성 유체·연료에 사용되며 HT 버전은 +200°C까지 지원합니다. cULus 인증 요청 가능.', 'Level switch with a 90° bent stainless stem (AISI 304, 316 on request), G1/8" cylindrical fixing and AISI 316 float. For water, oil, acids and fuels; HT version to +200°C; cULus certification on request.',
  '{"mounting": "lateral", "process_connection": "G1/8\" 원통형", "stem_material": "스테인리스 AISI 304 (90° 굽힘)", "float_material": "스테인리스 AISI 316", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac (SPDT 50 V, UL 125 Vac)", "min_specific_gravity": 0.8, "operating_temp": "-20~+100°C (HT -20~+200°C)", "media": "물·오일·산성 유체·연료 (식품용 유체 요청 시)", "length_options": "L = 75mm, 케이블 500mm (기타 요청 시)"}'::jsonb, true, 850, 'impg 스테인리스 전자기식 레벨 센서 impg stainless steel electromagnetic level sensor 90° 굽힘 스테인리스 스템 g1/8 레벨 스위치 (ht +200°c) 90° bent stainless stem level switch, g1/8 (ht to +200°c) impg euroswitch 플로트 레벨 스위치 float level switches lateral 측면(수평) lateral (horizontal) g1/8" 원통형 스테인리스 aisi 304 (90° 굽힘) 스테인리스 aisi 316 reed n.o./n.c. (spdt) 40 1 250 vac (spdt 50 v, ul 125 vac) 0.8 -20~+100°c (ht -20~+200°c) 물·오일·산성 유체·연료 (식품용 유체 요청 시) l = 75mm, 케이블 500mm (기타 요청 시)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imr-imrh', 'IMR-IMRH', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMR-IMRH 저항식 레벨 센서 (중부하용)', 'IMR-IMRH Resistive Level Sensor for Heavy-Duty Operations', 'G1" 알루미늄(IMR)/G1-1/4 스테인리스(IMRH) 저항식 레벨 센서 (L 100~2000mm)', 'Resistive level sensor, G1" aluminum (IMR) or G1-1/4 stainless (IMRH), L 100-2000 mm', '리드 체인·저항 네트워크 방식의 중부하용 저항식 레벨 센서입니다. IMR은 G1" 알루미늄 고정/알루미늄 스템, IMRH는 G1-1/4" 스테인리스 316 사양입니다. 분해능 10/20mm, 길이 100~2000mm(50mm 단위)이며 잔량(리저브) 접점 옵션이 있습니다.', 'Heavy-duty resistive level sensor with reed chain and resistor network. IMR has G1" aluminum fixing and aluminum stem; IMRH G1-1/4" in AISI 316 stainless. 10/20 mm pitch, lengths 100-2000 mm in 50 mm steps; reserve contact option.',
  '{"fixing": "G1\" 알루미늄 (IMR) / G1-1/4\" 스테인리스 316 (IMRH)", "stem_material": "알루미늄 (IMR) / 스테인리스 316 (IMRH)", "float_material": "NBR Ø30mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~2000mm (50mm 단위)", "protection_rating": "IP65 (DIN43650 커넥터)", "min_specific_gravity": 0.6, "operating_temp": "-20~+100°C (110°C 요청 시)", "media": "물·광유·경유·가솔린", "stabilized_room": false}'::jsonb, true, 860, 'imr-imrh 저항식 레벨 센서 (중부하용) imr-imrh resistive level sensor for heavy-duty operations g1" 알루미늄(imr)/g1-1/4 스테인리스(imrh) 저항식 레벨 센서 (l 100~2000mm) resistive level sensor, g1" aluminum (imr) or g1-1/4 stainless (imrh), l 100-2000 mm imr-imrh euroswitch 저항식 레벨 센서 resistive level sensors g1" 알루미늄 (imr) / g1-1/4" 스테인리스 316 (imrh) 알루미늄 (imr) / 스테인리스 316 (imrh) nbr ø30mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~2000mm (50mm 단위) ip65 (din43650 커넥터) 0.6 -20~+100°c (110°c 요청 시) 물·광유·경유·가솔린 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imra-imrb-imrt', 'IMRA-IMRB-IMRT', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRA-IMRB-IMRT 저항식 레벨 센서', 'IMRA-IMRB-IMRT Resistive Level Sensor', '스테인리스 플랜지(6홀/3홀) 고정 저항식 레벨 센서', 'Resistive level sensor with stainless flange fixing (6-hole / 3-hole)', '스테인리스 304 플랜지 고정형 저항식 레벨 센서입니다. IMRA는 6홀 Ø100(내경 80), IMRB는 6홀 Ø74(내경 60), IMRT는 3홀 플랜지 사양입니다. 분해능 10/20mm, 길이 100~2000mm, 잔량 접점 옵션을 제공합니다.', 'Resistive level sensor with AISI 304 stainless flange fixing: IMRA 6-hole Ø100 (int. 80), IMRB 6-hole Ø74 (int. 60), IMRT 3-hole flange. 10/20 mm pitch, lengths 100-2000 mm, reserve contact option.',
  '{"fixing": "6홀 플랜지 Ø100 (IMRA) / 6홀 Ø74 (IMRB) / 3홀 (IMRT), 스테인리스 304", "stem_material": "스틸 (요청 시 양극산화 알루미늄)", "float_material": "NBR Ø30mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~2000mm (50mm 단위)", "protection_rating": "IP65 (DIN43650 커넥터)", "min_specific_gravity": 0.6, "operating_temp": "-20~+100°C (110°C 요청 시)", "media": "물·광유·경유·가솔린", "stabilized_room": false}'::jsonb, true, 870, 'imra-imrb-imrt 저항식 레벨 센서 imra-imrb-imrt resistive level sensor 스테인리스 플랜지(6홀/3홀) 고정 저항식 레벨 센서 resistive level sensor with stainless flange fixing (6-hole / 3-hole) imra-imrb-imrt euroswitch 저항식 레벨 센서 resistive level sensors 6홀 플랜지 ø100 (imra) / 6홀 ø74 (imrb) / 3홀 (imrt), 스테인리스 304 스틸 (요청 시 양극산화 알루미늄) nbr ø30mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~2000mm (50mm 단위) ip65 (din43650 커넥터) 0.6 -20~+100°c (110°c 요청 시) 물·광유·경유·가솔린 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imre-imrf-imrg', 'IMRE-IMRF-IMRG', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-analog-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRE-IMRF-IMRG 아날로그 4-20mA 레벨 센서', 'IMRE-IMRF-IMRG Analog 4-20 mA Level Sensor', '4-20mA 출력 레벨 트랜스미터 (G1"/G2"/6홀 플랜지)', '4-20 mA level transmitter (G1" / G2" / 6-hole flange)', '4-20mA 아날로그 출력의 레벨 트랜스미터입니다. IMRE는 G1" 알루미늄, IMRF는 G2" 스테인리스 304, IMRG는 스테인리스 304 6홀 플랜지 고정 사양이며 DIN B 알루미늄 헤드에 전자부가 내장됩니다. 공급 전압 8~30V, Ex 인증 요청 가능.', 'Level transmitter with 4-20 mA analog output. IMRE with G1" aluminum fixing, IMRF G2" stainless 304, IMRG 6-hole stainless 304 flange; electronics in a DIN B aluminum head. Supply 8-30 V; Ex certification on request.',
  '{"output_signal": "아날로그 4-20mA", "digital_outputs": null, "supply_voltage": "8~30 V", "fixing": "G1\" 알루미늄 (IMRE) / G2\" 스테인리스 (IMRF) / 6홀 플랜지 스테인리스 (IMRG)", "stem_material": "스틸", "float_material": "NBR (IMRE/IMRG) / 스테인리스 AISI 316 (IMRF)", "length_range": "L = 100~2000mm (50mm 단위)", "resolution_pitch": "10/20mm", "protection_rating": "IP65", "operating_temp": "-20~+80°C", "min_specific_gravity": "0.6", "media": "물·광유·경유·가솔린"}'::jsonb, true, 880, 'imre-imrf-imrg 아날로그 4-20ma 레벨 센서 imre-imrf-imrg analog 4-20 ma level sensor 4-20ma 출력 레벨 트랜스미터 (g1"/g2"/6홀 플랜지) 4-20 ma level transmitter (g1" / g2" / 6-hole flange) imre-imrf-imrg euroswitch 아날로그 레벨 센서 (4-20ma) analog level sensors (4-20 ma) 아날로그 4-20ma 8~30 v g1" 알루미늄 (imre) / g2" 스테인리스 (imrf) / 6홀 플랜지 스테인리스 (imrg) 스틸 nbr (imre/imrg) / 스테인리스 aisi 316 (imrf) l = 100~2000mm (50mm 단위) 10/20mm ip65 -20~+80°c 0.6 물·광유·경유·가솔린')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imret', 'IMRET', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-analog-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRET 아날로그 4-20mA 레벨·온도 센서', 'IMRET Analog 4-20 mA Level and Temperature Sensor', '레벨/온도 독립 4-20mA 출력 트랜스미터 (G1" 알루미늄)', 'Transmitter with separate 4-20 mA outputs for level and temperature (G1" aluminum)', '레벨과 온도를 각각 독립된 4-20mA 신호로 출력하는 트랜스미터입니다. G1" 알루미늄 고정(요청 시 AISI 304), 알루미늄 단자 박스(M12 커넥터 요청 가능) 사양이며 길이는 100~2000mm입니다.', 'Transmitter providing separate 4-20 mA outputs for level and temperature. G1" aluminum fixing (AISI 304 on request), aluminum terminal box (M12 connector on request); lengths 100-2000 mm.',
  '{"output_signal": "아날로그 4-20mA (레벨/온도 독립 출력)", "digital_outputs": null, "supply_voltage": "8~30 V", "fixing": "G1\" 알루미늄 (요청 시 AISI 304)", "stem_material": "스틸", "float_material": "NBR", "length_range": "L = 100~2000mm (50mm 단위)", "resolution_pitch": "10/20mm", "protection_rating": "IP65", "operating_temp": "-20~+80°C", "min_specific_gravity": "0.6", "media": "물·광유·경유·가솔린"}'::jsonb, true, 890, 'imret 아날로그 4-20ma 레벨·온도 센서 imret analog 4-20 ma level and temperature sensor 레벨/온도 독립 4-20ma 출력 트랜스미터 (g1" 알루미늄) transmitter with separate 4-20 ma outputs for level and temperature (g1" aluminum) imret euroswitch 아날로그 레벨 센서 (4-20ma) analog level sensors (4-20 ma) 아날로그 4-20ma (레벨/온도 독립 출력) 8~30 v g1" 알루미늄 (요청 시 aisi 304) 스틸 nbr l = 100~2000mm (50mm 단위) 10/20mm ip65 -20~+80°c 0.6 물·광유·경유·가솔린')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imri-imrc', 'IMRI-IMRC', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRI-IMRC 저항식 레벨 센서', 'IMRI-IMRC Resistive Level Sensor', 'G2"(IMRI)/6홀 플랜지(IMRC) 스테인리스 저항식 레벨 센서 (구형 플로트)', 'Stainless resistive level sensor, G2" (IMRI) or 6-hole flange (IMRC), spherical float', 'G2" 나사(IMRI) 또는 스테인리스 6홀 플랜지(IMRC) 고정의 저항식 레벨 센서입니다. 스테인리스 304/316 스템과 Ø52 스테인리스 316 구형 플로트, FKM O-링 사양으로 물·광유·산성 유체·연료에 사용됩니다.', 'Resistive level sensor with G2" steel thread (IMRI) or stainless 6-hole flange (IMRC). AISI 304/316 stem, Ø52 AISI 316 spherical float and FKM O-ring; for water, mineral oils, acids and fuels.',
  '{"fixing": "G2\" (IMRI) / 6홀 플랜지 (IMRC), 스테인리스 304", "stem_material": "스테인리스 AISI 304 (Ø52 플로트부 316)", "float_material": "스테인리스 AISI 316 Ø52mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~2000mm (50mm 단위)", "protection_rating": "IP65 (DIN43650 커넥터)", "min_specific_gravity": 0.8, "operating_temp": "-20~+100°C (110°C 요청 시)", "media": "물·광유·산성 유체·연료 (식품용 유체 요청 시)", "stabilized_room": false}'::jsonb, true, 900, 'imri-imrc 저항식 레벨 센서 imri-imrc resistive level sensor g2"(imri)/6홀 플랜지(imrc) 스테인리스 저항식 레벨 센서 (구형 플로트) stainless resistive level sensor, g2" (imri) or 6-hole flange (imrc), spherical float imri-imrc euroswitch 저항식 레벨 센서 resistive level sensors g2" (imri) / 6홀 플랜지 (imrc), 스테인리스 304 스테인리스 aisi 304 (ø52 플로트부 316) 스테인리스 aisi 316 ø52mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~2000mm (50mm 단위) ip65 (din43650 커넥터) 0.8 -20~+100°c (110°c 요청 시) 물·광유·산성 유체·연료 (식품용 유체 요청 시) false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imrma', 'IMRMA', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRMA 저항식 레벨 센서', 'IMRMA Resistive Level Sensor', '알루미늄 6홀 플랜지 저항식 레벨 센서 (L 100~2000mm)', 'Resistive level sensor with aluminum 6-hole flange (L 100-2000 mm)', '알루미늄 6홀 플랜지(기타 재질 요청 가능) 고정의 저항식 레벨 센서입니다. 알루미늄 스템, NBR Ø30 플로트, 분해능 10/20mm, 길이 100~2000mm 사양이며 커넥터 종류·배선은 주문 시 지정합니다.', 'Resistive level sensor with aluminum 6-hole flange (other materials on request). Aluminum stem, NBR Ø30 float, 10/20 mm pitch, lengths 100-2000 mm; connector and wiring harness defined at order.',
  '{"fixing": "알루미늄 플랜지 6홀 (기타 재질 요청 시)", "stem_material": "알루미늄", "float_material": "NBR Ø30mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~2000mm (50mm 단위)", "protection_rating": "IP65", "min_specific_gravity": 0.6, "operating_temp": "-20~+100°C (110°C 요청 시)", "media": "물·광유·경유·가솔린", "stabilized_room": false}'::jsonb, true, 910, 'imrma 저항식 레벨 센서 imrma resistive level sensor 알루미늄 6홀 플랜지 저항식 레벨 센서 (l 100~2000mm) resistive level sensor with aluminum 6-hole flange (l 100-2000 mm) imrma euroswitch 저항식 레벨 센서 resistive level sensors 알루미늄 플랜지 6홀 (기타 재질 요청 시) 알루미늄 nbr ø30mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~2000mm (50mm 단위) ip65 0.6 -20~+100°c (110°c 요청 시) 물·광유·경유·가솔린 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imrn', 'IMRN', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRN 저항식 레벨 센서', 'IMRN Resistive Level Sensor', 'G1-1/2 스테인리스 고정 저항식 레벨 센서 (L 100~2000mm)', 'Resistive level sensor with G1-1/2 stainless fixing (L 100-2000 mm)', 'G1-1/2" 스테인리스 AISI 고정(요청 시 알루미늄)의 저항식 레벨 센서입니다. 90° 굽힘 케이블 출구 구조이며 분해능 10/20mm, 길이 100~2000mm, 잔량 접점 옵션을 제공합니다.', 'Resistive level sensor with G1-1/2" stainless AISI fixing (aluminum on request) and 90° cable outlet. 10/20 mm pitch, lengths 100-2000 mm, reserve contact option.',
  '{"fixing": "G1-1/2\" 스테인리스 AISI (알루미늄 요청 시)", "stem_material": "스틸·알루미늄", "float_material": "NBR Ø30mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~2000mm (50mm 단위)", "protection_rating": "IP65 (DIN43650 커넥터)", "min_specific_gravity": 0.6, "operating_temp": "-20~+100°C (110°C 요청 시)", "media": "물·광유·경유·가솔린", "stabilized_room": false}'::jsonb, true, 920, 'imrn 저항식 레벨 센서 imrn resistive level sensor g1-1/2 스테인리스 고정 저항식 레벨 센서 (l 100~2000mm) resistive level sensor with g1-1/2 stainless fixing (l 100-2000 mm) imrn euroswitch 저항식 레벨 센서 resistive level sensors g1-1/2" 스테인리스 aisi (알루미늄 요청 시) 스틸·알루미늄 nbr ø30mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~2000mm (50mm 단위) ip65 (din43650 커넥터) 0.6 -20~+100°c (110°c 요청 시) 물·광유·경유·가솔린 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imrpb1', 'IMRPB1', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRPB1 저항식 레벨 센서', 'IMRPB1 Resistive Level Sensor', '나일론 6홀 플랜지 저항식 레벨 센서 (L 100~1600mm)', 'Resistive level sensor with 6-hole nylon flange (L 100-1600 mm)', '나일론 6홀 플랜지 고정의 저항식 레벨 센서입니다. 알루미늄 스템(요청 시 스테인리스)과 NBR Ø30 플로트, 분해능 10/20mm 사양이며 길이는 100~1600mm(50mm 단위)입니다. 커넥터 종류와 배선 길이는 주문 시 지정합니다.', 'Resistive level sensor with 6-hole nylon flange. Aluminum stem (stainless on request), NBR Ø30 float, 10/20 mm pitch; lengths 100-1600 mm in 50 mm steps. Connector type and cable length defined at order.',
  '{"fixing": "나일론 플랜지 6홀", "stem_material": "알루미늄 (요청 시 스테인리스)", "float_material": "NBR Ø30mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~1600mm (50mm 단위)", "protection_rating": "IP65", "min_specific_gravity": 0.6, "operating_temp": "-20~+80°C", "media": "물·광유·경유·가솔린", "stabilized_room": false}'::jsonb, true, 930, 'imrpb1 저항식 레벨 센서 imrpb1 resistive level sensor 나일론 6홀 플랜지 저항식 레벨 센서 (l 100~1600mm) resistive level sensor with 6-hole nylon flange (l 100-1600 mm) imrpb1 euroswitch 저항식 레벨 센서 resistive level sensors 나일론 플랜지 6홀 알루미늄 (요청 시 스테인리스) nbr ø30mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~1600mm (50mm 단위) ip65 0.6 -20~+80°c 물·광유·경유·가솔린 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imrpb2', 'IMRPB2', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRPB2 안정화 챔버형 저항식 레벨 센서', 'IMRPB2 Resistive Level Sensor with Stabilized Room', '안정화 챔버 + 연료 흡입/리턴 배관 내장 저항식 레벨 센서', 'Resistive level sensor with stabilized room and fuel suction/backflow connections', '알루미늄 안정화 챔버와 연료 흡입/리턴 배관(AVP 스틸 피팅, PA11 Ø10x8 튜브, 스틸 필터)을 통합한 저항식 레벨 센서입니다. 나일론 5홀 플랜지 고정으로 연료 탱크 센더 유닛 용도에 적합하며 길이는 100~1600mm입니다.', 'Resistive level sensor integrating an aluminum stabilized room and fuel suction/backflow connections (AVP steel fittings, PA11 Ø10x8 tube, steel filter). 5-hole nylon flange fixing, suited to fuel tank sender units; lengths 100-1600 mm.',
  '{"fixing": "나일론 플랜지 5홀 (요청 시 스테인리스)", "stem_material": "알루미늄 (요청 시 스테인리스)", "float_material": "NBR Ø30mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~1600mm (50mm 단위)", "protection_rating": "IP65", "min_specific_gravity": 0.6, "operating_temp": "-20~+80°C", "media": "물·광유·경유·가솔린", "stabilized_room": true}'::jsonb, true, 940, 'imrpb2 안정화 챔버형 저항식 레벨 센서 imrpb2 resistive level sensor with stabilized room 안정화 챔버 + 연료 흡입/리턴 배관 내장 저항식 레벨 센서 resistive level sensor with stabilized room and fuel suction/backflow connections imrpb2 euroswitch 저항식 레벨 센서 resistive level sensors 나일론 플랜지 5홀 (요청 시 스테인리스) 알루미늄 (요청 시 스테인리스) nbr ø30mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~1600mm (50mm 단위) ip65 0.6 -20~+80°c 물·광유·경유·가솔린 true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imrpb5', 'IMRPB5', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRPB5 저항식 레벨 센서', 'IMRPB5 Resistive Level Sensor', '나일론 5홀 플랜지 + 사이드 케이블 출구 저항식 레벨 센서', 'Resistive level sensor with 5-hole nylon flange and side cable outlet', '나일론 5홀 플랜지와 U자형 사이드 케이블 출구 구조의 저항식 레벨 센서입니다. 알루미늄 스템(요청 시 스테인리스)과 NBR Ø30 플로트, 분해능 10/20mm, 길이 100~1600mm 사양입니다.', 'Resistive level sensor with 5-hole nylon flange and U-shaped side cable outlet. Aluminum stem (stainless on request), NBR Ø30 float, 10/20 mm pitch, lengths 100-1600 mm.',
  '{"fixing": "나일론 플랜지 5홀 (요청 시 스테인리스)", "stem_material": "알루미늄 (요청 시 스테인리스)", "float_material": "NBR Ø30mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~1600mm (50mm 단위)", "protection_rating": "IP65", "min_specific_gravity": 0.6, "operating_temp": "-20~+80°C", "media": "물·광유·경유·가솔린", "stabilized_room": false}'::jsonb, true, 950, 'imrpb5 저항식 레벨 센서 imrpb5 resistive level sensor 나일론 5홀 플랜지 + 사이드 케이블 출구 저항식 레벨 센서 resistive level sensor with 5-hole nylon flange and side cable outlet imrpb5 euroswitch 저항식 레벨 센서 resistive level sensors 나일론 플랜지 5홀 (요청 시 스테인리스) 알루미늄 (요청 시 스테인리스) nbr ø30mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~1600mm (50mm 단위) ip65 0.6 -20~+80°c 물·광유·경유·가솔린 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imrpb8', 'IMRPB8', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRPB8 저항식 레벨 센서', 'IMRPB8 Resistive Level Sensor', 'M36x2 나일론 나사 고정 저항식 레벨 센서', 'Resistive level sensor with M36x2 nylon threaded fixing', 'M36x2 나일론 나사 고정의 저항식 레벨 센서입니다. 알루미늄 스템(요청 시 스테인리스)과 NBR Ø30 플로트, 분해능 10/20mm, 길이 100~1600mm 사양이며 커넥터 종류·배선 길이는 주문 시 지정합니다.', 'Resistive level sensor with M36x2 nylon threaded fixing. Aluminum stem (stainless on request), NBR Ø30 float, 10/20 mm pitch, lengths 100-1600 mm; connector type and cable length defined at order.',
  '{"fixing": "M36x2 나일론 나사", "stem_material": "알루미늄 (요청 시 스테인리스)", "float_material": "NBR Ø30mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~1600mm (50mm 단위)", "protection_rating": "IP65", "min_specific_gravity": 0.6, "operating_temp": "-20~+80°C", "media": "물·광유·경유·가솔린", "stabilized_room": false}'::jsonb, true, 960, 'imrpb8 저항식 레벨 센서 imrpb8 resistive level sensor m36x2 나일론 나사 고정 저항식 레벨 센서 resistive level sensor with m36x2 nylon threaded fixing imrpb8 euroswitch 저항식 레벨 센서 resistive level sensors m36x2 나일론 나사 알루미늄 (요청 시 스테인리스) nbr ø30mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~1600mm (50mm 단위) ip65 0.6 -20~+80°c 물·광유·경유·가솔린 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imrpc2', 'IMRPC2', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRPC2 안정화 챔버형 저항식 레벨 센서', 'IMRPC2 Resistive Level Sensor with Stabilized Room', '알루미늄 안정화 챔버 + 연료 배관 내장, 금속 플레이트 고정형', 'Metal-plate mounted resistive sensor with aluminum stabilized room and fuel lines', '알루미늄 안정화 챔버와 연료 흡입/리턴 배관(AVP 스틸 피팅, PA11 Ø10x8 튜브, 스틸 필터)을 갖춘 금속 플레이트 고정형 저항식 레벨 센서입니다. 연료 탱크 센더 유닛 용도이며 길이는 100~1600mm입니다.', 'Metal-plate mounted resistive level sensor with aluminum stabilized room and fuel suction/backflow connections (AVP steel fittings, PA11 Ø10x8 tube, steel filter). Intended as a fuel tank sender unit; lengths 100-1600 mm.',
  '{"fixing": "금속 플레이트", "stem_material": "알루미늄 (요청 시 스테인리스)", "float_material": "NBR Ø30mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~1600mm (50mm 단위)", "protection_rating": "IP65", "min_specific_gravity": 0.6, "operating_temp": "-20~+80°C", "media": "물·광유·경유·가솔린", "stabilized_room": true}'::jsonb, true, 970, 'imrpc2 안정화 챔버형 저항식 레벨 센서 imrpc2 resistive level sensor with stabilized room 알루미늄 안정화 챔버 + 연료 배관 내장, 금속 플레이트 고정형 metal-plate mounted resistive sensor with aluminum stabilized room and fuel lines imrpc2 euroswitch 저항식 레벨 센서 resistive level sensors 금속 플레이트 알루미늄 (요청 시 스테인리스) nbr ø30mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~1600mm (50mm 단위) ip65 0.6 -20~+80°c 물·광유·경유·가솔린 true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imrs-1-2', 'IMRS 1-2', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRS 1-2 저항식 레벨 센서 (6홀 플랜지)', 'IMRS 1-2 Resistive Level Sensor (6-hole Flange)', '플라스틱 6홀 플랜지 저항식 레벨 센서 (L 100~2000mm)', 'Resistive level sensor with plastic 6-hole flange (L 100-2000 mm)', '플라스틱 6홀 플랜지 고정의 저항식 레벨 센서로, 실린더 상향(IMRS1)/하향(IMRS2) 두 가지 형태가 있습니다. 알루미늄 스템, NBR Ø30 플로트, 분해능 10/20mm 사양이며 최소 저항 위치·잔량 접점·출구 처리(90° 캡/레진/케이블 글랜드)를 코드로 지정합니다.', 'Resistive level sensor with a plastic 6-hole flange, cylinder up (IMRS1) or down (IMRS2). Aluminum stem, NBR Ø30 float, 10/20 mm pitch; minimum-resistance orientation, reserve contact and outlet style (90° cap / resined / cable gland) selected by code.',
  '{"fixing": "플라스틱 플랜지 6홀 (실린더 상향/하향)", "stem_material": "알루미늄", "float_material": "NBR Ø30mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~2000mm (50mm 단위)", "protection_rating": "IP65", "min_specific_gravity": 0.6, "operating_temp": "-20~+100°C (110°C 요청 시)", "media": "물·광유·경유·가솔린", "stabilized_room": false}'::jsonb, true, 980, 'imrs 1-2 저항식 레벨 센서 (6홀 플랜지) imrs 1-2 resistive level sensor (6-hole flange) 플라스틱 6홀 플랜지 저항식 레벨 센서 (l 100~2000mm) resistive level sensor with plastic 6-hole flange (l 100-2000 mm) imrs 1-2 euroswitch 저항식 레벨 센서 resistive level sensors 플라스틱 플랜지 6홀 (실린더 상향/하향) 알루미늄 nbr ø30mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~2000mm (50mm 단위) ip65 0.6 -20~+100°c (110°c 요청 시) 물·광유·경유·가솔린 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imrs-5-6', 'IMRS 5-6', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMRS 5-6 저항식 레벨 센서 (5홀 플랜지)', 'IMRS 5-6 Resistive Level Sensor (5-hole Flange)', '플라스틱 5홀 플랜지 저항식 레벨 센서 (L 100~2000mm)', 'Resistive level sensor with plastic 5-hole flange (L 100-2000 mm)', '플라스틱 5홀 플랜지 고정의 저항식 레벨 센서로, 실린더 상향(IMRS5)/하향(IMRS6) 두 가지 형태가 있습니다. 알루미늄 스템, NBR Ø30 플로트, 분해능 10/20mm 사양이며 최소 저항 위치·잔량 접점·출구 처리를 코드로 지정합니다.', 'Resistive level sensor with a plastic 5-hole flange, cylinder up (IMRS5) or down (IMRS6). Aluminum stem, NBR Ø30 float, 10/20 mm pitch; minimum-resistance orientation, reserve contact and outlet style selected by code.',
  '{"fixing": "플라스틱 플랜지 5홀 (실린더 상향/하향)", "stem_material": "알루미늄", "float_material": "NBR Ø30mm", "output_signal": "저항 (레벨 인디케이터 구동)", "resistance_range": "I형: 만위 5÷7Ω / 공위 315÷330Ω, II형: 만위 175÷180Ω / 공위 10÷7Ω", "resolution_pitch": "10/20mm", "length_range": "L = 100~2000mm (50mm 단위)", "protection_rating": "IP65", "min_specific_gravity": 0.6, "operating_temp": "-20~+100°C (110°C 요청 시)", "media": "물·광유·경유·가솔린", "stabilized_room": false}'::jsonb, true, 990, 'imrs 5-6 저항식 레벨 센서 (5홀 플랜지) imrs 5-6 resistive level sensor (5-hole flange) 플라스틱 5홀 플랜지 저항식 레벨 센서 (l 100~2000mm) resistive level sensor with plastic 5-hole flange (l 100-2000 mm) imrs 5-6 euroswitch 저항식 레벨 센서 resistive level sensors 플라스틱 플랜지 5홀 (실린더 상향/하향) 알루미늄 nbr ø30mm 저항 (레벨 인디케이터 구동) i형: 만위 5÷7ω / 공위 315÷330ω, ii형: 만위 175÷180ω / 공위 10÷7ω 10/20mm l = 100~2000mm (50mm 단위) ip65 0.6 -20~+100°c (110°c 요청 시) 물·광유·경유·가솔린 false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-ims', 'IMS', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMS 스테인리스 전자기식 레벨 센서', 'IMS Stainless Steel Electromagnetic Level Sensor', '구형 스테인리스 플로트(Ø52) 3/8" gas 레벨 스위치', 'Level switch with Ø52 spherical stainless float, 3/8" gas', 'Ø52mm 구형 스테인리스 316 플로트와 3/8" gas 스테인리스 304 고정의 수직 레벨 스위치입니다. 실리콘 케이블 1000mm 사양으로 물·오일·산성 유체·연료에 사용되며 HT 버전은 +200°C까지 지원합니다. Ex·cULus 인증 요청 가능.', 'Vertical level switch with a Ø52 mm spherical AISI 316 float and 3/8" gas AISI 304 fixing. Silicone cable 1000 mm; for water, oil, acids and fuels; HT version to +200°C. Ex and cULus certifications on request.',
  '{"mounting": "vertical", "process_connection": "3/8\" gas (스테인리스 AISI 304)", "stem_material": "스테인리스 AISI 304", "float_material": "스테인리스 AISI 316 (구형 Ø52)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 80, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac (SPDT 220 Vac, UL 240 Vac)", "min_specific_gravity": 0.8, "operating_temp": "-20~+100°C (HT -20~+200°C)", "media": "물·오일·산성 유체·연료 (식품용 유체 요청 시)", "length_options": "실리콘 케이블 L=1000mm"}'::jsonb, true, 1000, 'ims 스테인리스 전자기식 레벨 센서 ims stainless steel electromagnetic level sensor 구형 스테인리스 플로트(ø52) 3/8" gas 레벨 스위치 level switch with ø52 spherical stainless float, 3/8" gas ims euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 3/8" gas (스테인리스 aisi 304) 스테인리스 aisi 304 스테인리스 aisi 316 (구형 ø52) reed n.o./n.c. (spdt) 80 1 250 vac (spdt 220 vac, ul 240 vac) 0.8 -20~+100°c (ht -20~+200°c) 물·오일·산성 유체·연료 (식품용 유체 요청 시) 실리콘 케이블 l=1000mm')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-imx', 'IMx', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'IMx 스테인리스 전자기식 레벨 센서', 'IMx Stainless Steel Electromagnetic Level Sensor', 'IMG(G1")/IMF(3홀)/IMFP(2홀) 스테인리스 레벨 스위치 (L 100~1000mm)', 'Stainless level switch IMG (G1") / IMF (3-hole) / IMFP (2-hole), L 100-1000 mm', '스테인리스 스템(AISI 304, 요청 시 316)과 316 플로트의 산업용 수직 레벨 스위치입니다. IMG(G1" 나사), IMF(3홀 플랜지), IMFP(2홀 플랜지 Ø43) 고정 옵션과 길이 100~1000mm(50mm 단위)를 지원하며 DIN43650 커넥터 IP65, HT 버전 +200°C 사양입니다.', 'Industrial vertical level switch with stainless stem (AISI 304, 316 on request) and 316 float. Fixing options IMG (1" Gas), IMF (3-hole flange), IMFP (2-hole flange Ø43); lengths 100-1000 mm in 50 mm steps; DIN43650 connector IP65; HT version to +200°C.',
  '{"mounting": "vertical", "process_connection": "G1\" (IMG) / 3홀 플랜지 (IMF) / 2홀 플랜지 Ø43 (IMFP)", "stem_material": "스테인리스 AISI 304 (316 요청 시)", "float_material": "스테인리스 AISI 316", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac (SPDT 50 V, UL 125 Vac)", "min_specific_gravity": 0.8, "operating_temp": "-20~+100°C (HT -20~+200°C)", "media": "물·오일·산성 유체·연료 (식품용 유체 요청 시)", "length_options": "L 총 100~1000mm (50mm 단위)"}'::jsonb, true, 1010, 'imx 스테인리스 전자기식 레벨 센서 imx stainless steel electromagnetic level sensor img(g1")/imf(3홀)/imfp(2홀) 스테인리스 레벨 스위치 (l 100~1000mm) stainless level switch img (g1") / imf (3-hole) / imfp (2-hole), l 100-1000 mm imx euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical g1" (img) / 3홀 플랜지 (imf) / 2홀 플랜지 ø43 (imfp) 스테인리스 aisi 304 (316 요청 시) 스테인리스 aisi 316 reed n.o./n.c. (spdt) 40 1 250 vac (spdt 50 v, ul 125 vac) 0.8 -20~+100°c (ht -20~+200°c) 물·오일·산성 유체·연료 (식품용 유체 요청 시) l 총 100~1000mm (50mm 단위)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p003ac', 'P003AC', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P003AC 전자기식 레벨 센서', 'P003AC Electromagnetic Level Sensor', 'M10 폴리프로필렌 수직 플로트 레벨 스위치 (물·산성 유체용)', 'M10 polypropylene vertical float level switch for water and acids', 'M10x1 나사 고정형 수직 플로트 레벨 스위치로, 스템과 플로트가 폴리프로필렌 재질이라 물과 산성 유체(요청 시 식품용 유체)에 적합합니다. 플로트를 뒤집어 N.C./N.O. 전환이 가능하며 SPDT 접점 버전도 제공됩니다.', 'Vertical float level switch with M10x1 fixing; polypropylene stem and float suit water and acids (alimentary liquids on request). Contact convertible N.C./N.O. by flipping the float; SPDT versions available.',
  '{"mounting": "vertical", "process_connection": "M10x1", "stem_material": "폴리프로필렌", "float_material": "폴리프로필렌", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc (250 V 요청 시)", "min_specific_gravity": 0.75, "operating_temp": "-10~+80°C", "media": "물·산성 유체 (식품용 유체 요청 시)", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1020, 'p003ac 전자기식 레벨 센서 p003ac electromagnetic level sensor m10 폴리프로필렌 수직 플로트 레벨 스위치 (물·산성 유체용) m10 polypropylene vertical float level switch for water and acids p003ac euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical m10x1 폴리프로필렌 폴리프로필렌 reed n.o./n.c. (spdt) 40 1 48 v ac/dc (250 v 요청 시) 0.75 -10~+80°c 물·산성 유체 (식품용 유체 요청 시) 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p003f7', 'P003F7', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P003F7 전자기식 레벨 센서', 'P003F7 Electromagnetic Level Sensor', 'M10 나일론/NBR 수직 플로트 레벨 스위치 (오일·연료용)', 'M10 nylon/NBR vertical float level switch for oils and fuels', 'M10x1 나사 고정형 수직 플로트 레벨 스위치로, 나일론 스템과 NBR 플로트를 사용하여 광유·경유·가솔린에 적합합니다. 플로트 반전으로 N.C./N.O. 전환이 가능하며 SPDT 버전도 제공됩니다.', 'Vertical float level switch with M10x1 fixing; nylon stem and NBR float for mineral oils, diesel fuel and petrol. Contact convertible N.C./N.O. by flipping the float; SPDT versions available.',
  '{"mounting": "vertical", "process_connection": "M10x1", "stem_material": "나일론", "float_material": "NBR", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc (250 V 요청 시)", "min_specific_gravity": 0.75, "operating_temp": "-10~+100°C", "media": "광유·경유·가솔린", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1030, 'p003f7 전자기식 레벨 센서 p003f7 electromagnetic level sensor m10 나일론/nbr 수직 플로트 레벨 스위치 (오일·연료용) m10 nylon/nbr vertical float level switch for oils and fuels p003f7 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical m10x1 나일론 nbr reed n.o./n.c. (spdt) 40 1 48 v ac/dc (250 v 요청 시) 0.75 -10~+100°c 광유·경유·가솔린 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p004', 'P004', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P004 전자기식 레벨 센서', 'P004 Electromagnetic Level Sensor', 'M8 수직 플로트 레벨 스위치 (P004AC 물용 / P004F7 오일용)', 'M8 vertical float level switch (P004AC for water / P004F7 for oils)', 'M8x1.25 고정의 수직 플로트 레벨 스위치입니다. P004AC는 폴리프로필렌으로 물·산성 유체용, P004F7은 나일론 스템/NBR 플로트로 오일·연료용입니다. 플로트 반전으로 N.C./N.O. 전환 가능, SPDT 접점 제공.', 'Vertical float level switch with M8x1.25 fixing. P004AC in polypropylene for water/acids; P004F7 with nylon stem and NBR float for oils and fuels. Contact convertible by flipping the float; SPDT available.',
  '{"mounting": "vertical", "process_connection": "M8x1.25", "stem_material": "폴리프로필렌(AC) / 나일론(F7)", "float_material": "폴리프로필렌(AC) / NBR(F7)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc (250 V 요청 시)", "min_specific_gravity": 0.7, "operating_temp": "-10~+80°C (AC) / -10~+100°C (F7)", "media": "물·산성 유체(AC) / 광유·경유·가솔린(F7)", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1040, 'p004 전자기식 레벨 센서 p004 electromagnetic level sensor m8 수직 플로트 레벨 스위치 (p004ac 물용 / p004f7 오일용) m8 vertical float level switch (p004ac for water / p004f7 for oils) p004 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical m8x1.25 폴리프로필렌(ac) / 나일론(f7) 폴리프로필렌(ac) / nbr(f7) reed n.o./n.c. (spdt) 40 1 48 v ac/dc (250 v 요청 시) 0.7 -10~+80°c (ac) / -10~+100°c (f7) 물·산성 유체(ac) / 광유·경유·가솔린(f7) 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p005', 'P005', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P005 전자기식 레벨 센서', 'P005 Electromagnetic Level Sensor', 'M10 장스템 수직 플로트 레벨 스위치 (AC/F7 재질 옵션)', 'M10 long-stem vertical float level switch (AC/F7 material options)', 'M10x1 고정의 수직 플로트 레벨 스위치로 스템 길이 약 111mm의 장스템형입니다. P005AC는 폴리프로필렌(물·산성 유체용), P005F7은 나일론/NBR(오일·연료용)입니다. 플로트 반전으로 N.C./N.O. 전환 가능하며 SPDT 접점도 제공됩니다.', 'Vertical float level switch with M10x1 fixing and a longer (~111 mm) stem. P005AC in polypropylene for water/acids; P005F7 in nylon/NBR for oils and fuels. Contact convertible by flipping the float; SPDT available.',
  '{"mounting": "vertical", "process_connection": "M10x1", "stem_material": "폴리프로필렌(AC) / 나일론(F7)", "float_material": "폴리프로필렌(AC) / NBR(F7)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc (250 V 요청 시)", "min_specific_gravity": 0.7, "operating_temp": "-10~+80°C (AC) / -10~+100°C (F7)", "media": "물·산성 유체(AC) / 광유·경유·가솔린(F7)", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1050, 'p005 전자기식 레벨 센서 p005 electromagnetic level sensor m10 장스템 수직 플로트 레벨 스위치 (ac/f7 재질 옵션) m10 long-stem vertical float level switch (ac/f7 material options) p005 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical m10x1 폴리프로필렌(ac) / 나일론(f7) 폴리프로필렌(ac) / nbr(f7) reed n.o./n.c. (spdt) 40 1 48 v ac/dc (250 v 요청 시) 0.7 -10~+80°c (ac) / -10~+100°c (f7) 물·산성 유체(ac) / 광유·경유·가솔린(f7) 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p006', 'P006', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P006 전자기식 레벨 센서', 'P006 Electromagnetic Level Sensor', 'M10 초장스템(140mm) 수직 플로트 레벨 스위치', 'M10 extra-long stem (140 mm) vertical float level switch', 'M10x1 고정, 전장 약 140mm의 수직 플로트 레벨 스위치입니다. P006AC는 폴리프로필렌(물·산성 유체용), P006F7은 나일론/NBR(오일·연료용)입니다. 플로트 반전으로 N.C./N.O. 전환 가능, SPDT 접점 제공.', 'Vertical float level switch with M10x1 fixing and ~140 mm overall length. P006AC in polypropylene for water/acids; P006F7 in nylon/NBR for oils and fuels. Contact convertible by flipping the float; SPDT available.',
  '{"mounting": "vertical", "process_connection": "M10x1", "stem_material": "폴리프로필렌(AC) / 나일론(F7)", "float_material": "폴리프로필렌(AC) / NBR(F7)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc (250 V 요청 시)", "min_specific_gravity": 0.7, "operating_temp": "-10~+80°C (AC) / -10~+100°C (F7)", "media": "물·산성 유체(AC) / 광유·경유·가솔린(F7)", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1060, 'p006 전자기식 레벨 센서 p006 electromagnetic level sensor m10 초장스템(140mm) 수직 플로트 레벨 스위치 m10 extra-long stem (140 mm) vertical float level switch p006 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical m10x1 폴리프로필렌(ac) / 나일론(f7) 폴리프로필렌(ac) / nbr(f7) reed n.o./n.c. (spdt) 40 1 48 v ac/dc (250 v 요청 시) 0.7 -10~+80°c (ac) / -10~+100°c (f7) 물·산성 유체(ac) / 광유·경유·가솔린(f7) 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p0062', 'P0062', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P006 2단 전자기식 레벨 센서', 'P006 Electromagnetic Two-Level Sensor', '플로트 2개로 2개 레벨을 감지하는 M10 수직 레벨 스위치', 'M10 vertical level switch detecting two levels with two floats', 'P006 기반의 2단(2레벨) 감지형 수직 플로트 레벨 스위치입니다. 하나의 스템에 플로트 2개를 배치하여 두 지점의 레벨을 감지합니다. P0062AC는 폴리프로필렌(물·산성 유체), P0062F7은 나일론/NBR(오일·연료)입니다.', 'Two-level version of the P006 with two floats on one stem to detect two switching points. P0062AC in polypropylene for water/acids; P0062F7 in nylon/NBR for oils and fuels.',
  '{"mounting": "vertical", "process_connection": "M10x1", "stem_material": "폴리프로필렌(AC) / 나일론(F7)", "float_material": "폴리프로필렌(AC) / NBR(F7)", "contact_type": "Reed N.O./N.C. (SPDT), 2점 감지", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc (250 V 요청 시)", "min_specific_gravity": 0.7, "operating_temp": "-10~+80°C (AC) / -10~+100°C (F7)", "media": "물·산성 유체(AC) / 광유·경유·가솔린(F7)", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1070, 'p006 2단 전자기식 레벨 센서 p006 electromagnetic two-level sensor 플로트 2개로 2개 레벨을 감지하는 m10 수직 레벨 스위치 m10 vertical level switch detecting two levels with two floats p0062 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical m10x1 폴리프로필렌(ac) / 나일론(f7) 폴리프로필렌(ac) / nbr(f7) reed n.o./n.c. (spdt), 2점 감지 40 1 48 v ac/dc (250 v 요청 시) 0.7 -10~+80°c (ac) / -10~+100°c (f7) 물·산성 유체(ac) / 광유·경유·가솔린(f7) 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p200', 'P200', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P200 전자기식 레벨 센서', 'P200 Electromagnetic Level Sensor', 'M8 소형 수직 플로트 레벨 스위치 (P200AC 물/산성 유체, P200F7 오일/연료)', 'Compact M8 vertical float level switch (P200AC for water/acids, P200F7 for oils/fuels)', 'M8x1.25 나사 고정형 소형 수직 플로트 레벨 스위치입니다. P200AC는 폴리프로필렌 재질로 물·산성 유체용, P200F7은 나일론 스템과 NBR 플로트로 광유·경유·가솔린용입니다. 플로트를 뒤집어 N.C.에서 N.O.로 전환할 수 있으며 SPDT 접점 사양도 제공됩니다. 케이블 길이 500mm/1m/2m 옵션이 있습니다.', 'Compact vertical float level switch with M8x1.25 fixing. P200AC in polypropylene for water and acids; P200F7 with nylon stem and NBR float for mineral oils, diesel and petrol. The contact converts from N.C. to N.O. by flipping the float; SPDT contact versions available. Cable options 500 mm / 1 m / 2 m.',
  '{"mounting": "vertical", "process_connection": "M8x1.25", "stem_material": "폴리프로필렌(AC) / 나일론(F7)", "float_material": "폴리프로필렌(AC) / NBR(F7)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc (250 V 요청 시)", "min_specific_gravity": 0.7, "operating_temp": "-10~+80°C (AC) / -10~+100°C (F7)", "media": "물·산성 유체(AC) / 광유·경유·가솔린(F7)", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1080, 'p200 전자기식 레벨 센서 p200 electromagnetic level sensor m8 소형 수직 플로트 레벨 스위치 (p200ac 물/산성 유체, p200f7 오일/연료) compact m8 vertical float level switch (p200ac for water/acids, p200f7 for oils/fuels) p200 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical m8x1.25 폴리프로필렌(ac) / 나일론(f7) 폴리프로필렌(ac) / nbr(f7) reed n.o./n.c. (spdt) 40 1 48 v ac/dc (250 v 요청 시) 0.7 -10~+80°c (ac) / -10~+100°c (f7) 물·산성 유체(ac) / 광유·경유·가솔린(f7) 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p28', 'P28', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P28 전자기식 레벨 센서', 'P28 Electromagnetic Level Sensor', '황동 스템 G1/2 수직 플로트 레벨 스위치 (L 44~238mm)', 'Brass-stem G1/2 vertical float level switch (L 44-238 mm)', '황동 스템과 G1/2" 나사 고정의 수직 플로트 레벨 스위치입니다. NBR 플로트로 광유·경유·가솔린·물·세제에 사용되며, 길이 44~238mm의 10가지 표준 사양과 2접점(2×N.O.) 및 SPDT 배선 옵션이 있습니다.', 'Vertical float level switch with brass stem and G1/2" fixing. NBR float for mineral oils, diesel, petrol, water and detergents; ten standard lengths from 44 to 238 mm with dual-contact and SPDT wiring options.',
  '{"mounting": "vertical", "process_connection": "G1/2\"", "stem_material": "황동", "float_material": "NBR", "contact_type": "Reed N.O./N.C.", "max_switching_power_w": 10, "max_switching_current_a": 0.5, "max_switching_voltage": "50 V", "min_specific_gravity": 0.7, "operating_temp": "-10~+100°C", "media": "광유·경유·가솔린·물·세제", "length_options": "L = 44 / 80 / 100 / 125 / 150 / 168 / 183 / 198 / 228 / 238mm"}'::jsonb, true, 1090, 'p28 전자기식 레벨 센서 p28 electromagnetic level sensor 황동 스템 g1/2 수직 플로트 레벨 스위치 (l 44~238mm) brass-stem g1/2 vertical float level switch (l 44-238 mm) p28 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical g1/2" 황동 nbr reed n.o./n.c. 10 0.5 50 v 0.7 -10~+100°c 광유·경유·가솔린·물·세제 l = 44 / 80 / 100 / 125 / 150 / 168 / 183 / 198 / 228 / 238mm')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p34', 'P34', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P34 전자기식 레벨 센서', 'P34 Electromagnetic Level Sensor', '1/8" 테이퍼 나사 황동 수직 레벨 스위치 (원통형 대형 플로트)', 'Brass vertical level switch with 1/8" conical thread and large cylindrical float', '1/8" gas 테이퍼 나사와 황동 스템의 수직 플로트 레벨 스위치입니다. 발포 나일론 플로트(1bar 초과 시 NBR 권장)와 1000mm PVC 케이블 사양이며 광유·연료·물에 사용됩니다.', 'Vertical float level switch with 1/8" gas conical thread and brass stem. Foamed nylon float (NBR above 1 bar) and 1000 mm PVC cable; for mineral oils, fuels and water.',
  '{"mounting": "vertical", "process_connection": "1/8\" gas 테이퍼", "stem_material": "황동", "float_material": "발포 나일론 (1bar 초과 시 NBR 권장)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 80, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac (SPDT 220 Vac)", "min_specific_gravity": 0.75, "operating_temp": "-20~+100°C", "media": "광유·연료·물", "length_options": "케이블 1000mm 0.5mm² PVC"}'::jsonb, true, 1100, 'p34 전자기식 레벨 센서 p34 electromagnetic level sensor 1/8" 테이퍼 나사 황동 수직 레벨 스위치 (원통형 대형 플로트) brass vertical level switch with 1/8" conical thread and large cylindrical float p34 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 1/8" gas 테이퍼 황동 발포 나일론 (1bar 초과 시 nbr 권장) reed n.o./n.c. (spdt) 80 1 250 vac (spdt 220 vac) 0.75 -20~+100°c 광유·연료·물 케이블 1000mm 0.5mm² pvc')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p35', 'P35', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P35 전자기식 레벨 센서', 'P35 Electromagnetic Level Sensor', '3/8" gas 황동 수직 레벨 스위치 (L 150mm)', 'Brass vertical level switch with 3/8" gas thread (L 150 mm)', '3/8" gas 나사와 황동 스템의 수직 플로트 레벨 스위치입니다. NBR 플로트와 1000mm PVC 케이블 사양으로 광유·연료·물에 사용됩니다.', 'Vertical float level switch with 3/8" gas thread and brass stem. NBR float and 1000 mm PVC cable; for mineral oils, fuels and water.',
  '{"mounting": "vertical", "process_connection": "3/8\" gas", "stem_material": "황동", "float_material": "NBR", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 80, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac (SPDT 220 Vac)", "min_specific_gravity": 0.75, "operating_temp": "-20~+100°C", "media": "광유·연료·물", "length_options": "L = 150mm, 케이블 1000mm 0.5mm² PVC"}'::jsonb, true, 1110, 'p35 전자기식 레벨 센서 p35 electromagnetic level sensor 3/8" gas 황동 수직 레벨 스위치 (l 150mm) brass vertical level switch with 3/8" gas thread (l 150 mm) p35 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 3/8" gas 황동 nbr reed n.o./n.c. (spdt) 80 1 250 vac (spdt 220 vac) 0.75 -20~+100°c 광유·연료·물 l = 150mm, 케이블 1000mm 0.5mm² pvc')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p38', 'P38', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P38 스테인리스 전자기식 레벨 센서', 'P38 Stainless Steel Electromagnetic Level Sensor', '3/4" NPT 스테인리스 수직 레벨 스위치 (L 100~1000mm)', 'Stainless vertical level switch, 3/4" NPT (L 100-1000 mm)', '3/4" NPT AISI 304(요청 시 316) 고정과 스테인리스 스템·316 플로트의 수직 레벨 스위치입니다. 길이 100~1000mm(50mm 단위)로 주문하며 HT 버전은 -20~+200°C까지 지원합니다. 물·산성 유체(요청 시 식품용 유체)에 적합합니다.', 'Vertical level switch with 3/4" NPT AISI 304 fixing (316 on request), stainless stem and AISI 316 float. Lengths 100-1000 mm in 50 mm steps; HT version rated -20 to +200°C. For water and acids (alimentary liquids on request).',
  '{"mounting": "vertical", "process_connection": "3/4\" NPT (AISI 304, 316 요청 시)", "stem_material": "스테인리스 AISI 304 (316 요청 시)", "float_material": "스테인리스 AISI 316", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "<250 Vac (SPDT 50 V)", "min_specific_gravity": 0.95, "operating_temp": "-20~+100°C (HT -20~+200°C)", "media": "물·산성 유체 (식품용 유체 요청 시)", "length_options": "L 총 100~1000mm (50mm 단위), 케이블 요청 사양"}'::jsonb, true, 1120, 'p38 스테인리스 전자기식 레벨 센서 p38 stainless steel electromagnetic level sensor 3/4" npt 스테인리스 수직 레벨 스위치 (l 100~1000mm) stainless vertical level switch, 3/4" npt (l 100-1000 mm) p38 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 3/4" npt (aisi 304, 316 요청 시) 스테인리스 aisi 304 (316 요청 시) 스테인리스 aisi 316 reed n.o./n.c. (spdt) 40 1 <250 vac (spdt 50 v) 0.95 -20~+100°c (ht -20~+200°c) 물·산성 유체 (식품용 유체 요청 시) l 총 100~1000mm (50mm 단위), 케이블 요청 사양')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p39', 'P39', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P39 다단 전자기식 레벨 센서', 'P39 Multi-Level Electromagnetic Level Sensor', '최대 4개 플로트 다단 레벨 스위치 (G1" 알루미늄, L 100~1000mm)', 'Multi-level switch with up to 4 floats (aluminum G1", L 100-1000 mm)', '하나의 스템에 최대 4개의 플로트를 배치해 여러 레벨을 감지하는 다단 레벨 스위치입니다. 양극산화 알루미늄 G1" 고정, 황동 스템, NBR 플로트 사양이며 총길이 100~1000mm(50mm 단위)로 주문 가능합니다.', 'Multi-level switch with up to four floats on one stem. Anodized aluminum G1" fixing, brass stem, NBR floats; total length 100-1000 mm in 50 mm steps (L1-L4 specified at order).',
  '{"mounting": "vertical", "process_connection": "G1\" (양극산화 알루미늄)", "stem_material": "황동", "float_material": "NBR", "contact_type": "Reed N.O./N.C. (SPDT), 최대 4점", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "50 V", "min_specific_gravity": 0.7, "operating_temp": "-20~+100°C", "media": "광유·연료·물", "length_options": "L 총 100~1000mm (50mm 단위), 케이블 PVC 1m"}'::jsonb, true, 1130, 'p39 다단 전자기식 레벨 센서 p39 multi-level electromagnetic level sensor 최대 4개 플로트 다단 레벨 스위치 (g1" 알루미늄, l 100~1000mm) multi-level switch with up to 4 floats (aluminum g1", l 100-1000 mm) p39 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical g1" (양극산화 알루미늄) 황동 nbr reed n.o./n.c. (spdt), 최대 4점 40 1 50 v 0.7 -20~+100°c 광유·연료·물 l 총 100~1000mm (50mm 단위), 케이블 pvc 1m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p39d', 'P39D', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P39D 다단 전자기식 레벨 센서 (단자함형)', 'P39D Multi-Level Electromagnetic Level Sensor with Terminal Box', 'DINB 단자함 채용 최대 5점 다단 레벨 스위치', 'Multi-level switch with DINB terminal box, up to 5 levels', 'P39의 단자함(DINB 단자대+커버) 버전으로 최대 5개 레벨을 감지할 수 있습니다. G1" 알루미늄 고정, 황동 스템, NBR 플로트이며 총길이 100~1000mm(50mm 단위)로 주문합니다.', 'Terminal-box version of the P39 (DINB terminal blocks with housing) sensing up to five levels. Aluminum G1" fixing, brass stem, NBR floats; total length 100-1000 mm in 50 mm steps.',
  '{"mounting": "vertical", "process_connection": "G1\" (양극산화 알루미늄)", "stem_material": "황동", "float_material": "NBR", "contact_type": "Reed N.O./N.C. (SPDT), 최대 5점", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "50 V", "min_specific_gravity": 0.7, "operating_temp": "-20~+100°C", "media": "광유·연료·물", "length_options": "L 총 100~1000mm (50mm 단위)"}'::jsonb, true, 1140, 'p39d 다단 전자기식 레벨 센서 (단자함형) p39d multi-level electromagnetic level sensor with terminal box dinb 단자함 채용 최대 5점 다단 레벨 스위치 multi-level switch with dinb terminal box, up to 5 levels p39d euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical g1" (양극산화 알루미늄) 황동 nbr reed n.o./n.c. (spdt), 최대 5점 40 1 50 v 0.7 -20~+100°c 광유·연료·물 l 총 100~1000mm (50mm 단위)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p3x', 'P3x', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P3x 전자기식 레벨 센서', 'P3x Electromagnetic Level Sensor', '플랜지/나사 고정 산업용 수직 레벨 스위치 (L 100~500mm, IP65)', 'Industrial vertical level switch with flange or thread fixing (L 100-500 mm, IP65)', 'P30(3홀 플랜지), P31(G1"), P32/P32P(2홀 플랜지), P33(M18x1.5) 고정 옵션의 산업용 수직 플로트 레벨 스위치입니다. 황동 스템과 발포 나일론 플로트(1bar 초과 압력 시 NBR 권장), DIN43650 커넥터 IP65 사양이며 Ex·RINA 인증을 요청할 수 있습니다.', 'Industrial vertical float level switch with fixing options P30 (3-hole flange), P31 (G1"), P32/P32P (2-hole flanges), P33 (M18x1.5). Brass stem, foamed nylon float (NBR recommended above 1 bar), DIN43650 connector with IP65; Ex and RINA certifications on request.',
  '{"mounting": "vertical", "process_connection": "3홀 플랜지 / G1\" / 2홀 플랜지 Ø42·Ø43 / M18x1.5", "stem_material": "황동 (고정부 양극산화 알루미늄)", "float_material": "발포 나일론 (1bar 초과 시 NBR 권장)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 80, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac (SPDT 220 Vac)", "min_specific_gravity": 0.75, "operating_temp": "-20~+100°C", "media": "광유·연료·물", "length_options": "L = 100~500mm (50mm 단위)"}'::jsonb, true, 1150, 'p3x 전자기식 레벨 센서 p3x electromagnetic level sensor 플랜지/나사 고정 산업용 수직 레벨 스위치 (l 100~500mm, ip65) industrial vertical level switch with flange or thread fixing (l 100-500 mm, ip65) p3x euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 3홀 플랜지 / g1" / 2홀 플랜지 ø42·ø43 / m18x1.5 황동 (고정부 양극산화 알루미늄) 발포 나일론 (1bar 초과 시 nbr 권장) reed n.o./n.c. (spdt) 80 1 250 vac (spdt 220 vac) 0.75 -20~+100°c 광유·연료·물 l = 100~500mm (50mm 단위)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p3x0', 'P3x0', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P3x0 2단 전자기식 레벨 센서', 'P3x0 Two-Level Electromagnetic Level Sensor', 'P3x 기반 2단(2레벨) 감지형 레벨 스위치', 'Two-level version of the P3x level switch', 'P3x 시리즈의 2단 감지 버전으로 하나의 스템에 플로트 2개를 배치하여 L1/L2 두 지점을 감지합니다. P300(3홀 플랜지), P310(G1"), P320/P320P(2홀 플랜지) 고정 옵션이 있으며 DIN43650 커넥터 IP65 사양입니다.', 'Two-level version of the P3x with two floats on one stem sensing at L1/L2. Fixing options P300 (3-hole flange), P310 (G1"), P320/P320P (2-hole flanges); DIN43650 connector with IP65.',
  '{"mounting": "vertical", "process_connection": "3홀 플랜지 / G1\" / 2홀 플랜지 Ø42·Ø43", "stem_material": "황동 (고정부 양극산화 알루미늄)", "float_material": "발포 나일론 (1bar 초과 시 NBR 권장)", "contact_type": "Reed N.O./N.C., 2점 감지", "max_switching_power_w": 80, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac", "min_specific_gravity": 0.75, "operating_temp": "-20~+100°C", "media": "광유·연료·물", "length_options": "L1 200~500mm / L2 95~125mm 조합"}'::jsonb, true, 1160, 'p3x0 2단 전자기식 레벨 센서 p3x0 two-level electromagnetic level sensor p3x 기반 2단(2레벨) 감지형 레벨 스위치 two-level version of the p3x level switch p3x0 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 3홀 플랜지 / g1" / 2홀 플랜지 ø42·ø43 황동 (고정부 양극산화 알루미늄) 발포 나일론 (1bar 초과 시 nbr 권장) reed n.o./n.c., 2점 감지 80 1 250 vac 0.75 -20~+100°c 광유·연료·물 l1 200~500mm / l2 95~125mm 조합')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p4x', 'P4x', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P4x 전자기식 레벨 센서', 'P4x Electromagnetic Level Sensor', 'M12 커넥터 채용 황동 수직 레벨 스위치 (M20x1.5/G3/4/G1/2)', 'Brass vertical level switch with M12 connector (M20x1.5 / G3/4 / G1/2)', 'M12x1 커넥터를 채용한 수직 플로트 레벨 스위치로 P40(M20x1.5), P41(G3/4"), P42(G1/2") 고정 옵션이 있습니다. 황동 스템과 NBR 플로트, 총길이 100~1000mm(50mm 단위) 사양이며 광유·경유·가솔린·물·세제에 사용됩니다.', 'Vertical float level switch with M12x1 connector; fixing options P40 (M20x1.5), P41 (G3/4"), P42 (G1/2"). Brass stem, NBR float, total length 100-1000 mm in 50 mm steps; for mineral oils, diesel, petrol, water and detergents.',
  '{"mounting": "vertical", "process_connection": "M20x1.5 (P40) / G3/4\" (P41) / G1/2\" (P42)", "stem_material": "황동", "float_material": "NBR", "contact_type": "Reed N.O./N.C. (요청 시 SPDT)", "max_switching_power_w": 10, "max_switching_current_a": 0.5, "max_switching_voltage": "50 V", "min_specific_gravity": 0.7, "operating_temp": "-10~+100°C", "media": "광유·경유·가솔린·물·세제", "length_options": "L 총 100~1000mm (50mm 단위), M12x1 커넥터"}'::jsonb, true, 1170, 'p4x 전자기식 레벨 센서 p4x electromagnetic level sensor m12 커넥터 채용 황동 수직 레벨 스위치 (m20x1.5/g3/4/g1/2) brass vertical level switch with m12 connector (m20x1.5 / g3/4 / g1/2) p4x euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical m20x1.5 (p40) / g3/4" (p41) / g1/2" (p42) 황동 nbr reed n.o./n.c. (요청 시 spdt) 10 0.5 50 v 0.7 -10~+100°c 광유·경유·가솔린·물·세제 l 총 100~1000mm (50mm 단위), m12x1 커넥터')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p500', 'P500', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P500 측면 장착 전자기식 레벨 센서', 'P500 Electromagnetic Level Sensor, Lateral Fixing', 'M16x2 측면 장착 힌지 플로트 레벨 스위치', 'M16x2 lateral-fixing hinged float level switch', '탱크 측벽에 M16x2 나사로 장착하는 측면형 플로트 레벨 스위치입니다. P500AH는 폴리프로필렌(물·산성 유체용, 실리콘 O-링), P500F8은 나일론(광유·경유용, Viton O-링)입니다. 플로트 반전으로 N.C./N.O. 전환 가능, SPDT 제공.', 'Lateral float level switch mounted through the tank wall with an M16x2 thread. P500AH in polypropylene (water/acids, silicone O-ring); P500F8 in nylon (mineral oils/diesel, Viton O-ring). Contact convertible by flipping the float; SPDT available.',
  '{"mounting": "lateral", "process_connection": "M16x2", "stem_material": "폴리프로필렌(AH) / 나일론(F8)", "float_material": "폴리프로필렌(AH) / 나일론(F8)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc (250 V 요청 시)", "min_specific_gravity": 0.75, "operating_temp": "-10~+80°C (AH) / -10~+100°C (F8)", "media": "물·산성 유체(AH) / 광유·경유(F8)", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1180, 'p500 측면 장착 전자기식 레벨 센서 p500 electromagnetic level sensor, lateral fixing m16x2 측면 장착 힌지 플로트 레벨 스위치 m16x2 lateral-fixing hinged float level switch p500 euroswitch 플로트 레벨 스위치 float level switches lateral 측면(수평) lateral (horizontal) m16x2 폴리프로필렌(ah) / 나일론(f8) 폴리프로필렌(ah) / 나일론(f8) reed n.o./n.c. (spdt) 40 1 48 v ac/dc (250 v 요청 시) 0.75 -10~+80°c (ah) / -10~+100°c (f8) 물·산성 유체(ah) / 광유·경유(f8) 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p520', 'P520', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P520 확장 개스킷형 전자기식 레벨 센서', 'P520 Electromagnetic Level Sensor with Expansion Gasket', '확장 개스킷으로 무나사 장착하는 측면형 플로트 레벨 스위치', 'Lateral float level switch mounted with an expansion gasket (no thread)', '확장 개스킷 방식으로 22mm 홀에 끼워 고정하는 측면형 플로트 레벨 스위치입니다. P520AH는 폴리프로필렌(물·산성 유체, 실리콘 개스킷), P520F8은 나일론(오일·연료, NBR 개스킷)입니다. 벽 두께 2~5mm를 권장합니다.', 'Lateral float level switch fixed in a 22 mm hole by an expansion gasket. P520AH in polypropylene (water/acids, silicone gasket); P520F8 in nylon (oils/fuels, NBR gasket). A burr-free 22 mm hole and 2-5 mm wall thickness are recommended.',
  '{"mounting": "lateral", "process_connection": "확장 개스킷 (Ø22mm 홀)", "stem_material": "폴리프로필렌(AH) / 나일론(F8)", "float_material": "폴리프로필렌(AH) / 나일론(F8)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc (250 V 요청 시)", "min_specific_gravity": 0.8, "operating_temp": "-10~+80°C (AH) / -10~+100°C (F8)", "media": "물·산성 유체(AH) / 광유·경유·가솔린(F8)", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1190, 'p520 확장 개스킷형 전자기식 레벨 센서 p520 electromagnetic level sensor with expansion gasket 확장 개스킷으로 무나사 장착하는 측면형 플로트 레벨 스위치 lateral float level switch mounted with an expansion gasket (no thread) p520 euroswitch 플로트 레벨 스위치 float level switches lateral 측면(수평) lateral (horizontal) 확장 개스킷 (ø22mm 홀) 폴리프로필렌(ah) / 나일론(f8) 폴리프로필렌(ah) / 나일론(f8) reed n.o./n.c. (spdt) 40 1 48 v ac/dc (250 v 요청 시) 0.8 -10~+80°c (ah) / -10~+100°c (f8) 물·산성 유체(ah) / 광유·경유·가솔린(f8) 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p530', 'P530', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P530 측면 장착 레벨 센서 (G3/4 황동)', 'P530 Lateral Level Sensor, 3/4" Brass Connection', '황동 3/4" 나사 측면 장착 플로트 레벨 스위치', 'Lateral float level switch with brass 3/4" thread', '황동 3/4" 테이퍼 나사로 탱크 측벽에 장착하는 플로트 레벨 스위치입니다. P530AH는 폴리프로필렌(물용), P530F8은 나일론(광유·경유·가솔린용)입니다. 플로트 반전으로 N.C./N.O. 전환 가능, SPDT 제공, 중량 약 90g.', 'Lateral float level switch with a brass 3/4" conical thread. P530AH in polypropylene for water; P530F8 in nylon for mineral oils, diesel and petrol. Contact convertible by flipping the float; SPDT available; weight ~90 g.',
  '{"mounting": "lateral", "process_connection": "3/4\" G (황동)", "stem_material": "폴리프로필렌(AH) / 나일론(F8)", "float_material": "폴리프로필렌(AH) / 나일론(F8)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc", "min_specific_gravity": 0.8, "operating_temp": "-10~+80°C (AH) / -10~+100°C (F8)", "media": "물(AH) / 광유·경유·가솔린(F8)", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1200, 'p530 측면 장착 레벨 센서 (g3/4 황동) p530 lateral level sensor, 3/4" brass connection 황동 3/4" 나사 측면 장착 플로트 레벨 스위치 lateral float level switch with brass 3/4" thread p530 euroswitch 플로트 레벨 스위치 float level switches lateral 측면(수평) lateral (horizontal) 3/4" g (황동) 폴리프로필렌(ah) / 나일론(f8) 폴리프로필렌(ah) / 나일론(f8) reed n.o./n.c. (spdt) 40 1 48 v ac/dc 0.8 -10~+80°c (ah) / -10~+100°c (f8) 물(ah) / 광유·경유·가솔린(f8) 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p531-p540', 'P531-P540', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P531-P540 측면 장착 레벨 센서 (G3/4 / G1")', 'P531-P540 Lateral Level Sensor, G3/4" - G1" Connection', '황동 G3/4(P531)/G1(P540) 나사, DIN43650 커넥터 IP65 측면형 레벨 스위치', 'Brass G3/4 (P531) / G1 (P540) lateral level switch with IP65 DIN43650 connector', '황동 G3/4"(P531) 또는 G1"(P540) 나사로 장착하는 측면형 플로트 레벨 스위치입니다. UNI EN 175301-803(DIN43650) 규격 커넥터로 IP65 보호 등급을 제공합니다. AH형(폴리프로필렌)은 물용, F8형(나일론)은 광유·경유·가솔린용입니다.', 'Lateral float level switch with brass G3/4" (P531) or G1" (P540) thread, with UNI EN 175301-803 (DIN43650) connector providing IP65. AH versions (polypropylene) for water; F8 versions (nylon) for mineral oils, diesel and petrol.',
  '{"mounting": "lateral", "process_connection": "G3/4\" (P531) / G1\" (P540), 황동", "stem_material": "폴리프로필렌(AH) / 나일론(F8)", "float_material": "폴리프로필렌(AH) / 나일론(F8)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc", "min_specific_gravity": 0.8, "operating_temp": "-10~+100°C", "media": "물(AH) / 광유·경유·가솔린(F8)", "length_options": "L1 19mm(P531) / 16mm(P540)"}'::jsonb, true, 1210, 'p531-p540 측면 장착 레벨 센서 (g3/4 / g1") p531-p540 lateral level sensor, g3/4" - g1" connection 황동 g3/4(p531)/g1(p540) 나사, din43650 커넥터 ip65 측면형 레벨 스위치 brass g3/4 (p531) / g1 (p540) lateral level switch with ip65 din43650 connector p531-p540 euroswitch 플로트 레벨 스위치 float level switches lateral 측면(수평) lateral (horizontal) g3/4" (p531) / g1" (p540), 황동 폴리프로필렌(ah) / 나일론(f8) 폴리프로필렌(ah) / 나일론(f8) reed n.o./n.c. (spdt) 40 1 48 v ac/dc 0.8 -10~+100°c 물(ah) / 광유·경유·가솔린(f8) l1 19mm(p531) / 16mm(p540)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p535', 'P535', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P535 측면 장착 레벨 센서 (G1/2 플라스틱)', 'P535 Lateral Level Sensor, G1/2 Connection', 'G1/2 테이퍼 나사(수지) 측면 장착 플로트 레벨 스위치', 'Lateral float level switch with plastic G1/2 conical thread', 'G1/2 테이퍼 나사(수지 재질)로 장착하는 측면형 플로트 레벨 스위치입니다. P535AH는 폴리프로필렌(물·산성 유체용), P535F8은 나일론(광유·경유용)입니다. 플로트 반전으로 N.C./N.O. 전환 가능, SPDT 제공, 중량 약 24g.', 'Lateral float level switch with a plastic G1/2 conical thread. P535AH in polypropylene for water/acids; P535F8 in nylon for mineral oils and diesel. Contact convertible by flipping the float; SPDT available; weight ~24 g.',
  '{"mounting": "lateral", "process_connection": "G1/2 테이퍼 (수지)", "stem_material": "폴리프로필렌(AH) / 나일론(F8)", "float_material": "폴리프로필렌(AH) / 나일론(F8)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc (250 V 요청 시)", "min_specific_gravity": 0.8, "operating_temp": "-10~+80°C (AH) / -10~+100°C (F8)", "media": "물·산성 유체(AH) / 광유·경유(F8)", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1220, 'p535 측면 장착 레벨 센서 (g1/2 플라스틱) p535 lateral level sensor, g1/2 connection g1/2 테이퍼 나사(수지) 측면 장착 플로트 레벨 스위치 lateral float level switch with plastic g1/2 conical thread p535 euroswitch 플로트 레벨 스위치 float level switches lateral 측면(수평) lateral (horizontal) g1/2 테이퍼 (수지) 폴리프로필렌(ah) / 나일론(f8) 폴리프로필렌(ah) / 나일론(f8) reed n.o./n.c. (spdt) 40 1 48 v ac/dc (250 v 요청 시) 0.8 -10~+80°c (ah) / -10~+100°c (f8) 물·산성 유체(ah) / 광유·경유(f8) 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p580', 'P580', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P580 측면 장착 레벨 센서 (1/2" NPT 황동)', 'P580 Lateral Level Sensor, 1/2" NPT Connection', '황동 1/2" NPT 나사 측면 장착 플로트 레벨 스위치', 'Lateral float level switch with brass 1/2" NPT thread', '황동 1/2" NPT 나사로 장착하는 측면형 플로트 레벨 스위치입니다. P580AH는 폴리프로필렌(물용), P580F8은 나일론(광유·경유·가솔린용)입니다. 플로트 반전으로 N.C./N.O. 전환 가능, SPDT 제공, 중량 약 90g.', 'Lateral float level switch with a brass 1/2" NPT thread. P580AH in polypropylene for water; P580F8 in nylon for mineral oils, diesel and petrol. Contact convertible by flipping the float; SPDT available; weight ~90 g.',
  '{"mounting": "lateral", "process_connection": "1/2\" NPT (황동)", "stem_material": "폴리프로필렌(AH) / 나일론(F8)", "float_material": "폴리프로필렌(AH) / 나일론(F8)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc", "min_specific_gravity": 0.8, "operating_temp": "-10~+80°C (AH) / -10~+100°C (F8)", "media": "물(AH) / 광유·경유·가솔린(F8)", "length_options": "케이블 500mm / 1m / 2m"}'::jsonb, true, 1230, 'p580 측면 장착 레벨 센서 (1/2" npt 황동) p580 lateral level sensor, 1/2" npt connection 황동 1/2" npt 나사 측면 장착 플로트 레벨 스위치 lateral float level switch with brass 1/2" npt thread p580 euroswitch 플로트 레벨 스위치 float level switches lateral 측면(수평) lateral (horizontal) 1/2" npt (황동) 폴리프로필렌(ah) / 나일론(f8) 폴리프로필렌(ah) / 나일론(f8) reed n.o./n.c. (spdt) 40 1 48 v ac/dc 0.8 -10~+80°c (ah) / -10~+100°c (f8) 물(ah) / 광유·경유·가솔린(f8) 케이블 500mm / 1m / 2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p595', 'P595', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P595 측면 장착 스테인리스 레벨 센서', 'P595 Lateral Level Sensor, Stainless Steel', 'AISI 304 스테인리스 1/2" NPT 측면형 플로트 레벨 스위치', 'AISI 304 stainless steel lateral float level switch, 1/2" NPT', '스템과 플로트가 모두 AISI 304 스테인리스인 측면형 플로트 레벨 스위치입니다. 1/2" NPT 나사로 장착하며 물·오일·산성 유체·연료(요청 시 식품용 유체)에 사용됩니다. -40~+120°C의 넓은 온도 범위를 지원합니다.', 'Lateral float level switch with stem and float in AISI 304 stainless steel, 1/2" NPT fixing. For water, oil, acids and fuels (alimentary liquids on request), with a wide -40 to +120°C temperature range.',
  '{"mounting": "lateral", "process_connection": "1/2\" NPT", "stem_material": "스테인리스 AISI 304", "float_material": "스테인리스 AISI 304", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 50, "max_switching_current_a": 0.5, "max_switching_voltage": "250 Vac (SPDT 50 V)", "min_specific_gravity": 0.8, "operating_temp": "-40~+120°C", "media": "물·오일·산성 유체·연료 (식품용 유체 요청 시)", "length_options": "케이블 500mm (기타 요청 시)"}'::jsonb, true, 1240, 'p595 측면 장착 스테인리스 레벨 센서 p595 lateral level sensor, stainless steel aisi 304 스테인리스 1/2" npt 측면형 플로트 레벨 스위치 aisi 304 stainless steel lateral float level switch, 1/2" npt p595 euroswitch 플로트 레벨 스위치 float level switches lateral 측면(수평) lateral (horizontal) 1/2" npt 스테인리스 aisi 304 스테인리스 aisi 304 reed n.o./n.c. (spdt) 50 0.5 250 vac (spdt 50 v) 0.8 -40~+120°c 물·오일·산성 유체·연료 (식품용 유체 요청 시) 케이블 500mm (기타 요청 시)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p650', 'P650', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P650 전자기식 레벨 센서', 'P650 Electromagnetic Level Sensor', 'NBR 플러그 고정형 수직 플로트 레벨 스위치 (L2 50~500mm)', 'Vertical float level switch with NBR plug fixing (L2 50-500 mm)', 'NBR 플러그를 탱크 홀에 끼워 고정하는 수직 플로트 레벨 스위치입니다. 나일론 스템과 NBR 플로트로 광유·경유·가솔린에 적합하며 감지 길이 L2를 50~500mm 범위에서 지정할 수 있습니다. IP65 보호 등급입니다.', 'Vertical float level switch fixed by an NBR plug pushed into the tank hole. Nylon stem and NBR float for mineral oils, diesel and petrol; sensing length L2 selectable from 50 to 500 mm. IP65 protection.',
  '{"mounting": "vertical", "process_connection": "NBR 플러그", "stem_material": "나일론", "float_material": "NBR", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc", "min_specific_gravity": 0.7, "operating_temp": "-10~+80°C", "media": "광유·경유·가솔린", "length_options": "L2 = 50~500mm, 케이블 1m"}'::jsonb, true, 1250, 'p650 전자기식 레벨 센서 p650 electromagnetic level sensor nbr 플러그 고정형 수직 플로트 레벨 스위치 (l2 50~500mm) vertical float level switch with nbr plug fixing (l2 50-500 mm) p650 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical nbr 플러그 나일론 nbr reed n.o./n.c. (spdt) 40 1 48 v ac/dc 0.7 -10~+80°c 광유·경유·가솔린 l2 = 50~500mm, 케이블 1m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p68', 'P68', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P68 전자기식 레벨 센서', 'P68 Electromagnetic Level Sensor', 'P8 마이크로 커넥터(DIN43650) 채용 수직 레벨 스위치, IP65', 'Vertical level switch with P8 micro DIN43650 connector, IP65', 'G3/8"(P680/681), M20x1.5(P685/686), M30x1.5(P688/689) 고정 옵션의 수직 플로트 레벨 스위치입니다. UNI EN 175301-803(DIN43650) P8 마이크로 커넥터로 IP65를 만족하며, 스템 길이 L1은 주문 시 지정합니다. 광유·경유·가솔린용입니다.', 'Vertical float level switch with G3/8" (P680/681), M20x1.5 (P685/686) or M30x1.5 (P688/689) fixing. P8 micro connector to UNI EN 175301-803 (DIN43650) provides IP65; stem length L1 specified at order. For mineral oils, diesel and petrol.',
  '{"mounting": "vertical", "process_connection": "G3/8\" / M20x1.5 / M30x1.5", "stem_material": "나일론", "float_material": "폴리프로필렌", "contact_type": "Reed N.O./N.C. (SPDT 사양 P681/686/689)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc", "min_specific_gravity": 0.75, "operating_temp": "-10~+80°C", "media": "광유·경유·가솔린", "length_options": "L1 주문 지정"}'::jsonb, true, 1260, 'p68 전자기식 레벨 센서 p68 electromagnetic level sensor p8 마이크로 커넥터(din43650) 채용 수직 레벨 스위치, ip65 vertical level switch with p8 micro din43650 connector, ip65 p68 euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical g3/8" / m20x1.5 / m30x1.5 나일론 폴리프로필렌 reed n.o./n.c. (spdt 사양 p681/686/689) 40 1 48 v ac/dc 0.75 -10~+80°c 광유·경유·가솔린 l1 주문 지정')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p900-p930', 'P900-P930', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-resistive-level-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P900-P930 연속 제어 저항식 레벨 센서', 'P900-P930 Continuous Control Resistive Level Sensor', '소형 연속 제어형 저항식 레벨 센서 모듈 (P900 브래킷형 / P930 원통형)', 'Miniature continuous-control resistive level sensor modules (P900 bracket / P930 tubular)', '리드 접점 기반의 소형 연속 제어형 저항식 레벨 센서 모듈입니다. P900은 브래킷 장착형, P930은 Ø5.6 원통형이며 나일론 스템과 500mm PVC 배선 사양입니다. 출력 저항값·고정 방식 등 커스텀 사양은 별도 문의합니다.', 'Miniature continuous-control resistive level sensor modules based on reed contacts. P900 is bracket-mounted, P930 a Ø5.6 tubular body; nylon stem with 500 mm PVC wiring. Custom resistance values, fixing and connections on request.',
  '{"fixing": "브래킷 (P900) / 원통형 삽입 (P930)", "stem_material": "나일론", "float_material": null, "output_signal": "저항 (연속 제어)", "resistance_range": "커스텀 사양 (요청 시)", "resolution_pitch": null, "length_range": "P900 25.8mm / P930 30mm 본체", "protection_rating": null, "min_specific_gravity": null, "operating_temp": "-10~+80°C", "media": "탱크 내 유체 (요청 사양)", "stabilized_room": false}'::jsonb, true, 1270, 'p900-p930 연속 제어 저항식 레벨 센서 p900-p930 continuous control resistive level sensor 소형 연속 제어형 저항식 레벨 센서 모듈 (p900 브래킷형 / p930 원통형) miniature continuous-control resistive level sensor modules (p900 bracket / p930 tubular) p900-p930 euroswitch 저항식 레벨 센서 resistive level sensors 브래킷 (p900) / 원통형 삽입 (p930) 나일론 저항 (연속 제어) 커스텀 사양 (요청 시) p900 25.8mm / p930 30mm 본체 -10~+80°c 탱크 내 유체 (요청 사양) false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-p915-p920', 'P915-P920', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'P915-P920 착탈식 탱크용 레벨 센서', 'P915-P920 Level Sensor for Removable Tanks', '착탈식 탱크용 분리형 센서+플로트 레벨 스위치', 'Separate sensor + float level switch for removable tanks', '센서부와 플로트(GLL016)가 분리된 착탈식 탱크용 레벨 스위치로, 탱크를 분리해도 배선이 끊어지지 않는 구조입니다. P915는 리드 N.O.(10W), P920은 N.O./SPDT(40W) 사양입니다. 물·산성 유체·세제에 적합합니다.', 'Level switch for removable tanks with separate sensor and float (GLL016) so the tank can be removed without disturbing wiring. P915 has reed N.O. contact (10 W); P920 N.O./SPDT (40 W). For water, acids and detergents.',
  '{"mounting": "lateral", "process_connection": "브래킷 장착 (센서/플로트 분리형)", "stem_material": "나일론", "float_material": "폴리프로필렌", "contact_type": "Reed N.O. (P915) / N.O.·SPDT (P920)", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc", "min_specific_gravity": 0.8, "operating_temp": "-10~+80°C", "media": "물·산성 유체·세제", "length_options": "케이블 500mm PVC"}'::jsonb, true, 1280, 'p915-p920 착탈식 탱크용 레벨 센서 p915-p920 level sensor for removable tanks 착탈식 탱크용 분리형 센서+플로트 레벨 스위치 separate sensor + float level switch for removable tanks p915-p920 euroswitch 플로트 레벨 스위치 float level switches lateral 측면(수평) lateral (horizontal) 브래킷 장착 (센서/플로트 분리형) 나일론 폴리프로필렌 reed n.o. (p915) / n.o.·spdt (p920) 40 1 48 v ac/dc 0.8 -10~+80°c 물·산성 유체·세제 케이블 500mm pvc')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-pg29', 'PG29', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PG29 전자기식 레벨 센서', 'PG29 Electromagnetic Level Sensor', '90° 굽힘 황동 스템 G1/8 레벨 스위치', '90° bent brass stem level switch, G1/8 fixing', '90°로 굽은 황동 스템을 가진 레벨 스위치로 G1/8" 나사로 측면에서 장착해 수직 방향으로 레벨을 감지합니다. NBR 플로트로 광유·경유·가솔린·물·세제에 사용됩니다.', 'Level switch with a 90° bent brass stem, mounted laterally with a G1/8" thread while sensing vertically. NBR float for mineral oils, diesel, petrol, water and detergents.',
  '{"mounting": "lateral", "process_connection": "G1/8\"", "stem_material": "황동 (90° 굽힘)", "float_material": "NBR", "contact_type": "Reed N.O./N.C.", "max_switching_power_w": 10, "max_switching_current_a": 0.5, "max_switching_voltage": "50 V", "min_specific_gravity": 0.7, "operating_temp": "-10~+100°C", "media": "광유·경유·가솔린·물·세제", "length_options": "L = 75mm, 케이블 500mm PVC"}'::jsonb, true, 1290, 'pg29 전자기식 레벨 센서 pg29 electromagnetic level sensor 90° 굽힘 황동 스템 g1/8 레벨 스위치 90° bent brass stem level switch, g1/8 fixing pg29 euroswitch 플로트 레벨 스위치 float level switches lateral 측면(수평) lateral (horizontal) g1/8" 황동 (90° 굽힘) nbr reed n.o./n.c. 10 0.5 50 v 0.7 -10~+100°c 광유·경유·가솔린·물·세제 l = 75mm, 케이블 500mm pvc')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-pg3x', 'PG3x', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PG3x 측면 장착 전자기식 레벨 센서', 'PG3x Lateral Electromagnetic Level Sensor', '90° 굽힘 스템 측면 장착형 레벨 스위치 (L 103~350mm, IP65)', 'Lateral level switch with 90° bent stem (L 103-350 mm, IP65)', '90°로 굽은 황동 스템으로 측면 플랜지 장착 후 수직 감지하는 레벨 스위치입니다. 3홀 플랜지/G1"/2홀 플랜지/M18x1.5 고정 옵션과 길이 103~350mm 사양이 있으며 DIN43650 커넥터 IP65입니다. Ex·RINA 인증 요청 가능.', 'Lateral level switch with a 90° bent brass stem sensing vertically after flange mounting. Fixing options 3-hole flange / G1" / 2-hole flanges / M18x1.5, lengths 103-350 mm; DIN43650 connector IP65. Ex and RINA certifications on request.',
  '{"mounting": "lateral", "process_connection": "3홀 플랜지 / G1\" / 2홀 플랜지 Ø42·Ø43 / M18x1.5", "stem_material": "황동 (90° 굽힘, 플랜지 알루미늄)", "float_material": "발포 나일론 (1bar 초과 시 NBR 권장)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 80, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac (SPDT 220 Vac)", "min_specific_gravity": 0.75, "operating_temp": "-20~+100°C", "media": "광유·연료", "length_options": "L = 103 / 200 / 250 / 300 / 350mm"}'::jsonb, true, 1300, 'pg3x 측면 장착 전자기식 레벨 센서 pg3x lateral electromagnetic level sensor 90° 굽힘 스템 측면 장착형 레벨 스위치 (l 103~350mm, ip65) lateral level switch with 90° bent stem (l 103-350 mm, ip65) pg3x euroswitch 플로트 레벨 스위치 float level switches lateral 측면(수평) lateral (horizontal) 3홀 플랜지 / g1" / 2홀 플랜지 ø42·ø43 / m18x1.5 황동 (90° 굽힘, 플랜지 알루미늄) 발포 나일론 (1bar 초과 시 nbr 권장) reed n.o./n.c. (spdt) 80 1 250 vac (spdt 220 vac) 0.75 -20~+100°c 광유·연료 l = 103 / 200 / 250 / 300 / 350mm')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-pk', 'PK', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PK 모듈형 전자기식 레벨 센서', 'PK Modular Componible Electromagnetic Level Sensor', '황동 튜브로 길이를 구성하는 모듈형 레벨 스위치 (PK30/31/32)', 'Modular level switch assembled with customer-supplied brass tube (PK30/31/32)', '상하 두 모듈을 고객이 준비한 8x6mm 황동 튜브로 연결해 원하는 길이로 구성하는 모듈형 레벨 스위치입니다. PK30(3홀 플랜지), PK31(G1"), PK32(2홀 플랜지) 고정 옵션이 있으며 DIN43650 커넥터 IP65 사양입니다.', 'Modular level switch whose two parts are joined by a customer-supplied 8x6 mm brass tube with olive fittings to the desired length. Fixing options PK30 (3-hole flange), PK31 (1" Gas), PK32 (2-hole flange); DIN43650 connector IP65.',
  '{"mounting": "vertical", "process_connection": "3홀 플랜지 / 1\" Gas / 2홀 플랜지 (알루미늄)", "stem_material": "황동 튜브 8x6mm (고객 준비)", "float_material": "발포 나일론 (1bar 초과 시 NBR 권장)", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 80, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac (SPDT 220 Vac)", "min_specific_gravity": 0.75, "operating_temp": "-20~+100°C", "media": "광유·연료·물", "length_options": "튜브 길이 자유 구성 (L max 1000mm)"}'::jsonb, true, 1310, 'pk 모듈형 전자기식 레벨 센서 pk modular componible electromagnetic level sensor 황동 튜브로 길이를 구성하는 모듈형 레벨 스위치 (pk30/31/32) modular level switch assembled with customer-supplied brass tube (pk30/31/32) pk euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 3홀 플랜지 / 1" gas / 2홀 플랜지 (알루미늄) 황동 튜브 8x6mm (고객 준비) 발포 나일론 (1bar 초과 시 nbr 권장) reed n.o./n.c. (spdt) 80 1 250 vac (spdt 220 vac) 0.75 -20~+100°c 광유·연료·물 튜브 길이 자유 구성 (l max 1000mm)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-pkt', 'PKT', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PKT 서모스탯 내장 모듈형 레벨 센서', 'PKT Modular Level Sensor with Thermostat', '레벨 접점 + 서모스탯(40~80°C) 일체형 모듈형 레벨 스위치', 'Modular level switch combining level contact and thermostat (40-80°C)', 'PK 모듈형 구조에 서모스탯 접점을 통합한 레벨 스위치입니다. 서모스탯 설정 온도는 40/50/60/70/80°C, 접점은 N.O. 또는 N.C.로 지정합니다. PKT30(3홀 플랜지)/PKT31(G1")/PKT32(2홀 플랜지) 고정 옵션, DIN43650 커넥터 IP65 사양입니다.', 'PK-style modular level switch with an integrated thermostat contact. Thermostat setpoints 40/50/60/70/80°C, N.O. or N.C.; fixing options PKT30 (3-hole flange), PKT31 (1" Gas), PKT32 (2-hole flange); DIN43650 connector IP65.',
  '{"mounting": "vertical", "process_connection": "3홀 플랜지 / 1\" Gas / 2홀 플랜지 (양극산화 알루미늄)", "stem_material": "황동 튜브 8x6mm (고객 준비)", "float_material": "발포 나일론 (1bar 초과 시 NBR 권장)", "contact_type": "Reed N.O./N.C. (SPDT) + 서모스탯 40~80°C", "max_switching_power_w": 80, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac (SPDT 220 Vac)", "min_specific_gravity": 0.75, "operating_temp": "-20~+100°C", "media": "광유·연료·물", "length_options": "튜브 길이 자유 구성 (L max 1000mm)"}'::jsonb, true, 1320, 'pkt 서모스탯 내장 모듈형 레벨 센서 pkt modular level sensor with thermostat 레벨 접점 + 서모스탯(40~80°c) 일체형 모듈형 레벨 스위치 modular level switch combining level contact and thermostat (40-80°c) pkt euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 3홀 플랜지 / 1" gas / 2홀 플랜지 (양극산화 알루미늄) 황동 튜브 8x6mm (고객 준비) 발포 나일론 (1bar 초과 시 nbr 권장) reed n.o./n.c. (spdt) + 서모스탯 40~80°c 80 1 250 vac (spdt 220 vac) 0.75 -20~+100°c 광유·연료·물 튜브 길이 자유 구성 (l max 1000mm)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-pn', 'PN', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PN 서미스터 내장 전자기식 레벨 센서', 'PN Electromagnetic Level Sensor with Thermistor', '레벨 접점 + NTC/PTC 온도 센서 일체형 레벨 스위치', 'Level switch with integrated NTC/PTC temperature sensor', '레벨 리드 접점과 온도 서미스터(PT100/PT1000/NTC/PTC/KTY/Ni1000 선택)를 통합한 수직 레벨 스위치입니다. PN30(3홀 플랜지)/PN31(G1")/PN32/PN32P(2홀 플랜지) 고정 옵션, 총길이 100~1000mm, DIN43650 커넥터 IP65 사양입니다.', 'Vertical level switch combining a reed level contact with a temperature thermistor (PT100/PT1000/NTC/PTC/KTY/Ni1000 selectable). Fixing options PN30 (3-hole flange), PN31 (1" Gas), PN32/PN32P (2-hole flanges); total length 100-1000 mm; DIN43650 connector IP65.',
  '{"mounting": "vertical", "process_connection": "3홀 플랜지 / 1\" Gas / 2홀 플랜지 Ø42·Ø43 (양극산화 알루미늄)", "stem_material": "알루미늄 (anticorodal)", "float_material": "발포 나일론 (1bar 초과 시 NBR 권장)", "contact_type": "Reed N.O./N.C. + NTC/PTC 서미스터", "max_switching_power_w": 20, "max_switching_current_a": 1, "max_switching_voltage": "<50 Vac", "min_specific_gravity": 0.75, "operating_temp": "-20~+100°C", "media": "광유·연료·물", "length_options": "L 총 100~1000mm (50mm 단위)"}'::jsonb, true, 1330, 'pn 서미스터 내장 전자기식 레벨 센서 pn electromagnetic level sensor with thermistor 레벨 접점 + ntc/ptc 온도 센서 일체형 레벨 스위치 level switch with integrated ntc/ptc temperature sensor pn euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 3홀 플랜지 / 1" gas / 2홀 플랜지 ø42·ø43 (양극산화 알루미늄) 알루미늄 (anticorodal) 발포 나일론 (1bar 초과 시 nbr 권장) reed n.o./n.c. + ntc/ptc 서미스터 20 1 <50 vac 0.75 -20~+100°c 광유·연료·물 l 총 100~1000mm (50mm 단위)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-pt', 'PT', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PT 서모스탯 내장 전자기식 레벨 센서', 'PT Electromagnetic Level Sensor with Thermostat', '레벨 접점 + 서모스탯(40~80°C) 일체형 수직 레벨 스위치', 'Vertical level switch with integrated thermostat (40-80°C)', '레벨 리드 접점과 서모스탯(설정 40/50/60/70/80°C, N.O./N.C. 지정)을 통합한 수직 레벨 스위치입니다. PT30(3홀 플랜지)/PT31(G1")/PT32/PT32P(2홀 플랜지) 고정 옵션, 총길이 100~1000mm, DIN43650 커넥터 IP65 사양이며 RINA 인증을 요청할 수 있습니다.', 'Vertical level switch combining a reed level contact with a thermostat (setpoints 40/50/60/70/80°C, N.O. or N.C.). Fixing options PT30 (3-hole flange), PT31 (1" Gas), PT32/PT32P (2-hole flanges); total length 100-1000 mm; DIN43650 connector IP65; RINA certification on request.',
  '{"mounting": "vertical", "process_connection": "3홀 플랜지 / 1\" Gas / 2홀 플랜지 Ø42·Ø43 (양극산화 알루미늄)", "stem_material": "황동", "float_material": "발포 나일론 (1bar 초과 시 NBR 권장)", "contact_type": "Reed N.O./N.C. + 서모스탯 40~80°C", "max_switching_power_w": 80, "max_switching_current_a": 1, "max_switching_voltage": "250 Vac", "min_specific_gravity": 0.75, "operating_temp": "-20~+100°C", "media": "광유·연료·물", "length_options": "L 총 100~1000mm (50mm 단위)"}'::jsonb, true, 1340, 'pt 서모스탯 내장 전자기식 레벨 센서 pt electromagnetic level sensor with thermostat 레벨 접점 + 서모스탯(40~80°c) 일체형 수직 레벨 스위치 vertical level switch with integrated thermostat (40-80°c) pt euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 3홀 플랜지 / 1" gas / 2홀 플랜지 ø42·ø43 (양극산화 알루미늄) 황동 발포 나일론 (1bar 초과 시 nbr 권장) reed n.o./n.c. + 서모스탯 40~80°c 80 1 250 vac 0.75 -20~+100°c 광유·연료·물 l 총 100~1000mm (50mm 단위)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-pwm', 'PWM', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-temperature-transmitters'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'PWM 출력 온도 센서 (팬 제어용)', 'PWM Temperature Sensor with Analogue PWM Output', '냉각팬 속도·회전 방향 제어용 PWM 출력 온도 센서', 'PWM-output temperature sensor for programmable fan speed and rotation control', 'PWM 시리즈는 온도에 따라 듀티 사이클이 변하는 PWM 신호를 출력하여 냉각팬의 속도와 회전 방향을 제어하는 온도 센서입니다. 예시 설정으로 0~20°C에서 듀티 2.5%(0 rpm), 20.1~50°C에서 25~75%(500~2500 rpm), 50°C 초과 시 75%(최대 2500 rpm)로 동작하며 팬 역회전 사이클도 프로그래밍할 수 있습니다. 공급 전압 12 Vdc, G1/2"·M22x1.5 나사, 황동 바디, 최대 압력 50 bar, 사용 온도 -40~+95°C(주위 -40~+105°C)입니다.', 'The PWM series outputs a PWM signal whose duty cycle varies with temperature to control cooling fan speed and rotation direction. In the example setting, duty is 2.5% (0 rpm) from 0-20 °C, 25-75% (500-2500 rpm) from 20.1-50 °C and 75% (max 2500 rpm) above 50 °C, with a programmable reverse-rotation cycle. Supply 12 Vdc, G1/2" and M22x1.5 threads, brass body, 50 bar max pressure, working temperature -40 to +95 °C (ambient -40 to +105 °C).',
  '{"output_signal": "pwm", "fluid_temperature_range": "-40~+95°C (주위 온도 -40~+105°C)", "supply_voltage": "12 V DC", "max_pressure_bar": 50, "process_connection": "G1/2\", M22x1.5 (Hex 27)", "electrical_connection": "일체형 커넥터 (자동차용)", "protection_class": null, "body_material": "황동 (기타 요청 가능)", "digital_outputs": 0, "probe_length_options": null}'::jsonb, true, 1350, 'pwm 출력 온도 센서 (팬 제어용) pwm temperature sensor with analogue pwm output 냉각팬 속도·회전 방향 제어용 pwm 출력 온도 센서 pwm-output temperature sensor for programmable fan speed and rotation control pwm euroswitch 온도 트랜스미터 / 전자식 온도 센서 temperature transmitters / electronic temperature sensors pwm pwm pwm -40~+95°c (주위 온도 -40~+105°c) 12 v dc 50 g1/2", m22x1.5 (hex 27) 일체형 커넥터 (자동차용) 황동 (기타 요청 가능) 0')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-sog-srg', 'SOG-SRG', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-electromechanical-reserve-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SOG-SRG 전기기계식 리저브 레벨 센서', 'SOG-SRG Electromechanical Reserve Level Sensor', '오일(SOG)/가솔린(SRG)용 잔량 경고 레벨 센서 (L 53~192mm)', 'Reserve level sensor for oil (SOG) or petrol (SRG), L 53-192 mm', 'SOM-SRM과 동일한 전기기계식 구조의 잔량 레벨 센서로 상부 플랜지형 고무 플러그 고정 방식입니다. SOG는 오일용, SRG는 가솔린용이며 길이 53~192mm의 표준 사양이 있습니다. 안전 초저전압 회로 및 축전지 회로에 적합합니다.', 'Electromechanical reserve level sensor like the SOM-SRM with a top-flange rubber plug fixing. SOG for oils, SRG for petrol; standard lengths 53-192 mm. Suitable for very low-voltage safety circuits and electric accumulators.',
  '{"media": "광유·가솔린·경유", "fixing": "NBR 플러그 (SOG 내유성 / SRG 내가솔린성)", "stem_material": "나일론", "float_material": "발포 나일론", "contact_type": "전기기계식 N.C. (은도금 접점)", "max_switching_power_w": 5, "max_switching_current_a": 0.5, "max_switching_voltage": "24 Vdc", "min_specific_gravity": 0.7, "operating_temp": "-10~+80°C", "length_options": "L = 53~192mm (13종), 케이블 500mm PVC"}'::jsonb, true, 1360, 'sog-srg 전기기계식 리저브 레벨 센서 sog-srg electromechanical reserve level sensor 오일(sog)/가솔린(srg)용 잔량 경고 레벨 센서 (l 53~192mm) reserve level sensor for oil (sog) or petrol (srg), l 53-192 mm sog-srg euroswitch 전기기계식 리저브 레벨 센서 electromechanical reserve level sensors 광유·가솔린·경유 nbr 플러그 (sog 내유성 / srg 내가솔린성) 나일론 발포 나일론 전기기계식 n.c. (은도금 접점) 5 0.5 24 vdc 0.7 -10~+80°c l = 53~192mm (13종), 케이블 500mm pvc')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-som-srm', 'SOM-SRM', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-electromechanical-reserve-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SOM-SRM 전기기계식 리저브 레벨 센서', 'SOM-SRM Electromechanical Reserve Level Sensor', '오일(SOM)/가솔린(SRM)용 잔량 경고 레벨 센서 (L 71~198mm)', 'Reserve level sensor for oil (SOM) or petrol (SRM), L 71-198 mm', '안전 초저전압 회로용 전기기계식 잔량(리저브) 레벨 센서입니다. SOM은 내유성 NBR 플러그(오일용), SRM은 내가솔린성 NBR 플러그(가솔린용)이며, 은도금 황동 고정 접점과 은도금 인청동 가동 접점을 사용합니다. 길이 71~198mm의 12가지 표준 사양이 있습니다.', 'Electromechanical reserve level sensor for very low-voltage safety circuits. SOM uses an anti-oil NBR plug (for oils), SRM an anti-petrol NBR plug (for petrol); silver-plated brass fixed contact and silver-plated phosphorous bronze moving contact. Twelve standard lengths from 71 to 198 mm.',
  '{"media": "광유·가솔린·경유", "fixing": "NBR 플러그 (SOM 내유성 / SRM 내가솔린성)", "stem_material": "나일론", "float_material": "발포 나일론", "contact_type": "전기기계식 N.C. (은도금 접점)", "max_switching_power_w": 5, "max_switching_current_a": 0.5, "max_switching_voltage": "24 Vdc", "min_specific_gravity": 0.7, "operating_temp": "-10~+80°C", "length_options": "L = 71~198mm (12종), 케이블 500mm PVC"}'::jsonb, true, 1370, 'som-srm 전기기계식 리저브 레벨 센서 som-srm electromechanical reserve level sensor 오일(som)/가솔린(srm)용 잔량 경고 레벨 센서 (l 71~198mm) reserve level sensor for oil (som) or petrol (srm), l 71-198 mm som-srm euroswitch 전기기계식 리저브 레벨 센서 electromechanical reserve level sensors 광유·가솔린·경유 nbr 플러그 (som 내유성 / srm 내가솔린성) 나일론 발포 나일론 전기기계식 n.c. (은도금 접점) 5 0.5 24 vdc 0.7 -10~+80°c l = 71~198mm (12종), 케이블 500mm pvc')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-spe', 'SPE', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SPE 확장 개스킷형 전자기식 레벨 센서', 'SPE Electromagnetic Level Sensor with Expansion Gasket', 'Viton 확장 개스킷 고정 수직형 레벨 스위치 (L 54/164/183mm)', 'Vertical level switch with Viton expansion gasket fixing (L 54/164/183 mm)', 'Viton 확장 개스킷(기타 재질 요청 가능)으로 고정하는 수직 플로트 레벨 스위치입니다. 나일론 스템과 NBR 플로트로 광유·경유·가솔린에 적합하며, 길이 54/164/183mm, 500mm PVC 케이블 사양입니다.', 'Vertical float level switch fixed by a Viton expansion gasket (others on request). Nylon stem and NBR float for mineral oils, diesel and petrol; lengths 54/164/183 mm with 500 mm PVC cable.',
  '{"mounting": "vertical", "process_connection": "확장 개스킷 (Viton, 기타 요청 시)", "stem_material": "나일론", "float_material": "NBR", "contact_type": "Reed N.O./N.C.", "max_switching_power_w": 40, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc", "min_specific_gravity": 0.6, "operating_temp": "-10~+80°C", "media": "광유·경유·가솔린", "length_options": "L = 54 / 164 / 183mm, 케이블 500mm PVC"}'::jsonb, true, 1380, 'spe 확장 개스킷형 전자기식 레벨 센서 spe electromagnetic level sensor with expansion gasket viton 확장 개스킷 고정 수직형 레벨 스위치 (l 54/164/183mm) vertical level switch with viton expansion gasket fixing (l 54/164/183 mm) spe euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical 확장 개스킷 (viton, 기타 요청 시) 나일론 nbr reed n.o./n.c. 40 1 48 v ac/dc 0.6 -10~+80°c 광유·경유·가솔린 l = 54 / 164 / 183mm, 케이블 500mm pvc')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-spf-spfa', 'SPF-SPFA', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SPF-SPFA 전자기식 레벨 센서', 'SPF-SPFA Electromagnetic Level Sensor', 'G3/4(SPF)/G1/2(SPFA) 나사형 수직 플로트 레벨 스위치', 'Vertical float level switch with G3/4 (SPF) or G1/2 (SPFA) thread', 'G3/4"(SPF) 또는 G1/2"(SPFA) 나사로 장착하는 수직 플로트 레벨 스위치입니다. 나일론 스템과 NBR 플로트로 광유·경유·가솔린·물에 사용되며 스템 길이 L1은 74/97/110/135mm 중 선택합니다. -25~+100°C 온도 범위를 지원합니다.', 'Vertical float level switch with G3/4" (SPF) or G1/2" (SPFA) thread. Nylon stem and NBR float for mineral oils, diesel, petrol and water; stem length L1 74/97/110/135 mm. Working temperature -25 to +100°C.',
  '{"mounting": "vertical", "process_connection": "G3/4\" (SPF) / G1/2\" (SPFA)", "stem_material": "나일론", "float_material": "NBR", "contact_type": "Reed N.O./N.C. (SPDT)", "max_switching_power_w": 10, "max_switching_current_a": 1, "max_switching_voltage": "48 V ac/dc", "min_specific_gravity": 0.7, "operating_temp": "-25~+100°C", "media": "광유·경유·가솔린·물", "length_options": "L1 = 74 / 97 / 110 / 135mm, 케이블 500mm/1m/2m"}'::jsonb, true, 1390, 'spf-spfa 전자기식 레벨 센서 spf-spfa electromagnetic level sensor g3/4(spf)/g1/2(spfa) 나사형 수직 플로트 레벨 스위치 vertical float level switch with g3/4 (spf) or g1/2 (spfa) thread spf-spfa euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical g3/4" (spf) / g1/2" (spfa) 나일론 nbr reed n.o./n.c. (spdt) 10 1 48 v ac/dc 0.7 -25~+100°c 광유·경유·가솔린·물 l1 = 74 / 97 / 110 / 135mm, 케이블 500mm/1m/2m')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-spg', 'SPG', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-float-level-switches'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SPG 전자기식 레벨 센서', 'SPG Electromagnetic Level Sensor', '고무 플러그 고정형 소형 레벨 스위치 (L 68~187mm, 파스톤 단자)', 'Compact plug-fixing level switch (L 68-187 mm, Faston terminals)', 'NBR(SPGN) 또는 EPDM(SPGP) 플러그로 고정하는 소형 수직 플로트 레벨 스위치입니다. 나일론 버전은 광유·경유·가솔린용, 폴리프로필렌 버전은 물·세제용입니다. 길이 68~187mm, 파스톤 4.8 단자(요청 시 케이블) 사양입니다.', 'Compact vertical float level switch fixed by an NBR (SPGN) or EPDM (SPGP) plug. Nylon version for mineral oils, diesel and petrol; polypropylene version for water and detergents. Lengths 68-187 mm, Faston 4.8 terminals (wired version on request).',
  '{"mounting": "vertical", "process_connection": "NBR 플러그(SPGN) / EPDM 플러그(SPGP)", "stem_material": "나일론 또는 폴리프로필렌", "float_material": "NBR", "contact_type": "Reed N.O./N.C.", "max_switching_power_w": 10, "max_switching_current_a": 0.5, "max_switching_voltage": "48 V ac/dc", "min_specific_gravity": 0.6, "operating_temp": "-10~+80°C", "media": "광유·경유·가솔린(나일론) / 물·세제(PP)", "length_options": "L = 68 / 85 / 117 / 132 / 187mm"}'::jsonb, true, 1400, 'spg 전자기식 레벨 센서 spg electromagnetic level sensor 고무 플러그 고정형 소형 레벨 스위치 (l 68~187mm, 파스톤 단자) compact plug-fixing level switch (l 68-187 mm, faston terminals) spg euroswitch 플로트 레벨 스위치 float level switches vertical 수직 vertical nbr 플러그(spgn) / epdm 플러그(spgp) 나일론 또는 폴리프로필렌 nbr reed n.o./n.c. 10 0.5 48 v ac/dc 0.6 -10~+80°c 광유·경유·가솔린(나일론) / 물·세제(pp) l = 68 / 85 / 117 / 132 / 187mm')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('euroswitch-sre', 'SRE', (select id from manufacturers where slug = 'euroswitch'), (select id from product_categories where slug = 'euroswitch-electromechanical-reserve-sensors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'SRE 안정화 챔버형 전기기계식 리저브 레벨 센서', 'SRE Electromechanical Reserve Level Sensor with Stabilized Room', 'PVC 안정화 챔버 내장 경유용 잔량 레벨 센서 (L 100~1000mm)', 'Diesel reserve level sensor with PVC stabilized room (L 100-1000 mm)', 'PVC 안정화 챔버로 유면 요동의 영향을 줄인 경유용 전기기계식 잔량 레벨 센서입니다. 6홀 나일론 플랜지 고정, 내탄화수소 고무 개스킷 사양이며 길이는 100~1000mm 범위에서 지정합니다.', 'Electromechanical reserve level sensor for diesel fuel with a PVC stabilized room damping fluid movement. 6-hole nylon flange fixing with anti-petrol rubber gasket; length specified from 100 to 1000 mm.',
  '{"media": "경유", "fixing": "나일론 플랜지 6홀", "stem_material": "나일론", "float_material": "발포 나일론", "contact_type": "전기기계식 N.C. (은도금 접점)", "max_switching_power_w": 5, "max_switching_current_a": 0.5, "max_switching_voltage": "24 Vdc", "min_specific_gravity": 0.7, "operating_temp": "-10~+80°C", "length_options": "L = 100~1000mm, 케이블 500mm PVC"}'::jsonb, true, 1410, 'sre 안정화 챔버형 전기기계식 리저브 레벨 센서 sre electromechanical reserve level sensor with stabilized room pvc 안정화 챔버 내장 경유용 잔량 레벨 센서 (l 100~1000mm) diesel reserve level sensor with pvc stabilized room (l 100-1000 mm) sre euroswitch 전기기계식 리저브 레벨 센서 electromechanical reserve level sensors 경유 나일론 플랜지 6홀 나일론 발포 나일론 전기기계식 n.c. (은도금 접점) 5 0.5 24 vdc 0.7 -10~+80°c l = 100~1000mm, 케이블 500mm pvc')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-bd', 'BD', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'BD 시리즈 양방향 유량 제어 밸브', 'BD Series Bi-directional Flow Control Valves', '양방향 스로틀 유량 제어 밸브, DN6~DN40, 최대 400bar', 'Bi-directional throttle flow control valves, DN6-DN40, up to 400 bar', 'BD 시리즈는 양방향으로 유량을 제한하는 스로틀형 유량 제어 밸브입니다. DN6~DN40 사이즈에 최대 40 MPa(PN400, 대구경 35 MPa), 최대 유량 300 l/min이며 BSP/NPT 나사, 아연 도금 탄소강 본체로 제공되고 패널 장착 키트도 지원합니다.', 'The BD series are bi-directional throttle type flow control valves. Sizes DN6-DN40 are rated up to 40 MPa (PN400, 35 MPa for larger sizes) with flows up to 300 l/min, supplied with BSP/NPT ends and galvanized carbon steel bodies; panel mounting kits are available.',
  '{"valve_type": "flow_control_valve", "size_range": "DN6 ~ DN40", "max_pressure_mpa": 40, "end_connections": "BSP(ISO 228), NPT(ANSI/ASME B1.20.1)", "body_material": "carbon_steel", "temp_range_c": "-20°C ~ +100°C", "max_flow_lpm": 300, "seal_material": "NBR", "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 1420, 'bd 시리즈 양방향 유량 제어 밸브 bd series bi-directional flow control valves 양방향 스로틀 유량 제어 밸브, dn6~dn40, 최대 400bar bi-directional throttle flow control valves, dn6-dn40, up to 400 bar bd gemels s.p.a. 유압 밸브 hydraulic valves flow_control_valve 유량 제어 밸브 flow control valve dn6 ~ dn40 40 bsp(iso 228), npt(ansi/asme b1.20.1) carbon_steel 탄소강 carbon steel -20°c ~ +100°c 300 nbr 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-bgf', 'BGF', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'BGF 브레이크 커플링 (ISO 5676)', 'BGF Brake Couplings (ISO 5676)', '트레일러 유압 브레이크용 ISO 5676 커플링, DN10~DN13', 'ISO 5676 couplings for trailer hydraulic brakes, DN10 to DN13', '농업용 트랙터-트레일러 유압 브레이크 라인 표준인 ISO 5676 규격의 커플링입니다. DN10~DN13 사이즈에 최대 210 bar 사양이며, 아연 도금 탄소강 바디에 BSPP 및 DIN 2353 L(벌크헤드 포함) 엔드를 제공합니다. 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'Couplings to ISO 5676, the standard for tractor-trailer hydraulic brake lines in agriculture. Sizes DN10 to DN13 rated up to 210 bar, galvanized carbon steel bodies with BSPP and DIN 2353 L (including bulkhead) ends. Also available in the patented integrated ball-valve version.',
  '{"coupling_standard": "iso_5676", "size_range": "DN10–DN13", "max_working_pressure": 210, "body_material": "carbon_steel", "valve_type": "flat_face", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), DIN 2353 L + bulkhead", "surface_treatment": "Galvanized", "application": "brake_systems"}'::jsonb, true, 1430, 'bgf 브레이크 커플링 (iso 5676) bgf brake couplings (iso 5676) 트레일러 유압 브레이크용 iso 5676 커플링, dn10~dn13 iso 5676 couplings for trailer hydraulic brakes, dn10 to dn13 bgf gemels s.p.a. 퀵 커플링 quick couplings iso_5676 iso 5676 iso 5676 dn10–dn13 210 carbon_steel 탄소강 carbon steel flat_face 플랫 페이스 flat face push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false nbr (표준), fkm (옵션) bspp (iso 1179-1), din 2353 l + bulkhead galvanized brake_systems 트레일러 브레이크 trailer brake systems')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-customized', 'CUSTOMIZED', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '커스터마이즈드 시리즈 볼 밸브', 'Customized Series Ball Valves', '소방·자동차·건설 등 고객 요구 사양에 맞춘 특수 설계 볼 밸브 솔루션', 'Lean customized ball valve solutions engineered to customer specifications for fire-fighting, automotive and other fields', 'GEMELS 기술 부서와 고객 엔지니어링 부서의 협업으로 설계되는 맞춤형 볼 밸브 솔루션입니다. 전기 액추에이터·리밋 스위치·마이크로스위치·공압 액추에이터 장착형, DBB(더블 블록&블리드) 구성 등이 카탈로그에 수록되어 있습니다. 농업, 소방, 건설, 리프팅, 자동차, 제철, 중장비, 해양 등 다양한 분야에 적용되며 프로토타입 및 샘플 제작이 가능합니다. 소방용 제품은 요청 시 VDS 및 FM 승인이 가능합니다.', 'Custom-engineered ball valve solutions developed in close collaboration between GEMELS'' technical department and the customer''s engineering team. Catalog examples include versions with electric actuators, limit switches, microswitches, pneumatic actuators and DBB (double block and bleed) configurations. Applications span agriculture, fire-fighting, construction, lifting, automotive, steel plants, heavy equipment and marine; prototypes and samples can be produced. VDS and FM approvals are available on request for fire-fighting versions.',
  '{"size_range": "요청 사양에 따름 (카탈로그 예시 DN4 - DN32)", "body_material": "carbon_or_stainless_steel", "seat_material": "요청 사양에 따름", "seal_material": "요청 사양에 따름", "port_types": "요청 사양에 따름 (BSP, DIN 2353 등)", "special_features": "전기/공압 액추에이터, 리밋 스위치, 마이크로스위치, DBB 구성, VDS·FM 승인 옵션(소방용)"}'::jsonb, true, 1440, '커스터마이즈드 시리즈 볼 밸브 customized series ball valves 소방·자동차·건설 등 고객 요구 사양에 맞춘 특수 설계 볼 밸브 솔루션 lean customized ball valve solutions engineered to customer specifications for fire-fighting, automotive and other fields customized gemels s.p.a. 볼 밸브 ball valves 요청 사양에 따름 (카탈로그 예시 dn4 - dn32) carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel 요청 사양에 따름 요청 사양에 따름 요청 사양에 따름 (bsp, din 2353 등) 전기/공압 액추에이터, 리밋 스위치, 마이크로스위치, dbb 구성, vds·fm 승인 옵션(소방용)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-da-rack-pinion', 'DA (Rack & Pinion)', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-actuators-kits'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DA 시리즈 랙&피니언 공압 액추에이터 (복동식)', 'DA Series Rack & Pinion Pneumatic Actuators (Double Acting)', '복동식 랙&피니언 공압 액추에이터, 토크 23.7~824 Nm, ATEX', 'Double acting rack & pinion pneumatic actuators, 23.7-824 Nm, ATEX', 'DA 시리즈는 랙&피니언 구조의 복동식 공압 액추에이터입니다. DA25~DA825 모델이 0.6 MPa 공기압 기준 23.7~824 Nm의 토크를 제공하며 표준 공급 압력은 6 bar(최대 7 bar)입니다. 양극산화 알루미늄 본체, Buna-N 시일 기준 -40°C~+80°C 사용 온도, ATEX 인증, ISO 5211 F03~F12 플랜지를 지원하며 GEMELS 볼 밸브용 액추에이터 키트(AK 시리즈)와 조합됩니다.', 'The DA series are double acting rack & pinion pneumatic actuators. Models DA25 to DA825 deliver 23.7 to 824 Nm at 0.6 MPa air supply, with 6 bar standard (7 bar max). Anodized aluminium bodies, -40°C to +80°C with Buna-N seals, ATEX certification and ISO 5211 F03-F12 flanges; combined with AK series mounting kits for GEMELS ball valves.',
  '{"product_type": "pneumatic_actuator", "operation": "double_acting", "models": "DA25, DA40, DA100, DA200, DA375, DA825", "torque_range_nm": "23.7 ~ 824 Nm (0.6 MPa 공기압 기준)", "supply": "압축공기 6 bar (최대 7 bar), 건조/윤활 공기·비부식성 가스·경유압유", "iso5211_flange": "F03 ~ F12", "temp_range_c": "-40°C ~ +80°C (Buna-N 시일)", "certification": "ATEX"}'::jsonb, true, 1450, 'da 시리즈 랙&피니언 공압 액추에이터 (복동식) da series rack & pinion pneumatic actuators (double acting) 복동식 랙&피니언 공압 액추에이터, 토크 23.7~824 nm, atex double acting rack & pinion pneumatic actuators, 23.7-824 nm, atex da (rack & pinion) gemels s.p.a. 액추에이터 및 키트 actuators & kits pneumatic_actuator 공압 액추에이터 pneumatic actuator double_acting 복동식 double acting da25, da40, da100, da200, da375, da825 23.7 ~ 824 nm (0.6 mpa 공기압 기준) 압축공기 6 bar (최대 7 bar), 건조/윤활 공기·비부식성 가스·경유압유 f03 ~ f12 -40°c ~ +80°c (buna-n 시일) atex')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-dbb', 'DBB', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-oil-gas-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DBB 시리즈 더블 블록 앤 블리드 볼 밸브', 'DBB Series Double Block and Bleed Ball Valves', '더블 블록 앤 블리드 볼 밸브, DN13~DN200(1/2"~8"), ANSI 150~2500', 'Double block and bleed ball valves, DN13-DN200 (1/2"-8"), ANSI 150-2500', 'DBB 시리즈는 두 개의 볼과 블리더를 하나의 본체에 통합한 더블 블록 앤 블리드 볼 밸브입니다. DN13~DN200(1/2"~8") 사이즈, ANSI 150~2500 클래스로 제공되며 LF2/F316 단조 본체, RPTFE 시트(PEEK/POM/DEVLON/메탈-투-메탈 옵션), RF/RTJ/BW/FF 플랜지, 정전기 방지 장치를 갖추고 있습니다.', 'The DBB series are double block and bleed ball valves integrating two balls and a bleeder in one body. Sizes DN13-DN200 (1/2"-8") in ANSI class 150-2500 feature forged LF2/F316 bodies, RPTFE seats (PEEK/POM/DEVLON/metal-to-metal options), RF/RTJ/BW/FF flanges and antistatic devices.',
  '{"valve_design": "double_block_bleed", "size_range": "DN13 ~ DN200 (1/2\" ~ 8\"), FB/RB", "pressure_class": "ANSI 150 ~ 2500", "max_pressure_mpa": 42, "end_connections": "플랜지 RF (RTJ/BW/FF 주문 제작)", "body_material": "ASTM A350 LF2 / A479 Tp.316 (CS, SS, DSS, 합금강 단조)", "temp_range_c": "-50°C ~ +200°C (재질 선택에 따름)", "standards": "ASME B16.5, ISO 5211", "iso5211_mount": true}'::jsonb, true, 1460, 'dbb 시리즈 더블 블록 앤 블리드 볼 밸브 dbb series double block and bleed ball valves 더블 블록 앤 블리드 볼 밸브, dn13~dn200(1/2"~8"), ansi 150~2500 double block and bleed ball valves, dn13-dn200 (1/2"-8"), ansi 150-2500 dbb gemels s.p.a. 오일&가스 볼 밸브 oil & gas ball valves double_block_bleed 더블 블록 앤 블리드 double block and bleed dn13 ~ dn200 (1/2" ~ 8"), fb/rb ansi 150 ~ 2500 42 플랜지 rf (rtj/bw/ff 주문 제작) astm a350 lf2 / a479 tp.316 (cs, ss, dss, 합금강 단조) -50°c ~ +200°c (재질 선택에 따름) asme b16.5, iso 5211 true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ddf', 'DDF', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DDF 시리즈 3방 유량 분배 밸브 (주철)', 'DDF Series 3-Way Flow Diverters (Cast Iron)', '주철 본체 3방 유량 분배 밸브, DN6~DN25, 최대 300bar', 'Cast iron 3-way flow diverters, DN6-DN25, up to 300 bar', 'DDF 시리즈는 주철 본체의 오픈 센터 3방 유량 분배 밸브입니다. G1/4~G1(DN6~DN25) 사이즈에 최대 30 MPa(사이즈에 따라 22~30 MPa), 최대 유량 200 l/min을 지원합니다.', 'The DDF series are open-center 3-way flow diverters with cast iron bodies. Sizes G1/4 to G1 (DN6-DN25) are rated up to 30 MPa (22-30 MPa depending on size) with flows up to 200 l/min.',
  '{"valve_type": "flow_diverter", "size_range": "DN6 ~ DN25 (G1/4 ~ G1)", "max_pressure_mpa": 30, "end_connections": "BSP (GAS DIN/ISO 228)", "body_material": "cast_iron", "max_flow_lpm": 200, "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 1470, 'ddf 시리즈 3방 유량 분배 밸브 (주철) ddf series 3-way flow diverters (cast iron) 주철 본체 3방 유량 분배 밸브, dn6~dn25, 최대 300bar cast iron 3-way flow diverters, dn6-dn25, up to 300 bar ddf gemels s.p.a. 유압 밸브 hydraulic valves flow_diverter 유량 분배 밸브 flow diverter dn6 ~ dn25 (g1/4 ~ g1) 30 bsp (gas din/iso 228) cast_iron 주철 cast iron 200 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ddf3-a', 'DDF3-A', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DDF3-A 시리즈 3방 유량 분배 밸브', 'DDF3-A Series 3-Way Flow Diverters', '3방향 유량 분배 밸브(오픈/클로즈드 센터), DN6~DN25', '3-way flow diverters (open/closed center), DN6-DN25', 'DDF3-A 시리즈는 오픈 센터와 클로즈드 센터 두 방식으로 제공되는 3방 유량 분배 밸브입니다. G1/4~G1(DN6~DN25) 사이즈에 최대 50 MPa를 지원하며 아연 도금 탄소강 본체입니다. DIN 51524/ISO 6743-4 광유 사용, 15µm 여과가 권장됩니다.', 'The DDF3-A series are 3-way flow diverters available in open center and closed center versions. Sizes G1/4 to G1 (DN6-DN25) are rated up to 50 MPa with galvanized carbon steel bodies. Mineral oil per DIN 51524/ISO 6743-4 and 15 micron filtration are recommended.',
  '{"valve_type": "flow_diverter", "size_range": "DN6 ~ DN25 (G1/4 ~ G1)", "max_pressure_mpa": 50, "end_connections": "BSP (GAS DIN/ISO 228)", "body_material": "carbon_steel", "temp_range_c": "유체 -20°C ~ +80°C, 주위 -20°C ~ +50°C", "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 1480, 'ddf3-a 시리즈 3방 유량 분배 밸브 ddf3-a series 3-way flow diverters 3방향 유량 분배 밸브(오픈/클로즈드 센터), dn6~dn25 3-way flow diverters (open/closed center), dn6-dn25 ddf3-a gemels s.p.a. 유압 밸브 hydraulic valves flow_diverter 유량 분배 밸브 flow diverter dn6 ~ dn25 (g1/4 ~ g1) 50 bsp (gas din/iso 228) carbon_steel 탄소강 carbon steel 유체 -20°c ~ +80°c, 주위 -20°c ~ +50°c 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ddf6-a', 'DDF6-A', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DDF6-A 시리즈 6방 유량 분배 밸브', 'DDF6-A Series 6-Way Flow Diverters', '6방향 유량 분배 밸브(오픈/클로즈드 센터), DN10~DN25', '6-way flow diverters (open/closed center), DN10-DN25', 'DDF6-A 시리즈는 오픈 센터와 클로즈드 센터 방식의 6방 유량 분배 밸브입니다. G3/8~G1(DN10~DN25) 사이즈에 최대 35 MPa(사이즈에 따라 22~35 MPa)를 지원하며 아연 도금 탄소강 본체입니다.', 'The DDF6-A series are 6-way flow diverters in open center and closed center versions. Sizes G3/8 to G1 (DN10-DN25) are rated up to 35 MPa (22-35 MPa depending on size) with galvanized carbon steel bodies.',
  '{"valve_type": "flow_diverter", "size_range": "DN10 ~ DN25 (G3/8 ~ G1)", "max_pressure_mpa": 35, "end_connections": "BSP (GAS DIN/ISO 228)", "body_material": "carbon_steel", "temp_range_c": "유체 -20°C ~ +80°C, 주위 -20°C ~ +50°C", "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 1490, 'ddf6-a 시리즈 6방 유량 분배 밸브 ddf6-a series 6-way flow diverters 6방향 유량 분배 밸브(오픈/클로즈드 센터), dn10~dn25 6-way flow diverters (open/closed center), dn10-dn25 ddf6-a gemels s.p.a. 유압 밸브 hydraulic valves flow_diverter 유량 분배 밸브 flow diverter dn10 ~ dn25 (g3/8 ~ g1) 35 bsp (gas din/iso 228) carbon_steel 탄소강 carbon steel 유체 -20°c ~ +80°c, 주위 -20°c ~ +50°c 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-dg', 'DG', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'DG 진단용 커플링 (ISO 15171-1)', 'DG Diagnostic Couplings (ISO 15171-1)', '압력 측정·진단용 ISO 15171-1 커플링, 최대 500 bar', 'ISO 15171-1 couplings for pressure test and diagnostics, up to 500 bar', '유압 회로의 압력 측정과 진단에 사용하는 ISO 15171-1 규격 커플링입니다. DN6.3 사이즈에 최대 500 bar 사양이며, 아연 도금 탄소강 바디에 BSPP(G1/8, G1/4), NPT, SAE ORB 엔드를 제공합니다. 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'Diagnostic couplings to ISO 15171-1 for pressure test points in hydraulic circuits. DN6.3 size rated up to 500 bar, galvanized carbon steel bodies with BSPP (G1/8, G1/4), NPT and SAE ORB ends. Also available in the patented integrated ball-valve version.',
  '{"coupling_standard": "iso_15171_1", "size_range": "DN6.3", "max_working_pressure": 500, "body_material": "carbon_steel", "valve_type": "poppet", "connection_type": "screw_to_connect", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1: G1/8, G1/4), NPT (N1/8, N1/4), SAE ORB (SAE4)", "surface_treatment": "Galvanized", "application": "diagnostics"}'::jsonb, true, 1500, 'dg 진단용 커플링 (iso 15171-1) dg diagnostic couplings (iso 15171-1) 압력 측정·진단용 iso 15171-1 커플링, 최대 500 bar iso 15171-1 couplings for pressure test and diagnostics, up to 500 bar dg gemels s.p.a. 퀵 커플링 quick couplings iso_15171_1 iso 15171-1 iso 15171-1 dn6.3 500 carbon_steel 탄소강 carbon steel poppet 포핏 poppet screw_to_connect 스크류 체결식 screw-to-connect false nbr (표준), fkm (옵션) bspp (iso 1179-1: g1/8, g1/4), npt (n1/8, n1/4), sae orb (sae4) galvanized diagnostics 압력 진단 / 측정 pressure diagnostics')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-electric-motors', 'GE ELECTRIC', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-electric-motors'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GEMELS AC 3상 토크 모터 시리즈', 'GEMELS AC Three-Phase Torque Motor Series', '2~100kW AC 3상 토크 모터, 최대 10,000 RPM', '2-100 kW AC three-phase torque motors, up to 10,000 RPM', '이탈리아에서 설계·생산되는 GEMELS 전기 모터 시리즈는 AC 3상 토크 모터로, 2~100 kW 출력, 48~400V 전압, 최대 10,000 RPM 사양의 다양한 모델로 제공됩니다. 견인(트랙션) 구동, 유압 파워 유닛(펌프 인터페이스), 표준 IEC/NEMA 플랜지 사양으로 설계할 수 있으며 공랭/수랭, 커넥션 박스 또는 권선 직결 케이블 옵션을 지원합니다. 저속에서도 높은 토크를 내며 소음·배출이 적고 유지보수 부담이 낮은 것이 특징입니다. 상세 사양은 요청 시 맞춤 설계됩니다.', 'The GEMELS electric motor series, designed and produced in Italy, consists of AC three-phase torque motors available in models from 2 to 100 kW, 48 to 400V and up to 10,000 RPM. They can be configured for traction drives, hydraulic power units (pump interfaces) and standard IEC/NEMA flanges, with air or liquid cooling and power cables via connection box or directly connected to the winding. They deliver high torque even at low RPM with low noise, zero emissions and low maintenance; detailed specifications are customized on request.',
  '{"motor_type": "AC 3상 토크 모터 (AC three-phase torque motor)", "power_range_kw": "2 ~ 100 kW", "voltage_range_v": "48 ~ 400 V", "max_speed_rpm": 10000, "cooling": "공랭 / 수랭", "mounting": "트랙션용, 유압 파워 유닛(펌프 인터페이스), 표준 IEC/NEMA 플랜지", "applications": "전동 파워트레인, 유압 파워 유닛, 산업 구동"}'::jsonb, true, 1510, 'gemels ac 3상 토크 모터 시리즈 gemels ac three-phase torque motor series 2~100kw ac 3상 토크 모터, 최대 10,000 rpm 2-100 kw ac three-phase torque motors, up to 10,000 rpm ge electric gemels s.p.a. 전기 모터 electric motors ac 3상 토크 모터 (ac three-phase torque motor) 2 ~ 100 kw 48 ~ 400 v 10000 공랭 / 수랭 트랙션용, 유압 파워 유닛(펌프 인터페이스), 표준 iec/nema 플랜지 전동 파워트레인, 유압 파워 유닛, 산업 구동')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ffap', 'FFAP', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'FFAP 잔압 연결형 플랫 페이스 커플링', 'FFAP Flat Face Couplings – Connection Under Pressure', '잔압 상태에서도 연결 가능한 ISO 16028 플랫 페이스 커플링', 'ISO 16028 flat face couplings connectable under residual pressure', 'ISO 16028 기반의 플랫 페이스 커플링으로, 회로에 잔압이 남아 있는 상태에서도 연결이 가능하도록 설계되었습니다. DN6~DN25 사이즈에 최대 420 bar 사양이며, 아연 도금 탄소강 바디에 BSPP/NPT/SAE ORB 엔드와 NBR/FKM 씰을 제공합니다. 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'Flat face couplings based on ISO 16028, designed to connect even with residual pressure trapped in the circuit. Sizes DN6 to DN25 rated up to 420 bar, galvanized carbon steel bodies with BSPP, NPT and SAE ORB ends and NBR or FKM seals. Also available in the patented version with integrated ball valve.',
  '{"coupling_standard": "iso_16028", "size_range": "DN6–DN25", "max_working_pressure": 420, "body_material": "carbon_steel", "valve_type": "flat_face", "connection_type": "push_pull_sleeve", "connect_under_pressure": true, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1), NPT (ASME B1.20.1), SAE ORB (ISO 11926-1)", "surface_treatment": "Galvanized", "application": "construction"}'::jsonb, true, 1520, 'ffap 잔압 연결형 플랫 페이스 커플링 ffap flat face couplings – connection under pressure 잔압 상태에서도 연결 가능한 iso 16028 플랫 페이스 커플링 iso 16028 flat face couplings connectable under residual pressure ffap gemels s.p.a. 퀵 커플링 quick couplings iso_16028 iso 16028 (플랫 페이스) iso 16028 (flat face) dn6–dn25 420 carbon_steel 탄소강 carbon steel flat_face 플랫 페이스 flat face push_pull_sleeve 푸시풀 슬리브 push-pull sleeve true nbr (표준), fkm (옵션) bspp (iso 1179-1), npt (asme b1.20.1), sae orb (iso 11926-1) galvanized construction 건설기계 / 굴착기 construction / excavators')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ffap-plate-connection', 'FFAP PLATE CONNECTION', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'FFAP 플레이트 커넥션 (잔압 연결형)', 'FFAP Plate Connection – Under Pressure', '굴착기·중장비용 플레이트 장착 잔압 연결형 플랫 페이스 커플링', 'Plate-mounted flat face couplings connectable under pressure for excavators and earth moving', '멀티 커플링 플레이트에 장착하는 잔압 연결형 플랫 페이스 커플링(ISO 16028)입니다. 굴착기·토목 중장비의 어태치먼트 교체 라인에 적합하며, DN10~DN25 사이즈에 최대 420 bar를 지원합니다. BSPP, NPT, SAE ORB, DIN 2353(벌크헤드 포함), JIC 등 다양한 엔드를 갖추고 있습니다.', 'Flat face couplings (ISO 16028) for plate mounting that connect under residual pressure, suited to attachment change lines on excavators and earth-moving machinery. Sizes DN10 to DN25 rated up to 420 bar, with BSPP, NPT, SAE ORB, DIN 2353 (including bulkhead) and JIC ends.',
  '{"coupling_standard": "iso_16028", "size_range": "DN10–DN25", "max_working_pressure": 420, "body_material": "carbon_steel", "valve_type": "flat_face", "connection_type": "plate_mounting", "connect_under_pressure": true, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1 / ISO 8434-6), NPT, SAE ORB, DIN 2353 S/L + bulkhead, JIC (SAE J514)", "surface_treatment": "Galvanized", "application": "construction"}'::jsonb, true, 1530, 'ffap 플레이트 커넥션 (잔압 연결형) ffap plate connection – under pressure 굴착기·중장비용 플레이트 장착 잔압 연결형 플랫 페이스 커플링 plate-mounted flat face couplings connectable under pressure for excavators and earth moving ffap plate connection gemels s.p.a. 퀵 커플링 quick couplings iso_16028 iso 16028 (플랫 페이스) iso 16028 (flat face) dn10–dn25 420 carbon_steel 탄소강 carbon steel flat_face 플랫 페이스 flat face plate_mounting 플레이트 마운팅 plate mounting true nbr (표준), fkm (옵션) bspp (iso 1179-1 / iso 8434-6), npt, sae orb, din 2353 s/l + bulkhead, jic (sae j514) galvanized construction 건설기계 / 굴착기 construction / excavators')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-flat-face', 'FLAT FACE (FF)', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '플랫 페이스 퀵 커플링 (ISO 16028)', 'Flat Face Quick Couplings (ISO 16028)', 'ISO 16028 플랫 페이스 퀵 커플링, DN6.3~DN25, 최대 420 bar', 'ISO 16028 flat face quick couplings, DN6.3 to DN25, up to 420 bar', 'ISO 16028 규격의 플랫 페이스 퀵 커플링으로, 연결·분리 시 유체 유출과 공기 유입을 최소화하여 건설기계·산업 유압 분야에 널리 사용됩니다. 아연-니켈 도금 탄소강과 스테인리스강(1.4404) 두 가지 재질로 DN6.3~DN25(1/4"~1") 사이즈, 최대 420 bar 사양을 제공합니다. BSPP, NPT, SAE ORB, DIN 2353, JIC 등 다양한 엔드와 NBR/FKM 씰을 선택할 수 있으며, 볼 밸브 일체형 특허 버전도 제공됩니다.', 'ISO 16028 flat face quick couplings that minimize fluid spillage and air inclusion at connection, widely used in construction equipment and industrial hydraulics. Offered in zinc-nickel plated carbon steel and stainless steel (1.4404), sizes DN6.3 to DN25 (1/4" to 1"), rated up to 420 bar. Ends include BSPP, NPT, SAE ORB, DIN 2353 and JIC with NBR or FKM seals; also available in the patented version with integrated ball valve.',
  '{"coupling_standard": "iso_16028", "size_range": "DN6.3–DN25 (1/4\"–1\")", "max_working_pressure": 420, "body_material": "carbon_or_stainless_steel", "valve_type": "flat_face", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "BSPP (ISO 1179-1 / ISO 8434-6), NPT, SAE ORB (ISO 11926-1), DIN 2353 S/L + bulkhead, JIC (SAE J514)", "surface_treatment": "Zinc-Nickel (carbon steel)", "application": "general_hydraulics"}'::jsonb, true, 1540, '플랫 페이스 퀵 커플링 (iso 16028) flat face quick couplings (iso 16028) iso 16028 플랫 페이스 퀵 커플링, dn6.3~dn25, 최대 420 bar iso 16028 flat face quick couplings, dn6.3 to dn25, up to 420 bar flat face (ff) gemels s.p.a. 퀵 커플링 quick couplings iso_16028 iso 16028 (플랫 페이스) iso 16028 (flat face) dn6.3–dn25 (1/4"–1") 420 carbon_or_stainless_steel 탄소강 / 스테인리스강 carbon or stainless steel flat_face 플랫 페이스 flat face push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false nbr (표준), fkm (옵션) bspp (iso 1179-1 / iso 8434-6), npt, sae orb (iso 11926-1), din 2353 s/l + bulkhead, jic (sae j514) zinc-nickel (carbon steel) general_hydraulics 일반 유압 general hydraulics')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-g3k', 'G3K', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'G3K 3웨이 멀티포트 볼 밸브', 'G3K 3-Way Multi-Port Ball Valve', 'L/T/X 유로 스킴의 3웨이 멀티포트 볼 밸브. DN6~DN25, 최대 500bar', '3-way multi-port ball valve with L/T/X flow schemes, DN6 to DN25, up to 500 bar', 'L(K01), T(K02), X(K14) 유로 스킴을 선택할 수 있는 3웨이 멀티포트 고압 볼 밸브입니다. 사이즈 DN6~DN25, 최대 500bar(PN500)이며 탄소강(1.0737, 갈바나이징) 사양입니다. BSP 및 NPT 접속을 지원하고 4시트 구조로 다양한 유로 전환에 대응합니다.', 'A 3-way multi-port high pressure ball valve with selectable L (K01), T (K02) and X (K14) flow schemes. Sizes DN6 to DN25, rated up to 500 bar (PN500), in galvanized carbon steel (1.0737). BSP and NPT ends with a four-seat construction for versatile flow diverting.',
  '{"valve_ways": "3_way", "size_range": "DN6 - DN25", "max_pressure_bar": 500, "body_material": "carbon_steel", "seat_material": "POM", "seal_material": "NBR", "port_types": "BSP(ISO 228), NPT", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "L/T/X 유로 스킴(K01/K02/K14), 4시트 구조"}'::jsonb, true, 1550, 'g3k 3웨이 멀티포트 볼 밸브 g3k 3-way multi-port ball valve l/t/x 유로 스킴의 3웨이 멀티포트 볼 밸브. dn6~dn25, 최대 500bar 3-way multi-port ball valve with l/t/x flow schemes, dn6 to dn25, up to 500 bar g3k gemels s.p.a. 볼 밸브 ball valves 3_way 3웨이 3-way dn6 - dn25 500 carbon_steel 탄소강 carbon steel pom nbr bsp(iso 228), npt -20°c ~ +100°c 아연 도금(galvanized) l/t/x 유로 스킴(k01/k02/k14), 4시트 구조')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-g4k', 'G4K', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'G4K 4웨이 멀티포트 볼 밸브', 'G4K 4-Way Multi-Port Ball Valve', '4웨이 멀티포트 고압 볼 밸브. DN6~DN25, 최대 500bar', '4-way multi-port high pressure ball valve, DN6 to DN25, up to 500 bar', '4개 포트 간 유로 전환이 가능한 4웨이 고압 볼 밸브입니다. L(K01) 등 유로 스킴을 선택할 수 있으며 사이즈 DN6~DN25, 최대 500bar(PN500)입니다. 탄소강(1.0737, 갈바나이징) 사양이며 BSP, NPT 접속과 4시트 구조를 갖추고 있습니다.', 'A 4-way high pressure ball valve for flow diverting between four ports with selectable flow schemes such as L (K01). Sizes DN6 to DN25, rated up to 500 bar (PN500), in galvanized carbon steel (1.0737) with BSP or NPT ends and a four-seat construction.',
  '{"valve_ways": "4_way", "size_range": "DN6 - DN25", "max_pressure_bar": 500, "body_material": "carbon_steel", "seat_material": "POM", "seal_material": "NBR", "port_types": "BSP(ISO 228), NPT", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "멀티포트 유로 스킴, 4시트 구조"}'::jsonb, true, 1560, 'g4k 4웨이 멀티포트 볼 밸브 g4k 4-way multi-port ball valve 4웨이 멀티포트 고압 볼 밸브. dn6~dn25, 최대 500bar 4-way multi-port high pressure ball valve, dn6 to dn25, up to 500 bar g4k gemels s.p.a. 볼 밸브 ball valves 4_way 4웨이 4-way dn6 - dn25 500 carbon_steel 탄소강 carbon steel pom nbr bsp(iso 228), npt -20°c ~ +100°c 아연 도금(galvanized) 멀티포트 유로 스킴, 4시트 구조')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gb1', 'GB1', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GB1 단조 2웨이 볼 밸브', 'GB1 Forged 2-Way Ball Valve', 'DN32~DN50 대구경 단조 바디 2웨이 볼 밸브. 최대 420bar, DNV 인증', 'Forged-body 2-way ball valve for large bores DN32 to DN50, up to 420 bar, DNV certified', '단조(forged) 바디를 적용한 대구경 2웨이 고압 볼 밸브로 DNV 인증을 획득했습니다. 사이즈 DN32~DN50, 최대 420bar(PN420)이며 탄소강(1.0570, 갈바나이징)과 스테인리스강(1.4404) 사양을 제공합니다. BSP, NPT, SAE 및 DIN 2353 접속이 가능하고 바디는 -46°C까지 대응합니다.', 'A DNV-certified large-bore 2-way high pressure ball valve with forged body. Sizes DN32 to DN50 rated up to 420 bar (PN420), in galvanized carbon steel (1.0570) or stainless steel (1.4404). BSP, NPT, SAE and DIN 2353 ends are available; the body is rated down to -46°C.',
  '{"valve_ways": "2_way", "size_range": "DN32 - DN50", "max_pressure_bar": 420, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "BSP(ISO 228), NPT, SAE J1926-1, DIN 2353", "temp_range": "-30°C ~ +100°C (바디 -46°C)", "surface_treatment": "아연 도금(Galvanized)", "special_features": "단조 바디, DNV 인증, 보안 블록·액추에이터 옵션"}'::jsonb, true, 1570, 'gb1 단조 2웨이 볼 밸브 gb1 forged 2-way ball valve dn32~dn50 대구경 단조 바디 2웨이 볼 밸브. 최대 420bar, dnv 인증 forged-body 2-way ball valve for large bores dn32 to dn50, up to 420 bar, dnv certified gb1 gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn32 - dn50 420 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) bsp(iso 228), npt, sae j1926-1, din 2353 -30°c ~ +100°c (바디 -46°c) 아연 도금(galvanized) 단조 바디, dnv 인증, 보안 블록·액추에이터 옵션')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gb3', 'GB3', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GB3 대구경 3웨이 볼 밸브', 'GB3 Large-Bore 3-Way Ball Valve', 'DN32~DN50 대구경 3웨이 볼 밸브. 최대 350bar', 'Large-bore 3-way ball valve, DN32 to DN50, up to 350 bar', 'DN32~DN50 대구경 구간의 3웨이 고압 볼 밸브입니다. 최대 350bar(PN350)이며 탄소강(1.0570, 갈바나이징)과 스테인리스강(1.4404) 사양을 제공합니다. BSP 및 NPT 접속과 L/T 유로 스킴을 지원하며, 압력은 중앙 포트(1번)로만 인가해야 합니다.', 'A 3-way high pressure ball valve covering large bores DN32 to DN50, rated up to 350 bar (PN350). Available in galvanized carbon steel (1.0570) or stainless steel (1.4404) with BSP and NPT ends and L/T flow schemes. Pressure inlet must be from the center port (port 1) only.',
  '{"valve_ways": "3_way", "size_range": "DN32 - DN50", "max_pressure_bar": 350, "body_material": "carbon_or_stainless_steel", "seat_material": "POM", "seal_material": "NBR", "port_types": "BSP(ISO 228), NPT", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "L/T 유로 스킴, 중앙 포트 가압"}'::jsonb, true, 1580, 'gb3 대구경 3웨이 볼 밸브 gb3 large-bore 3-way ball valve dn32~dn50 대구경 3웨이 볼 밸브. 최대 350bar large-bore 3-way ball valve, dn32 to dn50, up to 350 bar gb3 gemels s.p.a. 볼 밸브 ball valves 3_way 3웨이 3-way dn32 - dn50 350 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom nbr bsp(iso 228), npt cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) l/t 유로 스킴, 중앙 포트 가압')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gbf', 'GBF', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GBF 대구경 SAE 플랜지 볼 밸브', 'GBF Large-Bore SAE Flanged Ball Valve', 'DN32~DN50 SAE J518 S3000/S6000 플랜지 2웨이 볼 밸브. 최대 420bar', '2-way SAE J518 S3000/S6000 flanged ball valve for DN32 to DN50, up to 420 bar', '대구경 구간(DN32~DN50)을 커버하는 SAE J518 플랜지 접속 2웨이 고압 볼 밸브입니다. S3000(F61)은 210bar, S6000(F62)은 420bar 클래스이며 미터나사 및 UNC 볼트 홀 버전을 제공합니다. 탄소강과 스테인리스강 사양이 있습니다.', 'A 2-way high pressure ball valve with SAE J518 flange connections for large bores DN32 to DN50. The S3000 (F61) class is rated 210 bar and S6000 (F62) 420 bar, with metric or UNC bolt hole versions, in carbon or stainless steel.',
  '{"valve_ways": "2_way", "size_range": "DN32 - DN50", "max_pressure_bar": 420, "body_material": "carbon_or_stainless_steel", "seat_material": "POM", "seal_material": "NBR", "port_types": "SAE J518 S3000(F61)/S6000(F62) 플랜지, 미터/UNC 볼트 홀", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "대구경 SAE 4볼트 플랜지 직결"}'::jsonb, true, 1590, 'gbf 대구경 sae 플랜지 볼 밸브 gbf large-bore sae flanged ball valve dn32~dn50 sae j518 s3000/s6000 플랜지 2웨이 볼 밸브. 최대 420bar 2-way sae j518 s3000/s6000 flanged ball valve for dn32 to dn50, up to 420 bar gbf gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn32 - dn50 420 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom nbr sae j518 s3000(f61)/s6000(f62) 플랜지, 미터/unc 볼트 홀 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) 대구경 sae 4볼트 플랜지 직결')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gbf-s', 'GBF-S', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GBF-S 컴팩트 대구경 SAE 플랜지 볼 밸브', 'GBF-S Compact Large-Bore SAE Flanged Ball Valve', '원피스 구조의 컴팩트 대구경 SAE 플랜지 2웨이 볼 밸브. DN32~DN50, 최대 420bar', 'Compact one-piece 2-way SAE flanged ball valve, DN32 to DN50, up to 420 bar', 'GBF의 컴팩트 버전으로 대구경(DN32~DN50) SAE J518 플랜지 접속 2웨이 볼 밸브입니다. S3000은 210bar, S6000은 420bar 클래스이며 GBF 대비 경량화된 설계입니다. 탄소강과 스테인리스강 사양, 미터/UNC 볼트 홀 버전을 제공합니다.', 'A compact version of the GBF, this 2-way SAE J518 flanged ball valve covers DN32 to DN50 with S3000 rated 210 bar and S6000 rated 420 bar, in a lighter design than the GBF. Available in carbon or stainless steel with metric or UNC bolt holes.',
  '{"valve_ways": "2_way", "size_range": "DN32 - DN50", "max_pressure_bar": 420, "body_material": "carbon_or_stainless_steel", "seat_material": "POM", "seal_material": "NBR", "port_types": "SAE J518 S3000/S6000 플랜지, 미터/UNC 볼트 홀", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "컴팩트 원피스 설계, GBF 대비 경량"}'::jsonb, true, 1600, 'gbf-s 컴팩트 대구경 sae 플랜지 볼 밸브 gbf-s compact large-bore sae flanged ball valve 원피스 구조의 컴팩트 대구경 sae 플랜지 2웨이 볼 밸브. dn32~dn50, 최대 420bar compact one-piece 2-way sae flanged ball valve, dn32 to dn50, up to 420 bar gbf-s gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn32 - dn50 420 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom nbr sae j518 s3000/s6000 플랜지, 미터/unc 볼트 홀 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) 컴팩트 원피스 설계, gbf 대비 경량')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gbs', 'GBS', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GBS 단조 SAE 플랜지 헤드 2웨이 볼 밸브', 'GBS Forged SAE Flange-Head 2-Way Ball Valve', '단조 바디 SAE J518 플랜지 헤드(C61/C62) 2웨이 볼 밸브. DN32~DN50, 최대 420bar', 'Forged 2-way ball valve with integrated SAE J518 flange heads (C61/C62), DN32 to DN50, up to 420 bar', '대구경(DN32~DN50)용 단조 바디 2웨이 고압 볼 밸브로, 양단에 SAE J518 플랜지 헤드가 일체로 가공되어 스플릿 플랜지 클램프로 직결됩니다. S3000(C61: DN32 28MPa, DN40/DN50 21MPa)과 S6000(C62: 전 사이즈 42MPa) 압력 클래스를 지원하며 표준형과 엑스트라 롱(연장형) 버전이 있습니다. 탄소강(바디 1.0570, 아연 도금)과 스테인리스강(1.4404) 사양을 제공합니다.', 'A forged-body 2-way high pressure ball valve for larger bores (DN32 to DN50) with SAE J518 flange heads machined integrally on both ends for direct split-flange clamping. Available in S3000 (C61: 28 MPa at DN32, 21 MPa at DN40/DN50) and S6000 (C62: 42 MPa all sizes) pressure classes, in standard and extra-long body versions, in galvanized carbon steel (body 1.0570) or stainless steel (1.4404).',
  '{"valve_ways": "2_way", "size_range": "DN32 - DN50", "max_pressure_bar": 420, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "SAE J518 플랜지 헤드, S3000(C61)/S6000(C62), 엑스트라 롱 버전 제공", "temp_range": "-30°C ~ +100°C (바디 -46°C)", "surface_treatment": "아연 도금(Galvanized)", "special_features": "단조 바디, 플랜지 헤드 일체형(어댑터 불필요), S3000은 사이즈별 정격 상이(DN32 280bar / DN40·50 210bar), 감축 보어·특수 나사·PN6000psi급·공압/전동 액추에이터·잠금장치 옵션"}'::jsonb, true, 1610, 'gbs 단조 sae 플랜지 헤드 2웨이 볼 밸브 gbs forged sae flange-head 2-way ball valve 단조 바디 sae j518 플랜지 헤드(c61/c62) 2웨이 볼 밸브. dn32~dn50, 최대 420bar forged 2-way ball valve with integrated sae j518 flange heads (c61/c62), dn32 to dn50, up to 420 bar gbs gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn32 - dn50 420 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) sae j518 플랜지 헤드, s3000(c61)/s6000(c62), 엑스트라 롱 버전 제공 -30°c ~ +100°c (바디 -46°c) 아연 도금(galvanized) 단조 바디, 플랜지 헤드 일체형(어댑터 불필요), s3000은 사이즈별 정격 상이(dn32 280bar / dn40·50 210bar), 감축 보어·특수 나사·pn6000psi급·공압/전동 액추에이터·잠금장치 옵션')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ge1', 'GE1', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GE1 2웨이 고압 볼 밸브', 'GE1 2-Way High Pressure Ball Valve', 'DN6~DN13, 최대 500bar의 경량 탄소강 2웨이 볼 밸브', 'Light-duty carbon steel 2-way ball valve, DN6 to DN13, up to 500 bar', 'DN6~DN13 소구경 구간을 커버하는 2웨이 고압 볼 밸브입니다. 최대 500bar(PN500)까지 사용 가능하며 탄소강(1.0737) 갈바나이징 사양입니다. BSP, NPT, SAE 접속을 제공하고 POM 시트와 NBR 실을 사용하며, 마운팅용 고정 홀이 기본 포함되어 있습니다.', 'A 2-way high pressure ball valve covering small bores DN6 to DN13, rated up to 500 bar (PN500) in galvanized carbon steel (1.0737). Offered with BSP, NPT and SAE ends, POM seats and NBR seals, with fixing holes included for mounting.',
  '{"valve_ways": "2_way", "size_range": "DN6 - DN13", "max_pressure_bar": 500, "body_material": "carbon_steel", "seat_material": "POM", "seal_material": "NBR", "port_types": "BSP(ISO 228), NPT, SAE J1926-1", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "고정 홀 기본 포함"}'::jsonb, true, 1620, 'ge1 2웨이 고압 볼 밸브 ge1 2-way high pressure ball valve dn6~dn13, 최대 500bar의 경량 탄소강 2웨이 볼 밸브 light-duty carbon steel 2-way ball valve, dn6 to dn13, up to 500 bar ge1 gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn6 - dn13 500 carbon_steel 탄소강 carbon steel pom nbr bsp(iso 228), npt, sae j1926-1 -20°c ~ +100°c 아연 도금(galvanized) 고정 홀 기본 포함')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ge2', 'GE2', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GE2 2웨이 고압 볼 밸브', 'GE2 2-Way High Pressure Ball Valve', 'GEMELS 대표 2웨이 볼 밸브. DN6~DN25, 최대 500bar, DNV 인증', 'GEMELS'' flagship 2-way ball valve, DN6 to DN25, up to 500 bar, DNV certified', 'GEMELS의 대표적인 2웨이 고압 볼 밸브 시리즈로 DNV 인증을 획득했습니다. 사이즈 DN6~DN25, 최대 500bar(PN500)이며 탄소강(1.0737, 갈바나이징)과 스테인리스강(1.4404) 사양을 제공합니다. BSP, NPT, SAE, DIN 2353(헤비/라이트) 등 다양한 접속이 가능하고, POM 시트/NBR 실 기본에 PEEK·PA612·GEMPTFE·PTFE 시트와 FKM·EPDM·MVQ 실을 옵션으로 지원합니다. 공압/전기 액추에이터, 보안 블록, 잠금장치 등의 옵션도 제공됩니다.', 'GEMELS'' flagship DNV-certified 2-way high pressure ball valve series. Sizes DN6 to DN25 rated up to 500 bar (PN500), in galvanized carbon steel (1.0737) or stainless steel (1.4404). End options include BSP, NPT, SAE and DIN 2353 (heavy/light series). POM seats and NBR seals are standard, with PEEK, PA612, GEMPTFE, PTFE seats and FKM, EPDM, MVQ seals on request, plus options such as pneumatic/electric actuators, security block and locking device.',
  '{"valve_ways": "2_way", "size_range": "DN6 - DN25", "max_pressure_bar": 500, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "BSP(ISO 228), NPT, SAE J1926-1, DIN 2353 헤비/라이트", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "DNV 인증, 공압/전기 액추에이터·보안 블록·잠금장치 옵션, 고정 홀 포함"}'::jsonb, true, 1630, 'ge2 2웨이 고압 볼 밸브 ge2 2-way high pressure ball valve gemels 대표 2웨이 볼 밸브. dn6~dn25, 최대 500bar, dnv 인증 gemels'' flagship 2-way ball valve, dn6 to dn25, up to 500 bar, dnv certified ge2 gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn6 - dn25 500 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) bsp(iso 228), npt, sae j1926-1, din 2353 헤비/라이트 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) dnv 인증, 공압/전기 액추에이터·보안 블록·잠금장치 옵션, 고정 홀 포함')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ge2-hc', 'GE2 HC', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GE2 HC 고사이클 2웨이 볼 밸브', 'GE2 HC High-Cycle 2-Way Ball Valve', '100만 사이클 보증 고사이클 2웨이 볼 밸브. DN6~DN32, 최대 500bar', 'High-cyclicity 2-way ball valve rated for 1,000,000 cycles, DN6 to DN32, up to 500 bar', '1,000,000 사이클의 수명을 보증하는 고사이클(High Cyclicity) 2웨이 볼 밸브입니다. 사이즈 DN6~DN32, 최대 500bar(PN500)이며 탄소강과 스테인리스강 사양을 제공합니다. 스템은 1.4542, 볼은 1.4404, 시트는 PA612G를 적용해 내구성을 높였으며 그래파이트 클로저 개스킷을 사용합니다. 액추에이터 장착을 위한 베어 스템 설계와 ISO 5211(F05) 인터페이스도 지원합니다.', 'A high-cyclicity 2-way ball valve rated for 1,000,000 operating cycles. Sizes DN6 to DN32, up to 500 bar (PN500), in carbon or stainless steel. Durability comes from a 1.4542 stem, 1.4404 ball, PA612G seats and graphite closure gaskets. Also available in bare-stem design with actuator holes and an ISO 5211 (F05) interface.',
  '{"valve_ways": "2_way", "size_range": "DN6 - DN32", "max_pressure_bar": 500, "body_material": "carbon_or_stainless_steel", "seat_material": "PA612G (옵션: POM, PEEK, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "BSP(ISO 228), NPT, SAE J1926-1", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "1,000,000 사이클 보증, 베어 스템 설계 가능, ISO 5211 액추에이터 인터페이스"}'::jsonb, true, 1640, 'ge2 hc 고사이클 2웨이 볼 밸브 ge2 hc high-cycle 2-way ball valve 100만 사이클 보증 고사이클 2웨이 볼 밸브. dn6~dn32, 최대 500bar high-cyclicity 2-way ball valve rated for 1,000,000 cycles, dn6 to dn32, up to 500 bar ge2 hc gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn6 - dn32 500 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pa612g (옵션: pom, peek, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) bsp(iso 228), npt, sae j1926-1 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) 1,000,000 사이클 보증, 베어 스템 설계 가능, iso 5211 액추에이터 인터페이스')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ge2-qc', 'GE2 FF / GE2 A / GE2 PP / GE2 VGA', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GE2 통합 퀵 커플링 볼 밸브', 'GE2 Ball Valves with Integrated Quick Couplings', '퀵 커플링(플랫 페이스·ISO A·푸시풀·스크루형)이 일체형으로 결합된 GE2 2웨이 볼 밸브', 'GE2 2-way ball valves with integrated flat face, ISO A, push-pull or screw-to-connect quick couplings', 'GEMELS 특허 설계로 GE2 2웨이 볼 밸브에 퀵 커플링을 일체형으로 결합한 제품군입니다. ISO 16028 플랫 페이스(FF), ISO 7241/A(A), 푸시풀(PP), ISO 14541 스크루 접속(VGA)의 4가지 커플링 타입을 제공합니다. 사이즈 DN10~DN25, 최대 420bar까지 사용 가능하며 탄소강 갈바나이징 사양입니다. 밸브 측 접속은 BSP, NPT, SAE, DIN 2353(헤비/라이트) 중 선택할 수 있습니다.', 'A patented GEMELS design combining the GE2 2-way ball valve with an integrated quick coupling. Four coupling types are available: ISO 16028 flat face (FF), ISO 7241/A (A), push-pull (PP) and ISO 14541 screw-to-connect (VGA). Sizes range from DN10 to DN25 with pressures up to 420 bar, in galvanized carbon steel. Valve-side ends can be BSP, NPT, SAE or DIN 2353 (heavy/light series).',
  '{"valve_ways": "2_way", "size_range": "DN10 - DN25", "max_pressure_bar": 420, "body_material": "carbon_steel", "seat_material": "POM", "seal_material": "NBR", "port_types": "BSP(ISO 228), NPT, SAE J1926-1, DIN 2353 + 통합 퀵 커플링(ISO 16028 FF / ISO 7241-A / Push-Pull / ISO 14541)", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "특허 등록 통합 퀵 커플링 설계, 수/암 커플링 선택 가능, 고정 홀 포함"}'::jsonb, true, 1650, 'ge2 통합 퀵 커플링 볼 밸브 ge2 ball valves with integrated quick couplings 퀵 커플링(플랫 페이스·iso a·푸시풀·스크루형)이 일체형으로 결합된 ge2 2웨이 볼 밸브 ge2 2-way ball valves with integrated flat face, iso a, push-pull or screw-to-connect quick couplings ge2 ff / ge2 a / ge2 pp / ge2 vga gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn10 - dn25 420 carbon_steel 탄소강 carbon steel pom nbr bsp(iso 228), npt, sae j1926-1, din 2353 + 통합 퀵 커플링(iso 16028 ff / iso 7241-a / push-pull / iso 14541) -20°c ~ +100°c 아연 도금(galvanized) 특허 등록 통합 퀵 커플링 설계, 수/암 커플링 선택 가능, 고정 홀 포함')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ge3', 'GE3 (GE3L / GE3T)', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GE3 3웨이 고압 볼 밸브', 'GE3 3-Way High Pressure Ball Valve', 'L/T 유로 스킴의 3웨이 볼 밸브. DN6~DN25, 최대 500bar', '3-way ball valve with L or T flow scheme, DN6 to DN25, up to 500 bar', 'L 스킴(GE3L)과 T 스킴(GE3T)을 선택할 수 있는 3웨이 고압 볼 밸브입니다. 사이즈 DN6~DN25, 최대 500bar(PN500)이며 탄소강(갈바나이징)과 스테인리스강(1.4404) 사양을 제공합니다. BSP, NPT, SAE, DIN 2353 접속이 가능하고 POM 시트/NBR 실 기본에 다양한 옵션 재질을 지원합니다. 압력은 반드시 중앙 포트(1번)로만 인가해야 합니다.', 'A 3-way high pressure ball valve available with L (GE3L) or T (GE3T) flow scheme. Sizes DN6 to DN25 rated up to 500 bar (PN500), in galvanized carbon steel or stainless steel (1.4404). End options include BSP, NPT, SAE and DIN 2353, with POM/NBR standard and optional seat/seal materials. Pressure must be applied from the center port (port 1) only.',
  '{"valve_ways": "3_way", "size_range": "DN6 - DN25", "max_pressure_bar": 500, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "BSP(ISO 228), NPT, SAE J1926-1, DIN 2353 헤비/라이트", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "L/T 유로 스킴 선택, 중앙 포트 가압, 보안 블록·잠금장치·액추에이터 옵션"}'::jsonb, true, 1660, 'ge3 3웨이 고압 볼 밸브 ge3 3-way high pressure ball valve l/t 유로 스킴의 3웨이 볼 밸브. dn6~dn25, 최대 500bar 3-way ball valve with l or t flow scheme, dn6 to dn25, up to 500 bar ge3 (ge3l / ge3t) gemels s.p.a. 볼 밸브 ball valves 3_way 3웨이 3-way dn6 - dn25 500 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) bsp(iso 228), npt, sae j1926-1, din 2353 헤비/라이트 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) l/t 유로 스킴 선택, 중앙 포트 가압, 보안 블록·잠금장치·액추에이터 옵션')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ge3-hc', 'GE3 HC', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GE3 HC 고사이클 3웨이 볼 밸브', 'GE3 HC High-Cycle 3-Way Ball Valve', '100만 사이클 보증 고사이클 3웨이 볼 밸브. DN10~DN25, 최대 500bar', 'High-cyclicity 3-way ball valve rated for 1,000,000 cycles, DN10 to DN25, up to 500 bar', '1,000,000 사이클 수명을 보증하는 고사이클 3웨이 볼 밸브입니다. L/T 유로 스킴을 지원하며 사이즈 DN10~DN25, 최대 500bar(PN500)입니다. 탄소강과 스테인리스강 사양을 제공하고 1.4542 스템, 1.4404 볼, PA612G 시트, 그래파이트 클로저 개스킷을 적용했습니다. 압력은 중앙 포트에서만 인가해야 하며, 공압/전기 액추에이터 옵션이 있습니다.', 'A high-cyclicity 3-way ball valve rated for 1,000,000 cycles with L/T flow schemes. Sizes DN10 to DN25, up to 500 bar (PN500), in carbon or stainless steel with a 1.4542 stem, 1.4404 ball, PA612G seats and graphite closure gaskets. Pressure inlet must be from the center port only; pneumatic/electric actuator options are available.',
  '{"valve_ways": "3_way", "size_range": "DN10 - DN25", "max_pressure_bar": 500, "body_material": "carbon_or_stainless_steel", "seat_material": "PA612G (옵션: POM, PEEK, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "BSP(ISO 228), NPT, SAE J1926-1", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "1,000,000 사이클 보증, L/T 유로 스킴, 중앙 포트 가압"}'::jsonb, true, 1670, 'ge3 hc 고사이클 3웨이 볼 밸브 ge3 hc high-cycle 3-way ball valve 100만 사이클 보증 고사이클 3웨이 볼 밸브. dn10~dn25, 최대 500bar high-cyclicity 3-way ball valve rated for 1,000,000 cycles, dn10 to dn25, up to 500 bar ge3 hc gemels s.p.a. 볼 밸브 ball valves 3_way 3웨이 3-way dn10 - dn25 500 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pa612g (옵션: pom, peek, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) bsp(iso 228), npt, sae j1926-1 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) 1,000,000 사이클 보증, l/t 유로 스킴, 중앙 포트 가압')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ge3k', 'GE3K (GE3KL / GE3KT)', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GE3K 무누설 3웨이 볼 밸브', 'GE3K Zero-Leakage 3-Way Ball Valve', '특수 시트 무누설(zero leakage) 3웨이 볼 밸브. DN6~DN25, 최대 500bar', '3-way ball valve with special seats for zero leakage, DN6 to DN25, up to 500 bar', '특수 시트 구조로 무누설(zero leakage)을 구현한 3웨이 고압 볼 밸브입니다. 압력이 시트를 볼 쪽으로 밀착시키고 플로팅 볼이 반대편 시트에 밀착되어 누설 없는 수밀 실링을 형성합니다. L 스킴(GE3KL)과 T 스킴(GE3KT)을 제공하며 사이즈 DN6~DN25, 최대 500bar(PN500)입니다. 탄소강과 스테인리스강 사양, BSP/NPT/SAE 접속을 지원합니다.', 'A 3-way high pressure ball valve achieving zero leakage through special seat construction: pressure pushes the seat against the ball while the floating ball presses against the opposite seat, creating a watertight seal. Available in L (GE3KL) and T (GE3KT) schemes, sizes DN6 to DN25, up to 500 bar (PN500), in carbon or stainless steel with BSP, NPT or SAE ends.',
  '{"valve_ways": "3_way", "size_range": "DN6 - DN25", "max_pressure_bar": 500, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "BSP(ISO 228), NPT, SAE J1926-1", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "특수 시트 무누설(zero leakage) 설계, L/T 유로 스킴"}'::jsonb, true, 1680, 'ge3k 무누설 3웨이 볼 밸브 ge3k zero-leakage 3-way ball valve 특수 시트 무누설(zero leakage) 3웨이 볼 밸브. dn6~dn25, 최대 500bar 3-way ball valve with special seats for zero leakage, dn6 to dn25, up to 500 bar ge3k (ge3kl / ge3kt) gemels s.p.a. 볼 밸브 ball valves 3_way 3웨이 3-way dn6 - dn25 500 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) bsp(iso 228), npt, sae j1926-1 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) 특수 시트 무누설(zero leakage) 설계, l/t 유로 스킴')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ge5', 'GE5', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GE5 소형 3웨이 볼 밸브', 'GE5 Compact 3-Way Ball Valve', '소형 설계 3웨이 볼 밸브. DN6~DN13, 최대 500bar', 'Smaller-design 3-way ball valve, DN6 to DN13, up to 500 bar', '소형(Smaller Design) 3웨이 고압 볼 밸브로 좁은 설치 공간에 적합합니다. 사이즈 DN6~DN13, 최대 500bar(PN500)이며 탄소강(1.0737, 갈바나이징) 사양입니다. BSP, NPT, SAE 접속을 제공하고 L/T 유로 스킴을 지원하며 고정 홀이 기본 포함됩니다. 압력은 중앙 포트(1번)로만 인가해야 합니다.', 'A smaller-design 3-way high pressure ball valve for tight installation spaces. Sizes DN6 to DN13, up to 500 bar (PN500), in galvanized carbon steel (1.0737). Offers BSP, NPT and SAE ends, L/T flow schemes and fixing holes included. Pressure inlet from the center port (port 1) only.',
  '{"valve_ways": "3_way", "size_range": "DN6 - DN13", "max_pressure_bar": 500, "body_material": "carbon_steel", "seat_material": "POM", "seal_material": "NBR", "port_types": "BSP(ISO 228), NPT, SAE J1926-1", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "소형 설계, L/T 유로 스킴, 고정 홀 포함, 중앙 포트 가압"}'::jsonb, true, 1690, 'ge5 소형 3웨이 볼 밸브 ge5 compact 3-way ball valve 소형 설계 3웨이 볼 밸브. dn6~dn13, 최대 500bar smaller-design 3-way ball valve, dn6 to dn13, up to 500 bar ge5 gemels s.p.a. 볼 밸브 ball valves 3_way 3웨이 3-way dn6 - dn13 500 carbon_steel 탄소강 carbon steel pom nbr bsp(iso 228), npt, sae j1926-1 -20°c ~ +100°c 아연 도금(galvanized) 소형 설계, l/t 유로 스킴, 고정 홀 포함, 중앙 포트 가압')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gef', 'GEF', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GEF SAE 플랜지 2웨이 볼 밸브', 'GEF SAE Flanged 2-Way Ball Valve', 'SAE J518 S3000/S6000 플랜지 접속 2웨이 볼 밸브. DN13~DN25, 최대 420bar', '2-way ball valve with SAE J518 S3000/S6000 flange ends, DN13 to DN25, up to 420 bar', 'ISO 6162-1/-2(SAE J518-1/-2) 플랜지 접속의 2웨이 고압 볼 밸브입니다. S3000(F61) 및 S6000(F62) 압력 클래스를 지원하며 사이즈 DN13~DN25, 최대 420bar입니다. 탄소강(갈바나이징)과 스테인리스강(1.4404) 사양을 제공하고, 미터나사 및 UNC 볼트 홀 버전을 선택할 수 있습니다.', 'A 2-way high pressure ball valve with ISO 6162-1/-2 (SAE J518-1/-2) flange connections in S3000 (F61) and S6000 (F62) pressure classes. Sizes DN13 to DN25 rated up to 420 bar, in galvanized carbon steel or stainless steel (1.4404), with metric or UNC bolt hole versions.',
  '{"valve_ways": "2_way", "size_range": "DN13 - DN25", "max_pressure_bar": 420, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "ISO 6162-1/-2 (SAE J518) 플랜지, S3000/S6000, 미터/UNC 볼트 홀", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "SAE 4볼트 플랜지 직결, 액추에이터·잠금장치 옵션"}'::jsonb, true, 1700, 'gef sae 플랜지 2웨이 볼 밸브 gef sae flanged 2-way ball valve sae j518 s3000/s6000 플랜지 접속 2웨이 볼 밸브. dn13~dn25, 최대 420bar 2-way ball valve with sae j518 s3000/s6000 flange ends, dn13 to dn25, up to 420 bar gef gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn13 - dn25 420 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) iso 6162-1/-2 (sae j518) 플랜지, s3000/s6000, 미터/unc 볼트 홀 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) sae 4볼트 플랜지 직결, 액추에이터·잠금장치 옵션')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gef-s', 'GEF-S', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GEF-S 컴팩트 SAE 플랜지 볼 밸브', 'GEF-S Compact SAE Flanged Ball Valve', '원피스 플러그 구조의 컴팩트 SAE J518 플랜지 2웨이 볼 밸브. DN13~DN25, 최대 420bar', 'Compact 2-way SAE J518 flanged ball valve with one-piece plug construction, DN13 to DN25, up to 420 bar', 'GEF의 컴팩트 버전으로, 플러그 일체형 구조를 채택한 SAE 플랜지 2웨이 볼 밸브입니다. ISO 6162-1/-2(SAE J518) S3000/S6000 플랜지 접속, 사이즈 DN13~DN25, 최대 420bar입니다. 탄소강과 스테인리스강 사양을 제공하며 GEF 대비 경량화된 설계입니다.', 'A compact version of the GEF with plug-type one-piece construction. ISO 6162-1/-2 (SAE J518) flange connections in S3000/S6000 classes, sizes DN13 to DN25, up to 420 bar. Available in carbon or stainless steel with a lighter design than the GEF.',
  '{"valve_ways": "2_way", "size_range": "DN13 - DN25", "max_pressure_bar": 420, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "ISO 6162-1/-2 (SAE J518) 플랜지, S3000/S6000, 미터/UNC 볼트 홀", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "컴팩트 원피스(플러그) 설계, GEF 대비 경량"}'::jsonb, true, 1710, 'gef-s 컴팩트 sae 플랜지 볼 밸브 gef-s compact sae flanged ball valve 원피스 플러그 구조의 컴팩트 sae j518 플랜지 2웨이 볼 밸브. dn13~dn25, 최대 420bar compact 2-way sae j518 flanged ball valve with one-piece plug construction, dn13 to dn25, up to 420 bar gef-s gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn13 - dn25 420 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) iso 6162-1/-2 (sae j518) 플랜지, s3000/s6000, 미터/unc 볼트 홀 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) 컴팩트 원피스(플러그) 설계, gef 대비 경량')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gem', 'GEM', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GEM 소형 2웨이 볼 밸브', 'GEM Compact 2-Way Ball Valve', 'DN6 단일 사이즈, 최대 500bar의 초소형 2웨이 고압 볼 밸브', 'Ultra-compact DN6 2-way high pressure ball valve rated up to 500 bar', 'DN6 단일 사이즈의 초소형 2웨이 고압 볼 밸브입니다. 최대 500bar(PN500)까지 사용 가능하며 탄소강(1.0737, 아연니켈 처리)과 스테인리스강(1.4305) 두 가지 바디 재질을 제공합니다. BSP, NPT, SAE 접속이 가능하고 POM 시트와 NBR 실이 기본이며 PEEK, PA612, PTFE 시트 및 FKM, EPDM, MVQ 실을 옵션으로 선택할 수 있습니다.', 'An ultra-compact 2-way high pressure ball valve in a single DN6 size, rated up to 500 bar (PN500). Available in carbon steel (1.0737, zinc-nickel treated) or stainless steel (1.4305) with BSP, NPT or SAE ends. POM seats and NBR seals are standard, with PEEK, PA612, PTFE seats and FKM, EPDM, MVQ seals on request.',
  '{"valve_ways": "2_way", "size_range": "DN6", "max_pressure_bar": 500, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "BSP(ISO 228), NPT, SAE J1926-1", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연니켈(Zinc Nickel)", "special_features": "축소 보어·특수 나사·잠금장치 옵션"}'::jsonb, true, 1720, 'gem 소형 2웨이 볼 밸브 gem compact 2-way ball valve dn6 단일 사이즈, 최대 500bar의 초소형 2웨이 고압 볼 밸브 ultra-compact dn6 2-way high pressure ball valve rated up to 500 bar gem gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn6 500 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, ptfe) nbr (옵션: fkm, epdm, mvq) bsp(iso 228), npt, sae j1926-1 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연니켈(zinc nickel) 축소 보어·특수 나사·잠금장치 옵션')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ges', 'GES', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GES SAE 플랜지 헤드 2웨이 볼 밸브', 'GES SAE Flange-Head 2-Way Ball Valve', 'SAE J518 플랜지 헤드(C61/C62) 일체형 2웨이 고압 볼 밸브. DN13~DN25, 최대 420bar', '2-way high pressure ball valve with integrated SAE J518 flange heads (C61/C62), DN13 to DN25, up to 420 bar', '밸브 양단에 SAE J518 플랜지 헤드가 일체로 가공된 2웨이 고압 볼 밸브입니다. S3000(C61, 35MPa)과 S6000(C62, 42MPa) 압력 클래스를 지원하며 사이즈는 DN13~DN25입니다. 스플릿 플랜지 클램프로 배관에 직결할 수 있어 별도 어댑터가 필요 없고, 표준형 외에 엑스트라 롱(연장형) 버전도 제공됩니다. 탄소강(1.0737, 아연 도금)과 스테인리스강(1.4404) 사양이 있으며 카본강 밸브에는 고정 홀이 기본 포함됩니다.', 'A 2-way high pressure ball valve with SAE J518 flange heads machined integrally on both ends, for direct split-flange clamping to the line without adapters. Available in S3000 (C61, 35 MPa) and S6000 (C62, 42 MPa) pressure classes, sizes DN13 to DN25, in standard and extra-long body versions. Offered in galvanized carbon steel (1.0737) and stainless steel (1.4404); fixing holes are included on carbon steel valves.',
  '{"valve_ways": "2_way", "size_range": "DN13 - DN25", "max_pressure_bar": 420, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "SAE J518 플랜지 헤드, S3000(C61)/S6000(C62), 엑스트라 롱 버전 제공", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "플랜지 헤드 일체형(어댑터 불필요), 카본강 고정 홀 포함, 감축 보어·특수 나사·PN6000psi급·공압/전동 액추에이터·잠금장치 옵션"}'::jsonb, true, 1730, 'ges sae 플랜지 헤드 2웨이 볼 밸브 ges sae flange-head 2-way ball valve sae j518 플랜지 헤드(c61/c62) 일체형 2웨이 고압 볼 밸브. dn13~dn25, 최대 420bar 2-way high pressure ball valve with integrated sae j518 flange heads (c61/c62), dn13 to dn25, up to 420 bar ges gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn13 - dn25 420 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) sae j518 플랜지 헤드, s3000(c61)/s6000(c62), 엑스트라 롱 버전 제공 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) 플랜지 헤드 일체형(어댑터 불필요), 카본강 고정 홀 포함, 감축 보어·특수 나사·pn6000psi급·공압/전동 액추에이터·잠금장치 옵션')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gev', 'GEV', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GEV 시리즈 3방 셔틀 밸브', 'GEV Series 3-Way Shuttle Valves', '3방향 셔틀 밸브, DN6~DN25, 최대 500bar', '3-way shuttle valves, DN6-DN25, up to 500 bar', 'GEV 시리즈는 두 입력 중 고압측을 자동 선택하는 3방 셔틀 밸브입니다. DN6~DN25 사이즈에 최대 50 MPa(PN500)를 지원하며 BSP/NPT 나사와 탄소강(1.0737) 본체로 제공됩니다. 축소 보어와 특수 나사는 주문 제작 가능합니다.', 'The GEV series are 3-way shuttle valves that automatically select the higher-pressure input. Sizes DN6-DN25 are rated up to 50 MPa (PN500), supplied with BSP/NPT ends and carbon steel (1.0737) bodies. Reduced bores and special threads are available on request.',
  '{"valve_type": "shuttle_valve", "size_range": "DN6 ~ DN25", "max_pressure_mpa": 50, "end_connections": "BSP(ISO 228), NPT(ANSI/ASME B1.20.1)", "body_material": "carbon_steel", "temp_range_c": "-20°C ~ +100°C", "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 1740, 'gev 시리즈 3방 셔틀 밸브 gev series 3-way shuttle valves 3방향 셔틀 밸브, dn6~dn25, 최대 500bar 3-way shuttle valves, dn6-dn25, up to 500 bar gev gemels s.p.a. 유압 밸브 hydraulic valves shuttle_valve 셔틀 밸브 shuttle valve dn6 ~ dn25 50 bsp(iso 228), npt(ansi/asme b1.20.1) carbon_steel 탄소강 carbon steel -20°c ~ +100°c 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gh2', 'GH2', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GH2 초고압 볼 밸브 (수소용)', 'GH2 Ultra High Pressure Ball Valve (Hydrogen)', '최대 1,000bar, 수소 애플리케이션 대응 스테인리스강 2웨이 고사이클 볼 밸브', 'Stainless steel 2-way high-cycle ball valve up to 1,000 bar for hydrogen applications', '수소 애플리케이션을 위해 개발된 2웨이 고사이클 초고압 볼 밸브입니다. 최대 1,000bar(PN1000)의 사용 압력을 지원하며 사이즈는 DN6~DN25입니다. 바디와 어댑터는 ASTM A479 TP316, 볼과 스템은 ASTM A182 FXM-19 재질이며 FKM AED 실과 GEM_PA 시트를 사용합니다. BSP, NPT, SAE 접속을 제공하고 ISO 5211 액추에이터 마운팅 인터페이스를 갖추고 있습니다.', 'A 2-way high-cycle ultra-high-pressure ball valve developed for hydrogen applications, rated up to 1,000 bar (PN1000) in sizes DN6 to DN25. The body and adapter are ASTM A479 TP316, ball and stem ASTM A182 FXM-19, with FKM AED seals and GEM_PA seats. Available with BSP, NPT and SAE ends, and features an ISO 5211 actuator mounting interface.',
  '{"valve_ways": "2_way", "size_range": "DN6 - DN25", "max_pressure_bar": 1000, "body_material": "stainless_steel", "seat_material": "GEM_PA", "seal_material": "FKM AED", "port_types": "BSP(ISO 228), NPT, SAE J1926-1", "temp_range": "", "surface_treatment": "", "special_features": "수소 애플리케이션 대응, 고사이클 설계, ISO 5211 액추에이터 인터페이스(F03/F05)"}'::jsonb, true, 1750, 'gh2 초고압 볼 밸브 (수소용) gh2 ultra high pressure ball valve (hydrogen) 최대 1,000bar, 수소 애플리케이션 대응 스테인리스강 2웨이 고사이클 볼 밸브 stainless steel 2-way high-cycle ball valve up to 1,000 bar for hydrogen applications gh2 gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn6 - dn25 1000 stainless_steel 스테인리스강 stainless steel gem_pa fkm aed bsp(iso 228), npt, sae j1926-1 수소 애플리케이션 대응, 고사이클 설계, iso 5211 액추에이터 인터페이스(f03/f05)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-ghp', 'GHP', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GHP 대구경 2웨이 볼 밸브', 'GHP Large-Bore 2-Way Ball Valve', 'DN13~DN100 나사식 대구경 2웨이 볼 밸브. 최대 370bar', 'Threaded large-bore 2-way ball valve, DN13 to DN100, up to 370 bar', 'G1/2부터 G4까지 폭넓은 나사 사이즈를 커버하는 대구경 2웨이 고압 볼 밸브입니다. 사이즈 DN13~DN100, 최대 370bar(PN370)이며 탄소강(1.0570, 갈바나이징)과 스테인리스강(1.4404) 사양을 제공합니다. 볼과 스템은 1.4404 스테인리스강이 기본이며 ISO 5211 액추에이터 인터페이스(F03~F10)를 갖추고 있습니다.', 'A large-bore 2-way high pressure ball valve covering thread sizes from G1/2 up to G4. Sizes DN13 to DN100 rated up to 370 bar (PN370), in galvanized carbon steel (1.0570) or stainless steel (1.4404). The ball and stem are 1.4404 stainless steel as standard, with an ISO 5211 actuator interface (F03 to F10).',
  '{"valve_ways": "2_way", "size_range": "DN13 - DN100", "max_pressure_bar": 370, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "BSP(ISO 228), NPT (G1/2 ~ G4)", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "ISO 5211 액추에이터 인터페이스(F03~F10), 보안 블록 옵션"}'::jsonb, true, 1760, 'ghp 대구경 2웨이 볼 밸브 ghp large-bore 2-way ball valve dn13~dn100 나사식 대구경 2웨이 볼 밸브. 최대 370bar threaded large-bore 2-way ball valve, dn13 to dn100, up to 370 bar ghp gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn13 - dn100 370 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) bsp(iso 228), npt (g1/2 ~ g4) cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) iso 5211 액추에이터 인터페이스(f03~f10), 보안 블록 옵션')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gm', 'GM', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-oil-gas-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GM 시리즈 2방 고압 볼 밸브', 'GM Series 2-Way High Pressure Ball Valves', '오일&가스용 2방 고압 볼 밸브, DN6~DN100, PN500/S3000', 'Oil & gas 2-way high pressure ball valves, DN6-DN100, PN500/S3000', 'GM 시리즈는 ASTM A350 LF2/A105(탄소강) 또는 A182 F316L(스테인리스강) 본체의 오일&가스용 2방 고압 볼 밸브입니다. DN6~DN100 사이즈에 최대 PN500 또는 S3000 클래스로 제공되며 BSP/NPT/소켓용접 접속(PE·SW 엑스트라롱은 주문 제작)과 -46°C~+250°C 온도 범위를 지원합니다.', 'The GM series are 2-way high-pressure ball valves for oil & gas with ASTM A350 LF2/A105 (carbon steel) or A182 F316L (stainless steel) bodies. Sizes DN6-DN100 are offered up to PN500 or S3000 class with BSP/NPT/socket weld ends (PE and SW extra-long on request) and a -46°C to +250°C temperature range depending on materials.',
  '{"valve_design": "floating_screwed", "size_range": "DN6 ~ DN100 (1/4\" ~ 4\")", "pressure_class": "PN500 / S3000", "max_pressure_mpa": 50, "end_connections": "BSP, NPT, SW (PE·SW 엑스트라롱 주문 제작)", "body_material": "ASTM A350 LF2 (DN65~100: A105) / ASTM A182 F316L", "temp_range_c": "-46°C ~ +250°C (재질 선택에 따름)", "iso5211_mount": false}'::jsonb, true, 1770, 'gm 시리즈 2방 고압 볼 밸브 gm series 2-way high pressure ball valves 오일&가스용 2방 고압 볼 밸브, dn6~dn100, pn500/s3000 oil & gas 2-way high pressure ball valves, dn6-dn100, pn500/s3000 gm gemels s.p.a. 오일&가스 볼 밸브 oil & gas ball valves floating_screwed 플로팅(나사식) floating (screwed ends) dn6 ~ dn100 (1/4" ~ 4") pn500 / s3000 50 bsp, npt, sw (pe·sw 엑스트라롱 주문 제작) astm a350 lf2 (dn65~100: a105) / astm a182 f316l -46°c ~ +250°c (재질 선택에 따름) false')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gn', 'GN', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-oil-gas-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GN 시리즈 2방 고압 볼 밸브', 'GN Series 2-Way High Pressure Ball Valves', '오일&가스용 2방 고압 볼 밸브, DN6~DN50, PN500/S6000', 'Oil & gas 2-way high pressure ball valves, DN6-DN50, PN500/S6000', 'GN 시리즈는 ASTM A350 LF2(탄소강) 또는 A182 F316L(스테인리스강) 단조 본체의 오일&가스용 2방 고압 볼 밸브입니다. DN6~DN50 사이즈에 최대 50 MPa(PN500) 또는 S6000(41.4 MPa) 클래스로 제공되며, BSP/NPT/소켓용접(SW)/PE 맞대기용접 접속과 -46°C~+250°C의 넓은 온도 범위(재질 선택에 따름)를 지원합니다. ISO 5211 마운트로 액추에이터 장착이 가능합니다.', 'The GN series are 2-way high-pressure ball valves for oil & gas with forged ASTM A350 LF2 (carbon steel) or A182 F316L (stainless steel) bodies. Sizes DN6-DN50 are offered in PN500 (50 MPa) or S6000 (41.4 MPa) classes with BSP/NPT/socket weld (SW/SWXT)/PE butt weld ends and a -46°C to +250°C temperature range depending on materials. ISO 5211 mounting allows actuator fitting.',
  '{"valve_design": "floating_screwed", "size_range": "DN6 ~ DN50 (1/4\" ~ 2\")", "pressure_class": "PN500 / S6000", "max_pressure_mpa": 50, "end_connections": "BSP, NPT, SW, SW Extra-long, PE BW", "body_material": "ASTM A350 LF2 / ASTM A182 F316L", "temp_range_c": "-46°C ~ +250°C (재질 선택에 따름)", "standards": "ISO 5211", "iso5211_mount": true}'::jsonb, true, 1780, 'gn 시리즈 2방 고압 볼 밸브 gn series 2-way high pressure ball valves 오일&가스용 2방 고압 볼 밸브, dn6~dn50, pn500/s6000 oil & gas 2-way high pressure ball valves, dn6-dn50, pn500/s6000 gn gemels s.p.a. 오일&가스 볼 밸브 oil & gas ball valves floating_screwed 플로팅(나사식) floating (screwed ends) dn6 ~ dn50 (1/4" ~ 2") pn500 / s6000 50 bsp, npt, sw, sw extra-long, pe bw astm a350 lf2 / astm a182 f316l -46°c ~ +250°c (재질 선택에 따름) iso 5211 true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gn-hc', 'GN HC', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-oil-gas-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GN HC 시리즈 고빈도 작동용 2방 고압 볼 밸브', 'GN HC Series High Cyclicity 2-Way High Pressure Ball Valves', '고빈도 작동(High Cyclicity)용 2방 고압 볼 밸브, DN6~DN50, 6000psi', 'High cyclicity 2-way high pressure ball valves, DN6-DN50, 6000 psi', 'GN HC 시리즈는 빈번한 개폐가 요구되는 오일&가스 응용을 위한 2방 고압 볼 밸브입니다. DN6~DN50 사이즈에 41.4 MPa(6000 psi)를 지원하며 스템 재질 1.4542, PA612G 볼 시트로 내구성을 높였습니다. BSP/NPT/SAE 나사, 탄소강 및 스테인리스강 본체로 제공되고 ISO 5211 마운트에 복동/스프링 리턴 액추에이터 장착이 가능합니다.', 'The GN HC series are 2-way high-pressure ball valves for oil & gas applications requiring frequent cycling. Sizes DN6-DN50 are rated 41.4 MPa (6000 psi), with a 1.4542 stem and PA612G ball seats for durability. Available with BSP/NPT/SAE ends in carbon or stainless steel, with ISO 5211 mounting for double acting or spring return actuators.',
  '{"valve_design": "floating_high_cyclicity", "size_range": "DN6 ~ DN50 (1/4\" ~ 2\")", "pressure_class": "6000 psi (PN414)", "max_pressure_mpa": 41.4, "end_connections": "BSP(ISO 228), NPT(ANSI/ASME B1.20.1), SAE J1926-1", "body_material": "탄소강 1.0737 / 스테인리스강 1.4404", "temp_range_c": "CS -20°C ~ +100°C, SS -30°C ~ +100°C", "standards": "ISO 5211", "iso5211_mount": true}'::jsonb, true, 1790, 'gn hc 시리즈 고빈도 작동용 2방 고압 볼 밸브 gn hc series high cyclicity 2-way high pressure ball valves 고빈도 작동(high cyclicity)용 2방 고압 볼 밸브, dn6~dn50, 6000psi high cyclicity 2-way high pressure ball valves, dn6-dn50, 6000 psi gn hc gemels s.p.a. 오일&가스 볼 밸브 oil & gas ball valves floating_high_cyclicity 플로팅(고빈도 작동) floating (high cyclicity) dn6 ~ dn50 (1/4" ~ 2") 6000 psi (pn414) 41.4 bsp(iso 228), npt(ansi/asme b1.20.1), sae j1926-1 탄소강 1.0737 / 스테인리스강 1.4404 cs -20°c ~ +100°c, ss -30°c ~ +100°c iso 5211 true')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gns', 'GNS', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GNS 냉각용 플랫 페이스 퀵 커플링', 'GNS Flat Face Quick Couplings for Cooling', '데이터센터 냉각용 플랫 페이스 스테인리스 퀵 커플링 (DN10~DN12.5)', 'Flat face stainless quick couplings for data center cooling, DN10 to DN12.5', '데이터센터 등 냉각 시스템용 플랫 페이스 퀵 커플링입니다. 플랫 페이스 구조로 연결·분리 시 유체 손실과 공기 유입을 최소화하며, DN10~DN12.5 사이즈에 최대 PN20(20 bar) 압력, 스테인리스강 바디와 FKM 씰, NPT/SAE ORB/호스 엔드를 제공합니다.', 'Flat face quick couplings for cooling systems such as data centers. The flat face design minimizes fluid loss and air inclusion during connection and disconnection; sizes DN10 to DN12.5 rated up to PN20 (20 bar), with stainless steel bodies, FKM seals and NPT/SAE ORB/hose ends.',
  '{"coupling_standard": "proprietary", "size_range": "DN10–DN12.5", "max_working_pressure": 20, "body_material": "stainless_steel", "valve_type": "flat_face", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "FKM", "thread_types": "NPT (ASME B1.20.1), SAE ORB (ISO 11926-1), hose ends", "surface_treatment": "Galvanized", "application": "data_center_cooling"}'::jsonb, true, 1800, 'gns 냉각용 플랫 페이스 퀵 커플링 gns flat face quick couplings for cooling 데이터센터 냉각용 플랫 페이스 스테인리스 퀵 커플링 (dn10~dn12.5) flat face stainless quick couplings for data center cooling, dn10 to dn12.5 gns gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn10–dn12.5 20 stainless_steel 스테인리스강 stainless steel flat_face 플랫 페이스 flat face push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false fkm npt (asme b1.20.1), sae orb (iso 11926-1), hose ends galvanized data_center_cooling 데이터센터 액체 냉각 data center liquid cooling')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gpk2', 'GPK2', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GPK2 매니폴드 2웨이 볼 밸브', 'GPK2 Manifold-Mounted 2-Way Ball Valve', '매니폴드 직결형 2웨이 볼 밸브. DN6~DN50, 최대 500bar', 'Manifold-mounted 2-way ball valve, DN6 to DN50, up to 500 bar', 'GEMELS 드릴링 패턴으로 매니폴드 블록에 직접 장착하는 2웨이 카트리지형 볼 밸브입니다. 사이즈 DN6~DN50, 최대 500bar(PN500)이며 탄소강(갈바나이징) 기본에 스테인리스강(1.4404) 옵션을 제공합니다. 배관 없이 블록에 통합되어 컴팩트한 유압 회로 구성이 가능합니다.', 'A 2-way ball valve for direct mounting on manifold blocks using the GEMELS drilling pattern. Sizes DN6 to DN50, rated up to 500 bar (PN500), in galvanized carbon steel with a stainless steel (1.4404) option. Integrating into the block without piping enables compact hydraulic circuit layouts.',
  '{"valve_ways": "2_way", "size_range": "DN6 - DN50", "max_pressure_bar": 500, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM)", "port_types": "GEMELS 드릴링 패턴 (매니폴드 마운팅)", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "매니폴드 블록 직결, 배관 불필요"}'::jsonb, true, 1810, 'gpk2 매니폴드 2웨이 볼 밸브 gpk2 manifold-mounted 2-way ball valve 매니폴드 직결형 2웨이 볼 밸브. dn6~dn50, 최대 500bar manifold-mounted 2-way ball valve, dn6 to dn50, up to 500 bar gpk2 gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn6 - dn50 500 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm) gemels 드릴링 패턴 (매니폴드 마운팅) cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) 매니폴드 블록 직결, 배관 불필요')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gpk3', 'GPK3', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GPK3 매니폴드 3웨이 볼 밸브', 'GPK3 Manifold-Mounted 3-Way Ball Valve', '매니폴드 직결형 3웨이 볼 밸브. DN6~DN50, 최대 500bar', 'Manifold-mounted 3-way ball valve, DN6 to DN50, up to 500 bar', 'GEMELS 드릴링 패턴으로 매니폴드 블록에 직접 장착하는 3웨이 볼 밸브입니다. L/T 유로 스킴을 지원하며 사이즈 DN6~DN50, 최대 500bar(PN500)입니다. 탄소강(갈바나이징) 사양이며 압력은 중앙 포트(1번)로만 인가해야 합니다.', 'A 3-way ball valve for direct mounting on manifold blocks using the GEMELS drilling pattern, with L/T flow schemes. Sizes DN6 to DN50, rated up to 500 bar (PN500), in galvanized carbon steel. Pressure inlet from the center port (port 1) only.',
  '{"valve_ways": "3_way", "size_range": "DN6 - DN50", "max_pressure_bar": 500, "body_material": "carbon_steel", "seat_material": "POM", "seal_material": "NBR", "port_types": "GEMELS 드릴링 패턴 (매니폴드 마운팅)", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "매니폴드 블록 직결, L/T 유로 스킴, 중앙 포트 가압"}'::jsonb, true, 1820, 'gpk3 매니폴드 3웨이 볼 밸브 gpk3 manifold-mounted 3-way ball valve 매니폴드 직결형 3웨이 볼 밸브. dn6~dn50, 최대 500bar manifold-mounted 3-way ball valve, dn6 to dn50, up to 500 bar gpk3 gemels s.p.a. 볼 밸브 ball valves 3_way 3웨이 3-way dn6 - dn50 500 carbon_steel 탄소강 carbon steel pom nbr gemels 드릴링 패턴 (매니폴드 마운팅) -20°c ~ +100°c 아연 도금(galvanized) 매니폴드 블록 직결, l/t 유로 스킴, 중앙 포트 가압')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gps', 'GPS', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-hydraulic-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GPS 시리즈 3방 단동 파일럿 체크 밸브', 'GPS Series 3-Way Single Pilot Operated Check Valves', '3방향 단동 파일럿 체크 밸브, DN6~DN25, 최대 400bar', '3-way single pilot operated check valves, DN6-DN25, up to 400 bar', 'GPS 시리즈는 아연 도금 강 본체의 3방향 단동 파일럿 체크 밸브입니다. G1/4~G1 포트에 최대 40 MPa(대구경 35 MPa), 최대 유량 120 l/min, 크래킹 압력 0.05~2.5 MPa(선택형), 파일럿비 1:3.5~1:9이며 NBR 오링을 사용합니다.', 'The GPS series are 3-way single pilot operated check valves with zinc plated steel bodies. Port sizes G1/4 to G1 are rated up to 40 MPa (35 MPa for larger sizes) with flows up to 120 l/min, selectable cracking pressures from 0.05 to 2.5 MPa and pilot ratios from 1:3.5 to 1:9, using NBR o-rings.',
  '{"valve_type": "pilot_check_valve", "size_range": "DN6 ~ DN25 (G1/4 ~ G1)", "max_pressure_mpa": 40, "end_connections": "BSP (BSPP)", "body_material": "carbon_steel", "temp_range_c": "-20°C ~ +100°C", "max_flow_lpm": 120, "seal_material": "NBR", "surface_treatment": "아연 도금 (Galvanized)"}'::jsonb, true, 1830, 'gps 시리즈 3방 단동 파일럿 체크 밸브 gps series 3-way single pilot operated check valves 3방향 단동 파일럿 체크 밸브, dn6~dn25, 최대 400bar 3-way single pilot operated check valves, dn6-dn25, up to 400 bar gps gemels s.p.a. 유압 밸브 hydraulic valves pilot_check_valve 파일럿 체크 밸브 pilot operated check valve dn6 ~ dn25 (g1/4 ~ g1) 40 bsp (bspp) carbon_steel 탄소강 carbon steel -20°c ~ +100°c 120 nbr 아연 도금 (galvanized)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-grc', 'GRC', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GRC CETOP 플랜지 볼 밸브', 'GRC CETOP Flanged Ball Valve', 'ISO 6164(CETOP) 플랜지 접속 대구경 2웨이 볼 밸브. DN25~DN125, 최대 420bar', 'Large-bore 2-way ball valve with ISO 6164 (CETOP) flange ends, DN25 to DN125, up to 420 bar', 'ISO 6164(CETOP) 4볼트 스퀘어 플랜지 접속의 대구경 2웨이 고압 볼 밸브입니다. 사이즈 DN25~DN125, PN250/PN350/PN400 클래스로 최대 420bar까지 대응합니다. 탄소강(1.0570)과 스테인리스강(1.4404) 사양이며 1.4542 스템과 ISO 5211 액추에이터 인터페이스를 갖추고 있습니다.', 'A large-bore 2-way high pressure ball valve with ISO 6164 (CETOP) four-bolt square flange connections. Sizes DN25 to DN125 in PN250/PN350/PN400 classes up to 420 bar. Available in carbon steel (1.0570) or stainless steel (1.4404) with a 1.4542 stem and ISO 5211 actuator interface.',
  '{"valve_ways": "2_way", "size_range": "DN25 - DN125", "max_pressure_bar": 420, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "ISO 6164 (CETOP) 플랜지, PN250/PN350/PN400", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "ISO 5211 액추에이터 인터페이스, 대구경 플랜지 직결"}'::jsonb, true, 1840, 'grc cetop 플랜지 볼 밸브 grc cetop flanged ball valve iso 6164(cetop) 플랜지 접속 대구경 2웨이 볼 밸브. dn25~dn125, 최대 420bar large-bore 2-way ball valve with iso 6164 (cetop) flange ends, dn25 to dn125, up to 420 bar grc gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn25 - dn125 420 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) iso 6164 (cetop) 플랜지, pn250/pn350/pn400 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) iso 5211 액추에이터 인터페이스, 대구경 플랜지 직결')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-grs', 'GRS', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GRS SAE 플랜지 대구경 볼 밸브', 'GRS SAE Flanged Large-Bore Ball Valve', 'SAE J518 S3000/S6000 플랜지 대구경 2웨이 볼 밸브. DN13~DN125, 최대 420bar', 'Large-bore 2-way ball valve with SAE J518 S3000/S6000 flange ends, DN13 to DN125, up to 420 bar', 'SAE J518(ISO 6162) S3000/S6000 플랜지 접속의 대구경 2웨이 고압 볼 밸브입니다. 사이즈 DN13~DN125, 최대 420bar이며 탄소강(1.0570)과 스테인리스강(1.4404) 사양을 제공합니다. 1.4542 스템과 PTFE 백업링 구조로 고압 내구성을 확보했습니다.', 'A large-bore 2-way high pressure ball valve with SAE J518 (ISO 6162) S3000/S6000 flange connections. Sizes DN13 to DN125 rated up to 420 bar, in carbon steel (1.0570) or stainless steel (1.4404), with a 1.4542 stem and PTFE back-up rings for high-pressure durability.',
  '{"valve_ways": "2_way", "size_range": "DN13 - DN125", "max_pressure_bar": 420, "body_material": "carbon_or_stainless_steel", "seat_material": "POM (옵션: PEEK, PA612, GEMPTFE, PTFE)", "seal_material": "NBR (옵션: FKM, EPDM, MVQ)", "port_types": "SAE J518 (ISO 6162) S3000/S6000 플랜지", "temp_range": "CS -20°C ~ +100°C / SS -30°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "대구경 SAE 플랜지 직결, 액추에이터 옵션"}'::jsonb, true, 1850, 'grs sae 플랜지 대구경 볼 밸브 grs sae flanged large-bore ball valve sae j518 s3000/s6000 플랜지 대구경 2웨이 볼 밸브. dn13~dn125, 최대 420bar large-bore 2-way ball valve with sae j518 s3000/s6000 flange ends, dn13 to dn125, up to 420 bar grs gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn13 - dn125 420 carbon_or_stainless_steel 탄소강/스테인리스강 carbon or stainless steel pom (옵션: peek, pa612, gemptfe, ptfe) nbr (옵션: fkm, epdm, mvq) sae j518 (iso 6162) s3000/s6000 플랜지 cs -20°c ~ +100°c / ss -30°c ~ +100°c 아연 도금(galvanized) 대구경 sae 플랜지 직결, 액추에이터 옵션')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gsj', 'GSJ', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-swivel-joints'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GSJ 시리즈 인라인 스위벨 조인트', 'GSJ Series In-line Swivel Joints', '최대 420bar 고압용 인라인 스위벨 조인트 (DN6~DN32)', 'High-pressure in-line swivel joints up to 420 bar (DN6-DN32)', 'GSJ 시리즈는 중장비용 고내구성 설계의 인라인 스위벨 조인트입니다. DN6~DN32 사이즈에서 최대 42 MPa(420 bar)의 작동 압력을 지원하며, 볼 없는 구조의 특수 고강성 설계로 유로가 끊기지 않아 높은 유량을 확보합니다. BSPP(암/수), NPT, SAE, JIC, ORFS, DIN 등 다양한 나사 조합이 가능하고 아연-니켈 표면 처리로 내식성이 우수합니다. 90° 타입도 주문 제작 가능합니다.', 'The GSJ series is an in-line swivel joint with a special high-resistance design for heavy-duty equipment. Sizes DN6 to DN32 support working pressures up to 42 MPa (420 bar), and the ball-free design with uninterrupted flow passage enables high flow rates. Available with BSPP (female/male), NPT, SAE, JIC, ORFS and DIN thread combinations, with zinc-nickel surface treatment for corrosion resistance. A 90-degree version is available on request.',
  '{"joint_type": "in_line", "size_range": "DN6 ~ DN32 (G1/4 ~ G1 1/4)", "max_pressure_mpa": 42, "end_connections": "BSPP(ISO 1179-1/ISO 8434-6), NPT(ANSI/ASME B1.20.1), SAE J1926-1, JIC(ISO 8434-2), ORFS(ISO 8434-3), DIN(ISO 8434-1)", "body_material": "탄소강 (Carbon Steel)", "temp_range_c": "-40°C ~ +100°C", "surface_treatment": "아연-니켈 도금 (Zinc-Nickel)"}'::jsonb, true, 1860, 'gsj 시리즈 인라인 스위벨 조인트 gsj series in-line swivel joints 최대 420bar 고압용 인라인 스위벨 조인트 (dn6~dn32) high-pressure in-line swivel joints up to 420 bar (dn6-dn32) gsj gemels s.p.a. 스위벨 조인트 swivel joints in_line 인라인 in-line dn6 ~ dn32 (g1/4 ~ g1 1/4) 42 bspp(iso 1179-1/iso 8434-6), npt(ansi/asme b1.20.1), sae j1926-1, jic(iso 8434-2), orfs(iso 8434-3), din(iso 8434-1) 탄소강 (carbon steel) -40°c ~ +100°c 아연-니켈 도금 (zinc-nickel)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gus', 'GUS', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GUS 커플링 (미국 시장 표준)', 'GUS Couplings (US Market)', '미국 시장 표준 인터체인지 커플링, 탄소강/스테인리스강/황동, DN6~DN40', 'US-market interchange couplings in carbon steel, stainless steel and brass, DN6 to DN40', '미국 시장 표준 인터체인지 프로파일의 GUS 퀵 커플링입니다. DN6~DN40 사이즈를 NPT 엔드로 제공하며, 탄소강·스테인리스강은 최대 270 bar, 황동은 최대 140 bar 사양입니다. NBR 씰이 기본이며 FKM 씰을 옵션으로 선택할 수 있습니다.', 'GUS quick couplings with the US-market interchange profile. Sizes DN6 to DN40 with NPT ends; carbon steel and stainless steel versions rated up to 270 bar, brass up to 140 bar. NBR seals standard with FKM optional.',
  '{"coupling_standard": "proprietary", "size_range": "DN6–DN40 (1/4\"–1 1/2\")", "max_working_pressure": 270, "body_material": "carbon_stainless_or_brass", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션)", "thread_types": "NPT (ASME B1.20.1)", "surface_treatment": "Galvanized (carbon steel)", "application": "us_market"}'::jsonb, true, 1870, 'gus 커플링 (미국 시장 표준) gus couplings (us market) 미국 시장 표준 인터체인지 커플링, 탄소강/스테인리스강/황동, dn6~dn40 us-market interchange couplings in carbon steel, stainless steel and brass, dn6 to dn40 gus gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn6–dn40 (1/4"–1 1/2") 270 carbon_stainless_or_brass 탄소강 / 스테인리스강 / 황동 carbon steel / stainless steel / brass poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false nbr (표준), fkm (옵션) npt (asme b1.20.1) galvanized (carbon steel) us_market 미국 시장 표준 us market standard')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gv2', 'GV2', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GV2 2웨이 볼 밸브 (등록 디자인)', 'GV2 2-Way Ball Valve (Registered Design)', '베이스 마운팅형 2웨이 볼 밸브. DN10~DN32, 최대 500bar', 'Base-mounting 2-way ball valve, DN10 to DN32, up to 500 bar', '등록 디자인(registered design)의 2웨이 고압 볼 밸브로 마운팅 홀을 갖춘 각형 바디가 특징입니다. 사이즈 DN10~DN32, 최대 500bar(PN500) 또는 S6000이며 탄소강(1.0737, 갈바나이징) 사양입니다. BSP, NPT, SAE 나사 및 ISO 6162-1 플랜지 접속을 지원하고 PA612G 시트와 FKM O-링, 스프링 디텐트 구조를 채택했습니다.', 'A registered-design 2-way high pressure ball valve featuring a block-style body with mounting holes. Sizes DN10 to DN32, rated up to 500 bar (PN500) or S6000, in galvanized carbon steel (1.0737). Supports BSP, NPT, SAE threads and ISO 6162-1 flange ends, with PA612G seats, FKM O-rings and a spring detent.',
  '{"valve_ways": "2_way", "size_range": "DN10 - DN32", "max_pressure_bar": 500, "body_material": "carbon_steel", "seat_material": "PA612G (옵션: POM, PEEK, GEMPTFE, PTFE)", "seal_material": "FKM (옵션: NBR, EPDM, MVQ)", "port_types": "BSP(ISO 228), NPT, SAE J1926-1 / ISO 6162-1 S6000 플랜지", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "등록 디자인, 마운팅 홀 일체형 바디, 스프링 디텐트"}'::jsonb, true, 1880, 'gv2 2웨이 볼 밸브 (등록 디자인) gv2 2-way ball valve (registered design) 베이스 마운팅형 2웨이 볼 밸브. dn10~dn32, 최대 500bar base-mounting 2-way ball valve, dn10 to dn32, up to 500 bar gv2 gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn10 - dn32 500 carbon_steel 탄소강 carbon steel pa612g (옵션: pom, peek, gemptfe, ptfe) fkm (옵션: nbr, epdm, mvq) bsp(iso 228), npt, sae j1926-1 / iso 6162-1 s6000 플랜지 -20°c ~ +100°c 아연 도금(galvanized) 등록 디자인, 마운팅 홀 일체형 바디, 스프링 디텐트')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gv3', 'GV3', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GV3 3웨이 볼 밸브 (등록 디자인)', 'GV3 3-Way Ball Valve (Registered Design)', '베이스 마운팅형 3웨이 볼 밸브. DN10~DN32, 최대 500bar', 'Base-mounting 3-way ball valve, DN10 to DN32, up to 500 bar', 'GV2와 동일한 등록 디자인 바디를 적용한 3웨이 고압 볼 밸브입니다. 사이즈 DN10~DN32, 최대 500bar(PN500)/S6000이며 탄소강(갈바나이징) 사양입니다. BSP, NPT, SAE 및 ISO 6162-1 접속을 지원하고 L/T 유로 스킴을 제공하며 압력은 중앙 포트(1번)로만 인가해야 합니다.', 'A 3-way high pressure ball valve sharing the GV registered-design body. Sizes DN10 to DN32, rated up to 500 bar (PN500)/S6000, in galvanized carbon steel. Supports BSP, NPT, SAE and ISO 6162-1 ends with L/T flow schemes; pressure inlet from the center port (port 1) only.',
  '{"valve_ways": "3_way", "size_range": "DN10 - DN32", "max_pressure_bar": 500, "body_material": "carbon_steel", "seat_material": "PA612G (옵션: POM, PEEK, GEMPTFE, PTFE)", "seal_material": "FKM (옵션: NBR, EPDM, MVQ)", "port_types": "BSP(ISO 228), NPT, SAE J1926-1 / ISO 6162-1", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "등록 디자인, L/T 유로 스킴, 중앙 포트 가압"}'::jsonb, true, 1890, 'gv3 3웨이 볼 밸브 (등록 디자인) gv3 3-way ball valve (registered design) 베이스 마운팅형 3웨이 볼 밸브. dn10~dn32, 최대 500bar base-mounting 3-way ball valve, dn10 to dn32, up to 500 bar gv3 gemels s.p.a. 볼 밸브 ball valves 3_way 3웨이 3-way dn10 - dn32 500 carbon_steel 탄소강 carbon steel pa612g (옵션: pom, peek, gemptfe, ptfe) fkm (옵션: nbr, epdm, mvq) bsp(iso 228), npt, sae j1926-1 / iso 6162-1 -20°c ~ +100°c 아연 도금(galvanized) 등록 디자인, l/t 유로 스킴, 중앙 포트 가압')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gv3k', 'GV3K', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GV3K 무누설 3웨이 볼 밸브', 'GV3K Zero-Leakage 3-Way Ball Valve', '특수 시트 무누설 3웨이 볼 밸브. DN10~DN20, 최대 500bar', '3-way ball valve with special zero-leakage seats, DN10 to DN20, up to 500 bar', '특수 시트로 무누설(zero leakage)을 구현한 GV 시리즈 3웨이 볼 밸브입니다. 사이즈 DN10~DN20, 최대 500bar(PN500)/S6000이며 탄소강(갈바나이징) 사양입니다. BSP, NPT, SAE 및 ISO 6162-1 접속을 지원하고 NBR, FKM, EPDM, MVQ O-링을 선택할 수 있습니다.', 'A GV-series 3-way ball valve achieving zero leakage with special seats. Sizes DN10 to DN20, rated up to 500 bar (PN500)/S6000, in galvanized carbon steel. Supports BSP, NPT, SAE and ISO 6162-1 ends with NBR, FKM, EPDM or MVQ O-ring options.',
  '{"valve_ways": "3_way", "size_range": "DN10 - DN20", "max_pressure_bar": 500, "body_material": "carbon_steel", "seat_material": "POM (옵션: PEEK, GEMPTFE, PTFE)", "seal_material": "FKM/NBR (옵션: EPDM, MVQ)", "port_types": "BSP(ISO 228), NPT, SAE J1926-1 / ISO 6162-1", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "특수 시트 무누설 설계, 등록 디자인"}'::jsonb, true, 1900, 'gv3k 무누설 3웨이 볼 밸브 gv3k zero-leakage 3-way ball valve 특수 시트 무누설 3웨이 볼 밸브. dn10~dn20, 최대 500bar 3-way ball valve with special zero-leakage seats, dn10 to dn20, up to 500 bar gv3k gemels s.p.a. 볼 밸브 ball valves 3_way 3웨이 3-way dn10 - dn20 500 carbon_steel 탄소강 carbon steel pom (옵션: peek, gemptfe, ptfe) fkm/nbr (옵션: epdm, mvq) bsp(iso 228), npt, sae j1926-1 / iso 6162-1 -20°c ~ +100°c 아연 도금(galvanized) 특수 시트 무누설 설계, 등록 디자인')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gvs', 'GVS', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GVS SAE 플랜지 2웨이 볼 밸브', 'GVS SAE Flanged 2-Way Ball Valve', 'ISO 6162-1/-2(SAE J518) 플랜지 직결형 2웨이 볼 밸브. DN13~DN32, 최대 420bar', '2-way ball valve for direct ISO 6162-1/-2 (SAE J518) flange mounting, DN13 to DN32, up to 420 bar', 'ISO 6162-1/-2(SAE J518) 플랜지 패턴에 직결되는 컴팩트 2웨이 볼 밸브입니다. 사이즈 DN13~DN32(코드상 DN40까지), 최대 420bar(S3000/S6000)이며 탄소강(1.0737, 갈바나이징) 사양입니다. 스프링 디텐트 구조를 갖추고 있으며 NBR, FKM, EPDM, MVQ O-링을 선택할 수 있습니다.', 'A compact 2-way ball valve designed for direct mounting on ISO 6162-1/-2 (SAE J518) flange patterns. Sizes DN13 to DN32 (up to DN40 per code structure), rated up to 420 bar (S3000/S6000), in galvanized carbon steel (1.0737). Features a spring detent and a choice of NBR, FKM, EPDM or MVQ O-rings.',
  '{"valve_ways": "2_way", "size_range": "DN13 - DN32", "max_pressure_bar": 420, "body_material": "carbon_steel", "seat_material": "POM (옵션: PEEK, GEMPTFE, PTFE)", "seal_material": "FKM/NBR (옵션: EPDM, MVQ)", "port_types": "ISO 6162-1/-2 (SAE J518) 플랜지, S3000/S6000", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "플랜지 직결 컴팩트 설계, 스프링 디텐트"}'::jsonb, true, 1910, 'gvs sae 플랜지 2웨이 볼 밸브 gvs sae flanged 2-way ball valve iso 6162-1/-2(sae j518) 플랜지 직결형 2웨이 볼 밸브. dn13~dn32, 최대 420bar 2-way ball valve for direct iso 6162-1/-2 (sae j518) flange mounting, dn13 to dn32, up to 420 bar gvs gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn13 - dn32 420 carbon_steel 탄소강 carbon steel pom (옵션: peek, gemptfe, ptfe) fkm/nbr (옵션: epdm, mvq) iso 6162-1/-2 (sae j518) 플랜지, s3000/s6000 -20°c ~ +100°c 아연 도금(galvanized) 플랜지 직결 컴팩트 설계, 스프링 디텐트')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-gvs-flanged', 'GVS Flanged', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-ball-valves'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'GVS 플랜지드 패널 마운팅 볼 밸브', 'GVS Flanged Panel Mounting Ball Valve', '패널 마운팅용 플랜지형 2웨이 볼 밸브. DN13~DN32, 최대 420bar', 'Flanged 2-way ball valve for panel mounting, DN13 to DN32, up to 420 bar', '패널 마운팅을 위한 플랜지 구조의 GVS 파생 2웨이 볼 밸브입니다. ISO 6162-1/-2(SAE J518) 접속, 사이즈 DN13~DN32(DN32는 ISO 6162-2 전용), 최대 420bar(S3000/S6000)이며 탄소강(갈바나이징) 사양입니다. NBR, FKM, EPDM, MVQ O-링 옵션을 제공합니다.', 'A GVS-derived 2-way ball valve with flanged construction for panel mounting. ISO 6162-1/-2 (SAE J518) connections, sizes DN13 to DN32 (DN32 in ISO 6162-2 only), rated up to 420 bar (S3000/S6000), in galvanized carbon steel with NBR, FKM, EPDM or MVQ O-ring options.',
  '{"valve_ways": "2_way", "size_range": "DN13 - DN32", "max_pressure_bar": 420, "body_material": "carbon_steel", "seat_material": "POM (옵션: PEEK, GEMPTFE, PTFE)", "seal_material": "FKM/NBR (옵션: EPDM, MVQ)", "port_types": "ISO 6162-1/-2 (SAE J518) 플랜지, S3000/S6000", "temp_range": "-20°C ~ +100°C", "surface_treatment": "아연 도금(Galvanized)", "special_features": "패널 마운팅 플랜지 구조"}'::jsonb, true, 1920, 'gvs 플랜지드 패널 마운팅 볼 밸브 gvs flanged panel mounting ball valve 패널 마운팅용 플랜지형 2웨이 볼 밸브. dn13~dn32, 최대 420bar flanged 2-way ball valve for panel mounting, dn13 to dn32, up to 420 bar gvs flanged gemels s.p.a. 볼 밸브 ball valves 2_way 2웨이 2-way dn13 - dn32 420 carbon_steel 탄소강 carbon steel pom (옵션: peek, gemptfe, ptfe) fkm/nbr (옵션: epdm, mvq) iso 6162-1/-2 (sae j518) 플랜지, s3000/s6000 -20°c ~ +100°c 아연 도금(galvanized) 패널 마운팅 플랜지 구조')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-handles', 'HANDLES', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-actuators-kits'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '핸들 시리즈', 'Handles Series', 'GEMELS 볼 밸브용 교체 핸들 (벤트/버터플라이/스트레이트/파이프/쇼트/탠덤)', 'Replacement handles for GEMELS ball valves (bent/butterfly/straight/pipe/short/tandem)', 'GEMELS 볼 밸브용 교체 핸들 키트입니다. 벤트, 버터플라이, 컷 스트레이트, 컷 벤트, 파이프, 쇼트, 스트레이트, 탠덤(콤비네이션 밸브용) 형태로 제공되며 GE, GPK, GN, GM, GB, GR, GHP, G3K/G4K 시리즈에 대응합니다. 재질은 자마크(크로밍/도장), 아연 도금 탄소강, 스테인리스강 중 선택 가능합니다.', 'Replacement handle kits for GEMELS ball valves in bent, butterfly, cut straight, cut bent, pipe, short, straight and tandem (for combination valves) styles, fitting GE, GPK, GN, GM, GB, GR, GHP and G3K/G4K series. Materials include zamak (chromed/painted), galvanized carbon steel and stainless steel.',
  '{"product_type": "handle", "operation": "manual", "models": "벤트, 버터플라이, 컷 스트레이트, 컷 벤트, 파이프, 쇼트, 스트레이트, 탠덤", "supply": "대응 밸브: GE, GPK, GN, GM, GB, GR, GHP, G3K/G4K (SW 6~24mm)", "certification": "재질: 자마크 / 아연 도금 탄소강 / 스테인리스강"}'::jsonb, true, 1930, '핸들 시리즈 handles series gemels 볼 밸브용 교체 핸들 (벤트/버터플라이/스트레이트/파이프/쇼트/탠덤) replacement handles for gemels ball valves (bent/butterfly/straight/pipe/short/tandem) handles gemels s.p.a. 액추에이터 및 키트 actuators & kits handle 핸들 handle manual 수동 manual 벤트, 버터플라이, 컷 스트레이트, 컷 벤트, 파이프, 쇼트, 스트레이트, 탠덤 대응 밸브: ge, gpk, gn, gm, gb, gr, ghp, g3k/g4k (sw 6~24mm) 재질: 자마크 / 아연 도금 탄소강 / 스테인리스강')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-hsj', 'HSJ', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-swivel-joints'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'HSJ 시리즈 유압 멀티웨이 스위벨 조인트', 'HSJ Series Hydraulic Multi-way Swivel Joints', '굴착기·크레인용 2~22 포트 유압 스위벨 조인트 (최대 420bar)', '2- to 22-way hydraulic swivel joints for excavators and cranes (up to 420 bar)', 'HSJ 시리즈는 드릴링 리그, 굴착기/모바일 크레인, 텔레핸들러, 콘크리트 믹서 펌프 등에 사용되는 유압 멀티웨이 스위벨 조인트입니다. 2웨이부터 22웨이까지 구성 가능하며 최대 압력 420 bar, 최대 회전 속도 12 rpm을 지원합니다. 스테이터는 C40/알루미늄, 로터는 S355J2G3/알루미늄 재질이고 NBR/FKM/EPDM/테플론 시일과 전기 슬립링 조합도 주문 제작 가능합니다.', 'The HSJ series hydraulic multi-way swivel joints serve drilling rigs, excavators/mobile cranes, telehandlers and concrete mixer pumps. Configurable from 2 up to 22 ways, they support pressures up to 420 bar and rotating speeds up to 12 rpm. The stator is C40/aluminium and rotor S355J2G3/aluminium, with NBR/FKM/EPDM/Teflon seals and optional electrical slip ring integration per customer requirements.',
  '{"joint_type": "multi_way", "size_range": "2웨이 ~ 22웨이", "max_pressure_mpa": 42, "end_connections": "BSP, NPT, SAE, 플랜지", "body_material": "스테이터 C40/알루미늄, 로터 S355J2G3/알루미늄", "temp_range_c": "주위 -20°C ~ +60°C, 작동 유체 최대 +90°C (표준 -10°C ~ +80°C)", "surface_treatment": "로터: 망간 인산염/ENP 니켈 도금/경질 산화, 스테이터: 경질 크롬/ENP 니켈 도금/경질 산화"}'::jsonb, true, 1940, 'hsj 시리즈 유압 멀티웨이 스위벨 조인트 hsj series hydraulic multi-way swivel joints 굴착기·크레인용 2~22 포트 유압 스위벨 조인트 (최대 420bar) 2- to 22-way hydraulic swivel joints for excavators and cranes (up to 420 bar) hsj gemels s.p.a. 스위벨 조인트 swivel joints multi_way 멀티웨이 multi-way 2웨이 ~ 22웨이 42 bsp, npt, sae, 플랜지 스테이터 c40/알루미늄, 로터 s355j2g3/알루미늄 주위 -20°c ~ +60°c, 작동 유체 최대 +90°c (표준 -10°c ~ +80°c) 로터: 망간 인산염/enp 니켈 도금/경질 산화, 스테이터: 경질 크롬/enp 니켈 도금/경질 산화')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-iso-a', 'ISO A', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ISO A 포핏 퀵 커플링 (ISO 7241-A)', 'ISO A Poppet Quick Couplings (ISO 7241-A)', 'ISO 7241-A 포핏 밸브 퀵 커플링, DN6.3~DN50, 최대 420 bar', 'ISO 7241-A poppet valve quick couplings, DN6.3 to DN50, up to 420 bar', '농업·산업 유압 분야의 표준인 ISO 7241-A 포핏 밸브 퀵 커플링입니다. 아연 도금 탄소강(최대 420 bar)과 스테인리스강 1.4404(최대 300 bar) 재질로 DN6.3~DN50(1/4"~2") 전 사이즈를 커버합니다. BSPP/NPT/SAE ORB 엔드와 NBR/FKM 씰을 제공하며, 양측 밸브가 없는 프리 플로우 PL 버전과 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'ISO 7241-A poppet valve quick couplings, the standard for agricultural and industrial hydraulics. Galvanized carbon steel (up to 420 bar) and stainless steel 1.4404 (up to 300 bar) versions cover DN6.3 to DN50 (1/4" to 2"). BSPP, NPT and SAE ORB ends with NBR or FKM seals; a free-flow PL version (no valves on either side) and a patented integrated ball-valve version are also available.',
  '{"coupling_standard": "iso_7241_a", "size_range": "DN6.3–DN50 (1/4\"–2\")", "max_working_pressure": 420, "body_material": "carbon_or_stainless_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션/스테인리스 표준)", "thread_types": "BSPP (ISO 1179-1), NPT (ASME B1.20.1), SAE ORB (ISO 11926-1)", "surface_treatment": "Galvanized (carbon steel)", "application": "general_hydraulics"}'::jsonb, true, 1950, 'iso a 포핏 퀵 커플링 (iso 7241-a) iso a poppet quick couplings (iso 7241-a) iso 7241-a 포핏 밸브 퀵 커플링, dn6.3~dn50, 최대 420 bar iso 7241-a poppet valve quick couplings, dn6.3 to dn50, up to 420 bar iso a gemels s.p.a. 퀵 커플링 quick couplings iso_7241_a iso 7241-a iso 7241-a dn6.3–dn50 (1/4"–2") 420 carbon_or_stainless_steel 탄소강 / 스테인리스강 carbon or stainless steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false nbr (표준), fkm (옵션/스테인리스 표준) bspp (iso 1179-1), npt (asme b1.20.1), sae orb (iso 11926-1) galvanized (carbon steel) general_hydraulics 일반 유압 general hydraulics')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-iso-b', 'ISO B', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'ISO B 포핏 퀵 커플링 (ISO 7241-B)', 'ISO B Poppet Quick Couplings (ISO 7241-B)', 'ISO 7241-B 포핏 밸브 퀵 커플링, DN5~DN50, 최대 420 bar', 'ISO 7241-B poppet valve quick couplings, DN5 to DN50, up to 420 bar', '산업 유압 분야에서 널리 쓰이는 ISO 7241-B 포핏 밸브 퀵 커플링입니다. 아연 도금 탄소강(최대 420 bar)과 스테인리스강 1.4404(최대 300 bar) 재질로 DN5~DN50(1/8"~2") 사이즈를 제공합니다. BSPP/NPT/SAE ORB 엔드에 NBR/FKM 씰 사양이며, 볼 밸브 일체형 특허 버전도 선택 가능합니다.', 'ISO 7241-B poppet valve quick couplings widely used in industrial hydraulics. Galvanized carbon steel (up to 420 bar) and stainless steel 1.4404 (up to 300 bar) versions cover DN5 to DN50 (1/8" to 2"). BSPP, NPT and SAE ORB ends with NBR or FKM seals; a patented integrated ball-valve version is also available.',
  '{"coupling_standard": "iso_7241_b", "size_range": "DN5–DN50 (1/8\"–2\")", "max_working_pressure": 420, "body_material": "carbon_or_stainless_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "NBR (표준), FKM (옵션/스테인리스 표준)", "thread_types": "BSPP (ISO 1179-1), NPT (ASME B1.20.1), SAE ORB (ISO 11926-1)", "surface_treatment": "Galvanized (carbon steel)", "application": "general_hydraulics"}'::jsonb, true, 1960, 'iso b 포핏 퀵 커플링 (iso 7241-b) iso b poppet quick couplings (iso 7241-b) iso 7241-b 포핏 밸브 퀵 커플링, dn5~dn50, 최대 420 bar iso 7241-b poppet valve quick couplings, dn5 to dn50, up to 420 bar iso b gemels s.p.a. 퀵 커플링 quick couplings iso_7241_b iso 7241-b iso 7241-b dn5–dn50 (1/8"–2") 420 carbon_or_stainless_steel 탄소강 / 스테인리스강 carbon or stainless steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false nbr (표준), fkm (옵션/스테인리스 표준) bspp (iso 1179-1), npt (asme b1.20.1), sae orb (iso 11926-1) galvanized (carbon steel) general_hydraulics 일반 유압 general hydraulics')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-j4c', 'J4C', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-actuators-kits'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'J4C 시리즈 전동 액추에이터', 'J4C Series Electric Actuators', '볼 밸브용 전동 액추에이터, 토크 20~300 Nm, IP67', 'Electric actuators for ball valves, 20-300 Nm, IP67', 'J4C 시리즈는 GEMELS 볼 밸브(DN6~DN50)용 쿼터턴 전동 액추에이터입니다. J4C-20/35/55/85/140/300 모델이 작동 토크 20~300 Nm를 제공하며, 12 VAC/VDC 또는 24~240 VAC/VDC 멀티전압 전원, 24V 브러시리스 모터, IP67 등급, 4 SPDT 리미트 스위치, 히터를 내장합니다. 디지털 포지셔너(4-20mA 등), 배터리 페일세이프(BSR), 3위치 제어 옵션이 제공되며 ISO 5211 F03~F10 플랜지를 지원합니다.', 'The J4C series are quarter-turn electric actuators for GEMELS ball valves (DN6-DN50). Models J4C-20/35/55/85/140/300 provide 20-300 Nm operational torque, powered at 12 VAC/VDC or multi-voltage 24-240 VAC/VDC with a 24V brushless motor, IP67 rating, 4 SPDT limit switches and heater. Options include digital positioner (4-20mA etc.), BSR battery fail-safe and 3-position control, with ISO 5211 F03-F10 flanges.',
  '{"product_type": "electric_actuator", "operation": "electric", "models": "J4C-20, J4C-35, J4C-55, J4C-85, J4C-140, J4C-300", "torque_range_nm": "작동 토크 20 ~ 300 Nm (브레이크 토크 25 ~ 350 Nm)", "supply": "12 VAC/VDC 또는 24~240 VAC/VDC, 듀티 75%, IP67", "iso5211_flange": "F03 ~ F10", "temp_range_c": "-20°C ~ +70°C", "certification": "IP67 (DPS 디지털 포지셔너·BSR 페일세이프 옵션)"}'::jsonb, true, 1970, 'j4c 시리즈 전동 액추에이터 j4c series electric actuators 볼 밸브용 전동 액추에이터, 토크 20~300 nm, ip67 electric actuators for ball valves, 20-300 nm, ip67 j4c gemels s.p.a. 액추에이터 및 키트 actuators & kits electric_actuator 전동 액추에이터 electric actuator electric 전동 electric j4c-20, j4c-35, j4c-55, j4c-85, j4c-140, j4c-300 작동 토크 20 ~ 300 nm (브레이크 토크 25 ~ 350 nm) 12 vac/vdc 또는 24~240 vac/vdc, 듀티 75%, ip67 f03 ~ f10 -20°c ~ +70°c ip67 (dps 디지털 포지셔너·bsr 페일세이프 옵션)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-jda', 'JDA', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-actuators-kits'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'JDA 시리즈 초소형 스카치요크 공압 액추에이터 (복동식)', 'JDA Series Ultra Compact Scotch-Yoke Pneumatic Actuators (Double Acting)', '복동식 스카치요크 공압 액추에이터, 토크 6.4~692 Nm, ATEX', 'Double acting scotch-yoke pneumatic actuators, 6.4-692 Nm, ATEX', 'JDA 시리즈는 초소형 스카치요크 구조의 복동식 공압 액추에이터로 고빈도 작동(High Cyclicity)에 적합합니다. JDA13~JDA520 모델이 공기압 0.3~0.8 MPa에서 6.4~691.8 Nm의 토크를 제공하며 표준 공급 압력은 6 bar(최대 8 bar)입니다. 알루미늄 실린더 본체, -50°C~+160°C 사용 온도, ATEX 인증, ISO 5211 F03~F10 플랜지를 지원합니다.', 'The JDA series are ultra compact scotch-yoke double acting pneumatic actuators suited to high cyclicity duty. Models JDA13 to JDA520 deliver 6.4 to 691.8 Nm at 0.3-0.8 MPa air supply, with 6 bar standard (8 bar max). Aluminium cylinder bodies, -50°C to +160°C service, ATEX certification and ISO 5211 F03-F10 flanges.',
  '{"product_type": "pneumatic_actuator", "operation": "double_acting", "models": "JDA13, JDA35, JDA75, JDA135, JDA520", "torque_range_nm": "6.4 ~ 691.8 Nm (0.3~0.8 MPa 공기압)", "supply": "압축공기 6 bar (최대 8 bar), 건조/윤활 공기·비부식성 가스·경유압유", "iso5211_flange": "F03 ~ F10", "temp_range_c": "-50°C ~ +160°C", "certification": "ATEX"}'::jsonb, true, 1980, 'jda 시리즈 초소형 스카치요크 공압 액추에이터 (복동식) jda series ultra compact scotch-yoke pneumatic actuators (double acting) 복동식 스카치요크 공압 액추에이터, 토크 6.4~692 nm, atex double acting scotch-yoke pneumatic actuators, 6.4-692 nm, atex jda gemels s.p.a. 액추에이터 및 키트 actuators & kits pneumatic_actuator 공압 액추에이터 pneumatic actuator double_acting 복동식 double acting jda13, jda35, jda75, jda135, jda520 6.4 ~ 691.8 nm (0.3~0.8 mpa 공기압) 압축공기 6 bar (최대 8 bar), 건조/윤활 공기·비부식성 가스·경유압유 f03 ~ f10 -50°c ~ +160°c atex')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-jsr', 'JSR', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-actuators-kits'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'JSR 시리즈 초소형 스카치요크 공압 액추에이터 (스프링 리턴)', 'JSR Series Ultra Compact Scotch-Yoke Pneumatic Actuators (Spring Return)', '스프링 리턴 스카치요크 공압 액추에이터, 토크 21.6~240 Nm, ATEX', 'Spring return scotch-yoke pneumatic actuators, 21.6-240 Nm, ATEX', 'JSR 시리즈는 초소형 스카치요크 구조의 스프링 리턴 공압 액추에이터입니다. JSR20~JSR240 모델이 0.6 MPa 공기압 기준 21.6~240 Nm의 토크를 제공하며 표준 공급 압력은 6 bar(최대 8 bar)입니다. -50°C~+160°C 사용 온도, ATEX 인증, ISO 5211 F03~F10 플랜지를 지원합니다.', 'The JSR series are ultra compact scotch-yoke spring return pneumatic actuators. Models JSR20 to JSR240 deliver 21.6 to 240 Nm at 0.6 MPa air supply, with 6 bar standard (8 bar max). Rated -50°C to +160°C with ATEX certification and ISO 5211 F03-F10 flanges.',
  '{"product_type": "pneumatic_actuator", "operation": "spring_return", "models": "JSR20, JSR42, JSR84, JSR240", "torque_range_nm": "21.6 ~ 240 Nm (0.6 MPa 공기압 기준)", "supply": "압축공기 6 bar (최대 8 bar), 건조/윤활 공기·비부식성 가스·경유압유", "iso5211_flange": "F03 ~ F10", "temp_range_c": "-50°C ~ +160°C", "certification": "ATEX"}'::jsonb, true, 1990, 'jsr 시리즈 초소형 스카치요크 공압 액추에이터 (스프링 리턴) jsr series ultra compact scotch-yoke pneumatic actuators (spring return) 스프링 리턴 스카치요크 공압 액추에이터, 토크 21.6~240 nm, atex spring return scotch-yoke pneumatic actuators, 21.6-240 nm, atex jsr gemels s.p.a. 액추에이터 및 키트 actuators & kits pneumatic_actuator 공압 액추에이터 pneumatic actuator spring_return 스프링 리턴 spring return jsr20, jsr42, jsr84, jsr240 21.6 ~ 240 nm (0.6 mpa 공기압 기준) 압축공기 6 bar (최대 8 bar), 건조/윤활 공기·비부식성 가스·경유압유 f03 ~ f10 -50°c ~ +160°c atex')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-limit-switch', 'LIMIT SWITCH', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-actuators-kits'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '리미트 스위치 시리즈', 'Limit Switch Series', '밸브 개폐 위치 피드백용 리미트 스위치 박스 (ATEX/SIL 옵션)', 'Limit switch boxes for valve position feedback (ATEX/SIL options)', '수동 및 액추에이터 구동 밸브용 위치 피드백 리미트 스위치 제품군입니다. 초소형 폴리아미드 박스(IP 시리즈, IP66/67), ATEX Ex ia 본질안전형(IV), ATEX Ex d 알루미늄형(EAE), NAMUR 솔레노이드 밸브(Ex ia, 3/2·5/2 way)로 구성되며 VDI/VDE 3845(80×30mm) 장착, SIL 1-3(IEC 61508) 대응이 가능합니다. 수동 밸브용 장착 키트(F03~F05 ISO 플랜지)도 제공됩니다.', 'Position feedback limit switch range for manual and actuated valves: compact polyamide boxes (IP series, IP66/67), ATEX Ex ia intrinsically safe (IV), ATEX Ex d aluminium (EAE) versions and a NAMUR solenoid valve (Ex ia, 3/2 and 5/2 way). VDI/VDE 3845 (80x30mm) mounting and SIL 1-3 (IEC 61508) capability, with mounting kits for manual valves (F03-F05 ISO flanges).',
  '{"product_type": "limit_switch", "operation": "monitoring", "models": "IP2M01, IV2M01 (ATEX Ex ia), EAE2M01 (ATEX Ex d), MNF532-IA 솔레노이드 밸브", "supply": "기계식 스위치/근접 센서 1~3개, 24~250 V AC/DC (모델별 상이)", "temp_range_c": "-25°C ~ +70°C (모델별 상이)", "certification": "IP66/IP67, ATEX/IECEx, SIL 1-3 (IEC 61508:2010)"}'::jsonb, true, 2000, '리미트 스위치 시리즈 limit switch series 밸브 개폐 위치 피드백용 리미트 스위치 박스 (atex/sil 옵션) limit switch boxes for valve position feedback (atex/sil options) limit switch gemels s.p.a. 액추에이터 및 키트 actuators & kits limit_switch 리미트 스위치 limit switch monitoring 위치 감지 position monitoring ip2m01, iv2m01 (atex ex ia), eae2m01 (atex ex d), mnf532-ia 솔레노이드 밸브 기계식 스위치/근접 센서 1~3개, 24~250 v ac/dc (모델별 상이) -25°c ~ +70°c (모델별 상이) ip66/ip67, atex/iecex, sil 1-3 (iec 61508:2010)')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-locking-devices', 'LK / SB', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-actuators-kits'), (select id from business_areas where slug = 'hydraulic-engineering'),
  '잠금장치 시리즈 (LKB/LKF/LKR/LKS/SB)', 'Locking Device Series (LKB/LKF/LKR/LKS/SB)', 'GEMELS 볼 밸브용 핸들 잠금장치 및 시큐리티 블록', 'Handle locking devices and security blocks for GEMELS ball valves', 'GEMELS 볼 밸브 시리즈별 전용 잠금장치입니다. LKB(GM·GN용), LKF(GE·GB·GHP·GPK용), LKR(GR용), LKS(SBF·SBF-W용), 시큐리티 블록(SB)과 리미트 스위치 겸용 LKF LS로 구성되며 DN6~DN100 사이즈에 대응합니다. 아연 도금 탄소강 또는 스테인리스강 재질로 제공됩니다.', 'Series-specific locking devices for GEMELS ball valves: LKB (for GM/GN), LKF (for GE/GB/GHP/GPK), LKR (for GR), LKS (for SBF/SBF-W), security blocks (SB) and LKF LS versions with limit switch provision, covering DN6-DN100. Available in galvanized carbon steel or stainless steel.',
  '{"product_type": "locking_device", "operation": "manual", "models": "LKB, LKF, LKF LS, LKR, LKS, SB (시큐리티 블록)", "supply": "대응 밸브: GE, GB, GHP, GPK, GR, GM, GN, SBF, SBF-W (DN6~DN100)", "certification": "재질: 아연 도금 탄소강 / 스테인리스강"}'::jsonb, true, 2010, '잠금장치 시리즈 (lkb/lkf/lkr/lks/sb) locking device series (lkb/lkf/lkr/lks/sb) gemels 볼 밸브용 핸들 잠금장치 및 시큐리티 블록 handle locking devices and security blocks for gemels ball valves lk / sb gemels s.p.a. 액추에이터 및 키트 actuators & kits locking_device 잠금장치 locking device manual 수동 manual lkb, lkf, lkf ls, lkr, lks, sb (시큐리티 블록) 대응 밸브: ge, gb, ghp, gpk, gr, gm, gn, sbf, sbf-w (dn6~dn100) 재질: 아연 도금 탄소강 / 스테인리스강')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-lqc', 'LQC', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'LQC 대구경 냉각용 퀵 커플링', 'LQC Large Quick Couplings for Cooling', '데이터센터 냉각 매니폴드용 DN25 대구경 스테인리스 퀵 커플링', 'DN25 large-bore stainless quick couplings for data center cooling manifolds', '데이터센터 액체 냉각 시스템의 대유량 라인을 위한 LQC(Large Quick Coupling)입니다. DN25 단일 사이즈로 최대 PN20(20 bar) 압력에 대응하며, 스테인리스강 바디와 EPDM 씰, BSPP/NPT/SAE ORB 엔드를 제공합니다.', 'LQC (Large Quick Coupling) for high-flow lines in data center liquid cooling systems. Available in DN25 with pressure rating up to PN20 (20 bar), stainless steel body, EPDM seals and BSPP/NPT/SAE ORB ends.',
  '{"coupling_standard": "proprietary", "size_range": "DN25 (G1, N1, SAE16)", "max_working_pressure": 20, "body_material": "stainless_steel", "valve_type": "poppet", "connection_type": "push_pull_sleeve", "connect_under_pressure": false, "seal_material": "EPDM", "thread_types": "BSPP (ISO 1179-1 / ISO 8434-6), NPT (ASME B1.20.1), SAE ORB (ISO 11926-1)", "application": "data_center_cooling"}'::jsonb, true, 2020, 'lqc 대구경 냉각용 퀵 커플링 lqc large quick couplings for cooling 데이터센터 냉각 매니폴드용 dn25 대구경 스테인리스 퀵 커플링 dn25 large-bore stainless quick couplings for data center cooling manifolds lqc gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn25 (g1, n1, sae16) 20 stainless_steel 스테인리스강 stainless steel poppet 포핏 poppet push_pull_sleeve 푸시풀 슬리브 push-pull sleeve false epdm bspp (iso 1179-1 / iso 8434-6), npt (asme b1.20.1), sae orb (iso 11926-1) data_center_cooling 데이터센터 액체 냉각 data center liquid cooling')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,
  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,
  specs, is_published, sort_order, search_text)
values ('gemels-mgw', 'MGW', (select id from manufacturers where slug = 'gemels'), (select id from product_categories where slug = 'gemels-quick-couplings'), (select id from business_areas where slug = 'hydraulic-engineering'),
  'MGW 플레이트 마운팅 플랫 페이스 커플링', 'MGW Flat Face Couplings for Plate Mounting', '멀티 커플링 플레이트 전용 플랫 페이스 커플링, 산업·냉각 분야용', 'Flat face couplings dedicated to multi-coupling plates for industrial and cooling applications', 'GEMELS 멀티 커플링 및 플레이트 전용 플랫 페이스 커플링입니다. 시거 링(seeger ring) 방식으로 조립되어 멀티 커넥션에서의 장착과 정비가 빠르며, DN12.5(탄소강)/DN13(스테인리스강) 기준 최대 420 bar에 대응합니다. 아연-니켈 또는 AISI 316 처리 사양, 요청 시 다른 사이즈·나사 규격도 제작 가능합니다.', 'Flat face couplings available exclusively for GEMELS multi couplings and plates. Assembled with a seeger ring for fast mounting and servicing on multi-connections; DN12.5 (carbon steel) / DN13 (stainless steel) rated up to 420 bar. Available with zinc-nickel or AISI 316 treatment, with other sizes and threads on request.',
  '{"coupling_standard": "proprietary", "size_range": "DN12.5–DN13", "max_working_pressure": 420, "body_material": "carbon_or_stainless_steel", "valve_type": "flat_face", "connection_type": "plate_mounting", "connect_under_pressure": false, "seal_material": "FKM (옵션 표기)", "thread_types": "BSPP (ISO 1179-1 / ISO 8434-6), NPT, SAE ORB, DIN 2353 L/S + bulkhead, JIC", "surface_treatment": "Galvanized / Zinc-Nickel or AISI 316 treatment", "application": "general_hydraulics"}'::jsonb, true, 2030, 'mgw 플레이트 마운팅 플랫 페이스 커플링 mgw flat face couplings for plate mounting 멀티 커플링 플레이트 전용 플랫 페이스 커플링, 산업·냉각 분야용 flat face couplings dedicated to multi-coupling plates for industrial and cooling applications mgw gemels s.p.a. 퀵 커플링 quick couplings proprietary 제조사 고유 규격 manufacturer proprietary dn12.5–dn13 420 carbon_or_stainless_steel 탄소강 / 스테인리스강 carbon or stainless steel flat_face 플랫 페이스 flat face plate_mounting 플레이트 마운팅 plate mounting false fkm (옵션 표기) bspp (iso 1179-1 / iso 8434-6), npt, sae orb, din 2353 l/s + bulkhead, jic galvanized / zinc-nickel or aisi 316 treatment general_hydraulics 일반 유압 general hydraulics')
on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,
  category_id = excluded.category_id, business_area_id = excluded.business_area_id,
  name_ko = excluded.name_ko, name_en = excluded.name_en,
  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,
  description_ko = excluded.description_ko, description_en = excluded.description_en,
  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();

commit;
