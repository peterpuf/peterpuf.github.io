-- 清理指定应用钥匙链及文件函数(keychain-2.db整个删除的话会导致系统配置丢失)
function cleanAppDataAndKeychain(packageName)
    sys.toast("清理App目录及Keychain...")
    Package = packageName --应用包名
    DataPath = app.dataPath(Package or error("获取程序目录失败", 0)) --获取应用文档目录
    -- Clean.Doc(DataPath); --清理文档
    -- Clean.Key(DataPath); --清理钥匙链
    Clean.All(Package, DataPath) --清理文档及钥匙链
    sys.sleep(1500)
    sys.log("--> cleanAppDataAndKeychain --> " .. DataPath) --记录清空操作
end

function exec(command)
    local res = io.popen(command) -- 将os.execute换成popen执行
    if res then
        local ret = res:read("*a")
        res:close()
        return ret
    else
        return -1
    end
end

Clean = {
    Doc = (function(DataPath)
        if DataPath and #DataPath > 1 then
            exec("rm -rf " .. DataPath .. "/Documents/*")
            exec("rm -rf " .. DataPath .. "/Library/*")
            exec("rm -rf " .. DataPath .. "/tmp/*")
            sys.sleep(1000)
        end
    end),
    Key = (function(Package)
        if Package and #Package > 1 then
            sqlite3 = require("lsqlite3")
            local DB = sqlite3.open("/var/Keychains/keychain-2.db")
            DB:exec(
                'DELETE From genp where agrp Like "%' .. Package .. '%"',
                function(ud, ncols, values, names)
                    return sqlite3.OK
                end
            )
            DB:exec(
                'DELETE From keys where agrp Like "%' .. Package .. '%"',
                function(ud, ncols, values, names)
                    return sqlite3.OK
                end
            )
            DB:exec(
                'DELETE From cert where agrp Like "%' .. Package .. '%"',
                function(ud, ncols, values, names)
                    return sqlite3.OK
                end
            )
            DB:exec(
                'DELETE From inet where agrp Like "%' .. Package .. '%"',
                function(ud, ncols, values, names)
                    return sqlite3.OK
                end
            )
            DB:close()
        end
    end),
    All = (function(Package, DataPath)
        Clean.Doc(DataPath)
        Clean.Key(Package)
    end)
}

function main()
    cleanAppDataAndKeychain("com.dianping.dpscope") 
    cleanAppDataAndKeychain("com.meituan.imeituan") 
    sys.sleep(1000)
end