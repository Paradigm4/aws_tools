set -x
time iquery -p 1240 -anq " aio_save(unpack(tickers, i_1),'path=/run/shm/shim_output_buf_59_1_Xt73CX','instance=1','format=(int64 ,string ,int32 )')"
rm -rf /run/shm/shim_output_buf_59_1*

set -x
time iquery -p 1240 -anq " aio_save( project( apply(project(cross_join(filter(project(taqPOC_20160401, timestamp,price,size,source_index,exchange_index,condition,trade_flag), trade_flag) as A, redimension(build(<date:int64,ticker_index:int64>[idx=1:80,100000,0],'{1}[(20160401,7616),(20160401,7617),(20160401,7618),(20160401,7619),(20160401,7620),(20160401,7621),(20160401,7622),(20160401,7623),(20160401,7624),(20160401,7625),(20160401,7626),(20160401,7627),(20160401,7628),(20160401,7629),(20160401,7630),(20160401,7631),(20160401,7633),(20160401,7634),(20160401,7635),(20160401,7636),(20160401,7637),(20160401,7639),(20160401,7640),(20160401,7641),(20160401,7642),(20160401,7643),(20160401,7644),(20160401,7645),(20160401,7646),(20160401,7647),(20160401,7648),(20160401,7649),(20160401,7650),(20160401,7651),(20160401,7652),(20160401,7653),(20160401,7654),(20160401,7655),(20160401,7656),(20160401,7657),(20160401,7658),(20160401,7659),(20160401,7660),(20160401,7661),(20160401,7662),(20160401,7663),(20160401,7664),(20160401,7665),(20160401,7666),(20160401,7667),(20160401,7668),(20160401,7669),(20160401,7670),(20160401,7671),(20160401,7672),(20160401,7673),(20160401,7674),(20160401,7675),(20160401,7676),(20160401,7677),(20160401,7678),(20160401,7679),(20160401,7680),(20160401,7681),(20160401,7682),(20160401,7683),(20160401,7684),(20160401,7685),(20160401,7686),(20160401,7688),(20160401,7689),(20160401,7690),(20160401,7692),(20160401,7695),(20160401,7696),(20160401,7698),(20160401,7699),(20160401,7700),(20160401,7701),(20160401,7702)]',true), <idx:int64>[date=0:*,1,0,ticker_index=0:*,50,0]) as B, A.date, B.date, A.ticker_index, B.ticker_index), timestamp,price,size,source_index,exchange_index,condition,trade_flag) , date_, date, rownumber_, rownumber, ticker_index_, ticker_index), date_, rownumber_, ticker_index_, timestamp,price,size,source_index,exchange_index,condition,trade_flag) ,'path=/run/shm/shim_output_buf_59_1_r7cGfA','instance=1','format=(int64 ,int64 ,int64 ,int64 null,int32 null,int32 null,int8 null,int8 null,int16 null,bool null)')"
rm -rf /run/shm/shim_output_buf_59_1*

set -x
time iquery -p 1240 -anq " aio_save( project( apply(project(cross_join(filter(project(taqPOC_20160401, timestamp,price,size,source_index,exchange_index,condition,trade_flag), trade_flag) as A, redimension(build(<date:int64,ticker_index:int64>[idx=1:80,100000,0],'{1}[(20160401,7263),(20160401,7264),(20160401,7265),(20160401,7266),(20160401,7267),(20160401,7268),(20160401,7269),(20160401,7270),(20160401,7271),(20160401,7272),(20160401,7273),(20160401,7274),(20160401,7275),(20160401,7276),(20160401,7277),(20160401,7278),(20160401,7279),(20160401,7280),(20160401,7284),(20160401,7285),(20160401,7286),(20160401,7287),(20160401,7288),(20160401,7289),(20160401,7290),(20160401,7291),(20160401,7292),(20160401,7293),(20160401,7294),(20160401,7295),(20160401,7296),(20160401,7297),(20160401,7299),(20160401,7302),(20160401,7303),(20160401,7304),(20160401,7305),(20160401,7306),(20160401,7307),(20160401,7308),(20160401,7309),(20160401,7310),(20160401,7311),(20160401,7312),(20160401,7313),(20160401,7314),(20160401,7315),(20160401,7316),(20160401,7317),(20160401,7318),(20160401,7319),(20160401,7320),(20160401,7321),(20160401,7322),(20160401,7323),(20160401,7324),(20160401,7325),(20160401,7326),(20160401,7327),(20160401,7328),(20160401,7329),(20160401,7330),(20160401,7331),(20160401,7332),(20160401,7333),(20160401,7334),(20160401,7335),(20160401,7336),(20160401,7337),(20160401,7338),(20160401,7339),(20160401,7341),(20160401,7342),(20160401,7343),(20160401,7344),(20160401,7345),(20160401,7346),(20160401,7347),(20160401,7348),(20160401,7349)]',true), <idx:int64>[date=0:*,1,0,ticker_index=0:*,50,0]) as B, A.date, B.date, A.ticker_index, B.ticker_index), timestamp,price,size,source_index,exchange_index,condition,trade_flag) , date_, date, rownumber_, rownumber, ticker_index_, ticker_index), date_, rownumber_, ticker_index_, timestamp,price,size,source_index,exchange_index,condition,trade_flag) ,'path=/run/shm/shim_output_buf_59_1_RPSbL5','instance=1','format=(int64 ,int64 ,int64 ,int64 null,int32 null,int32 null,int8 null,int8 null,int16 null,bool null)')"
rm -rf /run/shm/shim_output_buf_59_1*
