local rand_array = {}

function init_array()
  for row=1, sysbench.opt.real_num, 1 
  do
    rand_array[row] = sysbench.rand.string(string.rep("@", sysbench.opt.col_len))

  end
end

function init()
  print("saas_multi_index.lua init")
  init_array()
end

if sysbench.cmdline.command == nil then
  error("Command is required. Supported commands: prepare, warmup, run, " .. "cleanup, help")
end

-- Command line options
sysbench.cmdline.options = {
  table_size = {"Number of rows per table", 100000},
  tables = {"Number of tables", 4},
  -- total column type is real_num * thread_num
  real_num = {"Real number of column type", 200},
  col_len = {"The size of column length", 64}
}

function create_table(drv, con, table_num)
  query = string.format([[
  CREATE TABLE `saas_log%d` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `saas_type` varchar(64) DEFAULT NULL,
  `saas_currency_code` varchar(3) DEFAULT NULL,
  `saas_amount` bigint(20) DEFAULT '0',
  `saas_direction` varchar(2) DEFAULT 'NA',
  `saas_status` varchar(64) DEFAULT NULL,
  `saas_status_remarks` varchar(200) DEFAULT NULL,
  `ewallet_ref` varchar(64) DEFAULT NULL,
  `merchant_ref` varchar(64) DEFAULT NULL,
  `third_party_ref` varchar(64) DEFAULT NULL,
  `created_date_time` datetime DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `saas_date_time` datetime DEFAULT NULL,
  `original_saas_ref` varchar(64) DEFAULT NULL,
  `source_of_fund` varchar(64) DEFAULT NULL,
  `external_saas_type` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `merchant_id` varchar(64) DEFAULT NULL,
  `merchant_id_ext` varchar(64) DEFAULT NULL,
  `mfg_no` varchar(64) DEFAULT NULL,
  `rfid_tag_no` varchar(64) DEFAULT NULL,
  `payment_info` text,
  `extend_info` text,
  `admin_fee` bigint(20) DEFAULT NULL,
  `ppu_type` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `saas_log_ux01` (`ewallet_ref`) USING BTREE,
  KEY `saas_log_idx01` (`user_id`) USING BTREE,
  KEY `saas_log_idx02` (`saas_type`) USING BTREE,
  KEY `saas_log_idx03` (`saas_status`) USING BTREE,
  KEY `saas_log_idx04` (`merchant_ref`) USING BTREE,
  KEY `saas_log_idx05` (`third_party_ref`) USING BTREE,
  KEY `saas_log_idx06` (`saas_date_time`) USING BTREE,
  KEY `saas_log_idx07` (`created_date_time`) USING BTREE,
  KEY `saas_log_idx08` (`mfg_no`) USING BTREE,
  KEY `saas_log_idx09` (`rfid_tag_no`) USING BTREE,
  KEY `merchant_third_party_ref_idx` (`merchant_ref`,`third_party_ref`),
  KEY `saas_log_idx10` (`merchant_id`),
  KEY `saas_log_idx11` (`saas_date_time`,`saas_type`),
  KEY `saas_log_user_id_status_txndateTime_01` (`user_id`,`saas_status`,`saas_date_time`) USING BTREE,
  KEY `saas_log_idx12` (`updated_date_time`),
  KEY `saas_log_idx14` (`user_id`,`rfid_tag_no`)
  ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ]],
  table_num)

  con:query(query)
end

local function get_table_num()
  return sysbench.rand.uniform(1, sysbench.opt.tables)
end

function cmd_prepare()
  local drv = sysbench.sql.driver()
  local con = drv:connect()

  for i = sysbench.tid % sysbench.opt.threads + 1, sysbench.opt.tables,
    sysbench.opt.threads do
    create_table(drv, con, i)
  end
end

function execute_insert()
  local table_num = get_table_num()
  local query = "INSERT INTO saas_log" .. table_num .. " (`saas_type`, `saas_currency_code`, `saas_amount`, `saas_direction`, `saas_status`, `saas_status_remarks`, `ewallet_ref`, `merchant_ref`, `third_party_ref`, `version`, `original_saas_ref`, `source_of_fund`, `external_saas_type`, `user_id`, `merchant_id`, `merchant_id_ext`, `mfg_no`, `rfid_tag_no`, `payment_info`, `extend_info`, `admin_fee`, `ppu_type`) VALUES ("

  query = query .. string.format("'%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", '%s'", sysbench.rand.string(string.rep("@", 3)))
  query = query .. string.format(", %d", sysbench.rand.uniform(1, 100000))
  query = query .. string.format(", '%s'", sysbench.rand.string(string.rep("@", 2)))
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", '%s'", sysbench.rand.string(string.rep("@", 200)))
  query = query .. string.format(", '%s'", sysbench.rand.string(string.rep("@", sysbench.opt.col_len)))
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", %d", sysbench.rand.uniform(1, 100000))
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. string.format(", '%s'", sysbench.rand.string(string.rep("@", 1000)))
  query = query .. string.format(", '%s'", sysbench.rand.string(string.rep("@", 1000)))
  query = query .. string.format(", %d", sysbench.rand.uniform(1, 100000))
  query = query .. string.format(", '%s'", rand_array[sysbench.rand.uniform(1, sysbench.opt.real_num)])
  query = query .. ")"

  -- print(query)
  con:query(query)
end

-- Called by sysbench for each execution
function event()
  execute_insert()
end

-- Implement parallel prepare
sysbench.cmdline.commands = {
  prepare = {cmd_prepare, sysbench.cmdline.PARALLEL_COMMAND}
}

-- Called by sysbench one time to initialize this script
function thread_init()
  init_array()
  drv = sysbench.sql.driver()
  con = drv:connect()
end

-- Called by sysbench when script is done executing
function thread_done()
  con:disconnect()
end

function cleanup()
   local drv = sysbench.sql.driver()
   local con = drv:connect()

   for i = 1, sysbench.opt.tables do
      print(string.format("Dropping table 'saas_log%d'...", i))
      con:query("DROP TABLE IF EXISTS saas_log" .. i )
   end
end
