USE datasbd;

SELECT * FROM datas;

-- Obter o 'ano de fabricação' do veículo com o maior 'preço de venda' entre os veículos
SELECT data, YEAR(data) AS anoFabricacao FROM datas;

-- Distribuição dos veículos com base no 'ano de fabricacao'
SELECT YEAR(data) AS anoFabricacao, COUNT(*) AS veiculos
FROM datas
group by anoFabricacao
order by anoFabricacao desc;

-- Obter o 'mes do aniversario' dos funcionários
select data, month(data) as mesaniversario from datas;

select datahora,
  year(datahora), month(datahora), day(datahora),
  hour(datahora), minute(datahora), second(datahora),
  dayofmonth(datahora),
  quarter(datahora),
  dayname(datahora), monthname(datahora)
from datas;

select extract(year_month from '2024-11-06');
select extract(year_month from data) from datas;

-- Conversão entre tipos de dados
select datahora, date(datahora) from datas;

-- Último dia do mês
select data, last_day(data) from datas;

-- Obter a data/hora atual do sistema
select current_date(), curdate(),
  current_time(), curtime(),
  current_timestamp(), now(),
  sysdate(), localtime(), localtimestamp()
from datas;

-- Obter a duração em segundos
select datahora, time_to_sec(hora) from datas;
select sec_to_time(180);

-- Vencimento de um código PIX daqui a 5 min 
select now(), now() + interval 5 minute;
select datahora, datahora + interval 5 minute from datas;

-- Previsão de entrega para daqui a 1 semana
select datahora, datahora + interval 1 week from datas;

-- LEMBRETES
-- Lembrete de pagamento 1 dia antes do vencimento
select datahora, datahora - interval 1 day as data_lembrete from datas;

--Diferença de dias entre duas datas
select datahora, datediff(datahora, now()) from datas order by datahora desc;
select datediff('2025-11-06', '2024-11-06'); -- 365

